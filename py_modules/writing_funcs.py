from struct import pack
from .matmath import Matrix,Vector

def clamp(value, min_value, max_value):
    return max(min_value, min(value, max_value))

def write_name(string: str) -> bytes:
    return string.encode("ascii").ljust(0x10,b'\0')

def write_ubyte(int: int) -> bytes:
    return pack('<B',int)

def write_ubytes(ints: list[int]) -> bytes:
    return pack(f'<{len(ints)}B',*ints)

def write_sbyte(int: int) -> bytes:
    return pack('<b',int)

def write_sbytes(ints: list[int]) -> bytes:
    return pack(f'<{len(ints)}b',*ints)

def write_ushort(short: int) -> bytes:
    return pack('<H',short)

def write_ushorts(shorts: list[int]) -> bytes:
    return pack(f'<{len(shorts)}H',*shorts)

def write_sshorts(shorts: list[int]) -> bytes:
    return pack(f'<{len(shorts)}h',*shorts)

def write_uint(long: int) -> bytes:
    return pack('<L',long)

def write_uints(longs: list[int]) -> bytes:
    return pack(f'<{len(longs)}L',*longs)

def write_float(f: float) -> bytes:
    return pack('<f',f)

def write_floats(floats: list[float]) -> bytes:
    return pack(f'<{len(floats)}f',*floats)

def write_3dfvec(vec: Vector) -> bytes:
    return write_floats((vec.x,vec.y,vec.z))

def write_string(string: str) -> bytes:
    return write_uint(len(string)) + string.encode("ascii")

def mtoxm(m: Matrix): # 4x4 matrix as an Exanima matrix. Thanks, Inuk
    r0, r1, r2, r3 = m.m
    return (r0[0], r2[0], r1[0], r0[2],
            r2[2], r1[2], r0[1], r2[1],
            r1[1], r0[3], r2[3], r1[3])

def write_tmatrix(matrix: Matrix) -> bytes:
    return write_floats(mtoxm(matrix))