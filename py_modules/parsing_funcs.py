from _io import BufferedReader
from struct import unpack

from mathutils import Matrix,Vector
# from matmath import Matrix,Vector

def read_uints(file: BufferedReader, amount: int = 1) -> int | tuple[int]:
    if amount == 1: return unpack('<I',file.read(4))[0]
    else:           return unpack(f'<{amount}I',file.read(4*amount))

def read_ushorts(file: BufferedReader, amount: int = 1) -> int | tuple[int]:
    if amount == 1: return unpack('<H',file.read(2))[0]
    else:           return unpack(f'<{amount}H',file.read(2*amount))

def read_sshorts(file: BufferedReader, amount: int = 1) -> int | tuple[int]:
    if amount == 1: return unpack('<h', file.read(2))[0]
    else:           return unpack(f'<{amount}h',file.read(2*amount))

def read_ubytes(file: BufferedReader, amount: int = 1) -> int | tuple[int]:
    if amount == 1: return unpack('<B', file.read(1))[0]
    else:           return unpack(f'<{amount}B',file.read(amount))

def read_sbytes(file: BufferedReader, amount: int = 1) -> int | tuple[int]:
    if amount == 1: return unpack('<b', file.read(1))[0]
    else:           return unpack(f'<{amount}b',file.read(amount))

def read_floats(file: BufferedReader, amount: int = 1) -> int | tuple[int]:
    if amount == 1: return unpack('<f', file.read(4))[0]
    else:           return unpack(f'<{amount}f',file.read(4*amount))

def read_name(file: BufferedReader) -> str:
    return file.read(16).rstrip(b"\0").decode("ascii",errors='ignore')

def read_string(file: BufferedReader, string_length: int = 0) -> str:
    if not string_length: return file.read(read_uints(file,1)).decode("ascii",errors='ignore')
    else: return file.read(string_length).rstrip(b"\0").decode("ascii",errors='ignore')

def read_3dfvec(file:BufferedReader) -> Vector:
    return Vector((read_floats(file,3)))

def xmtom(m) -> Matrix: # Exanima transformation matrix as a 4x4 matrix. Thanks, Inuk.
    return Matrix(((
        (m[0], m[6], m[3], m[9]),
        (m[2], m[8], m[5], m[11]),
        (m[1], m[7], m[4], m[10]),
        (0, 0, 0, 1))))

def read_x_tmatrix(file: BufferedReader) -> Matrix:
    return xmtom(read_floats(file,12))
