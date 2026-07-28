from __future__ import annotations

'''
Matrix and Vector utilities. Thanks, Yew!
'''

from math import cos, sin, pi, sqrt, asin, atan2
class Vector:
	__slots__ = ("x", "y", "z")

	def __init__(self, iterable = (0,0,0)):
		x, y, z = iterable
		self.x, self.y, self.z = float(x), float(y), float(z)

	def copy(self) -> Vector:
		return Vector((self.x,self.y,self.z))

	def __getitem__(self, i):
		return (self.x, self.y, self.z)[i]

	def __iter__(self):
		yield self.x
		yield self.y
		yield self.z

	def __repr__(self):
		return f"Vector(({self.x!r}, {self.y!r}, {self.z!r}))"

	def to_4(self):
		return [self.x, self.y, self.z, 1.0]


class Matrix:
	__slots__ = ("m",)

	def __init__(self, rows=None):
		if rows is None:
			self.m = [
				[1.0, 0.0, 0.0, 0.0],
				[0.0, 1.0, 0.0, 0.0],
				[0.0, 0.0, 1.0, 0.0],
				[0.0, 0.0, 0.0, 1.0],
			]
		else:
			self.m = [[float(val) for val in row] for row in rows]
	
	def copy(self) -> Matrix:
		return Matrix(rows = self.m)

	def __getitem__(self, i):
		return self.m[i]

	def __iter__(self):
		return iter(self.m)

	def __repr__(self):
		rows = "), (".join(", ".join(f"{v!r}" for v in row) for row in self.m)
		return f"Matrix(({rows}))"

	def __matmul__(self, other):
		if isinstance(other, Matrix):
			a, b = self.m, other.m
			result = [[sum(a[i][k] * b[k][j] for k in range(4)) for j in range(4)] for i in range(4)]
			return Matrix(result)

		if isinstance(other, Vector) or (isinstance(other, (list, tuple)) and len(other) == 3):
			v4 = other.to_4() if isinstance(other, Vector) else [float(other[0]), float(other[1]), float(other[2]), 1.0]
			res = [sum(self.m[i][j] * v4[j] for j in range(4)) for i in range(4)]
			return Vector((res[0], res[1], res[2]))

		return NotImplemented

	def to_4x4(self):
		return self
		
	def decompose(self):
		# translation from last column
		tx, ty, tz = self.m[0][3], self.m[1][3], self.m[2][3]
		loc = Vector((tx, ty, tz))
		# extract 3x3 basis
		bx = [self.m[i][0] for i in range(3)]
		by = [self.m[i][1] for i in range(3)]
		bz = [self.m[i][2] for i in range(3)]
		# scale as lengths
		sx = sqrt(sum(c*c for c in bx))
		sy = sqrt(sum(c*c for c in by))
		sz = sqrt(sum(c*c for c in bz))
		scale = Vector((sx, sy, sz))
		# normalized rotation basis
		if sx: bx = [c/sx for c in bx]
		if sy: by = [c/sy for c in by]
		if sz: bz = [c/sz for c in bz]
		# build 4x4 rotation matrix
		rot_rows = [
			[bx[0], by[0], bz[0], 0.0],
			[bx[1], by[1], bz[1], 0.0],
			[bx[2], by[2], bz[2], 0.0],
			[0.0,   0.0,   0.0,   1.0],
		]
		rot = Matrix(rot_rows)
		return loc, rot, scale
	
	def to_euler(self):
		# Convert to XYZ order.
		r00, r01, r02 = self.m[0][0], self.m[0][1], self.m[0][2]
		r10, r11, r12 = self.m[1][0], self.m[1][1], self.m[1][2]
		r20, r21, r22 = self.m[2][0], self.m[2][1], self.m[2][2]
		# Fixes
		if r02 < 1.0:
			if r02 > -1.0:
				y = asin(r02)
				x = atan2(-r12, r22)
				z = atan2(-r01, r00)
			else:
				y = -pi/2
				x = -atan2(r10, r11)
				z = 0.0
		else:
			y = pi/2
			x = atan2(r10, r11)
			z = 0.0
		return x, y, z

	@classmethod
	def Identity(cls):
		return cls()

	@classmethod
	def Translation(cls, vec):
		x, y, z = (vec.x, vec.y, vec.z) if isinstance(vec, Vector) else vec
		return cls([
			[1.0, 0.0, 0.0, float(x)],
			[0.0, 1.0, 0.0, float(y)],
			[0.0, 0.0, 1.0, float(z)],
			[0.0, 0.0, 0.0, 1.0],
		])

	@classmethod
	def Rotation(cls, angle, size, axis):
		# axis 'X','Y','Z'.
		if size != 4:
			raise ValueError("Only 4×4 rotations are supported")
		c, s = cos(angle), sin(angle)
		if axis == 'X':
			rows = [
				[1.0, 0.0,  0.0, 0.0],
				[0.0, c,   -s,  0.0],
				[0.0, s,    c,  0.0],
				[0.0, 0.0,  0.0, 1.0],
			]
		elif axis == 'Y':
			rows = [
				[ c,  0.0, s,  0.0],
				[0.0, 1.0, 0.0,0.0],
				[-s,  0.0, c,  0.0],
				[0.0, 0.0, 0.0,1.0],
			]
		elif axis == 'Z':
			rows = [
				[c,   -s,   0.0, 0.0],
				[s,    c,   0.0, 0.0],
				[0.0, 0.0,  1.0, 0.0],
				[0.0, 0.0,  0.0, 1.0],
			]
		else:
			raise ValueError("Value Error: Axis must be X, Y, or Z.")
		return cls(rows)