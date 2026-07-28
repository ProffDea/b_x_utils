from __future__ import annotations

from .parsing_funcs import *
from .writing_funcs import *

from dataclasses import dataclass,field
from typing import ClassVar

@dataclass
class PowerConnection:
	bezier_points: tuple[float,float] = (0.0,0.0)
	node_id:       int = 0 #Previous node
	node:          PowerNode | None = None
	reserved:      int = 0
	@classmethod
	def parse(cls, file: BufferedReader) -> PowerConnection:
		return PowerConnection(bezier_points = read_floats(file,2),
							   node_id       = read_uints(file,1),
							   reserved      = read_uints(file,1))
	def write(self, pwr_tree: PowerTree) -> bytes:
		return write_floats(self.bezier_points) + write_uint(self.node_id) + write_uint(0x0)
	def __repr__(self):
		return f'PowerConnection(bezier_points={self.bezier_points}, node_id={hex(self.node_id).upper()})'
		
@dataclass
class PowerNode:
	created_nodes: ClassVar[int] = 0
	internal_id: 		int = 0
	power_index: 		int = 0x0 #1 byte.
	domain_index: 		int = 0x0 #1 byte.
	reserved_index:	int = 0x0 #1 nibble.
	concentration_index:int = 0x0 #1 nibble.
	insight_index:		int = 0x0 #1 nibble.
	icon_flag_index:	int = 0x0 #1 nibble.
	name_id:     int = 0x0
	name:        str = ''
	desc_id:     int = 0x0
	desc:        str = ''
	position:    tuple[float,float] = (0.0,0.0)
	connections: list[PowerConnection] = field(default_factory = list)
	def __post_init__(self) -> None:
		self.internal_id = PowerNode.created_nodes
		PowerNode.created_nodes += 1
	def __hash__(self):
		return self.internal_id
	@classmethod
	def parse(cls, file: BufferedReader) -> PowerNode:
		# Read and split up the four-byte UID into its components.
		b = file.read(4)
		# Six values stored in four bytes... Wow!
		power_index = b[0]
		domain_index = b[1]
		reserved_index = (b[2] >> 4) & 0x0F
		concentration_index = b[2] & 0x0F
		insight_index = (b[3] >> 4) & 0x0F
		icon_flag_index = b[3] & 0x0F
		return PowerNode(power_index = power_index,   # The index of the power in the domain, 0x01 for power 1, etc.
													  # Also determines icon from the game files? Icon sheet is 4x4, read left-to-right (Height can be expanded for more icons.)
						 domain_index = domain_index, # 01 for mind, 02 for force, and so on
													  # Internally used for power range.
													  # e.g. > 0x0100 (256) is Mind, > 0x0200 (512) is Force, etc.
						 reserved_index = reserved_index,	# Nibble | Always 0, perhaps used for another skill or domain (amalgamation) requirement in the future.
						 concentration_index = concentration_index,	# Nibble | Index of concentration skill, changes white overlay icon. Revelation causes node to disappear until learned (e.g. Corlian's "Raise Dead")
						 # The game loads the prior parameters when the player uses a power. This allows a larger range of powers for variations, such as  01 01 00 (Mind Sense) and 01 01 01 (Mind Sense, Continuous)
						 insight_index = insight_index, # Nibble | Index of insight skill requirement, determines border of the icon (Solid color for none, Arrows for Sustained, Wavy for continuous)
						 icon_flag_index = icon_flag_index,	# Nibble | Makes icon small, such as for "Mass" powers and continuous versions of normal powers.
						 # No clue if the above two nibbles are passed as well, they are only in the pwr file not the lookup tables in the .exe
						 name_id     = read_uints(file,1),
						 desc_id     = read_uints(file,1),
						 position    = read_floats(file,2),
						 connections = [PowerConnection.parse(file) for _ in range(read_uints(file,1))])
	def write(self, pwr_tree: PowerTree) -> bytes:
		if self in pwr_tree.r_nodes: return write_uint(pwr_tree.r_nodes[self])
		pwr_tree.r_nodes[self] = len(pwr_tree.r_nodes) + 1
		# pack the nibbles back together.
		b2 = ((self.reserved_index & 0x0F) << 4) | (self.concentration_index & 0x0F)
		b3 = ((self.insight_index & 0x0F) << 4) | (self.icon_flag_index & 0x0F)
		d = bytes([self.power_index & 0xFF, self.domain_index & 0xFF, b2, b3])
		if self.name not in pwr_tree.r_strings: pwr_tree.r_strings[self.name] = len(pwr_tree.r_strings) + 1
		if self.desc not in pwr_tree.r_strings: pwr_tree.r_strings[self.desc] = len(pwr_tree.r_strings) + 1
		d += write_uints((pwr_tree.r_strings[self.name], pwr_tree.r_strings[self.desc]))
		d += write_floats(self.position)
		d += write_uint(len(self.connections))
		for con in self.connections: d += con.write(pwr_tree)#; print(con)
		pwr_tree.w_nodes[self] = d
		return write_uint(pwr_tree.r_nodes[self])
	def __repr__(self) -> str:
		return f'PowerNode(name={self.name}, desc={self.desc}, power_index={hex(self.power_index)})'

@dataclass
class PowerStrings:
	signature: int = 0xABCDAD00
	unk_ints: tuple[int,int,int,int] = (0x6E65,0x0800,0x6E65,0x0104E4)
	reserved: int = 0x0
	string_dict: dict[int,str] = field(default_factory = dict)
	@classmethod
	def parse(cls, file: BufferedReader) -> PowerStrings:
		signature,length = read_uints(file,2)
		start = file.tell()
		unk_ints = read_uints(file,4)
		reserved = read_uints(file,1)
		strings_n = read_uints(file,1) + 2 #Why +2?
		offsets = read_uints(file, strings_n)
		string_start = file.tell()
		# print(f'Strings for power start @ {hex(string_start)} in {file.name}')
		rel_string_start = string_start - start
		string_dict = {}
		for i,offset in enumerate(offsets):
			# print(f'\tReading string {i} with offset {hex(offset)} @ {hex(file.tell())}')
			if offset + rel_string_start >= length: 
				# print(f'String is outside of the database length!')
				string_dict[i] = ''
				continue
			file.seek(string_start + offset)
			string_size = read_uints(file,1)
			if string_size >= 0xFFFF: continue #Ignore it! Somehow the string offset led to an incorrect string length
			string_dict[i] = read_string(file, string_size)
		file.seek(start + length)
		return PowerStrings(signature = signature,
							unk_ints = unk_ints,
							reserved = reserved,
							string_dict = string_dict)

@dataclass
class PowerTree:
	signature:  int = 0xFE01CD00
	reserved_a: int = 0x0
	reserved_b: int = 0x0
	icon_set_a: str = 'thmmndico1'
	icon_set_b: str = ''
	nodes: list[PowerNode] = field(default_factory = list)
	power_dict: dict[tuple[int,int,int,int],PowerNode] = field(default_factory = dict)
	power_strings: PowerStrings = field(default_factory = PowerStrings)
	#Writing stuff
	r_nodes: dict[PowerNode,int]   = field(default_factory = dict)
	w_nodes: dict[PowerNode,bytes] = field(default_factory = dict)
	r_strings: dict[str,int]       = field(default_factory = dict)
	@classmethod
	def parse(cls, file: BufferedReader, length: int) -> PowerTree:
		start = file.tell()
		while file.tell() - start < length:
			signature,sub_length = read_uints(file,2)
			if signature == 0xFE01CD00: #Header?
				reserved_a,reserved_b = read_uints(file,2)
				icon_set_a = read_name(file)
				icon_set_b = read_name(file)
				nodes = [PowerNode.parse(file) for _ in range(read_uints(file,1))]
				power_dict = {node.power_index:node for node in nodes}
			elif signature == 0xABCD0000: #Strings
				power_strings = PowerStrings.parse(file)
		if power_strings and nodes: #Since the strings are stored *after* the nodes are defined, we gotta go back and get them. Also, with this setup the nodes are holding IDs not actual nodes... Fix that after they're all known.
			for node in nodes:
				node.name,node.desc = power_strings.string_dict[node.name_id],power_strings.string_dict[node.desc_id]
				for connection in node.connections:
					# print(connection)
					connection.node = nodes[connection.node_id]
		return PowerTree(signature = signature,
						 reserved_a = reserved_a,
						 reserved_b = reserved_b,
						 icon_set_a = icon_set_a,
						 icon_set_b = icon_set_b,
						 nodes = nodes,
						 power_dict = power_dict,
						 power_strings = power_strings)
	def write(self) -> bytes:
		#Node Stuff
		n_d = write_uints((self.reserved_a,self.reserved_b)) + write_name(self.icon_set_a) + write_name(self.icon_set_b)
		n_d += write_uint(len(self.nodes))
		for node in self.nodes: node.write(self) #Get everything stored in the dicts...
		#for node,node_data in dict(self.w_nodes.items(), key = lambda item: item[1]):
		#	n_d += node_data
		for node in self.nodes:	n_d += self.w_nodes[node]
		n_d = write_uints((0xFE01CD00, len(n_d))) + n_d
		#String stuff - fixd
		s: PowerStrings = self.power_strings
		# We expect self.r_strings to be an insertion-ordered mapping: string -> id (1-based)
		# Build a reverse list indexed by id so we can emit offsets in id order (0..n-1)
		if not self.r_strings:
			# No strings: write empty strings section
			s_d = write_uints(s.unk_ints) + write_uints((s.reserved, 0))
			s_d += write_uint(0)  # no offsets
			s_d = write_uints((0xABCDAD00, len(s_d))) + s_d
			s_d = write_uints((0xABCD0000, len(s_d))) + s_d
		else:
			max_id = max(self.r_strings.values())
			# Build string list index 0..max_id correspond to IDs. 0 is no string. (0 length)
			id_list = [''] * max_id
			for s_text, sid in self.r_strings.items():
				if 1 <= sid <= max_id:
					id_list[sid - 1] = s_text  # place string at its id slot

			# string offsets
			s_o_d = b''
			s_b_d = b''
			current_offset = 4
			for text in id_list:
				s_o_d += write_uint(current_offset)
				data = write_string(text)
				s_b_d += data
				current_offset += len(data)

			s_d = write_uints(s.unk_ints) + write_uints((s.reserved, len(id_list)))
			s_d += write_uint(0x0) + s_o_d
			s_d += write_uint(current_offset)
			s_d += write_uint(0x0) + s_b_d
			s_d = write_uints((0xABCDAD00, len(s_d))) + s_d
			s_d = write_uints((0xABCD0000, len(s_d))) + s_d

		#
		return write_uint(0xAFCE01CE) + n_d + s_d

if __name__ == '__main__':
	# pwr_path = r'C:\Users\jango\Desktop\Exanima 0.9.4.5 Beta\resource\pwr_energy.pwr'
	# pwr_path = r'C:\Users\jango\Desktop\Exanima 0.9.4.5 Beta\resource\pwr_mind.pwr'
	pwr_path = r'C:\Users\jango\Desktop\Exanima 0.9.4.6 Beta\resource\pwr_force.pwr'
	# pwr_path = r'C:\Users\jango\Desktop\Exanima PWR Editor\pwr_mind_test.pwr'
	import os
	output_path = os.getcwd()
	with open(pwr_path, 'rb') as file:
		signature = file.read(4)
		length = os.path.getsize(pwr_path) - 4
		pwr_tree = PowerTree.parse(file,length)
		print(pwr_tree.nodes[0])
		# w_file = open(os.path.join(output_path,'pwr_mind_test.pwr'),'wb')
		# w_file.write(pwr_tree.write())
	
