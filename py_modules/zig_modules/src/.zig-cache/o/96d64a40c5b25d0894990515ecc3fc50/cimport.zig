const __root = @This();
pub const __builtin = @import("std").zig.c_translation.builtins;
pub const __helpers = @import("std").zig.c_translation.helpers;
pub const __builtin_va_list = [*c]u8;
pub const __gnuc_va_list = __builtin_va_list;
pub const va_list = __gnuc_va_list;
pub extern fn __mingw_get_crt_info() [*c]const u8;
pub const rsize_t = usize;
pub const ptrdiff_t = c_longlong;
pub const wchar_t = c_ushort;
pub const wint_t = c_ushort;
pub const wctype_t = c_ushort;
pub const errno_t = c_int;
pub const __time32_t = c_long;
pub const __time64_t = c_longlong;
pub const time_t = __time64_t;
pub const struct_threadlocaleinfostruct = extern struct {
    _locale_pctype: [*c]const c_ushort = null,
    _locale_mb_cur_max: c_int = 0,
    _locale_lc_codepage: c_uint = 0,
};
pub const struct_threadmbcinfostruct = opaque {};
pub const pthreadlocinfo = [*c]struct_threadlocaleinfostruct;
pub const pthreadmbcinfo = ?*struct_threadmbcinfostruct;
pub const struct___lc_time_data = opaque {};
pub const struct_localeinfo_struct = extern struct {
    locinfo: pthreadlocinfo = null,
    mbcinfo: pthreadmbcinfo = null,
};
pub const _locale_tstruct = struct_localeinfo_struct;
pub const _locale_t = [*c]struct_localeinfo_struct;
pub const struct_tagLC_ID = extern struct {
    wLanguage: c_ushort = 0,
    wCountry: c_ushort = 0,
    wCodePage: c_ushort = 0,
};
pub const LC_ID = struct_tagLC_ID;
pub const LPLC_ID = [*c]struct_tagLC_ID;
pub const threadlocinfo = struct_threadlocaleinfostruct;
pub extern fn _memccpy(_Dst: ?*anyopaque, _Src: ?*const anyopaque, _Val: c_int, _MaxCount: usize) ?*anyopaque;
pub extern fn memchr(_Buf: ?*const anyopaque, _Val: c_int, _MaxCount: usize) ?*anyopaque;
pub extern fn _memicmp(_Buf1: ?*const anyopaque, _Buf2: ?*const anyopaque, _Size: usize) c_int;
pub extern fn _memicmp_l(_Buf1: ?*const anyopaque, _Buf2: ?*const anyopaque, _Size: usize, _Locale: _locale_t) c_int;
pub extern fn memcmp(_Buf1: ?*const anyopaque, _Buf2: ?*const anyopaque, _Size: usize) c_int;
pub extern fn memcpy(noalias _Dst: ?*anyopaque, noalias _Src: ?*const anyopaque, _Size: usize) ?*anyopaque;
pub extern fn memcpy_s(_dest: ?*anyopaque, _numberOfElements: usize, _src: ?*const anyopaque, _count: usize) errno_t;
pub extern fn mempcpy(_Dst: ?*anyopaque, _Src: ?*const anyopaque, _Size: usize) ?*anyopaque;
pub extern fn memset(_Dst: ?*anyopaque, _Val: c_int, _Size: usize) ?*anyopaque;
pub extern fn memccpy(_Dst: ?*anyopaque, _Src: ?*const anyopaque, _Val: c_int, _Size: usize) ?*anyopaque;
pub extern fn memicmp(_Buf1: ?*const anyopaque, _Buf2: ?*const anyopaque, _Size: usize) c_int;
pub extern fn _strset(_Str: [*c]u8, _Val: c_int) [*c]u8;
pub extern fn _strset_l(_Str: [*c]u8, _Val: c_int, _Locale: _locale_t) [*c]u8;
pub extern fn strcpy(noalias _Dest: [*c]u8, noalias _Source: [*c]const u8) [*c]u8;
pub extern fn strcat(noalias _Dest: [*c]u8, noalias _Source: [*c]const u8) [*c]u8;
pub extern fn strcmp(_Str1: [*c]const u8, _Str2: [*c]const u8) c_int;
pub extern fn strlen(_Str: [*c]const u8) usize;
pub extern fn strnlen(_Str: [*c]const u8, _MaxCount: usize) usize;
pub extern fn memmove(_Dst: ?*anyopaque, _Src: ?*const anyopaque, _Size: usize) ?*anyopaque;
pub extern fn _strdup(_Src: [*c]const u8) [*c]u8;
pub extern fn strchr(_Str: [*c]const u8, _Val: c_int) [*c]u8;
pub extern fn _stricmp(_Str1: [*c]const u8, _Str2: [*c]const u8) c_int;
pub extern fn _strcmpi(_Str1: [*c]const u8, _Str2: [*c]const u8) c_int;
pub extern fn _stricmp_l(_Str1: [*c]const u8, _Str2: [*c]const u8, _Locale: _locale_t) c_int;
pub extern fn strcoll(_Str1: [*c]const u8, _Str2: [*c]const u8) c_int;
pub extern fn _strcoll_l(_Str1: [*c]const u8, _Str2: [*c]const u8, _Locale: _locale_t) c_int;
pub extern fn _stricoll(_Str1: [*c]const u8, _Str2: [*c]const u8) c_int;
pub extern fn _stricoll_l(_Str1: [*c]const u8, _Str2: [*c]const u8, _Locale: _locale_t) c_int;
pub extern fn _strncoll(_Str1: [*c]const u8, _Str2: [*c]const u8, _MaxCount: usize) c_int;
pub extern fn _strncoll_l(_Str1: [*c]const u8, _Str2: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) c_int;
pub extern fn _strnicoll(_Str1: [*c]const u8, _Str2: [*c]const u8, _MaxCount: usize) c_int;
pub extern fn _strnicoll_l(_Str1: [*c]const u8, _Str2: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) c_int;
pub extern fn strcspn(_Str: [*c]const u8, _Control: [*c]const u8) usize;
pub extern fn _strerror(_ErrMsg: [*c]const u8) [*c]u8;
pub extern fn strerror(c_int) [*c]u8;
pub extern fn _strlwr(_String: [*c]u8) [*c]u8;
pub extern fn strlwr_l(_String: [*c]u8, _Locale: _locale_t) [*c]u8;
pub extern fn strncat(noalias _Dest: [*c]u8, noalias _Source: [*c]const u8, _Count: usize) [*c]u8;
pub extern fn strncmp(_Str1: [*c]const u8, _Str2: [*c]const u8, _MaxCount: usize) c_int;
pub extern fn _strnicmp(_Str1: [*c]const u8, _Str2: [*c]const u8, _MaxCount: usize) c_int;
pub extern fn _strnicmp_l(_Str1: [*c]const u8, _Str2: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) c_int;
pub extern fn strncpy(noalias _Dest: [*c]u8, noalias _Source: [*c]const u8, _Count: usize) [*c]u8;
pub extern fn _strnset(_Str: [*c]u8, _Val: c_int, _MaxCount: usize) [*c]u8;
pub extern fn _strnset_l(str: [*c]u8, c: c_int, count: usize, _Locale: _locale_t) [*c]u8;
pub extern fn strpbrk(_Str: [*c]const u8, _Control: [*c]const u8) [*c]u8;
pub extern fn strrchr(_Str: [*c]const u8, _Ch: c_int) [*c]u8;
pub extern fn _strrev(_Str: [*c]u8) [*c]u8;
pub extern fn strspn(_Str: [*c]const u8, _Control: [*c]const u8) usize;
pub extern fn strstr(_Str: [*c]const u8, _SubStr: [*c]const u8) [*c]u8;
pub extern fn strtok(noalias _Str: [*c]u8, noalias _Delim: [*c]const u8) [*c]u8;
pub extern fn strtok_r(noalias _Str: [*c]u8, noalias _Delim: [*c]const u8, noalias __last: [*c][*c]u8) [*c]u8;
pub extern fn _strupr(_String: [*c]u8) [*c]u8;
pub extern fn _strupr_l(_String: [*c]u8, _Locale: _locale_t) [*c]u8;
pub extern fn strxfrm(noalias _Dst: [*c]u8, noalias _Src: [*c]const u8, _MaxCount: usize) usize;
pub extern fn _strxfrm_l(noalias _Dst: [*c]u8, noalias _Src: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) usize;
pub extern fn strdup(_Src: [*c]const u8) [*c]u8;
pub extern fn strcmpi(_Str1: [*c]const u8, _Str2: [*c]const u8) c_int;
pub extern fn stricmp(_Str1: [*c]const u8, _Str2: [*c]const u8) c_int;
pub extern fn strlwr(_Str: [*c]u8) [*c]u8;
pub extern fn strnicmp(_Str1: [*c]const u8, _Str: [*c]const u8, _MaxCount: usize) c_int;
pub fn strncasecmp(arg___sz1: [*c]const u8, arg___sz2: [*c]const u8, arg___sizeMaxCompare: usize) callconv(.c) c_int {
    var __sz1 = arg___sz1;
    _ = &__sz1;
    var __sz2 = arg___sz2;
    _ = &__sz2;
    var __sizeMaxCompare = arg___sizeMaxCompare;
    _ = &__sizeMaxCompare;
    return _strnicmp(__sz1, __sz2, __sizeMaxCompare);
}
pub fn strcasecmp(arg___sz1: [*c]const u8, arg___sz2: [*c]const u8) callconv(.c) c_int {
    var __sz1 = arg___sz1;
    _ = &__sz1;
    var __sz2 = arg___sz2;
    _ = &__sz2;
    return _stricmp(__sz1, __sz2);
}
pub extern fn strnset(_Str: [*c]u8, _Val: c_int, _MaxCount: usize) [*c]u8;
pub extern fn strrev(_Str: [*c]u8) [*c]u8;
pub extern fn strset(_Str: [*c]u8, _Val: c_int) [*c]u8;
pub extern fn strupr(_Str: [*c]u8) [*c]u8;
pub extern fn _wcsdup(_Str: [*c]const wchar_t) [*c]wchar_t;
pub extern fn wcscat(noalias _Dest: [*c]wchar_t, noalias _Source: [*c]const wchar_t) [*c]wchar_t;
pub extern fn wcschr(_Str: [*c]const wchar_t, _Ch: wchar_t) [*c]wchar_t;
pub extern fn wcscmp(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t) c_int;
pub extern fn wcscpy(noalias _Dest: [*c]wchar_t, noalias _Source: [*c]const wchar_t) [*c]wchar_t;
pub extern fn wcscspn(_Str: [*c]const wchar_t, _Control: [*c]const wchar_t) usize;
pub extern fn wcslen(_Str: [*c]const wchar_t) usize;
pub extern fn wcsnlen(_Src: [*c]const wchar_t, _MaxCount: usize) usize;
pub extern fn wcsncat(noalias _Dest: [*c]wchar_t, noalias _Source: [*c]const wchar_t, _Count: usize) [*c]wchar_t;
pub extern fn wcsncmp(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _MaxCount: usize) c_int;
pub extern fn wcsncpy(noalias _Dest: [*c]wchar_t, noalias _Source: [*c]const wchar_t, _Count: usize) [*c]wchar_t;
pub extern fn _wcsncpy_l(noalias _Dest: [*c]wchar_t, noalias _Source: [*c]const wchar_t, _Count: usize, _Locale: _locale_t) [*c]wchar_t;
pub extern fn wcspbrk(_Str: [*c]const wchar_t, _Control: [*c]const wchar_t) [*c]wchar_t;
pub extern fn wcsrchr(_Str: [*c]const wchar_t, _Ch: wchar_t) [*c]wchar_t;
pub extern fn wcsspn(_Str: [*c]const wchar_t, _Control: [*c]const wchar_t) usize;
pub extern fn wcsstr(_Str: [*c]const wchar_t, _SubStr: [*c]const wchar_t) [*c]wchar_t;
pub extern fn wcstok(noalias _Str: [*c]wchar_t, noalias _Delim: [*c]const wchar_t, noalias _Ptr: [*c][*c]wchar_t) [*c]wchar_t;
pub extern fn _wcstok(noalias _Str: [*c]wchar_t, noalias _Delim: [*c]const wchar_t) [*c]wchar_t;
pub extern fn _wcserror(_ErrNum: c_int) [*c]wchar_t;
pub extern fn __wcserror(_Str: [*c]const wchar_t) [*c]wchar_t;
pub extern fn _wcsicmp(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t) c_int;
pub extern fn _wcsicmp_l(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _Locale: _locale_t) c_int;
pub extern fn _wcsnicmp(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _MaxCount: usize) c_int;
pub extern fn _wcsnicmp_l(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _MaxCount: usize, _Locale: _locale_t) c_int;
pub extern fn _wcsnset(_Str: [*c]wchar_t, _Val: wchar_t, _MaxCount: usize) [*c]wchar_t;
pub extern fn _wcsrev(_Str: [*c]wchar_t) [*c]wchar_t;
pub extern fn _wcsset(_Str: [*c]wchar_t, _Val: wchar_t) [*c]wchar_t;
pub extern fn _wcslwr(_String: [*c]wchar_t) [*c]wchar_t;
pub extern fn _wcslwr_l(_String: [*c]wchar_t, _Locale: _locale_t) [*c]wchar_t;
pub extern fn _wcsupr(_String: [*c]wchar_t) [*c]wchar_t;
pub extern fn _wcsupr_l(_String: [*c]wchar_t, _Locale: _locale_t) [*c]wchar_t;
pub extern fn wcsxfrm(noalias _Dst: [*c]wchar_t, noalias _Src: [*c]const wchar_t, _MaxCount: usize) usize;
pub extern fn _wcsxfrm_l(noalias _Dst: [*c]wchar_t, noalias _Src: [*c]const wchar_t, _MaxCount: usize, _Locale: _locale_t) usize;
pub extern fn wcscoll(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t) c_int;
pub extern fn _wcscoll_l(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _Locale: _locale_t) c_int;
pub extern fn _wcsicoll(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t) c_int;
pub extern fn _wcsicoll_l(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _Locale: _locale_t) c_int;
pub extern fn _wcsncoll(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _MaxCount: usize) c_int;
pub extern fn _wcsncoll_l(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _MaxCount: usize, _Locale: _locale_t) c_int;
pub extern fn _wcsnicoll(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _MaxCount: usize) c_int;
pub extern fn _wcsnicoll_l(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _MaxCount: usize, _Locale: _locale_t) c_int;
pub extern fn wcsdup(_Str: [*c]const wchar_t) [*c]wchar_t;
pub extern fn wcsicmp(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t) c_int;
pub extern fn wcsnicmp(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _MaxCount: usize) c_int;
pub extern fn wcsnset(_Str: [*c]wchar_t, _Val: wchar_t, _MaxCount: usize) [*c]wchar_t;
pub extern fn wcsrev(_Str: [*c]wchar_t) [*c]wchar_t;
pub extern fn wcsset(_Str: [*c]wchar_t, _Val: wchar_t) [*c]wchar_t;
pub extern fn wcslwr(_Str: [*c]wchar_t) [*c]wchar_t;
pub extern fn wcsupr(_Str: [*c]wchar_t) [*c]wchar_t;
pub extern fn wcsicoll(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t) c_int;
pub extern fn _strset_s(_Dst: [*c]u8, _DstSize: usize, _Value: c_int) errno_t;
pub extern fn _strerror_s(_Buf: [*c]u8, _SizeInBytes: usize, _ErrMsg: [*c]const u8) errno_t;
pub extern fn strerror_s(_Buf: [*c]u8, _SizeInBytes: usize, _ErrNum: c_int) errno_t;
pub extern fn _strlwr_s(_Str: [*c]u8, _Size: usize) errno_t;
pub extern fn _strlwr_s_l(_Str: [*c]u8, _Size: usize, _Locale: _locale_t) errno_t;
pub extern fn _strnset_s(_Str: [*c]u8, _Size: usize, _Val: c_int, _MaxCount: usize) errno_t;
pub extern fn _strupr_s(_Str: [*c]u8, _Size: usize) errno_t;
pub extern fn _strupr_s_l(_Str: [*c]u8, _Size: usize, _Locale: _locale_t) errno_t;
pub extern fn strncat_s(_Dst: [*c]u8, _DstSizeInChars: usize, _Src: [*c]const u8, _MaxCount: usize) errno_t;
pub extern fn _strncat_s_l(_Dst: [*c]u8, _DstSizeInChars: usize, _Src: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) errno_t;
pub extern fn strcpy_s(_Dst: [*c]u8, _SizeInBytes: rsize_t, _Src: [*c]const u8) errno_t;
pub extern fn strncpy_s(_Dst: [*c]u8, _DstSizeInChars: usize, _Src: [*c]const u8, _MaxCount: usize) errno_t;
pub extern fn _strncpy_s_l(_Dst: [*c]u8, _DstSizeInChars: usize, _Src: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) errno_t;
pub extern fn strtok_s(_Str: [*c]u8, _Delim: [*c]const u8, _Context: [*c][*c]u8) [*c]u8;
pub extern fn _strtok_s_l(_Str: [*c]u8, _Delim: [*c]const u8, _Context: [*c][*c]u8, _Locale: _locale_t) [*c]u8;
pub extern fn strcat_s(_Dst: [*c]u8, _SizeInBytes: rsize_t, _Src: [*c]const u8) errno_t;
pub inline fn strnlen_s(arg__src: [*c]const u8, arg__count: usize) usize {
    var _src = arg__src;
    _ = &_src;
    var _count = arg__count;
    _ = &_count;
    return if (_src != null) strnlen(_src, _count) else @as(usize, 0);
}
pub extern fn memmove_s(_dest: ?*anyopaque, _numberOfElements: usize, _src: ?*const anyopaque, _count: usize) errno_t;
pub extern fn wcstok_s(_Str: [*c]wchar_t, _Delim: [*c]const wchar_t, _Context: [*c][*c]wchar_t) [*c]wchar_t;
pub extern fn _wcserror_s(_Buf: [*c]wchar_t, _SizeInWords: usize, _ErrNum: c_int) errno_t;
pub extern fn __wcserror_s(_Buffer: [*c]wchar_t, _SizeInWords: usize, _ErrMsg: [*c]const wchar_t) errno_t;
pub extern fn _wcsnset_s(_Dst: [*c]wchar_t, _DstSizeInWords: usize, _Val: wchar_t, _MaxCount: usize) errno_t;
pub extern fn _wcsset_s(_Str: [*c]wchar_t, _SizeInWords: usize, _Val: wchar_t) errno_t;
pub extern fn _wcslwr_s(_Str: [*c]wchar_t, _SizeInWords: usize) errno_t;
pub extern fn _wcslwr_s_l(_Str: [*c]wchar_t, _SizeInWords: usize, _Locale: _locale_t) errno_t;
pub extern fn _wcsupr_s(_Str: [*c]wchar_t, _Size: usize) errno_t;
pub extern fn _wcsupr_s_l(_Str: [*c]wchar_t, _Size: usize, _Locale: _locale_t) errno_t;
pub extern fn wcscpy_s(_Dst: [*c]wchar_t, _SizeInWords: rsize_t, _Src: [*c]const wchar_t) errno_t;
pub extern fn wcscat_s(_Dst: [*c]wchar_t, _SizeInWords: rsize_t, _Src: [*c]const wchar_t) errno_t;
pub extern fn wcsncat_s(_Dst: [*c]wchar_t, _DstSizeInChars: usize, _Src: [*c]const wchar_t, _MaxCount: usize) errno_t;
pub extern fn _wcsncat_s_l(_Dst: [*c]wchar_t, _DstSizeInChars: usize, _Src: [*c]const wchar_t, _MaxCount: usize, _Locale: _locale_t) errno_t;
pub extern fn wcsncpy_s(_Dst: [*c]wchar_t, _DstSizeInChars: usize, _Src: [*c]const wchar_t, _MaxCount: usize) errno_t;
pub extern fn _wcsncpy_s_l(_Dst: [*c]wchar_t, _DstSizeInChars: usize, _Src: [*c]const wchar_t, _MaxCount: usize, _Locale: _locale_t) errno_t;
pub extern fn _wcstok_s_l(_Str: [*c]wchar_t, _Delim: [*c]const wchar_t, _Context: [*c][*c]wchar_t, _Locale: _locale_t) [*c]wchar_t;
pub extern fn _wcsset_s_l(_Str: [*c]wchar_t, _SizeInChars: usize, _Val: wchar_t, _Locale: _locale_t) errno_t;
pub extern fn _wcsnset_s_l(_Str: [*c]wchar_t, _SizeInChars: usize, _Val: wchar_t, _Count: usize, _Locale: _locale_t) errno_t;
pub inline fn wcsnlen_s(arg__src: [*c]const wchar_t, arg__count: usize) usize {
    var _src = arg__src;
    _ = &_src;
    var _count = arg__count;
    _ = &_count;
    return if (_src != null) wcsnlen(_src, _count) else @as(usize, 0);
}
pub extern fn _getcwd([*c]u8, c_int) [*c]u8;
pub const _fsize_t = c_ulong;
pub const struct__finddata32_t = extern struct {
    attrib: c_uint = 0,
    time_create: __time32_t = 0,
    time_access: __time32_t = 0,
    time_write: __time32_t = 0,
    size: _fsize_t = 0,
    name: [260]u8 = @import("std").mem.zeroes([260]u8),
};
pub const struct__finddata32i64_t = extern struct {
    attrib: c_uint = 0,
    time_create: __time32_t = 0,
    time_access: __time32_t = 0,
    time_write: __time32_t = 0,
    size: c_longlong = 0,
    name: [260]u8 = @import("std").mem.zeroes([260]u8),
};
pub const struct__finddata64i32_t = extern struct {
    attrib: c_uint = 0,
    time_create: __time64_t = 0,
    time_access: __time64_t = 0,
    time_write: __time64_t = 0,
    size: _fsize_t = 0,
    name: [260]u8 = @import("std").mem.zeroes([260]u8),
};
pub const struct___finddata64_t = extern struct {
    attrib: c_uint = 0,
    time_create: __time64_t = 0,
    time_access: __time64_t = 0,
    time_write: __time64_t = 0,
    size: c_longlong = 0,
    name: [260]u8 = @import("std").mem.zeroes([260]u8),
};
pub const struct__wfinddata32_t = extern struct {
    attrib: c_uint = 0,
    time_create: __time32_t = 0,
    time_access: __time32_t = 0,
    time_write: __time32_t = 0,
    size: _fsize_t = 0,
    name: [260]wchar_t = @import("std").mem.zeroes([260]wchar_t),
};
pub const struct__wfinddata32i64_t = extern struct {
    attrib: c_uint = 0,
    time_create: __time32_t = 0,
    time_access: __time32_t = 0,
    time_write: __time32_t = 0,
    size: c_longlong = 0,
    name: [260]wchar_t = @import("std").mem.zeroes([260]wchar_t),
};
pub const struct__wfinddata64i32_t = extern struct {
    attrib: c_uint = 0,
    time_create: __time64_t = 0,
    time_access: __time64_t = 0,
    time_write: __time64_t = 0,
    size: _fsize_t = 0,
    name: [260]wchar_t = @import("std").mem.zeroes([260]wchar_t),
};
pub const struct__wfinddata64_t = extern struct {
    attrib: c_uint = 0,
    time_create: __time64_t = 0,
    time_access: __time64_t = 0,
    time_write: __time64_t = 0,
    size: c_longlong = 0,
    name: [260]wchar_t = @import("std").mem.zeroes([260]wchar_t),
};
pub const _off_t = c_long;
pub const off32_t = c_long;
pub const _off64_t = c_longlong;
pub const off64_t = c_longlong;
pub const off_t = off32_t;
pub extern fn _access(_Filename: [*c]const u8, _AccessMode: c_int) c_int;
pub extern fn _access_s(_Filename: [*c]const u8, _AccessMode: c_int) errno_t;
pub extern fn _chmod(_Filename: [*c]const u8, _Mode: c_int) c_int;
pub extern fn _chsize(_FileHandle: c_int, _Size: c_long) c_int;
pub extern fn _chsize_s(_FileHandle: c_int, _Size: c_longlong) errno_t;
pub extern fn _close(_FileHandle: c_int) c_int;
pub extern fn _commit(_FileHandle: c_int) c_int;
pub extern fn _creat(_Filename: [*c]const u8, _PermissionMode: c_int) c_int;
pub extern fn _dup(_FileHandle: c_int) c_int;
pub extern fn _dup2(_FileHandleSrc: c_int, _FileHandleDst: c_int) c_int;
pub extern fn _eof(_FileHandle: c_int) c_int;
pub extern fn _filelength(_FileHandle: c_int) c_long;
pub extern fn _findfirst32(_Filename: [*c]const u8, _FindData: [*c]struct__finddata32_t) isize;
pub extern fn _findnext32(_FindHandle: isize, _FindData: [*c]struct__finddata32_t) c_int;
pub extern fn _findclose(_FindHandle: isize) c_int;
pub extern fn _isatty(_FileHandle: c_int) c_int;
pub extern fn _locking(_FileHandle: c_int, _LockMode: c_int, _NumOfBytes: c_long) c_int;
pub extern fn _lseek(_FileHandle: c_int, _Offset: c_long, _Origin: c_int) c_long;
pub extern fn lseek64(fd: c_int, offset: _off64_t, whence: c_int) _off64_t;
pub extern fn _mktemp(_TemplateName: [*c]u8) [*c]u8;
pub extern fn _mktemp_s(_TemplateName: [*c]u8, _Size: usize) errno_t;
pub extern fn _pipe(_PtHandles: [*c]c_int, _PipeSize: c_uint, _TextMode: c_int) c_int;
pub extern fn _read(_FileHandle: c_int, _DstBuf: ?*anyopaque, _MaxCharCount: c_uint) c_int;
pub extern fn remove(_Filename: [*c]const u8) c_int;
pub extern fn rename(_OldFilename: [*c]const u8, _NewFilename: [*c]const u8) c_int;
pub extern fn _unlink(_Filename: [*c]const u8) c_int;
pub extern fn unlink(_Filename: [*c]const u8) c_int;
pub extern fn _setmode(_FileHandle: c_int, _Mode: c_int) c_int;
pub extern fn _tell(_FileHandle: c_int) c_long;
pub extern fn _umask(_Mode: c_int) c_int;
pub extern fn _umask_s(_NewMode: c_int, _OldMode: [*c]c_int) errno_t;
pub extern fn _write(_FileHandle: c_int, _Buf: ?*const anyopaque, _MaxCharCount: c_uint) c_int;
pub extern fn _filelengthi64(_FileHandle: c_int) c_longlong;
pub extern fn _findfirst32i64(_Filename: [*c]const u8, _FindData: [*c]struct__finddata32i64_t) isize;
pub extern fn _findfirst64(_Filename: [*c]const u8, _FindData: [*c]struct___finddata64_t) isize;
pub fn _findfirst64i32(arg__Filename: [*c]const u8, arg__FindData: [*c]struct__finddata64i32_t) callconv(.c) isize {
    var _Filename = arg__Filename;
    _ = &_Filename;
    var _FindData = arg__FindData;
    _ = &_FindData;
    var fd: struct___finddata64_t = undefined;
    _ = &fd;
    var ret: isize = _findfirst64(_Filename, &fd);
    _ = &ret;
    if (ret == @as(isize, -@as(c_int, 1))) {
        _ = memset(@ptrCast(@alignCast(_FindData)), 0, @sizeOf(struct__finddata64i32_t));
        return -@as(c_int, 1);
    }
    _FindData.*.attrib = fd.attrib;
    _FindData.*.time_create = fd.time_create;
    _FindData.*.time_access = fd.time_access;
    _FindData.*.time_write = fd.time_write;
    _FindData.*.size = @bitCast(@as(c_long, @truncate(fd.size)));
    _ = strncpy(@ptrCast(@alignCast(&_FindData.*.name)), @ptrCast(@alignCast(&fd.name)), 260);
    return ret;
}
pub extern fn _findnext32i64(_FindHandle: isize, _FindData: [*c]struct__finddata32i64_t) c_int;
pub extern fn _findnext64(_FindHandle: isize, _FindData: [*c]struct___finddata64_t) c_int;
pub fn _findnext64i32(arg__FindHandle: isize, arg__FindData: [*c]struct__finddata64i32_t) callconv(.c) c_int {
    var _FindHandle = arg__FindHandle;
    _ = &_FindHandle;
    var _FindData = arg__FindData;
    _ = &_FindData;
    var fd: struct___finddata64_t = undefined;
    _ = &fd;
    var __ret: c_int = _findnext64(_FindHandle, &fd);
    _ = &__ret;
    if (__ret == -@as(c_int, 1)) {
        _ = memset(@ptrCast(@alignCast(_FindData)), 0, @sizeOf(struct__finddata64i32_t));
        return -@as(c_int, 1);
    }
    _FindData.*.attrib = fd.attrib;
    _FindData.*.time_create = fd.time_create;
    _FindData.*.time_access = fd.time_access;
    _FindData.*.time_write = fd.time_write;
    _FindData.*.size = @bitCast(@as(c_long, @truncate(fd.size)));
    _ = strncpy(@ptrCast(@alignCast(&_FindData.*.name)), @ptrCast(@alignCast(&fd.name)), 260);
    return __ret;
}
pub extern fn _lseeki64(_FileHandle: c_int, _Offset: c_longlong, _Origin: c_int) c_longlong;
pub extern fn _telli64(_FileHandle: c_int) c_longlong;
pub extern fn chdir([*c]const u8) c_int;
pub extern fn getcwd([*c]u8, c_int) [*c]u8;
pub extern fn mkdir([*c]const u8) c_int;
pub extern fn mktemp([*c]u8) [*c]u8;
pub extern fn rmdir([*c]const u8) c_int;
pub extern fn chmod([*c]const u8, c_int) c_int;
pub extern fn _sopen_s(_FileHandle: [*c]c_int, _Filename: [*c]const u8, _OpenFlag: c_int, _ShareFlag: c_int, _PermissionMode: c_int) errno_t;
pub extern fn _open(_Filename: [*c]const u8, _OpenFlag: c_int, ...) c_int;
pub extern fn _sopen(_Filename: [*c]const u8, _OpenFlag: c_int, _ShareFlag: c_int, ...) c_int;
pub extern fn _waccess(_Filename: [*c]const wchar_t, _AccessMode: c_int) c_int;
pub extern fn _waccess_s(_Filename: [*c]const wchar_t, _AccessMode: c_int) errno_t;
pub extern fn _wchmod(_Filename: [*c]const wchar_t, _Mode: c_int) c_int;
pub extern fn _wcreat(_Filename: [*c]const wchar_t, _PermissionMode: c_int) c_int;
pub extern fn _wfindfirst32(_Filename: [*c]const wchar_t, _FindData: [*c]struct__wfinddata32_t) isize;
pub extern fn _wfindnext32(_FindHandle: isize, _FindData: [*c]struct__wfinddata32_t) c_int;
pub extern fn _wunlink(_Filename: [*c]const wchar_t) c_int;
pub extern fn _wrename(_OldFilename: [*c]const wchar_t, _NewFilename: [*c]const wchar_t) c_int;
pub extern fn _wmktemp(_TemplateName: [*c]wchar_t) [*c]wchar_t;
pub extern fn _wmktemp_s(_TemplateName: [*c]wchar_t, _SizeInWords: usize) errno_t;
pub extern fn _wfindfirst32i64(_Filename: [*c]const wchar_t, _FindData: [*c]struct__wfinddata32i64_t) isize;
pub extern fn _wfindfirst64i32(_Filename: [*c]const wchar_t, _FindData: [*c]struct__wfinddata64i32_t) isize;
pub extern fn _wfindfirst64(_Filename: [*c]const wchar_t, _FindData: [*c]struct__wfinddata64_t) isize;
pub extern fn _wfindnext32i64(_FindHandle: isize, _FindData: [*c]struct__wfinddata32i64_t) c_int;
pub extern fn _wfindnext64i32(_FindHandle: isize, _FindData: [*c]struct__wfinddata64i32_t) c_int;
pub extern fn _wfindnext64(_FindHandle: isize, _FindData: [*c]struct__wfinddata64_t) c_int;
pub extern fn _wsopen_s(_FileHandle: [*c]c_int, _Filename: [*c]const wchar_t, _OpenFlag: c_int, _ShareFlag: c_int, _PermissionFlag: c_int) errno_t;
pub extern fn _wopen(_Filename: [*c]const wchar_t, _OpenFlag: c_int, ...) c_int;
pub extern fn _wsopen(_Filename: [*c]const wchar_t, _OpenFlag: c_int, _ShareFlag: c_int, ...) c_int;
pub extern fn __lock_fhandle(_Filehandle: c_int) c_int;
pub extern fn _unlock_fhandle(_Filehandle: c_int) void;
pub extern fn _get_osfhandle(_FileHandle: c_int) isize;
pub extern fn _open_osfhandle(_OSFileHandle: isize, _Flags: c_int) c_int;
pub extern fn access(_Filename: [*c]const u8, _AccessMode: c_int) c_int;
pub extern fn chsize(_FileHandle: c_int, _Size: c_long) c_int;
pub extern fn close(_FileHandle: c_int) c_int;
pub extern fn creat(_Filename: [*c]const u8, _PermissionMode: c_int) c_int;
pub extern fn dup(_FileHandle: c_int) c_int;
pub extern fn dup2(_FileHandleSrc: c_int, _FileHandleDst: c_int) c_int;
pub extern fn eof(_FileHandle: c_int) c_int;
pub extern fn filelength(_FileHandle: c_int) c_long;
pub extern fn isatty(_FileHandle: c_int) c_int;
pub extern fn locking(_FileHandle: c_int, _LockMode: c_int, _NumOfBytes: c_long) c_int;
pub extern fn lseek(_FileHandle: c_int, _Offset: c_long, _Origin: c_int) c_long;
pub extern fn open(_Filename: [*c]const u8, _OpenFlag: c_int, ...) c_int;
pub extern fn read(_FileHandle: c_int, _DstBuf: ?*anyopaque, _MaxCharCount: c_uint) c_int;
pub extern fn setmode(_FileHandle: c_int, _Mode: c_int) c_int;
pub extern fn sopen(_Filename: [*c]const u8, _OpenFlag: c_int, _ShareFlag: c_int, ...) c_int;
pub extern fn tell(_FileHandle: c_int) c_long;
pub extern fn umask(_Mode: c_int) c_int;
pub extern fn write(_Filehandle: c_int, _Buf: ?*const anyopaque, _MaxCharCount: c_uint) c_int;
pub extern fn __local_stdio_printf_options() [*c]c_ulonglong;
pub extern fn __local_stdio_scanf_options() [*c]c_ulonglong;
pub const struct__iobuf = extern struct {
    _Placeholder: ?*anyopaque = null,
    pub const __mingw_fscanf = __root.__mingw_fscanf;
    pub const __mingw_vfscanf = __root.__mingw_vfscanf;
    pub const __mingw_fprintf = __root.__mingw_fprintf;
    pub const __mingw_vfprintf = __root.__mingw_vfprintf;
    pub const __ms_fscanf = __root.__ms_fscanf;
    pub const __ms_vfscanf = __root.__ms_vfscanf;
    pub const __ms_fprintf = __root.__ms_fprintf;
    pub const __ms_vfprintf = __root.__ms_vfprintf;
    pub const fprintf = __root.fprintf;
    pub const vfprintf = __root.vfprintf;
    pub const fscanf = __root.fscanf;
    pub const vfscanf = __root.vfscanf;
    pub const _filbuf = __root._filbuf;
    pub const clearerr = __root.clearerr;
    pub const fclose = __root.fclose;
    pub const feof = __root.feof;
    pub const ferror = __root.ferror;
    pub const fflush = __root.fflush;
    pub const fgetc = __root.fgetc;
    pub const fgetpos = __root.fgetpos;
    pub const fgetpos64 = __root.fgetpos64;
    pub const _fileno = __root._fileno;
    pub const fsetpos = __root.fsetpos;
    pub const fsetpos64 = __root.fsetpos64;
    pub const fseek = __root.fseek;
    pub const ftell = __root.ftell;
    pub const _fseeki64 = __root._fseeki64;
    pub const _ftelli64 = __root._ftelli64;
    pub const fseeko = __root.fseeko;
    pub const fseeko64 = __root.fseeko64;
    pub const ftello = __root.ftello;
    pub const ftello64 = __root.ftello64;
    pub const getc = __root.getc;
    pub const _getw = __root._getw;
    pub const _pclose = __root._pclose;
    pub const rewind = __root.rewind;
    pub const setbuf = __root.setbuf;
    pub const setvbuf = __root.setvbuf;
    pub const __mingw_fwscanf = __root.__mingw_fwscanf;
    pub const __mingw_vfwscanf = __root.__mingw_vfwscanf;
    pub const __mingw_fwprintf = __root.__mingw_fwprintf;
    pub const __mingw_vfwprintf = __root.__mingw_vfwprintf;
    pub const __ms_fwscanf = __root.__ms_fwscanf;
    pub const __ms_vfwscanf = __root.__ms_vfwscanf;
    pub const __ms_fwprintf = __root.__ms_fwprintf;
    pub const __ms_vfwprintf = __root.__ms_vfwprintf;
    pub const fwscanf = __root.fwscanf;
    pub const vfwscanf = __root.vfwscanf;
    pub const fwprintf = __root.fwprintf;
    pub const vfwprintf = __root.vfwprintf;
    pub const fgetwc = __root.fgetwc;
    pub const getwc = __root.getwc;
    pub const _fgetwc_nolock = __root._fgetwc_nolock;
    pub const _fgetc_nolock = __root._fgetc_nolock;
    pub const _getc_nolock = __root._getc_nolock;
    pub const _lock_file = __root._lock_file;
    pub const _unlock_file = __root._unlock_file;
    pub const _fclose_nolock = __root._fclose_nolock;
    pub const _fflush_nolock = __root._fflush_nolock;
    pub const _fseek_nolock = __root._fseek_nolock;
    pub const _ftell_nolock = __root._ftell_nolock;
    pub const _fseeki64_nolock = __root._fseeki64_nolock;
    pub const _ftelli64_nolock = __root._ftelli64_nolock;
    pub const fileno = __root.fileno;
    pub const getw = __root.getw;
    pub const clearerr_s = __root.clearerr_s;
    pub const _vfscanf_s_l = __root._vfscanf_s_l;
    pub const vfscanf_s = __root.vfscanf_s;
    pub const _fscanf_s_l = __root._fscanf_s_l;
    pub const fscanf_s = __root.fscanf_s;
    pub const _vfscanf_l = __root._vfscanf_l;
    pub const _fscanf_l = __root._fscanf_l;
    pub const _vfprintf_s_l = __root._vfprintf_s_l;
    pub const vfprintf_s = __root.vfprintf_s;
    pub const _fprintf_s_l = __root._fprintf_s_l;
    pub const fprintf_s = __root.fprintf_s;
    pub const _vfprintf_p_l = __root._vfprintf_p_l;
    pub const _vfprintf_p = __root._vfprintf_p;
    pub const _fprintf_p_l = __root._fprintf_p_l;
    pub const _fprintf_p = __root._fprintf_p;
    pub const _vfprintf_l = __root._vfprintf_l;
    pub const _fprintf_l = __root._fprintf_l;
    pub const _vfwscanf_s_l = __root._vfwscanf_s_l;
    pub const vfwscanf_s = __root.vfwscanf_s;
    pub const _fwscanf_s_l = __root._fwscanf_s_l;
    pub const fwscanf_s = __root.fwscanf_s;
    pub const _vfwprintf_s_l = __root._vfwprintf_s_l;
    pub const vfwprintf_s = __root.vfwprintf_s;
    pub const _fwprintf_s_l = __root._fwprintf_s_l;
    pub const fwprintf_s = __root.fwprintf_s;
    pub const fwide = __root.fwide;
    pub const PyRun_AnyFileExFlags = __root.PyRun_AnyFileExFlags;
    pub const PyRun_SimpleFileExFlags = __root.PyRun_SimpleFileExFlags;
    pub const PyRun_InteractiveOneFlags = __root.PyRun_InteractiveOneFlags;
    pub const PyRun_InteractiveOneObject = __root.PyRun_InteractiveOneObject;
    pub const PyRun_InteractiveLoopFlags = __root.PyRun_InteractiveLoopFlags;
    pub const PyRun_FileExFlags = __root.PyRun_FileExFlags;
    pub const PyRun_AnyFile = __root.PyRun_AnyFile;
    pub const PyRun_AnyFileEx = __root.PyRun_AnyFileEx;
    pub const PyRun_AnyFileFlags = __root.PyRun_AnyFileFlags;
    pub const PyRun_SimpleFile = __root.PyRun_SimpleFile;
    pub const PyRun_SimpleFileEx = __root.PyRun_SimpleFileEx;
    pub const PyRun_InteractiveOne = __root.PyRun_InteractiveOne;
    pub const PyRun_InteractiveLoop = __root.PyRun_InteractiveLoop;
    pub const PyRun_File = __root.PyRun_File;
    pub const PyRun_FileEx = __root.PyRun_FileEx;
    pub const PyRun_FileFlags = __root.PyRun_FileFlags;
    pub const PyOS_Readline = __root.PyOS_Readline;
    pub const Py_FdIsInteractive = __root.Py_FdIsInteractive;
    pub const filbuf = __root._filbuf;
    pub const fseeki64 = __root._fseeki64;
    pub const ftelli64 = __root._ftelli64;
    pub const nolock = __root._fgetwc_nolock;
    pub const file = __root._lock_file;
    pub const s = __root.clearerr_s;
    pub const l = __root._vfscanf_s_l;
    pub const p = __root._vfprintf_p;
    pub const AnyFileExFlags = __root.PyRun_AnyFileExFlags;
    pub const SimpleFileExFlags = __root.PyRun_SimpleFileExFlags;
    pub const InteractiveOneFlags = __root.PyRun_InteractiveOneFlags;
    pub const InteractiveOneObject = __root.PyRun_InteractiveOneObject;
    pub const InteractiveLoopFlags = __root.PyRun_InteractiveLoopFlags;
    pub const FileExFlags = __root.PyRun_FileExFlags;
    pub const AnyFile = __root.PyRun_AnyFile;
    pub const AnyFileEx = __root.PyRun_AnyFileEx;
    pub const AnyFileFlags = __root.PyRun_AnyFileFlags;
    pub const SimpleFile = __root.PyRun_SimpleFile;
    pub const SimpleFileEx = __root.PyRun_SimpleFileEx;
    pub const InteractiveOne = __root.PyRun_InteractiveOne;
    pub const InteractiveLoop = __root.PyRun_InteractiveLoop;
    pub const File = __root.PyRun_File;
    pub const FileEx = __root.PyRun_FileEx;
    pub const FileFlags = __root.PyRun_FileFlags;
    pub const Readline = __root.PyOS_Readline;
    pub const FdIsInteractive = __root.Py_FdIsInteractive;
};
pub const FILE = struct__iobuf;
pub extern fn __acrt_iob_func(index: c_uint) [*c]FILE;
pub extern fn __iob_func() [*c]FILE;
pub const fpos_t = c_longlong;
pub extern fn __mingw_sscanf(noalias _Src: [*c]const u8, noalias _Format: [*c]const u8, ...) c_int;
pub extern fn __mingw_vsscanf(noalias _Str: [*c]const u8, noalias Format: [*c]const u8, argp: va_list) c_int;
pub extern fn __mingw_scanf(noalias _Format: [*c]const u8, ...) c_int;
pub extern fn __mingw_vscanf(noalias Format: [*c]const u8, argp: va_list) c_int;
pub extern fn __mingw_fscanf(noalias _File: [*c]FILE, noalias _Format: [*c]const u8, ...) c_int;
pub extern fn __mingw_vfscanf(noalias fp: [*c]FILE, noalias Format: [*c]const u8, argp: va_list) c_int;
pub extern fn __mingw_vsnprintf(noalias _DstBuf: [*c]u8, _MaxCount: usize, noalias _Format: [*c]const u8, _ArgList: va_list) c_int;
pub extern fn __mingw_snprintf(noalias s: [*c]u8, n: usize, noalias format: [*c]const u8, ...) c_int;
pub extern fn __mingw_printf(noalias [*c]const u8, ...) c_int;
pub extern fn __mingw_vprintf(noalias [*c]const u8, va_list) c_int;
pub extern fn __mingw_fprintf(noalias [*c]FILE, noalias [*c]const u8, ...) c_int;
pub extern fn __mingw_vfprintf(noalias [*c]FILE, noalias [*c]const u8, va_list) c_int;
pub extern fn __mingw_sprintf(noalias [*c]u8, noalias [*c]const u8, ...) c_int;
pub extern fn __mingw_vsprintf(noalias [*c]u8, noalias [*c]const u8, va_list) c_int;
pub extern fn __mingw_asprintf(noalias [*c][*c]u8, noalias [*c]const u8, ...) c_int;
pub extern fn __mingw_vasprintf(noalias [*c][*c]u8, noalias [*c]const u8, va_list) c_int;
pub extern fn __ms_sscanf(noalias _Src: [*c]const u8, noalias _Format: [*c]const u8, ...) c_int;
pub extern fn __ms_vsscanf(noalias _Str: [*c]const u8, noalias _Format: [*c]const u8, argp: va_list) c_int;
pub extern fn __ms_scanf(noalias _Format: [*c]const u8, ...) c_int;
pub extern fn __ms_vscanf(noalias _Format: [*c]const u8, argp: va_list) c_int;
pub extern fn __ms_fscanf(noalias _File: [*c]FILE, noalias _Format: [*c]const u8, ...) c_int;
pub extern fn __ms_vfscanf(noalias _File: [*c]FILE, noalias _Format: [*c]const u8, argp: va_list) c_int;
pub extern fn __ms_printf(noalias [*c]const u8, ...) c_int;
pub extern fn __ms_vprintf(noalias [*c]const u8, va_list) c_int;
pub extern fn __ms_fprintf(noalias [*c]FILE, noalias [*c]const u8, ...) c_int;
pub extern fn __ms_vfprintf(noalias [*c]FILE, noalias [*c]const u8, va_list) c_int;
pub extern fn __ms_sprintf(noalias [*c]u8, noalias [*c]const u8, ...) c_int;
pub extern fn __ms_vsprintf(noalias [*c]u8, noalias [*c]const u8, va_list) c_int;
pub extern fn __ms_snprintf(noalias [*c]u8, usize, noalias [*c]const u8, ...) c_int;
pub extern fn __ms_vsnprintf(noalias [*c]u8, usize, noalias [*c]const u8, va_list) c_int;
pub extern fn __stdio_common_vsprintf(options: c_ulonglong, str: [*c]u8, len: usize, format: [*c]const u8, locale: _locale_t, valist: va_list) c_int;
pub extern fn __stdio_common_vfprintf(options: c_ulonglong, file: [*c]FILE, format: [*c]const u8, locale: _locale_t, valist: va_list) c_int;
pub extern fn __stdio_common_vsscanf(options: c_ulonglong, input: [*c]const u8, length: usize, format: [*c]const u8, locale: _locale_t, valist: va_list) c_int;
pub extern fn __stdio_common_vfscanf(options: c_ulonglong, file: [*c]FILE, format: [*c]const u8, locale: _locale_t, valist: va_list) c_int;
pub extern fn fprintf(noalias _File: [*c]FILE, noalias _Format: [*c]const u8, ...) c_int;
pub extern fn printf(noalias _Format: [*c]const u8, ...) c_int;
pub extern fn sprintf(noalias _Dest: [*c]u8, noalias _Format: [*c]const u8, ...) c_int;
pub extern fn vfprintf(noalias _File: [*c]FILE, noalias _Format: [*c]const u8, _ArgList: va_list) c_int;
pub extern fn vprintf(noalias _Format: [*c]const u8, _ArgList: va_list) c_int;
pub extern fn vsprintf(noalias _Dest: [*c]u8, noalias _Format: [*c]const u8, _Args: va_list) c_int;
pub extern fn fscanf(noalias _File: [*c]FILE, noalias _Format: [*c]const u8, ...) c_int;
pub extern fn scanf(noalias _Format: [*c]const u8, ...) c_int;
pub extern fn sscanf(noalias _Src: [*c]const u8, noalias _Format: [*c]const u8, ...) c_int;
pub extern fn vfscanf(__stream: [*c]FILE, __format: [*c]const u8, __local_argv: __builtin_va_list) c_int;
pub extern fn vsscanf(noalias __source: [*c]const u8, noalias __format: [*c]const u8, __local_argv: __builtin_va_list) c_int;
pub extern fn vscanf(__format: [*c]const u8, __local_argv: __builtin_va_list) c_int;
pub extern fn _filbuf(_File: [*c]FILE) c_int;
pub extern fn _flsbuf(_Ch: c_int, _File: [*c]FILE) c_int;
pub extern fn _fsopen(_Filename: [*c]const u8, _Mode: [*c]const u8, _ShFlag: c_int) [*c]FILE;
pub extern fn clearerr(_File: [*c]FILE) void;
pub extern fn fclose(_File: [*c]FILE) c_int;
pub extern fn _fcloseall() c_int;
pub extern fn _fdopen(_FileHandle: c_int, _Mode: [*c]const u8) [*c]FILE;
pub extern fn feof(_File: [*c]FILE) c_int;
pub extern fn ferror(_File: [*c]FILE) c_int;
pub extern fn fflush(_File: [*c]FILE) c_int;
pub extern fn fgetc(_File: [*c]FILE) c_int;
pub extern fn _fgetchar() c_int;
pub extern fn fgetpos(noalias _File: [*c]FILE, noalias _Pos: [*c]fpos_t) c_int;
pub extern fn fgetpos64(noalias _File: [*c]FILE, noalias _Pos: [*c]fpos_t) c_int;
pub extern fn fgets(noalias _Buf: [*c]u8, _MaxCount: c_int, noalias _File: [*c]FILE) [*c]u8;
pub extern fn _fileno(_File: [*c]FILE) c_int;
pub extern fn _tempnam(_DirName: [*c]const u8, _FilePrefix: [*c]const u8) [*c]u8;
pub extern fn _flushall() c_int;
pub extern fn fopen(noalias _Filename: [*c]const u8, noalias _Mode: [*c]const u8) [*c]FILE;
pub extern fn fopen64(noalias filename: [*c]const u8, noalias mode: [*c]const u8) [*c]FILE;
pub extern fn fputc(_Ch: c_int, _File: [*c]FILE) c_int;
pub extern fn _fputchar(_Ch: c_int) c_int;
pub extern fn fputs(noalias _Str: [*c]const u8, noalias _File: [*c]FILE) c_int;
pub extern fn fread(noalias _DstBuf: ?*anyopaque, _ElementSize: usize, _Count: usize, noalias _File: [*c]FILE) usize;
pub extern fn freopen(noalias _Filename: [*c]const u8, noalias _Mode: [*c]const u8, noalias _File: [*c]FILE) [*c]FILE;
pub extern fn fsetpos(_File: [*c]FILE, _Pos: [*c]const fpos_t) c_int;
pub extern fn fsetpos64(_File: [*c]FILE, _Pos: [*c]const fpos_t) c_int;
pub extern fn fseek(_File: [*c]FILE, _Offset: c_long, _Origin: c_int) c_int;
pub extern fn ftell(_File: [*c]FILE) c_long;
pub extern fn _fseeki64(_File: [*c]FILE, _Offset: c_longlong, _Origin: c_int) c_int;
pub extern fn _ftelli64(_File: [*c]FILE) c_longlong;
pub fn fseeko(arg__File: [*c]FILE, arg__Offset: _off_t, arg__Origin: c_int) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Offset = arg__Offset;
    _ = &_Offset;
    var _Origin = arg__Origin;
    _ = &_Origin;
    return fseek(_File, _Offset, _Origin);
}
pub fn fseeko64(arg__File: [*c]FILE, arg__Offset: _off64_t, arg__Origin: c_int) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Offset = arg__Offset;
    _ = &_Offset;
    var _Origin = arg__Origin;
    _ = &_Origin;
    return _fseeki64(_File, _Offset, _Origin);
}
pub fn ftello(arg__File: [*c]FILE) callconv(.c) _off_t {
    var _File = arg__File;
    _ = &_File;
    return ftell(_File);
}
pub fn ftello64(arg__File: [*c]FILE) callconv(.c) _off64_t {
    var _File = arg__File;
    _ = &_File;
    return _ftelli64(_File);
}
pub extern fn fwrite(noalias _Str: ?*const anyopaque, _Size: usize, _Count: usize, noalias _File: [*c]FILE) usize;
pub extern fn getc(_File: [*c]FILE) c_int;
pub extern fn getchar() c_int;
pub extern fn _getmaxstdio() c_int;
pub extern fn gets(_Buffer: [*c]u8) [*c]u8;
pub extern fn _getw(_File: [*c]FILE) c_int;
pub extern fn perror(_ErrMsg: [*c]const u8) void;
pub extern fn _pclose(_File: [*c]FILE) c_int;
pub extern fn _popen(_Command: [*c]const u8, _Mode: [*c]const u8) [*c]FILE;
pub extern fn putc(_Ch: c_int, _File: [*c]FILE) c_int;
pub extern fn putchar(_Ch: c_int) c_int;
pub extern fn puts(_Str: [*c]const u8) c_int;
pub extern fn _putw(_Word: c_int, _File: [*c]FILE) c_int;
pub extern fn rewind(_File: [*c]FILE) void;
pub extern fn _rmtmp() c_int;
pub extern fn setbuf(noalias _File: [*c]FILE, noalias _Buffer: [*c]u8) void;
pub extern fn _setmaxstdio(_Max: c_int) c_int;
pub extern fn _set_output_format(_Format: c_uint) c_uint;
pub extern fn _get_output_format() c_uint;
pub extern fn setvbuf(noalias _File: [*c]FILE, noalias _Buf: [*c]u8, _Mode: c_int, _Size: usize) c_int;
pub extern fn _scprintf(noalias _Format: [*c]const u8, ...) c_int;
pub extern fn _snscanf(noalias _Src: [*c]const u8, _MaxCount: usize, noalias _Format: [*c]const u8, ...) c_int;
pub extern fn _vscprintf(noalias _Format: [*c]const u8, _ArgList: va_list) c_int;
pub extern fn tmpfile() [*c]FILE;
pub extern fn tmpnam(_Buffer: [*c]u8) [*c]u8;
pub extern fn ungetc(_Ch: c_int, _File: [*c]FILE) c_int;
pub extern fn _vsnprintf(noalias _Dest: [*c]u8, _Count: usize, noalias _Format: [*c]const u8, _Args: va_list) c_int;
pub extern fn _snprintf(noalias _Dest: [*c]u8, _Count: usize, noalias _Format: [*c]const u8, ...) c_int;
pub extern fn vsnprintf(noalias __stream: [*c]u8, __n: usize, noalias __format: [*c]const u8, __local_argv: va_list) c_int;
pub extern fn snprintf(noalias __stream: [*c]u8, __n: usize, noalias __format: [*c]const u8, ...) c_int;
pub extern fn _set_printf_count_output(_Value: c_int) c_int;
pub extern fn _get_printf_count_output() c_int;
pub extern fn __mingw_swscanf(noalias _Src: [*c]const wchar_t, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __mingw_vswscanf(noalias _Str: [*c]const wchar_t, noalias Format: [*c]const wchar_t, argp: va_list) c_int;
pub extern fn __mingw_wscanf(noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __mingw_vwscanf(noalias Format: [*c]const wchar_t, argp: va_list) c_int;
pub extern fn __mingw_fwscanf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __mingw_vfwscanf(noalias fp: [*c]FILE, noalias Format: [*c]const wchar_t, argp: va_list) c_int;
pub extern fn __mingw_fwprintf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __mingw_wprintf(noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __mingw_vfwprintf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
pub extern fn __mingw_vwprintf(noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
pub extern fn __mingw_snwprintf(noalias s: [*c]wchar_t, n: usize, noalias format: [*c]const wchar_t, ...) c_int;
pub extern fn __mingw_vsnwprintf(noalias [*c]wchar_t, usize, noalias [*c]const wchar_t, va_list) c_int;
pub extern fn __mingw_swprintf(noalias [*c]wchar_t, usize, noalias [*c]const wchar_t, ...) c_int;
pub extern fn __mingw_vswprintf(noalias [*c]wchar_t, usize, noalias [*c]const wchar_t, va_list) c_int;
pub extern fn __ms_swscanf(noalias _Src: [*c]const wchar_t, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __ms_vswscanf(noalias _Src: [*c]const wchar_t, noalias _Format: [*c]const wchar_t, va_list) c_int;
pub extern fn __ms_wscanf(noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __ms_vwscanf(noalias _Format: [*c]const wchar_t, va_list) c_int;
pub extern fn __ms_fwscanf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __ms_vfwscanf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, va_list) c_int;
pub extern fn __ms_fwprintf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __ms_wprintf(noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __ms_vfwprintf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
pub extern fn __ms_vwprintf(noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
pub extern fn __ms_swprintf(noalias [*c]wchar_t, usize, noalias [*c]const wchar_t, ...) c_int;
pub extern fn __ms_vswprintf(noalias [*c]wchar_t, usize, noalias [*c]const wchar_t, va_list) c_int;
pub extern fn __ms_snwprintf(noalias [*c]wchar_t, usize, noalias [*c]const wchar_t, ...) c_int;
pub extern fn __ms_vsnwprintf(noalias [*c]wchar_t, usize, noalias [*c]const wchar_t, va_list) c_int;
pub extern fn __stdio_common_vswprintf(options: c_ulonglong, str: [*c]wchar_t, len: usize, format: [*c]const wchar_t, locale: _locale_t, valist: va_list) c_int;
pub extern fn __stdio_common_vfwprintf(options: c_ulonglong, file: [*c]FILE, format: [*c]const wchar_t, locale: _locale_t, valist: va_list) c_int;
pub extern fn __stdio_common_vswscanf(options: c_ulonglong, input: [*c]const wchar_t, length: usize, format: [*c]const wchar_t, locale: _locale_t, valist: va_list) c_int;
pub extern fn __stdio_common_vfwscanf(options: c_ulonglong, file: [*c]FILE, format: [*c]const wchar_t, locale: _locale_t, valist: va_list) c_int;
pub extern fn fwscanf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn swscanf(noalias _Src: [*c]const wchar_t, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn wscanf(noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn vfwscanf(__stream: [*c]FILE, __format: [*c]const wchar_t, __local_argv: va_list) c_int;
pub extern fn vswscanf(noalias __source: [*c]const wchar_t, noalias __format: [*c]const wchar_t, __local_argv: va_list) c_int;
pub extern fn vwscanf(__format: [*c]const wchar_t, __local_argv: va_list) c_int;
pub extern fn fwprintf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn wprintf(noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn vfwprintf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
pub extern fn vwprintf(noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
pub extern fn _wfsopen(_Filename: [*c]const wchar_t, _Mode: [*c]const wchar_t, _ShFlag: c_int) [*c]FILE;
pub extern fn fgetwc(_File: [*c]FILE) wint_t;
pub extern fn _fgetwchar() wint_t;
pub extern fn fputwc(_Ch: wchar_t, _File: [*c]FILE) wint_t;
pub extern fn _fputwchar(_Ch: wchar_t) wint_t;
pub extern fn getwc(_File: [*c]FILE) wint_t;
pub extern fn getwchar() wint_t;
pub extern fn putwc(_Ch: wchar_t, _File: [*c]FILE) wint_t;
pub extern fn putwchar(_Ch: wchar_t) wint_t;
pub extern fn ungetwc(_Ch: wint_t, _File: [*c]FILE) wint_t;
pub extern fn fgetws(noalias _Dst: [*c]wchar_t, _SizeInWords: c_int, noalias _File: [*c]FILE) [*c]wchar_t;
pub extern fn fputws(noalias _Str: [*c]const wchar_t, noalias _File: [*c]FILE) c_int;
pub extern fn _getws(_String: [*c]wchar_t) [*c]wchar_t;
pub extern fn _putws(_Str: [*c]const wchar_t) c_int; // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\stdio.h:1169:15: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _scwprintf(noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn _snwprintf(noalias _Dest: [*c]wchar_t, _Count: usize, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn _vsnwprintf(noalias _Dest: [*c]wchar_t, _Count: usize, noalias _Format: [*c]const wchar_t, _Args: va_list) c_int;
pub extern fn swprintf(noalias _Dest: [*c]wchar_t, _Count: usize, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn vswprintf(noalias _Dest: [*c]wchar_t, _Count: usize, noalias _Format: [*c]const wchar_t, _Args: va_list) c_int;
pub extern fn snwprintf(noalias s: [*c]wchar_t, n: usize, noalias format: [*c]const wchar_t, ...) c_int;
pub extern fn vsnwprintf(noalias s: [*c]wchar_t, n: usize, noalias format: [*c]const wchar_t, arg: va_list) c_int; // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\stdio.h:1190:15: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _swprintf(noalias _Dest: [*c]wchar_t, noalias _Format: [*c]const wchar_t, ...) c_int;
pub fn _vswprintf(noalias arg__Dest: [*c]wchar_t, noalias arg__Format: [*c]const wchar_t, arg__Args: va_list) callconv(.c) c_int {
    var _Dest = arg__Dest;
    _ = &_Dest;
    var _Format = arg__Format;
    _ = &_Format;
    var _Args = arg__Args;
    _ = &_Args;
    return __stdio_common_vswprintf(__local_stdio_printf_options().*, _Dest, @bitCast(@as(c_longlong, -@as(c_int, 1))), _Format, null, _Args);
}
pub fn _vscwprintf(noalias arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    var _Result: c_int = __stdio_common_vswprintf(__local_stdio_printf_options().* | _CRT_INTERNAL_PRINTF_STANDARD_SNPRINTF_BEHAVIOR, null, 0, _Format, null, _ArgList);
    _ = &_Result;
    return if (_Result < @as(c_int, 0)) -@as(c_int, 1) else _Result;
}
pub extern fn _wtempnam(_Directory: [*c]const wchar_t, _FilePrefix: [*c]const wchar_t) [*c]wchar_t;
pub extern fn _snwscanf(noalias _Src: [*c]const wchar_t, _MaxCount: usize, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn _wfdopen(_FileHandle: c_int, _Mode: [*c]const wchar_t) [*c]FILE;
pub extern fn _wfopen(noalias _Filename: [*c]const wchar_t, noalias _Mode: [*c]const wchar_t) [*c]FILE;
pub extern fn _wfreopen(noalias _Filename: [*c]const wchar_t, noalias _Mode: [*c]const wchar_t, noalias _OldFile: [*c]FILE) [*c]FILE;
pub extern fn _wperror(_ErrMsg: [*c]const wchar_t) void;
pub extern fn _wpopen(_Command: [*c]const wchar_t, _Mode: [*c]const wchar_t) [*c]FILE;
pub extern fn _wremove(_Filename: [*c]const wchar_t) c_int;
pub extern fn _wtmpnam(_Buffer: [*c]wchar_t) [*c]wchar_t;
pub extern fn _fgetwc_nolock(_File: [*c]FILE) wint_t;
pub extern fn _fputwc_nolock(_Ch: wchar_t, _File: [*c]FILE) wint_t;
pub extern fn _ungetwc_nolock(_Ch: wint_t, _File: [*c]FILE) wint_t;
pub extern fn _fgetc_nolock(_File: [*c]FILE) c_int;
pub extern fn _fputc_nolock(_Char: c_int, _File: [*c]FILE) c_int;
pub extern fn _getc_nolock(_File: [*c]FILE) c_int;
pub extern fn _putc_nolock(_Char: c_int, _File: [*c]FILE) c_int;
pub extern fn _lock_file(_File: [*c]FILE) void;
pub extern fn _unlock_file(_File: [*c]FILE) void;
pub extern fn _fclose_nolock(_File: [*c]FILE) c_int;
pub extern fn _fflush_nolock(_File: [*c]FILE) c_int;
pub extern fn _fread_nolock(noalias _DstBuf: ?*anyopaque, _ElementSize: usize, _Count: usize, noalias _File: [*c]FILE) usize;
pub extern fn _fseek_nolock(_File: [*c]FILE, _Offset: c_long, _Origin: c_int) c_int;
pub extern fn _ftell_nolock(_File: [*c]FILE) c_long;
pub extern fn _fseeki64_nolock(_File: [*c]FILE, _Offset: c_longlong, _Origin: c_int) c_int;
pub extern fn _ftelli64_nolock(_File: [*c]FILE) c_longlong;
pub extern fn _fwrite_nolock(noalias _DstBuf: ?*const anyopaque, _Size: usize, _Count: usize, noalias _File: [*c]FILE) usize;
pub extern fn _ungetc_nolock(_Ch: c_int, _File: [*c]FILE) c_int;
pub extern fn tempnam(_Directory: [*c]const u8, _FilePrefix: [*c]const u8) [*c]u8;
pub extern fn fcloseall() c_int;
pub extern fn fdopen(_FileHandle: c_int, _Format: [*c]const u8) [*c]FILE;
pub extern fn fgetchar() c_int;
pub extern fn fileno(_File: [*c]FILE) c_int;
pub extern fn flushall() c_int;
pub extern fn fputchar(_Ch: c_int) c_int;
pub extern fn getw(_File: [*c]FILE) c_int;
pub extern fn putw(_Ch: c_int, _File: [*c]FILE) c_int;
pub extern fn rmtmp() c_int;
pub extern fn __mingw_str_wide_utf8(wptr: [*c]const wchar_t, mbptr: [*c][*c]u8, buflen: [*c]usize) c_int;
pub extern fn __mingw_str_utf8_wide(mbptr: [*c]const u8, wptr: [*c][*c]wchar_t, buflen: [*c]usize) c_int;
pub extern fn __mingw_str_free(ptr: ?*anyopaque) void;
pub extern fn _wspawnl(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const wchar_t, ...) isize;
pub extern fn _wspawnle(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const wchar_t, ...) isize;
pub extern fn _wspawnlp(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const wchar_t, ...) isize;
pub extern fn _wspawnlpe(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const wchar_t, ...) isize;
pub extern fn _wspawnv(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const [*c]const wchar_t) isize;
pub extern fn _wspawnve(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const [*c]const wchar_t, _Env: [*c]const [*c]const wchar_t) isize;
pub extern fn _wspawnvp(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const [*c]const wchar_t) isize;
pub extern fn _wspawnvpe(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const [*c]const wchar_t, _Env: [*c]const [*c]const wchar_t) isize;
pub extern fn _spawnv(_Mode: c_int, _Filename: [*c]const u8, _ArgList: [*c]const [*c]const u8) isize;
pub extern fn _spawnve(_Mode: c_int, _Filename: [*c]const u8, _ArgList: [*c]const [*c]const u8, _Env: [*c]const [*c]const u8) isize;
pub extern fn _spawnvp(_Mode: c_int, _Filename: [*c]const u8, _ArgList: [*c]const [*c]const u8) isize;
pub extern fn _spawnvpe(_Mode: c_int, _Filename: [*c]const u8, _ArgList: [*c]const [*c]const u8, _Env: [*c]const [*c]const u8) isize;
pub extern fn clearerr_s(_File: [*c]FILE) errno_t;
pub extern fn fread_s(_DstBuf: ?*anyopaque, _DstSize: usize, _ElementSize: usize, _Count: usize, _File: [*c]FILE) usize;
pub extern fn __stdio_common_vsprintf_s(_Options: c_ulonglong, _Str: [*c]u8, _Len: usize, _Format: [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
pub extern fn __stdio_common_vsprintf_p(_Options: c_ulonglong, _Str: [*c]u8, _Len: usize, _Format: [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
pub extern fn __stdio_common_vsnprintf_s(_Options: c_ulonglong, _Str: [*c]u8, _Len: usize, _MaxCount: usize, _Format: [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
pub extern fn __stdio_common_vfprintf_s(_Options: c_ulonglong, _File: [*c]FILE, _Format: [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
pub extern fn __stdio_common_vfprintf_p(_Options: c_ulonglong, _File: [*c]FILE, _Format: [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
pub fn _vfscanf_s_l(arg__File: [*c]FILE, arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vfscanf(_CRT_INTERNAL_SCANF_SECURECRT, _File, _Format, _Locale, _ArgList);
}
pub fn vfscanf_s(arg__File: [*c]FILE, arg__Format: [*c]const u8, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfscanf_s_l(_File, _Format, null, _ArgList);
}
pub fn _vscanf_s_l(arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfscanf_s_l(__acrt_iob_func(0), _Format, _Locale, _ArgList);
}
pub fn vscanf_s(arg__Format: [*c]const u8, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfscanf_s_l(__acrt_iob_func(0), _Format, null, _ArgList);
} // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:60:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _fscanf_s_l(_File: [*c]FILE, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int; // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:70:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn fscanf_s(_File: [*c]FILE, _Format: [*c]const u8, ...) c_int; // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:80:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _scanf_s_l(_Format: [*c]const u8, _Locale: _locale_t, ...) c_int; // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:90:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn scanf_s(_Format: [*c]const u8, ...) c_int;
pub fn _vfscanf_l(arg__File: [*c]FILE, arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vfscanf(0, _File, _Format, _Locale, _ArgList);
}
pub fn _vscanf_l(arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfscanf_l(__acrt_iob_func(0), _Format, _Locale, _ArgList);
} // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:110:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _fscanf_l(_File: [*c]FILE, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int; // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:119:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _scanf_l(_Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
pub fn _vsscanf_s_l(arg__Src: [*c]const u8, arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Src = arg__Src;
    _ = &_Src;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vsscanf(_CRT_INTERNAL_SCANF_SECURECRT, _Src, @bitCast(@as(c_longlong, -@as(c_int, 1))), _Format, _Locale, _ArgList);
}
pub fn vsscanf_s(arg__Src: [*c]const u8, arg__Format: [*c]const u8, arg__ArgList: va_list) callconv(.c) c_int {
    var _Src = arg__Src;
    _ = &_Src;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vsscanf_s_l(_Src, _Format, null, _ArgList);
} // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:137:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _sscanf_s_l(_Src: [*c]const u8, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int; // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:146:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn sscanf_s(_Src: [*c]const u8, _Format: [*c]const u8, ...) c_int;
pub fn _vsscanf_l(arg__Src: [*c]const u8, arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Src = arg__Src;
    _ = &_Src;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vsscanf(0, _Src, @bitCast(@as(c_longlong, -@as(c_int, 1))), _Format, _Locale, _ArgList);
} // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:160:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _sscanf_l(_Src: [*c]const u8, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int; // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:171:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snscanf_s_l(_Src: [*c]const u8, _MaxCount: usize, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int; // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:180:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snscanf_s(_Src: [*c]const u8, _MaxCount: usize, _Format: [*c]const u8, ...) c_int; // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:191:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snscanf_l(_Src: [*c]const u8, _MaxCount: usize, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
pub fn _vfprintf_s_l(arg__File: [*c]FILE, arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vfprintf_s(__local_stdio_printf_options().*, _File, _Format, _Locale, _ArgList);
}
pub fn vfprintf_s(arg__File: [*c]FILE, arg__Format: [*c]const u8, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfprintf_s_l(_File, _Format, null, _ArgList);
}
pub fn _vprintf_s_l(arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfprintf_s_l(__acrt_iob_func(1), _Format, _Locale, _ArgList);
}
pub fn vprintf_s(arg__Format: [*c]const u8, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfprintf_s_l(__acrt_iob_func(1), _Format, null, _ArgList);
} // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:218:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _fprintf_s_l(_File: [*c]FILE, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int; // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:227:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _printf_s_l(_Format: [*c]const u8, _Locale: _locale_t, ...) c_int; // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:236:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn fprintf_s(_File: [*c]FILE, _Format: [*c]const u8, ...) c_int; // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:245:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn printf_s(_Format: [*c]const u8, ...) c_int;
pub fn _vsnprintf_c_l(arg__DstBuf: [*c]u8, arg__MaxCount: usize, arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vsprintf(__local_stdio_printf_options().*, _DstBuf, _MaxCount, _Format, _Locale, _ArgList);
}
pub fn _vsnprintf_c(arg__DstBuf: [*c]u8, arg__MaxCount: usize, arg__Format: [*c]const u8, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vsnprintf_c_l(_DstBuf, _MaxCount, _Format, null, _ArgList);
} // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:263:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snprintf_c_l(_DstBuf: [*c]u8, _MaxCount: usize, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int; // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:272:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snprintf_c(_DstBuf: [*c]u8, _MaxCount: usize, _Format: [*c]const u8, ...) c_int;
pub fn _vsnprintf_s_l(arg__DstBuf: [*c]u8, arg__DstSize: usize, arg__MaxCount: usize, arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _DstSize = arg__DstSize;
    _ = &_DstSize;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vsnprintf_s(__local_stdio_printf_options().*, _DstBuf, _DstSize, _MaxCount, _Format, _Locale, _ArgList);
}
pub fn vsnprintf_s(arg__DstBuf: [*c]u8, arg__DstSize: usize, arg__MaxCount: usize, arg__Format: [*c]const u8, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _DstSize = arg__DstSize;
    _ = &_DstSize;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vsnprintf_s_l(_DstBuf, _DstSize, _MaxCount, _Format, null, _ArgList);
}
pub fn _vsnprintf_s(arg__DstBuf: [*c]u8, arg__DstSize: usize, arg__MaxCount: usize, arg__Format: [*c]const u8, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _DstSize = arg__DstSize;
    _ = &_DstSize;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vsnprintf_s_l(_DstBuf, _DstSize, _MaxCount, _Format, null, _ArgList);
} // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:294:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snprintf_s_l(_DstBuf: [*c]u8, _DstSize: usize, _MaxCount: usize, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int; // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:303:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snprintf_s(_DstBuf: [*c]u8, _DstSize: usize, _MaxCount: usize, _Format: [*c]const u8, ...) c_int;
pub fn _vsprintf_s_l(arg__DstBuf: [*c]u8, arg__DstSize: usize, arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _DstSize = arg__DstSize;
    _ = &_DstSize;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vsprintf_s(__local_stdio_printf_options().*, _DstBuf, _DstSize, _Format, _Locale, _ArgList);
}
pub fn vsprintf_s(arg__DstBuf: [*c]u8, arg__Size: usize, arg__Format: [*c]const u8, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _Size = arg__Size;
    _ = &_Size;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vsprintf_s_l(_DstBuf, _Size, _Format, null, _ArgList);
} // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:321:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _sprintf_s_l(_DstBuf: [*c]u8, _DstSize: usize, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int; // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:330:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn sprintf_s(_DstBuf: [*c]u8, _DstSize: usize, _Format: [*c]const u8, ...) c_int;
pub fn _vfprintf_p_l(arg__File: [*c]FILE, arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vfprintf_p(__local_stdio_printf_options().*, _File, _Format, _Locale, _ArgList);
}
pub fn _vfprintf_p(arg__File: [*c]FILE, arg__Format: [*c]const u8, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfprintf_p_l(_File, _Format, null, _ArgList);
}
pub fn _vprintf_p_l(arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfprintf_p_l(__acrt_iob_func(1), _Format, _Locale, _ArgList);
}
pub fn _vprintf_p(arg__Format: [*c]const u8, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfprintf_p_l(__acrt_iob_func(1), _Format, null, _ArgList);
} // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:356:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _fprintf_p_l(_File: [*c]FILE, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int; // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:365:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _fprintf_p(_File: [*c]FILE, _Format: [*c]const u8, ...) c_int; // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:374:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _printf_p_l(_Format: [*c]const u8, _Locale: _locale_t, ...) c_int; // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:383:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _printf_p(_Format: [*c]const u8, ...) c_int;
pub fn _vsprintf_p_l(arg__DstBuf: [*c]u8, arg__MaxCount: usize, arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vsprintf_p(__local_stdio_printf_options().*, _DstBuf, _MaxCount, _Format, _Locale, _ArgList);
}
pub fn _vsprintf_p(arg__Dst: [*c]u8, arg__MaxCount: usize, arg__Format: [*c]const u8, arg__ArgList: va_list) callconv(.c) c_int {
    var _Dst = arg__Dst;
    _ = &_Dst;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vsprintf_p_l(_Dst, _MaxCount, _Format, null, _ArgList);
} // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:401:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _sprintf_p_l(_DstBuf: [*c]u8, _MaxCount: usize, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int; // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:410:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _sprintf_p(_Dst: [*c]u8, _MaxCount: usize, _Format: [*c]const u8, ...) c_int;
pub fn _vscprintf_p_l(arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vsprintf_p(_CRT_INTERNAL_PRINTF_STANDARD_SNPRINTF_BEHAVIOR, null, 0, _Format, _Locale, _ArgList);
}
pub fn _vscprintf_p(arg__Format: [*c]const u8, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vscprintf_p_l(_Format, null, _ArgList);
} // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:428:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _scprintf_p_l(_Format: [*c]const u8, _Locale: _locale_t, ...) c_int; // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:437:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _scprintf_p(_Format: [*c]const u8, ...) c_int;
pub fn _vfprintf_l(arg__File: [*c]FILE, arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vfprintf(__local_stdio_printf_options().*, _File, _Format, _Locale, _ArgList);
}
pub fn _vprintf_l(arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfprintf_l(__acrt_iob_func(1), _Format, _Locale, _ArgList);
} // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:455:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _fprintf_l(_File: [*c]FILE, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int; // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:464:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _printf_l(_Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
pub fn _vsnprintf_l(arg__DstBuf: [*c]u8, arg__MaxCount: usize, arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vsprintf(_CRT_INTERNAL_PRINTF_LEGACY_VSPRINTF_NULL_TERMINATION, _DstBuf, _MaxCount, _Format, _Locale, _ArgList);
} // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:478:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snprintf_l(_DstBuf: [*c]u8, _MaxCount: usize, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
pub fn _vsprintf_l(arg__DstBuf: [*c]u8, arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vsnprintf_l(_DstBuf, @bitCast(@as(c_longlong, -@as(c_int, 1))), _Format, _Locale, _ArgList);
} // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:491:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _sprintf_l(_DstBuf: [*c]u8, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
pub fn _vscprintf_l(arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vsprintf(_CRT_INTERNAL_PRINTF_STANDARD_SNPRINTF_BEHAVIOR, null, 0, _Format, _Locale, _ArgList);
} // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:505:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _scprintf_l(_Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
pub extern fn fopen_s(_File: [*c][*c]FILE, _Filename: [*c]const u8, _Mode: [*c]const u8) errno_t;
pub extern fn freopen_s(_File: [*c][*c]FILE, _Filename: [*c]const u8, _Mode: [*c]const u8, _Stream: [*c]FILE) errno_t;
pub extern fn gets_s([*c]u8, rsize_t) [*c]u8;
pub extern fn tmpfile_s(_File: [*c][*c]FILE) errno_t;
pub extern fn tmpnam_s([*c]u8, rsize_t) errno_t;
pub extern fn _getws_s(_Str: [*c]wchar_t, _SizeInWords: usize) [*c]wchar_t;
pub extern fn __stdio_common_vswprintf_s(_Options: c_ulonglong, _Str: [*c]wchar_t, _Len: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
pub extern fn __stdio_common_vsnwprintf_s(_Options: c_ulonglong, _Str: [*c]wchar_t, _Len: usize, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
pub extern fn __stdio_common_vfwprintf_s(_Options: c_ulonglong, _File: [*c]FILE, _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
pub fn _vfwscanf_s_l(arg__File: [*c]FILE, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vfwscanf(__local_stdio_scanf_options().* | _CRT_INTERNAL_SCANF_SECURECRT, _File, _Format, _Locale, _ArgList);
}
pub fn vfwscanf_s(arg__File: [*c]FILE, arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfwscanf_s_l(_File, _Format, null, _ArgList);
}
pub fn _vwscanf_s_l(arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfwscanf_s_l(__acrt_iob_func(0), _Format, _Locale, _ArgList);
}
pub fn vwscanf_s(arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfwscanf_s_l(__acrt_iob_func(0), _Format, null, _ArgList);
} // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:631:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _fwscanf_s_l(_File: [*c]FILE, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int; // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:641:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn fwscanf_s(_File: [*c]FILE, _Format: [*c]const wchar_t, ...) c_int; // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:651:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _wscanf_s_l(_Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int; // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:661:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn wscanf_s(_Format: [*c]const wchar_t, ...) c_int;
pub fn _vswscanf_s_l(arg__Src: [*c]const wchar_t, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Src = arg__Src;
    _ = &_Src;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vswscanf(__local_stdio_scanf_options().* | _CRT_INTERNAL_SCANF_SECURECRT, _Src, @bitCast(@as(c_longlong, -@as(c_int, 1))), _Format, _Locale, _ArgList);
}
pub fn vswscanf_s(arg__Src: [*c]const wchar_t, arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Src = arg__Src;
    _ = &_Src;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vswscanf_s_l(_Src, _Format, null, _ArgList);
} // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:681:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _swscanf_s_l(_Src: [*c]const wchar_t, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int; // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:690:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn swscanf_s(_Src: [*c]const wchar_t, _Format: [*c]const wchar_t, ...) c_int;
pub fn _vsnwscanf_s_l(arg__Src: [*c]const wchar_t, arg__MaxCount: usize, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Src = arg__Src;
    _ = &_Src;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vswscanf(__local_stdio_scanf_options().* | _CRT_INTERNAL_SCANF_SECURECRT, _Src, _MaxCount, _Format, _Locale, _ArgList);
} // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:704:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snwscanf_s_l(_Src: [*c]const wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int; // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:713:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snwscanf_s(_Src: [*c]const wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, ...) c_int;
pub fn _vfwprintf_s_l(arg__File: [*c]FILE, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vfwprintf_s(__local_stdio_printf_options().*, _File, _Format, _Locale, _ArgList);
}
pub fn _vwprintf_s_l(arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfwprintf_s_l(__acrt_iob_func(1), _Format, _Locale, _ArgList);
}
pub fn vfwprintf_s(arg__File: [*c]FILE, arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfwprintf_s_l(_File, _Format, null, _ArgList);
}
pub fn vwprintf_s(arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfwprintf_s_l(__acrt_iob_func(1), _Format, null, _ArgList);
} // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:739:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _fwprintf_s_l(_File: [*c]FILE, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int; // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:748:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _wprintf_s_l(_Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int; // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:757:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn fwprintf_s(_File: [*c]FILE, _Format: [*c]const wchar_t, ...) c_int; // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:766:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn wprintf_s(_Format: [*c]const wchar_t, ...) c_int;
pub fn _vswprintf_s_l(arg__DstBuf: [*c]wchar_t, arg__DstSize: usize, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _DstSize = arg__DstSize;
    _ = &_DstSize;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vswprintf_s(__local_stdio_printf_options().*, _DstBuf, _DstSize, _Format, _Locale, _ArgList);
}
pub fn vswprintf_s(arg__DstBuf: [*c]wchar_t, arg__DstSize: usize, arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _DstSize = arg__DstSize;
    _ = &_DstSize;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vswprintf_s_l(_DstBuf, _DstSize, _Format, null, _ArgList);
} // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:784:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _swprintf_s_l(_DstBuf: [*c]wchar_t, _DstSize: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int; // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:793:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn swprintf_s(_DstBuf: [*c]wchar_t, _DstSize: usize, _Format: [*c]const wchar_t, ...) c_int;
pub fn _vsnwprintf_s_l(arg__DstBuf: [*c]wchar_t, arg__DstSize: usize, arg__MaxCount: usize, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _DstSize = arg__DstSize;
    _ = &_DstSize;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vsnwprintf_s(__local_stdio_printf_options().*, _DstBuf, _DstSize, _MaxCount, _Format, _Locale, _ArgList);
}
pub fn _vsnwprintf_s(arg__DstBuf: [*c]wchar_t, arg__DstSize: usize, arg__MaxCount: usize, arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _DstSize = arg__DstSize;
    _ = &_DstSize;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vsnwprintf_s_l(_DstBuf, _DstSize, _MaxCount, _Format, null, _ArgList);
} // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:811:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snwprintf_s_l(_DstBuf: [*c]wchar_t, _DstSize: usize, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int; // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\sec_api/stdio_s.h:820:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snwprintf_s(_DstBuf: [*c]wchar_t, _DstSize: usize, _MaxCount: usize, _Format: [*c]const wchar_t, ...) c_int;
pub extern fn _wfopen_s(_File: [*c][*c]FILE, _Filename: [*c]const wchar_t, _Mode: [*c]const wchar_t) errno_t;
pub extern fn _wfreopen_s(_File: [*c][*c]FILE, _Filename: [*c]const wchar_t, _Mode: [*c]const wchar_t, _OldFile: [*c]FILE) errno_t;
pub extern fn _wtmpnam_s(_DstBuf: [*c]wchar_t, _SizeInWords: usize) errno_t;
pub extern fn _fread_nolock_s(_DstBuf: ?*anyopaque, _DstSize: usize, _ElementSize: usize, _Count: usize, _File: [*c]FILE) usize;
pub extern fn _wassert(_Message: [*c]const wchar_t, _File: [*c]const wchar_t, _Line: c_uint) noreturn;
pub extern fn _assert(_Message: [*c]const u8, _File: [*c]const u8, _Line: c_uint) noreturn;
pub const max_align_t = extern struct {
    __aro_max_align_ll: c_longlong = 0,
    __aro_max_align_ld: c_longdouble = 0,
};
pub const int_least8_t = i8;
pub const uint_least8_t = u8;
pub const int_least16_t = c_short;
pub const uint_least16_t = c_ushort;
pub const int_least32_t = c_int;
pub const uint_least32_t = c_uint;
pub const int_least64_t = c_longlong;
pub const uint_least64_t = c_ulonglong;
pub const int_fast8_t = i8;
pub const uint_fast8_t = u8;
pub const int_fast16_t = c_short;
pub const uint_fast16_t = c_ushort;
pub const int_fast32_t = c_int;
pub const uint_fast32_t = c_uint;
pub const int_fast64_t = c_longlong;
pub const uint_fast64_t = c_ulonglong;
pub const intmax_t = c_longlong;
pub const uintmax_t = c_ulonglong;
pub const imaxdiv_t = extern struct {
    quot: intmax_t = 0,
    rem: intmax_t = 0,
};
pub fn imaxabs(arg_j: intmax_t) callconv(.c) intmax_t {
    var j = arg_j;
    _ = &j;
    return if (j >= @as(intmax_t, 0)) j else -j;
}
pub extern fn imaxdiv(numer: intmax_t, denom: intmax_t) imaxdiv_t;
pub extern fn strtoimax(noalias nptr: [*c]const u8, noalias endptr: [*c][*c]u8, base: c_int) intmax_t;
pub extern fn strtoumax(noalias nptr: [*c]const u8, noalias endptr: [*c][*c]u8, base: c_int) uintmax_t;
pub extern fn wcstoimax(noalias nptr: [*c]const wchar_t, noalias endptr: [*c][*c]wchar_t, base: c_int) intmax_t;
pub extern fn wcstoumax(noalias nptr: [*c]const wchar_t, noalias endptr: [*c][*c]wchar_t, base: c_int) uintmax_t;
pub const struct__exception = extern struct {
    type: c_int = 0,
    name: [*c]const u8 = null,
    arg1: f64 = 0,
    arg2: f64 = 0,
    retval: f64 = 0,
    pub const _matherr = __root._matherr;
};
const struct_unnamed_1 = extern struct {
    low: c_uint = 0,
    high: c_uint = 0,
};
pub const union___mingw_dbl_type_t = extern union {
    x: f64,
    val: c_ulonglong,
    lh: struct_unnamed_1,
};
pub const __mingw_dbl_type_t = union___mingw_dbl_type_t;
pub const union___mingw_flt_type_t = extern union {
    x: f32,
    val: c_uint,
};
pub const __mingw_flt_type_t = union___mingw_flt_type_t; // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\math.h:135:11: warning: struct demoted to opaque type - has bitfield
const struct_unnamed_2 = opaque {}; // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\math.h:138:7: warning: union demoted to opaque type - has opaque field
pub const union___mingw_ldbl_type_t = opaque {};
pub const __mingw_ldbl_type_t = union___mingw_ldbl_type_t;
pub extern var __imp__HUGE: [*c]f64;
pub extern fn __mingw_raise_matherr(typ: c_int, name: [*c]const u8, a1: f64, a2: f64, rslt: f64) void;
pub extern fn __mingw_setusermatherr(?*const fn ([*c]struct__exception) callconv(.c) c_int) void;
pub extern fn __setusermatherr(?*const fn ([*c]struct__exception) callconv(.c) c_int) void;
pub extern fn sin(_X: f64) f64;
pub extern fn cos(_X: f64) f64;
pub extern fn tan(_X: f64) f64;
pub extern fn sinh(_X: f64) f64;
pub extern fn cosh(_X: f64) f64;
pub extern fn tanh(_X: f64) f64;
pub extern fn asin(_X: f64) f64;
pub extern fn acos(_X: f64) f64;
pub extern fn atan(_X: f64) f64;
pub extern fn atan2(_Y: f64, _X: f64) f64;
pub extern fn exp(_X: f64) f64;
pub extern fn log(_X: f64) f64;
pub extern fn log10(_X: f64) f64;
pub extern fn pow(_X: f64, _Y: f64) f64;
pub extern fn sqrt(_X: f64) f64;
pub extern fn ceil(_X: f64) f64;
pub extern fn floor(_X: f64) f64;
pub fn fabsf(arg_x: f32) callconv(.c) f32 {
    var x = arg_x;
    _ = &x;
    return @abs(@as(f32, x));
} // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\math.h:213:5: warning: TODO asm stmt
// C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\math.h:207:36: warning: unable to translate function, demoted to extern
pub extern fn fabsl(arg_x: c_longdouble) callconv(.c) c_longdouble;
pub fn fabs(arg_x: f64) callconv(.c) f64 {
    var x = arg_x;
    _ = &x;
    return @abs(@as(f64, x));
}
pub extern fn ldexp(_X: f64, _Y: c_int) f64;
pub extern fn frexp(_X: f64, _Y: [*c]c_int) f64;
pub extern fn modf(_X: f64, _Y: [*c]f64) f64;
pub extern fn fmod(_X: f64, _Y: f64) f64;
pub extern fn sincos(__x: f64, p_sin: [*c]f64, p_cos: [*c]f64) void;
pub extern fn sincosl(__x: c_longdouble, p_sin: [*c]c_longdouble, p_cos: [*c]c_longdouble) void;
pub extern fn sincosf(__x: f32, p_sin: [*c]f32, p_cos: [*c]f32) void;
pub extern fn abs(_X: c_int) c_int;
pub extern fn labs(_X: c_long) c_long;
pub extern fn atof(_String: [*c]const u8) f64;
pub extern fn _atof_l(_String: [*c]const u8, _Locale: _locale_t) f64;
pub const struct__complex = extern struct {
    x: f64 = 0,
    y: f64 = 0,
    pub const _cabs = __root._cabs;
    pub const cabs = __root._cabs;
};
pub extern fn _cabs(_ComplexA: struct__complex) f64;
pub extern fn _hypot(_X: f64, _Y: f64) f64;
pub extern fn _j0(_X: f64) f64;
pub extern fn _j1(_X: f64) f64;
pub extern fn _jn(_X: c_int, _Y: f64) f64;
pub extern fn _y0(_X: f64) f64;
pub extern fn _y1(_X: f64) f64;
pub extern fn _yn(_X: c_int, _Y: f64) f64;
pub extern fn _matherr([*c]struct__exception) c_int;
pub extern fn _chgsign(_X: f64) f64;
pub extern fn _copysign(_Number: f64, _Sign: f64) f64;
pub extern fn _logb(f64) f64;
pub extern fn _nextafter(f64, f64) f64;
pub extern fn _scalb(f64, c_long) f64;
pub extern fn _finite(f64) c_int;
pub extern fn _fpclass(f64) c_int;
pub extern fn _isnan(f64) c_int;
pub extern fn j0(f64) f64;
pub extern fn j1(f64) f64;
pub extern fn jn(c_int, f64) f64;
pub extern fn y0(f64) f64;
pub extern fn y1(f64) f64;
pub extern fn yn(c_int, f64) f64;
pub extern fn chgsign(f64) f64;
pub extern fn finite(f64) c_int;
pub extern fn fpclass(f64) c_int;
pub const float_t = f32;
pub const double_t = f64; // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\math.h:405:8: warning: member access of demoted record
// C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\math.h:399:28: warning: unable to translate function, demoted to extern
pub extern fn __fpclassifyl(arg_x: c_longdouble) callconv(.c) c_int;
pub fn __fpclassifyf(arg_x: f32) callconv(.c) c_int {
    var x = arg_x;
    _ = &x;
    var hlp: __mingw_flt_type_t = undefined;
    _ = &hlp;
    hlp.x = x;
    hlp.val &= 2147483647;
    if (hlp.val == @as(c_uint, 0)) return FP_ZERO;
    if (hlp.val < @as(c_uint, 8388608)) return FP_NORMAL | FP_ZERO;
    if (hlp.val >= @as(c_uint, 2139095040)) return if (hlp.val > @as(c_uint, 2139095040)) FP_NAN else FP_NAN | FP_NORMAL;
    return FP_NORMAL;
}
pub fn __fpclassify(arg_x: f64) callconv(.c) c_int {
    var x = arg_x;
    _ = &x;
    var hlp: __mingw_dbl_type_t = undefined;
    _ = &hlp;
    var l: c_uint = undefined;
    _ = &l;
    var h: c_uint = undefined;
    _ = &h;
    hlp.x = x;
    h = hlp.lh.high;
    l = hlp.lh.low | (h & @as(c_uint, 1048575));
    h &= 2146435072;
    if ((h | l) == @as(c_uint, 0)) return FP_ZERO;
    if (!(h != 0)) return FP_NORMAL | FP_ZERO;
    if (h == @as(c_uint, 2146435072)) return if (l != 0) FP_NAN else FP_NAN | FP_NORMAL;
    return FP_NORMAL;
}
pub fn __isnan(arg__x: f64) callconv(.c) c_int {
    var _x = arg__x;
    _ = &_x;
    var hlp: __mingw_dbl_type_t = undefined;
    _ = &hlp;
    var l: c_uint = undefined;
    _ = &l;
    var h: c_uint = undefined;
    _ = &h;
    hlp.x = _x;
    l = hlp.lh.low;
    h = hlp.lh.high & @as(c_uint, 2147483647);
    h |= (l | -%l) >> @intCast(@as(c_uint, 31));
    h = @as(c_uint, 2146435072) -% h;
    return @as(c_int, @bitCast(@as(c_uint, @truncate(h)))) >> @intCast(@as(c_int, 31));
}
pub fn __isnanf(arg__x: f32) callconv(.c) c_int {
    var _x = arg__x;
    _ = &_x;
    var hlp: __mingw_flt_type_t = undefined;
    _ = &hlp;
    var i: c_uint = undefined;
    _ = &i;
    hlp.x = _x;
    i = hlp.val & @as(c_uint, 2147483647);
    i = @as(c_uint, 2139095040) -% i;
    return @bitCast(@as(c_uint, @truncate(i >> @intCast(@as(c_uint, 31)))));
} // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\math.h:560:7: warning: member access of demoted record
// C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\math.h:552:28: warning: unable to translate function, demoted to extern
pub extern fn __isnanl(arg__x: c_longdouble) callconv(.c) c_int;
pub fn __signbit(arg_x: f64) callconv(.c) c_int {
    var x = arg_x;
    _ = &x;
    var hlp: __mingw_dbl_type_t = undefined;
    _ = &hlp;
    hlp.x = x;
    return @intFromBool((hlp.lh.high & @as(c_uint, 2147483648)) != @as(c_uint, 0));
}
pub fn __signbitf(arg_x: f32) callconv(.c) c_int {
    var x = arg_x;
    _ = &x;
    var hlp: __mingw_flt_type_t = undefined;
    _ = &hlp;
    hlp.x = x;
    return @intFromBool((hlp.val & @as(c_uint, 2147483648)) != @as(c_uint, 0));
} // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\math.h:628:7: warning: member access of demoted record
// C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\math.h:623:28: warning: unable to translate function, demoted to extern
pub extern fn __signbitl(arg_x: c_longdouble) callconv(.c) c_int;
pub extern fn sinf(_X: f32) f32;
pub extern fn sinl(c_longdouble) c_longdouble;
pub extern fn cosf(_X: f32) f32;
pub extern fn cosl(c_longdouble) c_longdouble;
pub extern fn tanf(_X: f32) f32;
pub extern fn tanl(c_longdouble) c_longdouble;
pub extern fn asinf(_X: f32) f32;
pub extern fn asinl(c_longdouble) c_longdouble;
pub extern fn acosf(f32) f32;
pub extern fn acosl(c_longdouble) c_longdouble;
pub extern fn atanf(f32) f32;
pub extern fn atanl(c_longdouble) c_longdouble;
pub extern fn atan2f(f32, f32) f32;
pub extern fn atan2l(c_longdouble, c_longdouble) c_longdouble;
pub extern fn sinhf(_X: f32) f32;
pub extern fn sinhl(c_longdouble) c_longdouble;
pub extern fn coshf(_X: f32) f32;
pub extern fn coshl(c_longdouble) c_longdouble;
pub extern fn tanhf(_X: f32) f32;
pub extern fn tanhl(c_longdouble) c_longdouble;
pub extern fn acosh(f64) f64;
pub extern fn acoshf(f32) f32;
pub extern fn acoshl(c_longdouble) c_longdouble;
pub extern fn asinh(f64) f64;
pub extern fn asinhf(f32) f32;
pub extern fn asinhl(c_longdouble) c_longdouble;
pub extern fn atanh(f64) f64;
pub extern fn atanhf(f32) f32;
pub extern fn atanhl(c_longdouble) c_longdouble;
pub extern fn expf(_X: f32) f32;
pub extern fn expl(c_longdouble) c_longdouble;
pub extern fn exp2(f64) f64;
pub extern fn exp2f(f32) f32;
pub extern fn exp2l(c_longdouble) c_longdouble;
pub extern fn expm1(f64) f64;
pub extern fn expm1f(f32) f32;
pub extern fn expm1l(c_longdouble) c_longdouble;
pub extern fn frexpf(_X: f32, _Y: [*c]c_int) f32;
pub extern fn frexpl(c_longdouble, [*c]c_int) c_longdouble;
pub extern fn ilogb(f64) c_int;
pub extern fn ilogbf(f32) c_int;
pub extern fn ilogbl(c_longdouble) c_int;
pub extern fn ldexpf(_X: f32, _Y: c_int) f32;
pub extern fn ldexpl(c_longdouble, c_int) c_longdouble;
pub extern fn logf(f32) f32;
pub extern fn logl(c_longdouble) c_longdouble;
pub extern fn log10f(f32) f32;
pub extern fn log10l(c_longdouble) c_longdouble;
pub extern fn log1p(f64) f64;
pub extern fn log1pf(f32) f32;
pub extern fn log1pl(c_longdouble) c_longdouble;
pub extern fn log2(f64) f64;
pub extern fn log2f(f32) f32;
pub extern fn log2l(c_longdouble) c_longdouble;
pub extern fn logb(f64) f64;
pub extern fn logbf(f32) f32;
pub extern fn logbl(c_longdouble) c_longdouble;
pub extern fn modff(f32, [*c]f32) f32;
pub extern fn modfl(c_longdouble, [*c]c_longdouble) c_longdouble;
pub extern fn scalbn(f64, c_int) f64;
pub extern fn scalbnf(f32, c_int) f32;
pub extern fn scalbnl(c_longdouble, c_int) c_longdouble;
pub extern fn scalbln(f64, c_long) f64;
pub extern fn scalblnf(f32, c_long) f32;
pub extern fn scalblnl(c_longdouble, c_long) c_longdouble;
pub extern fn cbrt(f64) f64;
pub extern fn cbrtf(f32) f32;
pub extern fn cbrtl(c_longdouble) c_longdouble;
pub extern fn hypot(f64, f64) f64;
pub extern fn hypotf(x: f32, y: f32) f32;
pub extern fn hypotl(c_longdouble, c_longdouble) c_longdouble;
pub extern fn powf(_X: f32, _Y: f32) f32;
pub extern fn powl(c_longdouble, c_longdouble) c_longdouble;
pub extern fn sqrtf(f32) f32;
pub extern fn sqrtl(c_longdouble) c_longdouble;
pub extern fn erf(f64) f64;
pub extern fn erff(f32) f32;
pub extern fn erfl(c_longdouble) c_longdouble;
pub extern fn erfc(f64) f64;
pub extern fn erfcf(f32) f32;
pub extern fn erfcl(c_longdouble) c_longdouble;
pub extern fn lgamma(f64) f64;
pub extern fn lgammaf(f32) f32;
pub extern fn lgammal(c_longdouble) c_longdouble;
pub extern var signgam: c_int;
pub extern fn tgamma(f64) f64;
pub extern fn tgammaf(f32) f32;
pub extern fn tgammal(c_longdouble) c_longdouble;
pub extern fn ceilf(f32) f32;
pub extern fn ceill(c_longdouble) c_longdouble;
pub extern fn floorf(f32) f32;
pub extern fn floorl(c_longdouble) c_longdouble;
pub extern fn nearbyint(f64) f64;
pub extern fn nearbyintf(f32) f32;
pub extern fn nearbyintl(c_longdouble) c_longdouble;
pub extern fn rint(f64) f64;
pub extern fn rintf(f32) f32;
pub extern fn rintl(c_longdouble) c_longdouble;
pub extern fn lrint(f64) c_long;
pub extern fn lrintf(f32) c_long;
pub extern fn lrintl(c_longdouble) c_long;
pub extern fn llrint(f64) c_longlong;
pub extern fn llrintf(f32) c_longlong;
pub extern fn llrintl(c_longdouble) c_longlong;
pub extern fn round(f64) f64;
pub extern fn roundf(f32) f32;
pub extern fn roundl(c_longdouble) c_longdouble;
pub extern fn lround(f64) c_long;
pub extern fn lroundf(f32) c_long;
pub extern fn lroundl(c_longdouble) c_long;
pub extern fn llround(f64) c_longlong;
pub extern fn llroundf(f32) c_longlong;
pub extern fn llroundl(c_longdouble) c_longlong;
pub extern fn trunc(f64) f64;
pub extern fn truncf(f32) f32;
pub extern fn truncl(c_longdouble) c_longdouble;
pub extern fn fmodf(f32, f32) f32;
pub extern fn fmodl(c_longdouble, c_longdouble) c_longdouble;
pub extern fn remainder(f64, f64) f64;
pub extern fn remainderf(f32, f32) f32;
pub extern fn remainderl(c_longdouble, c_longdouble) c_longdouble;
pub extern fn remquo(f64, f64, [*c]c_int) f64;
pub extern fn remquof(f32, f32, [*c]c_int) f32;
pub extern fn remquol(c_longdouble, c_longdouble, [*c]c_int) c_longdouble;
pub fn copysign(arg_x: f64, arg_y: f64) callconv(.c) f64 {
    var x = arg_x;
    _ = &x;
    var y = arg_y;
    _ = &y;
    var hx: __mingw_dbl_type_t = undefined;
    _ = &hx;
    var hy: __mingw_dbl_type_t = undefined;
    _ = &hy;
    hx.x = x;
    hy.x = y;
    hx.lh.high = (hx.lh.high & @as(c_uint, 2147483647)) | (hy.lh.high & @as(c_uint, 2147483648));
    return hx.x;
}
pub fn copysignf(arg_x: f32, arg_y: f32) callconv(.c) f32 {
    var x = arg_x;
    _ = &x;
    var y = arg_y;
    _ = &y;
    var hx: __mingw_flt_type_t = undefined;
    _ = &hx;
    var hy: __mingw_flt_type_t = undefined;
    _ = &hy;
    hx.x = x;
    hy.x = y;
    hx.val = (hx.val & @as(c_uint, 2147483647)) | (hy.val & @as(c_uint, 2147483648));
    return hx.x;
}
pub extern fn copysignl(c_longdouble, c_longdouble) c_longdouble;
pub extern fn nan(tagp: [*c]const u8) f64;
pub extern fn nanf(tagp: [*c]const u8) f32;
pub extern fn nanl(tagp: [*c]const u8) c_longdouble;
pub extern fn nextafter(f64, f64) f64;
pub extern fn nextafterf(f32, f32) f32;
pub extern fn nextafterl(c_longdouble, c_longdouble) c_longdouble;
pub extern fn nexttoward(f64, c_longdouble) f64;
pub extern fn nexttowardf(f32, c_longdouble) f32;
pub extern fn nexttowardl(c_longdouble, c_longdouble) c_longdouble;
pub extern fn fdim(x: f64, y: f64) f64;
pub extern fn fdimf(x: f32, y: f32) f32;
pub extern fn fdiml(x: c_longdouble, y: c_longdouble) c_longdouble;
pub extern fn fmax(f64, f64) f64;
pub extern fn fmaxf(f32, f32) f32;
pub extern fn fmaxl(c_longdouble, c_longdouble) c_longdouble;
pub extern fn fmin(f64, f64) f64;
pub extern fn fminf(f32, f32) f32;
pub extern fn fminl(c_longdouble, c_longdouble) c_longdouble;
pub extern fn fma(f64, f64, f64) f64;
pub extern fn fmaf(f32, f32, f32) f32;
pub extern fn fmal(c_longdouble, c_longdouble, c_longdouble) c_longdouble;
pub extern fn _copysignf(_Number: f32, _Sign: f32) f32;
pub extern fn _chgsignf(_X: f32) f32;
pub extern fn _logbf(_X: f32) f32;
pub extern fn _nextafterf(_X: f32, _Y: f32) f32;
pub extern fn _finitef(_X: f32) c_int;
pub extern fn _isnanf(_X: f32) c_int;
pub extern fn _fpclassf(_X: f32) c_int;
pub extern fn _chgsignl(c_longdouble) c_longdouble;
pub extern fn _wdupenv_s(_Buffer: [*c][*c]wchar_t, _BufferSizeInWords: [*c]usize, _VarName: [*c]const wchar_t) errno_t;
pub extern fn _itow_s(_Val: c_int, _DstBuf: [*c]wchar_t, _SizeInWords: usize, _Radix: c_int) errno_t;
pub extern fn _ltow_s(_Val: c_long, _DstBuf: [*c]wchar_t, _SizeInWords: usize, _Radix: c_int) errno_t;
pub extern fn _ultow_s(_Val: c_ulong, _DstBuf: [*c]wchar_t, _SizeInWords: usize, _Radix: c_int) errno_t;
pub extern fn _wgetenv_s(_ReturnSize: [*c]usize, _DstBuf: [*c]wchar_t, _DstSizeInWords: usize, _VarName: [*c]const wchar_t) errno_t;
pub extern fn _i64tow_s(_Val: c_longlong, _DstBuf: [*c]wchar_t, _SizeInWords: usize, _Radix: c_int) errno_t;
pub extern fn _ui64tow_s(_Val: c_ulonglong, _DstBuf: [*c]wchar_t, _SizeInWords: usize, _Radix: c_int) errno_t;
pub extern fn _wmakepath_s(_PathResult: [*c]wchar_t, _SizeInWords: usize, _Drive: [*c]const wchar_t, _Dir: [*c]const wchar_t, _Filename: [*c]const wchar_t, _Ext: [*c]const wchar_t) errno_t;
pub extern fn _wputenv_s(_Name: [*c]const wchar_t, _Value: [*c]const wchar_t) errno_t;
pub extern fn _wsearchenv_s(_Filename: [*c]const wchar_t, _EnvVar: [*c]const wchar_t, _ResultPath: [*c]wchar_t, _SizeInWords: usize) errno_t;
pub extern fn _wsplitpath_s(_FullPath: [*c]const wchar_t, _Drive: [*c]wchar_t, _DriveSizeInWords: usize, _Dir: [*c]wchar_t, _DirSizeInWords: usize, _Filename: [*c]wchar_t, _FilenameSizeInWords: usize, _Ext: [*c]wchar_t, _ExtSizeInWords: usize) errno_t;
pub extern fn __pctype_func() [*c]const c_ushort;
pub extern var __imp__wctype: [*c][*c]const c_ushort;
pub extern fn __pwctype_func() [*c]const wctype_t;
pub extern fn iswalpha(_C: wint_t) c_int;
pub extern fn iswupper(_C: wint_t) c_int;
pub extern fn iswlower(_C: wint_t) c_int;
pub extern fn iswdigit(_C: wint_t) c_int;
pub extern fn iswxdigit(_C: wint_t) c_int;
pub extern fn iswspace(_C: wint_t) c_int;
pub extern fn iswpunct(_C: wint_t) c_int;
pub extern fn iswalnum(_C: wint_t) c_int;
pub extern fn iswprint(_C: wint_t) c_int;
pub extern fn iswgraph(_C: wint_t) c_int;
pub extern fn iswcntrl(_C: wint_t) c_int;
pub extern fn iswascii(_C: wint_t) c_int;
pub extern fn isleadbyte(_C: c_int) c_int;
pub extern fn towupper(_C: wint_t) wint_t;
pub extern fn towlower(_C: wint_t) wint_t;
pub extern fn iswctype(_C: wint_t, _Type: wctype_t) c_int;
pub extern fn __iswcsymf(_C: wint_t) c_int;
pub extern fn __iswcsym(_C: wint_t) c_int;
pub extern fn iswblank(_C: wint_t) c_int;
pub extern fn _iswalpha_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn _iswupper_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn _iswlower_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn _iswdigit_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn _iswxdigit_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn _iswspace_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn _iswpunct_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn _iswalnum_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn _iswprint_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn _iswgraph_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn _iswcntrl_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn _towupper_l(_C: wint_t, _Locale: _locale_t) wint_t;
pub extern fn _towlower_l(_C: wint_t, _Locale: _locale_t) wint_t;
pub extern fn _isleadbyte_l(_C: c_int, _Locale: _locale_t) c_int;
pub extern fn _iswctype_l(_C: wint_t, _Type: wctype_t, _Locale: _locale_t) c_int;
pub extern fn _iswblank_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn _iswcsymf_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn _iswcsym_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn is_wctype(_C: wint_t, _Type: wctype_t) c_int;
pub extern fn _wgetcwd(_DstBuf: [*c]wchar_t, _SizeInWords: c_int) [*c]wchar_t;
pub extern fn _wgetdcwd(_Drive: c_int, _DstBuf: [*c]wchar_t, _SizeInWords: c_int) [*c]wchar_t;
pub extern fn _wgetdcwd_nolock(_Drive: c_int, _DstBuf: [*c]wchar_t, _SizeInWords: c_int) [*c]wchar_t;
pub extern fn _wchdir(_Path: [*c]const wchar_t) c_int;
pub extern fn _wmkdir(_Path: [*c]const wchar_t) c_int;
pub extern fn _wrmdir(_Path: [*c]const wchar_t) c_int;
pub extern fn _wsetlocale(_Category: c_int, _Locale: [*c]const wchar_t) [*c]wchar_t;
pub extern fn _wcreate_locale(_Category: c_int, _Locale: [*c]const wchar_t) _locale_t;
pub extern fn _wexecl(_Filename: [*c]const wchar_t, _ArgList: [*c]const wchar_t, ...) isize;
pub extern fn _wexecle(_Filename: [*c]const wchar_t, _ArgList: [*c]const wchar_t, ...) isize;
pub extern fn _wexeclp(_Filename: [*c]const wchar_t, _ArgList: [*c]const wchar_t, ...) isize;
pub extern fn _wexeclpe(_Filename: [*c]const wchar_t, _ArgList: [*c]const wchar_t, ...) isize;
pub extern fn _wexecv(_Filename: [*c]const wchar_t, _ArgList: [*c]const [*c]const wchar_t) isize;
pub extern fn _wexecve(_Filename: [*c]const wchar_t, _ArgList: [*c]const [*c]const wchar_t, _Env: [*c]const [*c]const wchar_t) isize;
pub extern fn _wexecvp(_Filename: [*c]const wchar_t, _ArgList: [*c]const [*c]const wchar_t) isize;
pub extern fn _wexecvpe(_Filename: [*c]const wchar_t, _ArgList: [*c]const [*c]const wchar_t, _Env: [*c]const [*c]const wchar_t) isize;
pub extern fn _wsystem(_Command: [*c]const wchar_t) c_int;
pub const _ino_t = c_ushort;
pub const ino_t = c_ushort;
pub const _dev_t = c_uint;
pub const dev_t = c_uint;
pub const struct__stat32 = extern struct {
    st_dev: _dev_t = 0,
    st_ino: _ino_t = 0,
    st_mode: c_ushort = 0,
    st_nlink: c_short = 0,
    st_uid: c_short = 0,
    st_gid: c_short = 0,
    st_rdev: _dev_t = 0,
    st_size: _off_t = 0,
    st_atime: __time32_t = 0,
    st_mtime: __time32_t = 0,
    st_ctime: __time32_t = 0,
};
pub const struct__stat32i64 = extern struct {
    st_dev: _dev_t = 0,
    st_ino: _ino_t = 0,
    st_mode: c_ushort = 0,
    st_nlink: c_short = 0,
    st_uid: c_short = 0,
    st_gid: c_short = 0,
    st_rdev: _dev_t = 0,
    st_size: c_longlong = 0,
    st_atime: __time32_t = 0,
    st_mtime: __time32_t = 0,
    st_ctime: __time32_t = 0,
};
pub const struct__stat64i32 = extern struct {
    st_dev: _dev_t = 0,
    st_ino: _ino_t = 0,
    st_mode: c_ushort = 0,
    st_nlink: c_short = 0,
    st_uid: c_short = 0,
    st_gid: c_short = 0,
    st_rdev: _dev_t = 0,
    st_size: _off_t = 0,
    st_atime: __time64_t = 0,
    st_mtime: __time64_t = 0,
    st_ctime: __time64_t = 0,
};
pub const struct__stat64 = extern struct {
    st_dev: _dev_t = 0,
    st_ino: _ino_t = 0,
    st_mode: c_ushort = 0,
    st_nlink: c_short = 0,
    st_uid: c_short = 0,
    st_gid: c_short = 0,
    st_rdev: _dev_t = 0,
    st_size: c_longlong = 0,
    st_atime: __time64_t = 0,
    st_mtime: __time64_t = 0,
    st_ctime: __time64_t = 0,
};
pub extern fn _wstat32(_Name: [*c]const wchar_t, _Stat: [*c]struct__stat32) c_int;
pub extern fn _wstat32i64(_Name: [*c]const wchar_t, _Stat: [*c]struct__stat32i64) c_int;
pub extern fn _wstat64i32(_Name: [*c]const wchar_t, _Stat: [*c]struct__stat64i32) c_int;
pub extern fn _wstat64(_Name: [*c]const wchar_t, _Stat: [*c]struct__stat64) c_int;
pub extern fn _cgetws(_Buffer: [*c]wchar_t) [*c]wchar_t;
pub extern fn _getwch() wint_t;
pub extern fn _getwche() wint_t;
pub extern fn _putwch(_WCh: wchar_t) wint_t;
pub extern fn _ungetwch(_WCh: wint_t) wint_t;
pub extern fn _cputws(_String: [*c]const wchar_t) c_int;
pub extern fn _cwprintf(noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn _cwscanf(noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn _cwscanf_l(noalias _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
pub extern fn _vcwprintf(noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
pub extern fn _cwprintf_p(noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn _vcwprintf_p(noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
pub extern fn _cwprintf_l(noalias _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
pub extern fn _vcwprintf_l(noalias _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
pub extern fn _cwprintf_p_l(noalias _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
pub extern fn _vcwprintf_p_l(noalias _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
pub extern fn _putwch_nolock(_WCh: wchar_t) wint_t;
pub extern fn _getwch_nolock() wint_t;
pub extern fn _getwche_nolock() wint_t;
pub extern fn _ungetwch_nolock(_WCh: wint_t) wint_t;
pub extern fn __stdio_common_vswprintf_p(_Options: c_ulonglong, _Str: [*c]wchar_t, _Len: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
pub extern fn __stdio_common_vfwprintf_p(_Options: c_ulonglong, _File: [*c]FILE, _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
pub extern fn _itow(_Value: c_int, _Dest: [*c]wchar_t, _Radix: c_int) [*c]wchar_t;
pub extern fn _ltow(_Value: c_long, _Dest: [*c]wchar_t, _Radix: c_int) [*c]wchar_t;
pub extern fn _ultow(_Value: c_ulong, _Dest: [*c]wchar_t, _Radix: c_int) [*c]wchar_t;
pub extern fn _wcstod_l(noalias _Str: [*c]const wchar_t, noalias _EndPtr: [*c][*c]wchar_t, _Locale: _locale_t) f64;
pub extern fn __mingw_wcstod(noalias _Str: [*c]const wchar_t, noalias _EndPtr: [*c][*c]wchar_t) f64;
pub extern fn __mingw_wcstof(noalias nptr: [*c]const wchar_t, noalias endptr: [*c][*c]wchar_t) f32;
pub extern fn __mingw_wcstold(noalias [*c]const wchar_t, noalias [*c][*c]wchar_t) c_longdouble;
pub extern fn wcstod(noalias _Str: [*c]const wchar_t, noalias _EndPtr: [*c][*c]wchar_t) f64;
pub extern fn wcstof(noalias nptr: [*c]const wchar_t, noalias endptr: [*c][*c]wchar_t) f32;
pub extern fn wcstold(noalias [*c]const wchar_t, noalias [*c][*c]wchar_t) c_longdouble;
pub extern fn wcstol(noalias _Str: [*c]const wchar_t, noalias _EndPtr: [*c][*c]wchar_t, _Radix: c_int) c_long;
pub extern fn _wcstol_l(noalias _Str: [*c]const wchar_t, noalias _EndPtr: [*c][*c]wchar_t, _Radix: c_int, _Locale: _locale_t) c_long;
pub extern fn wcstoul(noalias _Str: [*c]const wchar_t, noalias _EndPtr: [*c][*c]wchar_t, _Radix: c_int) c_ulong;
pub extern fn _wcstoul_l(noalias _Str: [*c]const wchar_t, noalias _EndPtr: [*c][*c]wchar_t, _Radix: c_int, _Locale: _locale_t) c_ulong;
pub extern fn _wgetenv(_VarName: [*c]const wchar_t) [*c]wchar_t;
pub extern fn _wtof(_Str: [*c]const wchar_t) f64;
pub extern fn _wtof_l(_Str: [*c]const wchar_t, _Locale: _locale_t) f64;
pub extern fn _wtoi(_Str: [*c]const wchar_t) c_int;
pub extern fn _wtoi_l(_Str: [*c]const wchar_t, _Locale: _locale_t) c_int;
pub extern fn _wtol(_Str: [*c]const wchar_t) c_long;
pub extern fn _wtol_l(_Str: [*c]const wchar_t, _Locale: _locale_t) c_long;
pub extern fn _i64tow(_Val: c_longlong, _DstBuf: [*c]wchar_t, _Radix: c_int) [*c]wchar_t;
pub extern fn _ui64tow(_Val: c_ulonglong, _DstBuf: [*c]wchar_t, _Radix: c_int) [*c]wchar_t;
pub extern fn _wtoi64(_Str: [*c]const wchar_t) c_longlong;
pub extern fn _wtoi64_l(_Str: [*c]const wchar_t, _Locale: _locale_t) c_longlong;
pub extern fn _wcstoi64(_Str: [*c]const wchar_t, _EndPtr: [*c][*c]wchar_t, _Radix: c_int) c_longlong;
pub extern fn _wcstoi64_l(_Str: [*c]const wchar_t, _EndPtr: [*c][*c]wchar_t, _Radix: c_int, _Locale: _locale_t) c_longlong;
pub extern fn _wcstoui64(_Str: [*c]const wchar_t, _EndPtr: [*c][*c]wchar_t, _Radix: c_int) c_ulonglong;
pub extern fn _wcstoui64_l(_Str: [*c]const wchar_t, _EndPtr: [*c][*c]wchar_t, _Radix: c_int, _Locale: _locale_t) c_ulonglong;
pub extern fn _wfullpath(_FullPath: [*c]wchar_t, _Path: [*c]const wchar_t, _SizeInWords: usize) [*c]wchar_t;
pub extern fn _wmakepath(_ResultPath: [*c]wchar_t, _Drive: [*c]const wchar_t, _Dir: [*c]const wchar_t, _Filename: [*c]const wchar_t, _Ext: [*c]const wchar_t) void;
pub extern fn _wputenv(_EnvString: [*c]const wchar_t) c_int;
pub extern fn _wsearchenv(_Filename: [*c]const wchar_t, _EnvVar: [*c]const wchar_t, _ResultPath: [*c]wchar_t) void;
pub extern fn _wsplitpath(_FullPath: [*c]const wchar_t, _Drive: [*c]wchar_t, _Dir: [*c]wchar_t, _Filename: [*c]wchar_t, _Ext: [*c]wchar_t) void;
pub const struct_tm = extern struct {
    tm_sec: c_int = 0,
    tm_min: c_int = 0,
    tm_hour: c_int = 0,
    tm_mday: c_int = 0,
    tm_mon: c_int = 0,
    tm_year: c_int = 0,
    tm_wday: c_int = 0,
    tm_yday: c_int = 0,
    tm_isdst: c_int = 0,
    pub const _wasctime = __root._wasctime;
    pub const wasctime = __root._wasctime;
};
pub extern fn _wasctime(_Tm: [*c]const struct_tm) [*c]wchar_t;
pub extern fn _wasctime_s(_Buf: [*c]wchar_t, _SizeInWords: usize, _Tm: [*c]const struct_tm) errno_t;
pub extern fn _wctime32(_Time: [*c]const __time32_t) [*c]wchar_t;
pub extern fn _wctime32_s(_Buf: [*c]wchar_t, _SizeInWords: usize, _Time: [*c]const __time32_t) errno_t;
pub extern fn wcsftime(noalias _Buf: [*c]wchar_t, _SizeInWords: usize, noalias _Format: [*c]const wchar_t, noalias _Tm: [*c]const struct_tm) usize;
pub extern fn _wcsftime_l(noalias _Buf: [*c]wchar_t, _SizeInWords: usize, noalias _Format: [*c]const wchar_t, noalias _Tm: [*c]const struct_tm, _Locale: _locale_t) usize;
pub extern fn _wstrdate(_Buffer: [*c]wchar_t) [*c]wchar_t;
pub extern fn _wstrdate_s(_Buf: [*c]wchar_t, _SizeInWords: usize) errno_t;
pub extern fn _wstrtime(_Buffer: [*c]wchar_t) [*c]wchar_t;
pub extern fn _wstrtime_s(_Buf: [*c]wchar_t, _SizeInWords: usize) errno_t;
pub extern fn _wctime64(_Time: [*c]const __time64_t) [*c]wchar_t;
pub extern fn _wctime64_s(_Buf: [*c]wchar_t, _SizeInWords: usize, _Time: [*c]const __time64_t) errno_t;
pub fn _wctime(arg__Time: [*c]const time_t) callconv(.c) [*c]wchar_t {
    var _Time = arg__Time;
    _ = &_Time;
    return _wctime64(_Time);
}
pub fn _wctime_s(arg__Buffer: [*c]wchar_t, arg__SizeInWords: usize, arg__Time: [*c]const time_t) callconv(.c) errno_t {
    var _Buffer = arg__Buffer;
    _ = &_Buffer;
    var _SizeInWords = arg__SizeInWords;
    _ = &_SizeInWords;
    var _Time = arg__Time;
    _ = &_Time;
    return _wctime64_s(_Buffer, _SizeInWords, _Time);
}
pub const struct__Mbstatet = extern struct {
    _Wchar: c_ulong = 0,
    _Byte: c_ushort = 0,
    _State: c_ushort = 0,
    pub const mbsinit = __root.mbsinit;
};
pub const _Mbstatet = struct__Mbstatet;
pub const mbstate_t = _Mbstatet;
pub const _Wint_t = wchar_t;
pub extern fn btowc(c_int) wint_t;
pub extern fn mbrlen(noalias _Ch: [*c]const u8, _SizeInBytes: usize, noalias _State: [*c]mbstate_t) usize;
pub extern fn mbrtowc(noalias _DstCh: [*c]wchar_t, noalias _SrcCh: [*c]const u8, _SizeInBytes: usize, noalias _State: [*c]mbstate_t) usize;
pub extern fn mbsrtowcs(noalias _Dest: [*c]wchar_t, noalias _PSrc: [*c][*c]const u8, _Count: usize, noalias _State: [*c]mbstate_t) usize;
pub extern fn wcrtomb(noalias _Dest: [*c]u8, _Source: wchar_t, noalias _State: [*c]mbstate_t) usize;
pub extern fn wcsrtombs(noalias _Dest: [*c]u8, noalias _PSource: [*c][*c]const wchar_t, _Count: usize, noalias _State: [*c]mbstate_t) usize;
pub extern fn wctob(_WCh: wint_t) c_int;
pub fn wmemset(arg__S: [*c]wchar_t, arg__C: wchar_t, arg__N: usize) callconv(.c) [*c]wchar_t {
    var _S = arg__S;
    _ = &_S;
    var _C = arg__C;
    _ = &_C;
    var _N = arg__N;
    _ = &_N;
    var _Su: [*c]wchar_t = _S;
    _ = &_Su;
    _Su += 1;
    while (@as(usize, 0) < _N) : (_N -%= 1) {
        _Su.* = _C;
    }
    return _S;
}
pub fn wmemchr(arg__S: [*c]const wchar_t, arg__C: wchar_t, arg__N: usize) callconv(.c) [*c]wchar_t {
    var _S = arg__S;
    _ = &_S;
    var _C = arg__C;
    _ = &_C;
    var _N = arg__N;
    _ = &_N;
    if (_S != null) {
        _S += 1;
        while (@as(usize, 0) < _N) : (_N -%= 1) if (@as(c_int, _S.*) == @as(c_int, _C)) return @ptrCast(@alignCast(@constCast(_S)));
    }
    return null;
}
pub fn wmemcmp(arg__S1: [*c]const wchar_t, arg__S2: [*c]const wchar_t, arg__N: usize) callconv(.c) c_int {
    var _S1 = arg__S1;
    _ = &_S1;
    var _S2 = arg__S2;
    _ = &_S2;
    var _N = arg__N;
    _ = &_N;
    if ((_N == @as(usize, 0)) or (_S1 == _S2)) return 0;
    if (((_S1 != null) and !(_S2 != null)) or ((_S2 != null) and !(_S1 != null))) return if (!(_S2 != null)) @as(c_int, 1) else -@as(c_int, 1);
    _S1 += 1;
    _S2 += 1;
    while (@as(usize, 0) < _N) : (_N -%= 1) if (@as(c_int, _S1.*) != @as(c_int, _S2.*)) return if (@as(c_int, _S1.*) < @as(c_int, _S2.*)) -@as(c_int, 1) else @as(c_int, 1);
    return 0;
}
pub fn wmemcpy(noalias arg__S1: [*c]wchar_t, noalias arg__S2: [*c]const wchar_t, arg__N: usize) callconv(.c) [*c]wchar_t {
    var _S1 = arg__S1;
    _ = &_S1;
    var _S2 = arg__S2;
    _ = &_S2;
    var _N = arg__N;
    _ = &_N;
    return @ptrCast(@alignCast(memcpy(@ptrCast(@alignCast(_S1)), @ptrCast(@alignCast(_S2)), _N *% @sizeOf(wchar_t))));
}
pub extern fn wmempcpy(_Dst: [*c]wchar_t, _Src: [*c]const wchar_t, _Size: usize) [*c]wchar_t;
pub fn wmemmove(arg__S1: [*c]wchar_t, arg__S2: [*c]const wchar_t, arg__N: usize) callconv(.c) [*c]wchar_t {
    var _S1 = arg__S1;
    _ = &_S1;
    var _S2 = arg__S2;
    _ = &_S2;
    var _N = arg__N;
    _ = &_N;
    return @ptrCast(@alignCast(memmove(@ptrCast(@alignCast(_S1)), @ptrCast(@alignCast(_S2)), _N *% @sizeOf(wchar_t))));
}
pub fn fwide(arg__F: [*c]FILE, arg__M: c_int) callconv(.c) c_int {
    var _F = arg__F;
    _ = &_F;
    var _M = arg__M;
    _ = &_M;
    _ = &_F;
    return _M;
}
pub fn mbsinit(arg__P: [*c]const mbstate_t) callconv(.c) c_int {
    var _P = arg__P;
    _ = &_P;
    return @intFromBool(!(_P != null) or (_P.*._Wchar == @as(c_ulong, 0)));
}
pub extern fn wcstoll(noalias nptr: [*c]const wchar_t, noalias endptr: [*c][*c]wchar_t, base: c_int) c_longlong;
pub extern fn wcstoull(noalias nptr: [*c]const wchar_t, noalias endptr: [*c][*c]wchar_t, base: c_int) c_ulonglong;
pub extern fn _cgetws_s(_Buffer: [*c]wchar_t, _SizeInWords: usize, _SizeRead: [*c]usize) errno_t;
pub extern fn _cwprintf_s(_Format: [*c]const wchar_t, ...) c_int;
pub extern fn _cwscanf_s(_Format: [*c]const wchar_t, ...) c_int;
pub extern fn _cwscanf_s_l(_Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
pub extern fn _vcwprintf_s(_Format: [*c]const wchar_t, _ArgList: va_list) c_int;
pub extern fn _cwprintf_s_l(_Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
pub extern fn _vcwprintf_s_l(_Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
pub extern fn mbsrtowcs_s(_Retval: [*c]usize, _Dst: [*c]wchar_t, _SizeInWords: usize, _PSrc: [*c][*c]const u8, _N: usize, _State: [*c]mbstate_t) errno_t;
pub extern fn wcrtomb_s(_Retval: [*c]usize, _Dst: [*c]u8, _SizeInBytes: usize, _Ch: wchar_t, _State: [*c]mbstate_t) errno_t;
pub extern fn wcsrtombs_s(_Retval: [*c]usize, _Dst: [*c]u8, _SizeInBytes: usize, _Src: [*c][*c]const wchar_t, _Size: usize, _State: [*c]mbstate_t) errno_t;
pub extern fn wmemcpy_s(_dest: [*c]wchar_t, _numberOfElements: usize, _src: [*c]const wchar_t, _count: usize) errno_t;
pub extern fn wmemmove_s(_dest: [*c]wchar_t, _numberOfElements: usize, _src: [*c]const wchar_t, _count: usize) errno_t;
pub const _pid_t = c_longlong;
pub const pid_t = _pid_t;
pub const _mode_t = c_ushort;
pub const mode_t = _mode_t;
pub const useconds_t = c_uint;
pub const struct_timespec = extern struct {
    tv_sec: time_t = 0,
    tv_nsec: c_long = 0,
};
pub const struct_itimerspec = extern struct {
    it_interval: struct_timespec = @import("std").mem.zeroes(struct_timespec),
    it_value: struct_timespec = @import("std").mem.zeroes(struct_timespec),
};
pub const _sigset_t = c_ulonglong;
pub extern fn _errno() [*c]c_int;
pub extern fn _set_errno(_Value: c_int) errno_t;
pub extern fn _get_errno(_Value: [*c]c_int) errno_t;
pub const _onexit_t = ?*const fn () callconv(.c) c_int;
pub const struct__div_t = extern struct {
    quot: c_int = 0,
    rem: c_int = 0,
};
pub const div_t = struct__div_t;
pub const struct__ldiv_t = extern struct {
    quot: c_long = 0,
    rem: c_long = 0,
};
pub const ldiv_t = struct__ldiv_t;
pub const _LDOUBLE = extern struct {
    ld: [10]u8 = @import("std").mem.zeroes([10]u8),
    pub const _atoldbl = __root._atoldbl;
    pub const _atoldbl_l = __root._atoldbl_l;
    pub const atoldbl = __root._atoldbl;
    pub const l = __root._atoldbl_l;
};
pub const _CRT_DOUBLE = extern struct {
    x: f64 = 0,
    pub const _atodbl = __root._atodbl;
    pub const _atodbl_l = __root._atodbl_l;
    pub const atodbl = __root._atodbl;
    pub const l = __root._atodbl_l;
};
pub const _CRT_FLOAT = extern struct {
    f: f32 = 0,
    pub const _atoflt = __root._atoflt;
    pub const _atoflt_l = __root._atoflt_l;
    pub const atoflt = __root._atoflt;
    pub const l = __root._atoflt_l;
};
pub const _LONGDOUBLE = extern struct {
    x: c_longdouble = 0,
};
pub const _LDBL12 = extern struct {
    ld12: [12]u8 = @import("std").mem.zeroes([12]u8),
};
pub extern fn ___mb_cur_max_func() c_int;
pub const _purecall_handler = ?*const fn () callconv(.c) void;
pub extern fn _set_purecall_handler(_Handler: _purecall_handler) _purecall_handler;
pub extern fn _get_purecall_handler() _purecall_handler;
pub const _invalid_parameter_handler = ?*const fn ([*c]const wchar_t, [*c]const wchar_t, [*c]const wchar_t, c_uint, usize) callconv(.c) void;
pub extern fn _set_invalid_parameter_handler(_Handler: _invalid_parameter_handler) _invalid_parameter_handler;
pub extern fn _get_invalid_parameter_handler() _invalid_parameter_handler;
pub extern fn __doserrno() [*c]c_ulong;
pub extern fn _set_doserrno(_Value: c_ulong) errno_t;
pub extern fn _get_doserrno(_Value: [*c]c_ulong) errno_t;
pub extern fn __sys_errlist() [*c][*c]u8;
pub extern fn __sys_nerr() [*c]c_int;
pub extern fn __p___argv() [*c][*c][*c]u8;
pub extern fn __p__fmode() [*c]c_int;
pub extern fn __p___argc() [*c]c_int;
pub extern fn __p___wargv() [*c][*c][*c]wchar_t;
pub extern fn __p__pgmptr() [*c][*c]u8;
pub extern fn __p__wpgmptr() [*c][*c]wchar_t;
pub extern fn _get_pgmptr(_Value: [*c][*c]u8) errno_t;
pub extern fn _get_wpgmptr(_Value: [*c][*c]wchar_t) errno_t;
pub extern fn _set_fmode(_Mode: c_int) errno_t;
pub extern fn _get_fmode(_PMode: [*c]c_int) errno_t;
pub extern fn __p__environ() [*c][*c][*c]u8;
pub extern fn __p__wenviron() [*c][*c][*c]wchar_t;
pub extern fn __p__osplatform() [*c]c_uint;
pub extern fn __p__osver() [*c]c_uint;
pub extern fn __p__winver() [*c]c_uint;
pub extern fn __p__winmajor() [*c]c_uint;
pub extern fn __p__winminor() [*c]c_uint;
pub extern fn _get_osplatform(_Value: [*c]c_uint) errno_t;
pub extern fn _get_osver(_Value: [*c]c_uint) errno_t;
pub extern fn _get_winver(_Value: [*c]c_uint) errno_t;
pub extern fn _get_winmajor(_Value: [*c]c_uint) errno_t;
pub extern fn _get_winminor(_Value: [*c]c_uint) errno_t;
pub extern fn exit(_Code: c_int) noreturn;
pub extern fn _exit(_Code: c_int) noreturn;
pub extern fn quick_exit(_Code: c_int) noreturn;
pub fn _Exit(arg_status: c_int) callconv(.c) noreturn {
    var status = arg_status;
    _ = &status;
    _exit(status);
}
pub extern fn abort() noreturn;
pub extern fn _set_abort_behavior(_Flags: c_uint, _Mask: c_uint) c_uint;
pub inline fn _abs64(arg_x: c_longlong) c_longlong {
    var x = arg_x;
    _ = &x;
    return __builtin.llabs(x);
}
pub extern fn atexit(?*const fn () callconv(.c) void) c_int;
pub extern fn at_quick_exit(?*const fn () callconv(.c) void) c_int;
pub extern fn atoi(_Str: [*c]const u8) c_int;
pub extern fn _atoi_l(_Str: [*c]const u8, _Locale: _locale_t) c_int;
pub extern fn atol(_Str: [*c]const u8) c_long;
pub extern fn _atol_l(_Str: [*c]const u8, _Locale: _locale_t) c_long;
pub extern fn bsearch(_Key: ?*const anyopaque, _Base: ?*const anyopaque, _NumOfElements: usize, _SizeOfElements: usize, _PtFuncCompare: ?*const fn (?*const anyopaque, ?*const anyopaque) callconv(.c) c_int) ?*anyopaque;
pub extern fn qsort(_Base: ?*anyopaque, _NumOfElements: usize, _SizeOfElements: usize, _PtFuncCompare: ?*const fn (?*const anyopaque, ?*const anyopaque) callconv(.c) c_int) void;
pub extern fn _byteswap_ushort(_Short: c_ushort) c_ushort;
pub extern fn _byteswap_ulong(_Long: c_ulong) c_ulong;
pub extern fn _byteswap_uint64(_Int64: c_ulonglong) c_ulonglong;
pub extern fn div(_Numerator: c_int, _Denominator: c_int) div_t;
pub extern fn getenv(_VarName: [*c]const u8) [*c]u8;
pub extern fn _itoa(_Value: c_int, _Dest: [*c]u8, _Radix: c_int) [*c]u8;
pub extern fn _i64toa(_Val: c_longlong, _DstBuf: [*c]u8, _Radix: c_int) [*c]u8;
pub extern fn _ui64toa(_Val: c_ulonglong, _DstBuf: [*c]u8, _Radix: c_int) [*c]u8;
pub extern fn _atoi64(_String: [*c]const u8) c_longlong;
pub extern fn _atoi64_l(_String: [*c]const u8, _Locale: _locale_t) c_longlong;
pub extern fn _strtoi64(_String: [*c]const u8, _EndPtr: [*c][*c]u8, _Radix: c_int) c_longlong;
pub extern fn _strtoi64_l(_String: [*c]const u8, _EndPtr: [*c][*c]u8, _Radix: c_int, _Locale: _locale_t) c_longlong;
pub extern fn _strtoui64(_String: [*c]const u8, _EndPtr: [*c][*c]u8, _Radix: c_int) c_ulonglong;
pub extern fn _strtoui64_l(_String: [*c]const u8, _EndPtr: [*c][*c]u8, _Radix: c_int, _Locale: _locale_t) c_ulonglong;
pub extern fn ldiv(_Numerator: c_long, _Denominator: c_long) ldiv_t;
pub extern fn _ltoa(_Value: c_long, _Dest: [*c]u8, _Radix: c_int) [*c]u8;
pub extern fn mblen(_Ch: [*c]const u8, _MaxCount: usize) c_int;
pub extern fn _mblen_l(_Ch: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) c_int;
pub extern fn _mbstrlen(_Str: [*c]const u8) usize;
pub extern fn _mbstrlen_l(_Str: [*c]const u8, _Locale: _locale_t) usize;
pub extern fn _mbstrnlen(_Str: [*c]const u8, _MaxCount: usize) usize;
pub extern fn _mbstrnlen_l(_Str: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) usize;
pub extern fn mbtowc(noalias _DstCh: [*c]wchar_t, noalias _SrcCh: [*c]const u8, _SrcSizeInBytes: usize) c_int;
pub extern fn _mbtowc_l(noalias _DstCh: [*c]wchar_t, noalias _SrcCh: [*c]const u8, _SrcSizeInBytes: usize, _Locale: _locale_t) c_int;
pub extern fn mbstowcs(noalias _Dest: [*c]wchar_t, noalias _Source: [*c]const u8, _MaxCount: usize) usize;
pub extern fn _mbstowcs_l(noalias _Dest: [*c]wchar_t, noalias _Source: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) usize;
pub extern fn mkstemp(template_name: [*c]u8) c_int;
pub extern fn rand() c_int;
pub extern fn _set_error_mode(_Mode: c_int) c_int;
pub extern fn srand(_Seed: c_uint) void;
pub extern fn strtod(noalias _Str: [*c]const u8, noalias _EndPtr: [*c][*c]u8) f64;
pub extern fn strtof(noalias nptr: [*c]const u8, noalias endptr: [*c][*c]u8) f32;
pub extern fn strtold(noalias [*c]const u8, noalias [*c][*c]u8) c_longdouble;
pub extern fn __strtod(noalias [*c]const u8, noalias [*c][*c]u8) f64;
pub extern fn __mingw_strtof(noalias [*c]const u8, noalias [*c][*c]u8) f32;
pub extern fn __mingw_strtod(noalias [*c]const u8, noalias [*c][*c]u8) f64;
pub extern fn __mingw_strtold(noalias [*c]const u8, noalias [*c][*c]u8) c_longdouble;
pub extern fn _strtof_l(noalias _Str: [*c]const u8, noalias _EndPtr: [*c][*c]u8, _Locale: _locale_t) f32;
pub extern fn _strtod_l(noalias _Str: [*c]const u8, noalias _EndPtr: [*c][*c]u8, _Locale: _locale_t) f64;
pub extern fn strtol(noalias _Str: [*c]const u8, noalias _EndPtr: [*c][*c]u8, _Radix: c_int) c_long;
pub extern fn _strtol_l(noalias _Str: [*c]const u8, noalias _EndPtr: [*c][*c]u8, _Radix: c_int, _Locale: _locale_t) c_long;
pub extern fn strtoul(noalias _Str: [*c]const u8, noalias _EndPtr: [*c][*c]u8, _Radix: c_int) c_ulong;
pub extern fn _strtoul_l(noalias _Str: [*c]const u8, noalias _EndPtr: [*c][*c]u8, _Radix: c_int, _Locale: _locale_t) c_ulong;
pub extern fn system(_Command: [*c]const u8) c_int;
pub extern fn _ultoa(_Value: c_ulong, _Dest: [*c]u8, _Radix: c_int) [*c]u8;
pub extern fn wctomb(_MbCh: [*c]u8, _WCh: wchar_t) c_int;
pub extern fn _wctomb_l(_MbCh: [*c]u8, _WCh: wchar_t, _Locale: _locale_t) c_int;
pub extern fn wcstombs(noalias _Dest: [*c]u8, noalias _Source: [*c]const wchar_t, _MaxCount: usize) usize;
pub extern fn _wcstombs_l(noalias _Dest: [*c]u8, noalias _Source: [*c]const wchar_t, _MaxCount: usize, _Locale: _locale_t) usize;
pub extern fn calloc(_NumOfElements: usize, _SizeOfElements: usize) ?*anyopaque;
pub extern fn free(_Memory: ?*anyopaque) void;
pub extern fn malloc(_Size: usize) ?*anyopaque;
pub extern fn realloc(_Memory: ?*anyopaque, _NewSize: usize) ?*anyopaque;
pub extern fn _aligned_free(_Memory: ?*anyopaque) void;
pub extern fn _aligned_malloc(_Size: usize, _Alignment: usize) ?*anyopaque;
pub extern fn _aligned_offset_malloc(_Size: usize, _Alignment: usize, _Offset: usize) ?*anyopaque;
pub extern fn _aligned_realloc(_Memory: ?*anyopaque, _Size: usize, _Alignment: usize) ?*anyopaque;
pub extern fn _aligned_offset_realloc(_Memory: ?*anyopaque, _Size: usize, _Alignment: usize, _Offset: usize) ?*anyopaque;
pub extern fn _recalloc(_Memory: ?*anyopaque, _Count: usize, _Size: usize) ?*anyopaque;
pub extern fn _aligned_recalloc(_Memory: ?*anyopaque, _Count: usize, _Size: usize, _Alignment: usize) ?*anyopaque;
pub extern fn _aligned_offset_recalloc(_Memory: ?*anyopaque, _Count: usize, _Size: usize, _Alignment: usize, _Offset: usize) ?*anyopaque;
pub extern fn _aligned_msize(_Memory: ?*anyopaque, _Alignment: usize, _Offset: usize) usize;
pub extern fn _putenv(_EnvString: [*c]const u8) c_int;
pub extern fn _fullpath(_FullPath: [*c]u8, _Path: [*c]const u8, _SizeInBytes: usize) [*c]u8;
pub extern fn _ecvt(_Val: f64, _NumOfDigits: c_int, _PtDec: [*c]c_int, _PtSign: [*c]c_int) [*c]u8;
pub extern fn _fcvt(_Val: f64, _NumOfDec: c_int, _PtDec: [*c]c_int, _PtSign: [*c]c_int) [*c]u8;
pub extern fn _gcvt(_Val: f64, _NumOfDigits: c_int, _DstBuf: [*c]u8) [*c]u8;
pub extern fn _atodbl(_Result: [*c]_CRT_DOUBLE, _Str: [*c]u8) c_int;
pub extern fn _atoldbl(_Result: [*c]_LDOUBLE, _Str: [*c]u8) c_int;
pub extern fn _atoflt(_Result: [*c]_CRT_FLOAT, _Str: [*c]u8) c_int;
pub extern fn _atodbl_l(_Result: [*c]_CRT_DOUBLE, _Str: [*c]u8, _Locale: _locale_t) c_int;
pub extern fn _atoldbl_l(_Result: [*c]_LDOUBLE, _Str: [*c]u8, _Locale: _locale_t) c_int;
pub extern fn _atoflt_l(_Result: [*c]_CRT_FLOAT, _Str: [*c]u8, _Locale: _locale_t) c_int;
pub extern fn _lrotl(c_ulong, c_int) c_ulong;
pub extern fn _lrotr(c_ulong, c_int) c_ulong;
pub extern fn _makepath(_Path: [*c]u8, _Drive: [*c]const u8, _Dir: [*c]const u8, _Filename: [*c]const u8, _Ext: [*c]const u8) void;
pub extern fn _onexit(_Func: _onexit_t) _onexit_t;
pub extern fn _rotl64(_Val: c_ulonglong, _Shift: c_int) c_ulonglong;
pub extern fn _rotr64(Value: c_ulonglong, Shift: c_int) c_ulonglong;
pub extern fn _rotr(_Val: c_uint, _Shift: c_int) c_uint;
pub extern fn _rotl(_Val: c_uint, _Shift: c_int) c_uint;
pub extern fn _searchenv(_Filename: [*c]const u8, _EnvVar: [*c]const u8, _ResultPath: [*c]u8) void;
pub extern fn _splitpath(_FullPath: [*c]const u8, _Drive: [*c]u8, _Dir: [*c]u8, _Filename: [*c]u8, _Ext: [*c]u8) void;
pub extern fn _swab(_Buf1: [*c]u8, _Buf2: [*c]u8, _SizeInBytes: c_int) void;
pub extern fn _beep(_Frequency: c_uint, _Duration: c_uint) void;
pub extern fn _seterrormode(_Mode: c_int) void;
pub extern fn _sleep(_Duration: c_ulong) void;
pub extern fn ecvt(_Val: f64, _NumOfDigits: c_int, _PtDec: [*c]c_int, _PtSign: [*c]c_int) [*c]u8;
pub extern fn fcvt(_Val: f64, _NumOfDec: c_int, _PtDec: [*c]c_int, _PtSign: [*c]c_int) [*c]u8;
pub extern fn gcvt(_Val: f64, _NumOfDigits: c_int, _DstBuf: [*c]u8) [*c]u8;
pub extern fn itoa(_Val: c_int, _DstBuf: [*c]u8, _Radix: c_int) [*c]u8;
pub extern fn ltoa(_Val: c_long, _DstBuf: [*c]u8, _Radix: c_int) [*c]u8;
pub extern fn putenv(_EnvString: [*c]const u8) c_int;
pub extern fn swab(_Buf1: [*c]u8, _Buf2: [*c]u8, _SizeInBytes: c_int) void;
pub extern fn ultoa(_Val: c_ulong, _Dstbuf: [*c]u8, _Radix: c_int) [*c]u8;
pub extern fn onexit(_Func: _onexit_t) _onexit_t;
pub const lldiv_t = extern struct {
    quot: c_longlong = 0,
    rem: c_longlong = 0,
};
pub extern fn lldiv(c_longlong, c_longlong) lldiv_t;
pub fn llabs(arg__j: c_longlong) callconv(.c) c_longlong {
    var _j = arg__j;
    _ = &_j;
    return if (_j >= @as(c_longlong, 0)) _j else -_j;
}
pub extern fn strtoll(noalias [*c]const u8, noalias [*c][*c]u8, c_int) c_longlong;
pub extern fn strtoull(noalias [*c]const u8, noalias [*c][*c]u8, c_int) c_ulonglong;
pub extern fn atoll([*c]const u8) c_longlong;
pub fn wtoll(arg__w: [*c]const wchar_t) callconv(.c) c_longlong {
    var _w = arg__w;
    _ = &_w;
    return _wtoi64(_w);
}
pub fn lltoa(arg__n: c_longlong, arg__c: [*c]u8, arg__i: c_int) callconv(.c) [*c]u8 {
    var _n = arg__n;
    _ = &_n;
    var _c = arg__c;
    _ = &_c;
    var _i = arg__i;
    _ = &_i;
    return _i64toa(_n, _c, _i);
}
pub fn ulltoa(arg__n: c_ulonglong, arg__c: [*c]u8, arg__i: c_int) callconv(.c) [*c]u8 {
    var _n = arg__n;
    _ = &_n;
    var _c = arg__c;
    _ = &_c;
    var _i = arg__i;
    _ = &_i;
    return _ui64toa(_n, _c, _i);
}
pub fn lltow(arg__n: c_longlong, arg__w: [*c]wchar_t, arg__i: c_int) callconv(.c) [*c]wchar_t {
    var _n = arg__n;
    _ = &_n;
    var _w = arg__w;
    _ = &_w;
    var _i = arg__i;
    _ = &_i;
    return _i64tow(_n, _w, _i);
}
pub fn ulltow(arg__n: c_ulonglong, arg__w: [*c]wchar_t, arg__i: c_int) callconv(.c) [*c]wchar_t {
    var _n = arg__n;
    _ = &_n;
    var _w = arg__w;
    _ = &_w;
    var _i = arg__i;
    _ = &_i;
    return _ui64tow(_n, _w, _i);
}
pub extern fn _dupenv_s(_PBuffer: [*c][*c]u8, _PBufferSizeInBytes: [*c]usize, _VarName: [*c]const u8) errno_t;
pub extern fn bsearch_s(_Key: ?*const anyopaque, _Base: ?*const anyopaque, _NumOfElements: rsize_t, _SizeOfElements: rsize_t, _PtFuncCompare: ?*const fn (?*anyopaque, ?*const anyopaque, ?*const anyopaque) callconv(.c) c_int, _Context: ?*anyopaque) ?*anyopaque;
pub extern fn getenv_s(_ReturnSize: [*c]usize, _DstBuf: [*c]u8, _DstSize: rsize_t, _VarName: [*c]const u8) errno_t;
pub extern fn _itoa_s(_Value: c_int, _DstBuf: [*c]u8, _Size: usize, _Radix: c_int) errno_t;
pub extern fn _i64toa_s(_Val: c_longlong, _DstBuf: [*c]u8, _Size: usize, _Radix: c_int) errno_t;
pub extern fn _ui64toa_s(_Val: c_ulonglong, _DstBuf: [*c]u8, _Size: usize, _Radix: c_int) errno_t;
pub extern fn _ltoa_s(_Val: c_long, _DstBuf: [*c]u8, _Size: usize, _Radix: c_int) errno_t;
pub extern fn mbstowcs_s(_PtNumOfCharConverted: [*c]usize, _DstBuf: [*c]wchar_t, _SizeInWords: usize, _SrcBuf: [*c]const u8, _MaxCount: usize) errno_t;
pub extern fn _mbstowcs_s_l(_PtNumOfCharConverted: [*c]usize, _DstBuf: [*c]wchar_t, _SizeInWords: usize, _SrcBuf: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) errno_t;
pub extern fn _ultoa_s(_Val: c_ulong, _DstBuf: [*c]u8, _Size: usize, _Radix: c_int) errno_t;
pub extern fn wctomb_s(_SizeConverted: [*c]c_int, _MbCh: [*c]u8, _SizeInBytes: rsize_t, _WCh: wchar_t) errno_t;
pub extern fn _wctomb_s_l(_SizeConverted: [*c]c_int, _MbCh: [*c]u8, _SizeInBytes: usize, _WCh: wchar_t, _Locale: _locale_t) errno_t;
pub extern fn wcstombs_s(_PtNumOfCharConverted: [*c]usize, _Dst: [*c]u8, _DstSizeInBytes: usize, _Src: [*c]const wchar_t, _MaxCountInBytes: usize) errno_t;
pub extern fn _wcstombs_s_l(_PtNumOfCharConverted: [*c]usize, _Dst: [*c]u8, _DstSizeInBytes: usize, _Src: [*c]const wchar_t, _MaxCountInBytes: usize, _Locale: _locale_t) errno_t;
pub extern fn _ecvt_s(_DstBuf: [*c]u8, _Size: usize, _Val: f64, _NumOfDights: c_int, _PtDec: [*c]c_int, _PtSign: [*c]c_int) errno_t;
pub extern fn _fcvt_s(_DstBuf: [*c]u8, _Size: usize, _Val: f64, _NumOfDec: c_int, _PtDec: [*c]c_int, _PtSign: [*c]c_int) errno_t;
pub extern fn _gcvt_s(_DstBuf: [*c]u8, _Size: usize, _Val: f64, _NumOfDigits: c_int) errno_t;
pub extern fn _makepath_s(_PathResult: [*c]u8, _Size: usize, _Drive: [*c]const u8, _Dir: [*c]const u8, _Filename: [*c]const u8, _Ext: [*c]const u8) errno_t;
pub extern fn _putenv_s(_Name: [*c]const u8, _Value: [*c]const u8) errno_t;
pub extern fn _searchenv_s(_Filename: [*c]const u8, _EnvVar: [*c]const u8, _ResultPath: [*c]u8, _SizeInBytes: usize) errno_t;
pub extern fn _splitpath_s(_FullPath: [*c]const u8, _Drive: [*c]u8, _DriveSize: usize, _Dir: [*c]u8, _DirSize: usize, _Filename: [*c]u8, _FilenameSize: usize, _Ext: [*c]u8, _ExtSize: usize) errno_t;
pub extern fn qsort_s(_Base: ?*anyopaque, _NumOfElements: usize, _SizeOfElements: usize, _PtFuncCompare: ?*const fn (?*anyopaque, ?*const anyopaque, ?*const anyopaque) callconv(.c) c_int, _Context: ?*anyopaque) void;
pub const struct__heapinfo = extern struct {
    _pentry: [*c]c_int = null,
    _size: usize = 0,
    _useflag: c_int = 0,
    pub const _heapwalk = __root._heapwalk;
    pub const heapwalk = __root._heapwalk;
};
pub const _HEAPINFO = struct__heapinfo;
pub extern fn __p__amblksiz() [*c]c_uint;
pub extern fn __mingw_aligned_malloc(_Size: usize, _Alignment: usize) ?*anyopaque;
pub extern fn __mingw_aligned_free(_Memory: ?*anyopaque) void;
pub extern fn __mingw_aligned_offset_realloc(_Memory: ?*anyopaque, _Size: usize, _Alignment: usize, _Offset: usize) ?*anyopaque;
pub extern fn __mingw_aligned_offset_malloc(usize, usize, usize) ?*anyopaque;
pub extern fn __mingw_aligned_realloc(_Memory: ?*anyopaque, _Size: usize, _Offset: usize) ?*anyopaque;
pub extern fn __mingw_aligned_msize(memblock: ?*anyopaque, alignment: usize, offset: usize) usize;
pub inline fn _mm_malloc(arg___size: usize, arg___align: usize) ?*anyopaque {
    var __size = arg___size;
    _ = &__size;
    var __align = arg___align;
    _ = &__align;
    if (__align == @as(usize, 1)) {
        return malloc(__size);
    }
    if (!((__align & (__align -% @as(usize, 1))) != 0) and (__align < @sizeOf(?*anyopaque))) {
        __align = @sizeOf(?*anyopaque);
    }
    var __mallocedMemory: ?*anyopaque = undefined;
    _ = &__mallocedMemory;
    __mallocedMemory = __mingw_aligned_malloc(__size, __align);
    return __mallocedMemory;
}
pub inline fn _mm_free(arg___p: ?*anyopaque) void {
    var __p = arg___p;
    _ = &__p;
    __mingw_aligned_free(__p);
}
pub extern fn _resetstkoflw() c_int;
pub extern fn _set_malloc_crt_max_wait(_NewValue: c_ulong) c_ulong;
pub extern fn _expand(_Memory: ?*anyopaque, _NewSize: usize) ?*anyopaque;
pub extern fn _msize(_Memory: ?*anyopaque) usize;
pub extern fn _get_sbh_threshold() usize;
pub extern fn _set_sbh_threshold(_NewValue: usize) c_int;
pub extern fn _set_amblksiz(_Value: usize) errno_t;
pub extern fn _get_amblksiz(_Value: [*c]usize) errno_t;
pub extern fn _heapadd(_Memory: ?*anyopaque, _Size: usize) c_int;
pub extern fn _heapchk() c_int;
pub extern fn _heapmin() c_int;
pub extern fn _heapset(_Fill: c_uint) c_int;
pub extern fn _heapwalk(_EntryInfo: [*c]_HEAPINFO) c_int;
pub extern fn _heapused(_Used: [*c]usize, _Commit: [*c]usize) usize;
pub extern fn _get_heap_handle() isize;
pub fn _MarkAllocaS(arg__Ptr: ?*anyopaque, arg__Marker: c_uint) callconv(.c) ?*anyopaque {
    var _Ptr = arg__Ptr;
    _ = &_Ptr;
    var _Marker = arg__Marker;
    _ = &_Marker;
    if (_Ptr != null) {
        @as([*c]c_uint, @ptrCast(@alignCast(_Ptr))).* = _Marker;
        _Ptr = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(_Ptr))) + @as(usize, @bitCast(@as(isize, @intCast(_ALLOCA_S_MARKER_SIZE))))));
    }
    return _Ptr;
}
pub fn _freea(arg__Memory: ?*anyopaque) callconv(.c) void {
    var _Memory = arg__Memory;
    _ = &_Memory;
    var _Marker: c_uint = undefined;
    _ = &_Marker;
    if (_Memory != null) {
        _Memory = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(_Memory))) - @as(usize, @bitCast(@as(isize, @intCast(_ALLOCA_S_MARKER_SIZE))))));
        _Marker = @as([*c]c_uint, @ptrCast(@alignCast(_Memory))).*;
        if (_Marker == @as(c_uint, _ALLOCA_S_HEAP_MARKER)) {
            free(_Memory);
        }
    }
}
pub const __newclmap: [*c]const u8 = @extern([*c]const u8, .{
    .name = "__newclmap",
});
pub const __newcumap: [*c]const u8 = @extern([*c]const u8, .{
    .name = "__newcumap",
});
pub extern var __ptlocinfo: pthreadlocinfo;
pub extern var __ptmbcinfo: pthreadmbcinfo;
pub extern var __globallocalestatus: c_int;
pub extern var __locale_changed: c_int;
pub extern var __initiallocinfo: struct_threadlocaleinfostruct;
pub extern var __initiallocalestructinfo: _locale_tstruct;
pub extern fn __updatetlocinfo() pthreadlocinfo;
pub extern fn __updatetmbcinfo() pthreadmbcinfo;
pub extern fn isalpha(_C: c_int) c_int;
pub extern fn isupper(_C: c_int) c_int;
pub extern fn islower(_C: c_int) c_int;
pub extern fn isdigit(_C: c_int) c_int;
pub extern fn isxdigit(_C: c_int) c_int;
pub extern fn isspace(_C: c_int) c_int;
pub extern fn ispunct(_C: c_int) c_int;
pub extern fn isalnum(_C: c_int) c_int;
pub extern fn isprint(_C: c_int) c_int;
pub extern fn isgraph(_C: c_int) c_int;
pub extern fn iscntrl(_C: c_int) c_int;
pub extern fn toupper(_C: c_int) c_int;
pub extern fn _toupper(_C: c_int) c_int;
pub extern fn tolower(_C: c_int) c_int;
pub extern fn _tolower(_C: c_int) c_int;
pub extern fn _tolower_l(_C: c_int, _Locale: _locale_t) c_int;
pub extern fn _isctype(_C: c_int, _Type: c_int) c_int;
pub extern fn isblank(_C: c_int) c_int;
pub extern fn _isalpha_l(_C: c_int, _Locale: _locale_t) c_int;
pub extern fn _isupper_l(_C: c_int, _Locale: _locale_t) c_int;
pub extern fn _islower_l(_C: c_int, _Locale: _locale_t) c_int;
pub extern fn _isdigit_l(_C: c_int, _Locale: _locale_t) c_int;
pub extern fn _isxdigit_l(_C: c_int, _Locale: _locale_t) c_int;
pub extern fn _isspace_l(_C: c_int, _Locale: _locale_t) c_int;
pub extern fn _ispunct_l(_C: c_int, _Locale: _locale_t) c_int;
pub extern fn _isalnum_l(_C: c_int, _Locale: _locale_t) c_int;
pub extern fn _isprint_l(_C: c_int, _Locale: _locale_t) c_int;
pub extern fn _isgraph_l(_C: c_int, _Locale: _locale_t) c_int;
pub extern fn _iscntrl_l(_C: c_int, _Locale: _locale_t) c_int;
pub extern fn _toupper_l(_C: c_int, _Locale: _locale_t) c_int;
pub extern fn _isctype_l(_C: c_int, _Type: c_int, _Locale: _locale_t) c_int;
pub extern fn _isblank_l(_C: c_int, _Locale: _locale_t) c_int;
pub extern fn __isascii(_C: c_int) c_int;
pub extern fn __toascii(_C: c_int) c_int;
pub extern fn __iscsymf(_C: c_int) c_int;
pub extern fn __iscsym(_C: c_int) c_int;
pub const Py_uintptr_t = usize;
pub const Py_intptr_t = isize;
pub const Py_ssize_t = Py_intptr_t;
pub const Py_hash_t = Py_ssize_t;
pub const Py_uhash_t = usize;
pub const Py_ssize_clean_t = Py_ssize_t;
pub extern fn PyMem_Malloc(size: usize) ?*anyopaque;
pub extern fn PyMem_Calloc(nelem: usize, elsize: usize) ?*anyopaque;
pub extern fn PyMem_Realloc(ptr: ?*anyopaque, new_size: usize) ?*anyopaque;
pub extern fn PyMem_Free(ptr: ?*anyopaque) void;
pub extern fn PyMem_RawMalloc(size: usize) ?*anyopaque;
pub extern fn PyMem_RawCalloc(nelem: usize, elsize: usize) ?*anyopaque;
pub extern fn PyMem_RawRealloc(ptr: ?*anyopaque, new_size: usize) ?*anyopaque;
pub extern fn PyMem_RawFree(ptr: ?*anyopaque) void;
pub const PYMEM_DOMAIN_RAW: c_int = 0;
pub const PYMEM_DOMAIN_MEM: c_int = 1;
pub const PYMEM_DOMAIN_OBJ: c_int = 2;
pub const PyMemAllocatorDomain = c_uint;
pub const PYMEM_ALLOCATOR_NOT_SET: c_int = 0;
pub const PYMEM_ALLOCATOR_DEFAULT: c_int = 1;
pub const PYMEM_ALLOCATOR_DEBUG: c_int = 2;
pub const PYMEM_ALLOCATOR_MALLOC: c_int = 3;
pub const PYMEM_ALLOCATOR_MALLOC_DEBUG: c_int = 4;
pub const PYMEM_ALLOCATOR_PYMALLOC: c_int = 5;
pub const PYMEM_ALLOCATOR_PYMALLOC_DEBUG: c_int = 6;
pub const PYMEM_ALLOCATOR_MIMALLOC: c_int = 7;
pub const PYMEM_ALLOCATOR_MIMALLOC_DEBUG: c_int = 8;
pub const PyMemAllocatorName = c_uint;
pub const PyMemAllocatorEx = extern struct {
    ctx: ?*anyopaque = null,
    malloc: ?*const fn (ctx: ?*anyopaque, size: usize) callconv(.c) ?*anyopaque = null,
    calloc: ?*const fn (ctx: ?*anyopaque, nelem: usize, elsize: usize) callconv(.c) ?*anyopaque = null,
    realloc: ?*const fn (ctx: ?*anyopaque, ptr: ?*anyopaque, new_size: usize) callconv(.c) ?*anyopaque = null,
    free: ?*const fn (ctx: ?*anyopaque, ptr: ?*anyopaque) callconv(.c) void = null,
};
pub extern fn PyMem_GetAllocator(domain: PyMemAllocatorDomain, allocator: [*c]PyMemAllocatorEx) void;
pub extern fn PyMem_SetAllocator(domain: PyMemAllocatorDomain, allocator: [*c]PyMemAllocatorEx) void;
pub extern fn PyMem_SetupDebugHooks() void;
const union_unnamed_3 = extern union {
    ob_refcnt: Py_ssize_t,
    ob_refcnt_split: [2]u32,
};
pub const destructor = ?*const fn ([*c]PyObject) callconv(.c) void;
pub const getattrfunc = ?*const fn ([*c]PyObject, [*c]u8) callconv(.c) [*c]PyObject;
pub const setattrfunc = ?*const fn ([*c]PyObject, [*c]u8, [*c]PyObject) callconv(.c) c_int;
pub const reprfunc = ?*const fn ([*c]PyObject) callconv(.c) [*c]PyObject;
pub const hashfunc = ?*const fn ([*c]PyObject) callconv(.c) Py_hash_t;
pub const ternaryfunc = ?*const fn ([*c]PyObject, [*c]PyObject, [*c]PyObject) callconv(.c) [*c]PyObject;
pub const getattrofunc = ?*const fn ([*c]PyObject, [*c]PyObject) callconv(.c) [*c]PyObject;
pub const setattrofunc = ?*const fn ([*c]PyObject, [*c]PyObject, [*c]PyObject) callconv(.c) c_int;
pub const visitproc = ?*const fn ([*c]PyObject, ?*anyopaque) callconv(.c) c_int;
pub const traverseproc = ?*const fn ([*c]PyObject, visitproc, ?*anyopaque) callconv(.c) c_int;
pub const inquiry = ?*const fn ([*c]PyObject) callconv(.c) c_int;
pub const richcmpfunc = ?*const fn ([*c]PyObject, [*c]PyObject, c_int) callconv(.c) [*c]PyObject;
pub const getiterfunc = ?*const fn ([*c]PyObject) callconv(.c) [*c]PyObject;
pub const iternextfunc = ?*const fn ([*c]PyObject) callconv(.c) [*c]PyObject;
pub const PyCFunction = ?*const fn ([*c]PyObject, [*c]PyObject) callconv(.c) [*c]PyObject;
pub const struct_PyMethodDef = extern struct {
    ml_name: [*c]const u8 = null,
    ml_meth: PyCFunction = null,
    ml_flags: c_int = 0,
    ml_doc: [*c]const u8 = null,
    pub const PyCFunction_New = __root.PyCFunction_New;
    pub const PyCFunction_NewEx = __root.PyCFunction_NewEx;
    pub const PyCMethod_New = __root.PyCMethod_New;
    pub const New = __root.PyCFunction_New;
    pub const NewEx = __root.PyCFunction_NewEx;
};
pub const PyMethodDef = struct_PyMethodDef;
pub const struct_PyMemberDef = extern struct {
    name: [*c]const u8 = null,
    type: c_int = 0,
    offset: Py_ssize_t = 0,
    flags: c_int = 0,
    doc: [*c]const u8 = null,
};
pub const PyMemberDef = struct_PyMemberDef;
pub const getter = ?*const fn ([*c]PyObject, ?*anyopaque) callconv(.c) [*c]PyObject;
pub const setter = ?*const fn ([*c]PyObject, [*c]PyObject, ?*anyopaque) callconv(.c) c_int;
pub const struct_PyGetSetDef = extern struct {
    name: [*c]const u8 = null,
    get: getter = null,
    set: setter = null,
    doc: [*c]const u8 = null,
    closure: ?*anyopaque = null,
};
pub const PyGetSetDef = struct_PyGetSetDef;
pub const descrgetfunc = ?*const fn ([*c]PyObject, [*c]PyObject, [*c]PyObject) callconv(.c) [*c]PyObject;
pub const descrsetfunc = ?*const fn ([*c]PyObject, [*c]PyObject, [*c]PyObject) callconv(.c) c_int;
pub const initproc = ?*const fn ([*c]PyObject, [*c]PyObject, [*c]PyObject) callconv(.c) c_int;
pub const allocfunc = ?*const fn ([*c]PyTypeObject, Py_ssize_t) callconv(.c) [*c]PyObject;
pub const newfunc = ?*const fn ([*c]PyTypeObject, [*c]PyObject, [*c]PyObject) callconv(.c) [*c]PyObject;
pub const freefunc = ?*const fn (?*anyopaque) callconv(.c) void;
pub const vectorcallfunc = ?*const fn (callable: [*c]PyObject, args: [*c]const [*c]PyObject, nargsf: usize, kwnames: [*c]PyObject) callconv(.c) [*c]PyObject;
pub const struct__typeobject = extern struct {
    ob_base: PyVarObject = @import("std").mem.zeroes(PyVarObject),
    tp_name: [*c]const u8 = null,
    tp_basicsize: Py_ssize_t = 0,
    tp_itemsize: Py_ssize_t = 0,
    tp_dealloc: destructor = null,
    tp_vectorcall_offset: Py_ssize_t = 0,
    tp_getattr: getattrfunc = null,
    tp_setattr: setattrfunc = null,
    tp_as_async: [*c]PyAsyncMethods = null,
    tp_repr: reprfunc = null,
    tp_as_number: [*c]PyNumberMethods = null,
    tp_as_sequence: [*c]PySequenceMethods = null,
    tp_as_mapping: [*c]PyMappingMethods = null,
    tp_hash: hashfunc = null,
    tp_call: ternaryfunc = null,
    tp_str: reprfunc = null,
    tp_getattro: getattrofunc = null,
    tp_setattro: setattrofunc = null,
    tp_as_buffer: [*c]PyBufferProcs = null,
    tp_flags: c_ulong = 0,
    tp_doc: [*c]const u8 = null,
    tp_traverse: traverseproc = null,
    tp_clear: inquiry = null,
    tp_richcompare: richcmpfunc = null,
    tp_weaklistoffset: Py_ssize_t = 0,
    tp_iter: getiterfunc = null,
    tp_iternext: iternextfunc = null,
    tp_methods: [*c]PyMethodDef = null,
    tp_members: [*c]PyMemberDef = null,
    tp_getset: [*c]PyGetSetDef = null,
    tp_base: [*c]PyTypeObject = null,
    tp_dict: [*c]PyObject = null,
    tp_descr_get: descrgetfunc = null,
    tp_descr_set: descrsetfunc = null,
    tp_dictoffset: Py_ssize_t = 0,
    tp_init: initproc = null,
    tp_alloc: allocfunc = null,
    tp_new: newfunc = null,
    tp_free: freefunc = null,
    tp_is_gc: inquiry = null,
    tp_bases: [*c]PyObject = null,
    tp_mro: [*c]PyObject = null,
    tp_cache: [*c]PyObject = null,
    tp_subclasses: ?*anyopaque = null,
    tp_weaklist: [*c]PyObject = null,
    tp_del: destructor = null,
    tp_version_tag: c_uint = 0,
    tp_finalize: destructor = null,
    tp_vectorcall: vectorcallfunc = null,
    tp_watched: u8 = 0,
    tp_versions_used: u16 = 0,
    pub const PyType_GetSlot = __root.PyType_GetSlot;
    pub const PyType_GetModule = __root.PyType_GetModule;
    pub const PyType_GetModuleState = __root.PyType_GetModuleState;
    pub const PyType_GetName = __root.PyType_GetName;
    pub const PyType_GetQualName = __root.PyType_GetQualName;
    pub const PyType_GetFullyQualifiedName = __root.PyType_GetFullyQualifiedName;
    pub const PyType_GetModuleName = __root.PyType_GetModuleName;
    pub const PyType_FromMetaclass = __root.PyType_FromMetaclass;
    pub const PyType_GetTypeDataSize = __root.PyType_GetTypeDataSize;
    pub const PyType_IsSubtype = __root.PyType_IsSubtype;
    pub const PyType_GetFlags = __root.PyType_GetFlags;
    pub const PyType_Ready = __root.PyType_Ready;
    pub const PyType_GenericAlloc = __root.PyType_GenericAlloc;
    pub const PyType_GenericNew = __root.PyType_GenericNew;
    pub const PyType_Modified = __root.PyType_Modified;
    pub const _PyType_Name = __root._PyType_Name;
    pub const _PyType_Lookup = __root._PyType_Lookup;
    pub const _PyType_LookupRef = __root._PyType_LookupRef;
    pub const PyType_GetDict = __root.PyType_GetDict;
    pub const PyUnstable_Type_AssignVersionTag = __root.PyUnstable_Type_AssignVersionTag;
    pub const PyType_HasFeature = __root.PyType_HasFeature;
    pub const PyType_GetModuleByDef = __root.PyType_GetModuleByDef;
    pub const _PyObject_New = __root._PyObject_New;
    pub const _PyObject_NewVar = __root._PyObject_NewVar;
    pub const _PyObject_GC_New = __root._PyObject_GC_New;
    pub const _PyObject_GC_NewVar = __root._PyObject_GC_NewVar;
    pub const _PyObject_SIZE = __root._PyObject_SIZE;
    pub const _PyObject_VAR_SIZE = __root._PyObject_VAR_SIZE;
    pub const PyType_SUPPORTS_WEAKREFS = __root.PyType_SUPPORTS_WEAKREFS;
    pub const PyUnstable_Object_GC_NewWithExtraData = __root.PyUnstable_Object_GC_NewWithExtraData;
    pub const PyDescr_NewMethod = __root.PyDescr_NewMethod;
    pub const PyDescr_NewClassMethod = __root.PyDescr_NewClassMethod;
    pub const PyDescr_NewMember = __root.PyDescr_NewMember;
    pub const PyDescr_NewGetSet = __root.PyDescr_NewGetSet;
    pub const PyDescr_NewWrapper = __root.PyDescr_NewWrapper;
    pub const PyStructSequence_InitType = __root.PyStructSequence_InitType;
    pub const PyStructSequence_InitType2 = __root.PyStructSequence_InitType2;
    pub const PyStructSequence_New = __root.PyStructSequence_New;
    pub const GetSlot = __root.PyType_GetSlot;
    pub const GetModule = __root.PyType_GetModule;
    pub const GetModuleState = __root.PyType_GetModuleState;
    pub const GetName = __root.PyType_GetName;
    pub const GetQualName = __root.PyType_GetQualName;
    pub const GetFullyQualifiedName = __root.PyType_GetFullyQualifiedName;
    pub const GetModuleName = __root.PyType_GetModuleName;
    pub const FromMetaclass = __root.PyType_FromMetaclass;
    pub const GetTypeDataSize = __root.PyType_GetTypeDataSize;
    pub const IsSubtype = __root.PyType_IsSubtype;
    pub const GetFlags = __root.PyType_GetFlags;
    pub const Ready = __root.PyType_Ready;
    pub const GenericAlloc = __root.PyType_GenericAlloc;
    pub const GenericNew = __root.PyType_GenericNew;
    pub const Modified = __root.PyType_Modified;
    pub const Name = __root._PyType_Name;
    pub const Lookup = __root._PyType_Lookup;
    pub const LookupRef = __root._PyType_LookupRef;
    pub const GetDict = __root.PyType_GetDict;
    pub const AssignVersionTag = __root.PyUnstable_Type_AssignVersionTag;
    pub const HasFeature = __root.PyType_HasFeature;
    pub const GetModuleByDef = __root.PyType_GetModuleByDef;
    pub const New = __root._PyObject_New;
    pub const NewVar = __root._PyObject_NewVar;
    pub const SIZE = __root._PyObject_SIZE;
    pub const WEAKREFS = __root.PyType_SUPPORTS_WEAKREFS;
    pub const NewWithExtraData = __root.PyUnstable_Object_GC_NewWithExtraData;
    pub const NewMethod = __root.PyDescr_NewMethod;
    pub const NewClassMethod = __root.PyDescr_NewClassMethod;
    pub const NewMember = __root.PyDescr_NewMember;
    pub const NewGetSet = __root.PyDescr_NewGetSet;
    pub const NewWrapper = __root.PyDescr_NewWrapper;
    pub const InitType = __root.PyStructSequence_InitType;
    pub const InitType2 = __root.PyStructSequence_InitType2;
};
pub const PyTypeObject = struct__typeobject;
pub const struct__object = extern struct {
    unnamed_0: union_unnamed_3 = @import("std").mem.zeroes(union_unnamed_3),
    ob_type: [*c]PyTypeObject = null,
    pub const PyObject_CheckBuffer = __root.PyObject_CheckBuffer;
    pub const PyObject_GetBuffer = __root.PyObject_GetBuffer;
    pub const PyObject_CopyData = __root.PyObject_CopyData;
    pub const Py_Is = __root.Py_Is;
    pub const Py_REFCNT = __root.Py_REFCNT;
    pub const Py_TYPE = __root.Py_TYPE;
    pub const Py_SIZE = __root.Py_SIZE;
    pub const _Py_IsImmortal = __root._Py_IsImmortal;
    pub const Py_IS_TYPE = __root.Py_IS_TYPE;
    pub const _Py_SetRefcnt = __root._Py_SetRefcnt;
    pub const Py_SET_REFCNT = __root.Py_SET_REFCNT;
    pub const Py_SET_TYPE = __root.Py_SET_TYPE;
    pub const PyType_FromModuleAndSpec = __root.PyType_FromModuleAndSpec;
    pub const PyObject_GetTypeData = __root.PyObject_GetTypeData;
    pub const PyObject_TypeCheck = __root.PyObject_TypeCheck;
    pub const PyObject_Repr = __root.PyObject_Repr;
    pub const PyObject_Str = __root.PyObject_Str;
    pub const PyObject_ASCII = __root.PyObject_ASCII;
    pub const PyObject_Bytes = __root.PyObject_Bytes;
    pub const PyObject_RichCompare = __root.PyObject_RichCompare;
    pub const PyObject_RichCompareBool = __root.PyObject_RichCompareBool;
    pub const PyObject_GetAttrString = __root.PyObject_GetAttrString;
    pub const PyObject_SetAttrString = __root.PyObject_SetAttrString;
    pub const PyObject_DelAttrString = __root.PyObject_DelAttrString;
    pub const PyObject_HasAttrString = __root.PyObject_HasAttrString;
    pub const PyObject_GetAttr = __root.PyObject_GetAttr;
    pub const PyObject_GetOptionalAttr = __root.PyObject_GetOptionalAttr;
    pub const PyObject_GetOptionalAttrString = __root.PyObject_GetOptionalAttrString;
    pub const PyObject_SetAttr = __root.PyObject_SetAttr;
    pub const PyObject_DelAttr = __root.PyObject_DelAttr;
    pub const PyObject_HasAttr = __root.PyObject_HasAttr;
    pub const PyObject_HasAttrWithError = __root.PyObject_HasAttrWithError;
    pub const PyObject_HasAttrStringWithError = __root.PyObject_HasAttrStringWithError;
    pub const PyObject_SelfIter = __root.PyObject_SelfIter;
    pub const PyObject_GenericGetAttr = __root.PyObject_GenericGetAttr;
    pub const PyObject_GenericSetAttr = __root.PyObject_GenericSetAttr;
    pub const PyObject_GenericSetDict = __root.PyObject_GenericSetDict;
    pub const PyObject_Hash = __root.PyObject_Hash;
    pub const PyObject_HashNotImplemented = __root.PyObject_HashNotImplemented;
    pub const PyObject_IsTrue = __root.PyObject_IsTrue;
    pub const PyObject_Not = __root.PyObject_Not;
    pub const PyCallable_Check = __root.PyCallable_Check;
    pub const PyObject_ClearWeakRefs = __root.PyObject_ClearWeakRefs;
    pub const PyObject_Dir = __root.PyObject_Dir;
    pub const Py_ReprEnter = __root.Py_ReprEnter;
    pub const Py_ReprLeave = __root.Py_ReprLeave;
    pub const _Py_Dealloc = __root._Py_Dealloc;
    pub const Py_IncRef = __root.Py_IncRef;
    pub const Py_DecRef = __root.Py_DecRef;
    pub const _Py_IncRef = __root._Py_IncRef;
    pub const _Py_DecRef = __root._Py_DecRef;
    pub const Py_INCREF = __root.Py_INCREF;
    pub const Py_DECREF = __root.Py_DECREF;
    pub const Py_XINCREF = __root.Py_XINCREF;
    pub const Py_XDECREF = __root.Py_XDECREF;
    pub const Py_NewRef = __root.Py_NewRef;
    pub const Py_XNewRef = __root.Py_XNewRef;
    pub const _Py_NewRef = __root._Py_NewRef;
    pub const _Py_XNewRef = __root._Py_XNewRef;
    pub const Py_IsNone = __root.Py_IsNone;
    pub const _Py_NewReference = __root._Py_NewReference;
    pub const _Py_NewReferenceNoTotal = __root._Py_NewReferenceNoTotal;
    pub const _Py_ResurrectReference = __root._Py_ResurrectReference;
    pub const PyObject_Print = __root.PyObject_Print;
    pub const _PyObject_Dump = __root._PyObject_Dump;
    pub const _PyObject_GetAttrId = __root._PyObject_GetAttrId;
    pub const _PyObject_GetDictPtr = __root._PyObject_GetDictPtr;
    pub const PyObject_CallFinalizer = __root.PyObject_CallFinalizer;
    pub const PyObject_CallFinalizerFromDealloc = __root.PyObject_CallFinalizerFromDealloc;
    pub const PyUnstable_Object_ClearWeakRefsNoCallbacks = __root.PyUnstable_Object_ClearWeakRefsNoCallbacks;
    pub const _PyObject_GenericGetAttrWithDict = __root._PyObject_GenericGetAttrWithDict;
    pub const _PyObject_GenericSetAttrWithDict = __root._PyObject_GenericSetAttrWithDict;
    pub const _PyObject_FunctionStr = __root._PyObject_FunctionStr;
    pub const _PyObject_AssertFailed = __root._PyObject_AssertFailed;
    pub const PyObject_GetItemData = __root.PyObject_GetItemData;
    pub const PyObject_VisitManagedDict = __root.PyObject_VisitManagedDict;
    pub const _PyObject_SetManagedDict = __root._PyObject_SetManagedDict;
    pub const PyObject_ClearManagedDict = __root.PyObject_ClearManagedDict;
    pub const PyType_Check = __root.PyType_Check;
    pub const PyType_CheckExact = __root.PyType_CheckExact;
    pub const PyObject_Init = __root.PyObject_Init;
    pub const PyObject_GC_IsTracked = __root.PyObject_GC_IsTracked;
    pub const PyObject_GC_IsFinalized = __root.PyObject_GC_IsFinalized;
    pub const PyObject_IS_GC = __root.PyObject_IS_GC;
    pub const PyObject_GET_WEAKREFS_LISTPTR = __root.PyObject_GET_WEAKREFS_LISTPTR;
    pub const _Py_HashDouble = __root._Py_HashDouble;
    pub const PyObject_GenericHash = __root.PyObject_GenericHash;
    pub const PyByteArray_FromObject = __root.PyByteArray_FromObject;
    pub const PyByteArray_Concat = __root.PyByteArray_Concat;
    pub const PyByteArray_Size = __root.PyByteArray_Size;
    pub const PyByteArray_AsString = __root.PyByteArray_AsString;
    pub const PyByteArray_Resize = __root.PyByteArray_Resize;
    pub const PyByteArray_AS_STRING = __root.PyByteArray_AS_STRING;
    pub const PyByteArray_GET_SIZE = __root.PyByteArray_GET_SIZE;
    pub const PyBytes_FromObject = __root.PyBytes_FromObject;
    pub const PyBytes_Size = __root.PyBytes_Size;
    pub const PyBytes_AsString = __root.PyBytes_AsString;
    pub const PyBytes_Repr = __root.PyBytes_Repr;
    pub const PyBytes_AsStringAndSize = __root.PyBytes_AsStringAndSize;
    pub const PyBytes_AS_STRING = __root.PyBytes_AS_STRING;
    pub const PyBytes_GET_SIZE = __root.PyBytes_GET_SIZE;
    pub const _PyBytes_Join = __root._PyBytes_Join;
    pub const PyUnicode_Substring = __root.PyUnicode_Substring;
    pub const PyUnicode_AsUCS4 = __root.PyUnicode_AsUCS4;
    pub const PyUnicode_AsUCS4Copy = __root.PyUnicode_AsUCS4Copy;
    pub const PyUnicode_GetLength = __root.PyUnicode_GetLength;
    pub const PyUnicode_ReadChar = __root.PyUnicode_ReadChar;
    pub const PyUnicode_WriteChar = __root.PyUnicode_WriteChar;
    pub const PyUnicode_FromEncodedObject = __root.PyUnicode_FromEncodedObject;
    pub const PyUnicode_FromObject = __root.PyUnicode_FromObject;
    pub const PyUnicode_AsWideChar = __root.PyUnicode_AsWideChar;
    pub const PyUnicode_AsWideCharString = __root.PyUnicode_AsWideCharString;
    pub const PyUnicode_AsDecodedObject = __root.PyUnicode_AsDecodedObject;
    pub const PyUnicode_AsDecodedUnicode = __root.PyUnicode_AsDecodedUnicode;
    pub const PyUnicode_AsEncodedObject = __root.PyUnicode_AsEncodedObject;
    pub const PyUnicode_AsEncodedString = __root.PyUnicode_AsEncodedString;
    pub const PyUnicode_AsEncodedUnicode = __root.PyUnicode_AsEncodedUnicode;
    pub const PyUnicode_BuildEncodingMap = __root.PyUnicode_BuildEncodingMap;
    pub const PyUnicode_AsUTF8String = __root.PyUnicode_AsUTF8String;
    pub const PyUnicode_AsUTF8AndSize = __root.PyUnicode_AsUTF8AndSize;
    pub const PyUnicode_AsUTF32String = __root.PyUnicode_AsUTF32String;
    pub const PyUnicode_AsUTF16String = __root.PyUnicode_AsUTF16String;
    pub const PyUnicode_AsUnicodeEscapeString = __root.PyUnicode_AsUnicodeEscapeString;
    pub const PyUnicode_AsRawUnicodeEscapeString = __root.PyUnicode_AsRawUnicodeEscapeString;
    pub const PyUnicode_AsLatin1String = __root.PyUnicode_AsLatin1String;
    pub const PyUnicode_AsASCIIString = __root.PyUnicode_AsASCIIString;
    pub const PyUnicode_AsCharmapString = __root.PyUnicode_AsCharmapString;
    pub const PyUnicode_AsMBCSString = __root.PyUnicode_AsMBCSString;
    pub const PyUnicode_EncodeLocale = __root.PyUnicode_EncodeLocale;
    pub const PyUnicode_FSConverter = __root.PyUnicode_FSConverter;
    pub const PyUnicode_FSDecoder = __root.PyUnicode_FSDecoder;
    pub const PyUnicode_EncodeFSDefault = __root.PyUnicode_EncodeFSDefault;
    pub const PyUnicode_Concat = __root.PyUnicode_Concat;
    pub const PyUnicode_Split = __root.PyUnicode_Split;
    pub const PyUnicode_Splitlines = __root.PyUnicode_Splitlines;
    pub const PyUnicode_Partition = __root.PyUnicode_Partition;
    pub const PyUnicode_RPartition = __root.PyUnicode_RPartition;
    pub const PyUnicode_RSplit = __root.PyUnicode_RSplit;
    pub const PyUnicode_Translate = __root.PyUnicode_Translate;
    pub const PyUnicode_Join = __root.PyUnicode_Join;
    pub const PyUnicode_Tailmatch = __root.PyUnicode_Tailmatch;
    pub const PyUnicode_Find = __root.PyUnicode_Find;
    pub const PyUnicode_FindChar = __root.PyUnicode_FindChar;
    pub const PyUnicode_Count = __root.PyUnicode_Count;
    pub const PyUnicode_Replace = __root.PyUnicode_Replace;
    pub const PyUnicode_Compare = __root.PyUnicode_Compare;
    pub const PyUnicode_CompareWithASCIIString = __root.PyUnicode_CompareWithASCIIString;
    pub const PyUnicode_EqualToUTF8 = __root.PyUnicode_EqualToUTF8;
    pub const PyUnicode_EqualToUTF8AndSize = __root.PyUnicode_EqualToUTF8AndSize;
    pub const PyUnicode_RichCompare = __root.PyUnicode_RichCompare;
    pub const PyUnicode_Format = __root.PyUnicode_Format;
    pub const PyUnicode_Contains = __root.PyUnicode_Contains;
    pub const PyUnicode_IsIdentifier = __root.PyUnicode_IsIdentifier;
    pub const PyUnicode_IS_READY = __root.PyUnicode_IS_READY;
    pub const _PyUnicode_COMPACT_DATA = __root._PyUnicode_COMPACT_DATA;
    pub const PyUnicode_DATA = __root.PyUnicode_DATA;
    pub const PyUnicode_READY = __root.PyUnicode_READY;
    pub const PyUnicode_CopyCharacters = __root.PyUnicode_CopyCharacters;
    pub const PyUnicode_Fill = __root.PyUnicode_Fill;
    pub const PyUnicode_AsUTF8 = __root.PyUnicode_AsUTF8;
    pub const PyErr_SetNone = __root.PyErr_SetNone;
    pub const PyErr_SetObject = __root.PyErr_SetObject;
    pub const PyErr_SetString = __root.PyErr_SetString;
    pub const PyErr_Restore = __root.PyErr_Restore;
    pub const PyErr_SetRaisedException = __root.PyErr_SetRaisedException;
    pub const PyErr_SetHandledException = __root.PyErr_SetHandledException;
    pub const PyErr_SetExcInfo = __root.PyErr_SetExcInfo;
    pub const PyErr_GivenExceptionMatches = __root.PyErr_GivenExceptionMatches;
    pub const PyErr_ExceptionMatches = __root.PyErr_ExceptionMatches;
    pub const PyException_SetTraceback = __root.PyException_SetTraceback;
    pub const PyException_GetTraceback = __root.PyException_GetTraceback;
    pub const PyException_GetCause = __root.PyException_GetCause;
    pub const PyException_SetCause = __root.PyException_SetCause;
    pub const PyException_GetContext = __root.PyException_GetContext;
    pub const PyException_SetContext = __root.PyException_SetContext;
    pub const PyException_GetArgs = __root.PyException_GetArgs;
    pub const PyException_SetArgs = __root.PyException_SetArgs;
    pub const PyExceptionClass_Name = __root.PyExceptionClass_Name;
    pub const PyErr_SetFromErrno = __root.PyErr_SetFromErrno;
    pub const PyErr_SetFromErrnoWithFilenameObject = __root.PyErr_SetFromErrnoWithFilenameObject;
    pub const PyErr_SetFromErrnoWithFilenameObjects = __root.PyErr_SetFromErrnoWithFilenameObjects;
    pub const PyErr_SetFromErrnoWithFilename = __root.PyErr_SetFromErrnoWithFilename;
    pub const PyErr_Format = __root.PyErr_Format;
    pub const PyErr_FormatV = __root.PyErr_FormatV;
    pub const PyErr_SetExcFromWindowsErrWithFilenameObject = __root.PyErr_SetExcFromWindowsErrWithFilenameObject;
    pub const PyErr_SetExcFromWindowsErrWithFilenameObjects = __root.PyErr_SetExcFromWindowsErrWithFilenameObjects;
    pub const PyErr_SetExcFromWindowsErrWithFilename = __root.PyErr_SetExcFromWindowsErrWithFilename;
    pub const PyErr_SetExcFromWindowsErr = __root.PyErr_SetExcFromWindowsErr;
    pub const PyErr_SetImportErrorSubclass = __root.PyErr_SetImportErrorSubclass;
    pub const PyErr_SetImportError = __root.PyErr_SetImportError;
    pub const PyErr_WriteUnraisable = __root.PyErr_WriteUnraisable;
    pub const PyUnicodeEncodeError_GetEncoding = __root.PyUnicodeEncodeError_GetEncoding;
    pub const PyUnicodeDecodeError_GetEncoding = __root.PyUnicodeDecodeError_GetEncoding;
    pub const PyUnicodeEncodeError_GetObject = __root.PyUnicodeEncodeError_GetObject;
    pub const PyUnicodeDecodeError_GetObject = __root.PyUnicodeDecodeError_GetObject;
    pub const PyUnicodeTranslateError_GetObject = __root.PyUnicodeTranslateError_GetObject;
    pub const PyUnicodeEncodeError_GetStart = __root.PyUnicodeEncodeError_GetStart;
    pub const PyUnicodeDecodeError_GetStart = __root.PyUnicodeDecodeError_GetStart;
    pub const PyUnicodeTranslateError_GetStart = __root.PyUnicodeTranslateError_GetStart;
    pub const PyUnicodeEncodeError_SetStart = __root.PyUnicodeEncodeError_SetStart;
    pub const PyUnicodeDecodeError_SetStart = __root.PyUnicodeDecodeError_SetStart;
    pub const PyUnicodeTranslateError_SetStart = __root.PyUnicodeTranslateError_SetStart;
    pub const PyUnicodeEncodeError_GetEnd = __root.PyUnicodeEncodeError_GetEnd;
    pub const PyUnicodeDecodeError_GetEnd = __root.PyUnicodeDecodeError_GetEnd;
    pub const PyUnicodeTranslateError_GetEnd = __root.PyUnicodeTranslateError_GetEnd;
    pub const PyUnicodeEncodeError_SetEnd = __root.PyUnicodeEncodeError_SetEnd;
    pub const PyUnicodeDecodeError_SetEnd = __root.PyUnicodeDecodeError_SetEnd;
    pub const PyUnicodeTranslateError_SetEnd = __root.PyUnicodeTranslateError_SetEnd;
    pub const PyUnicodeEncodeError_GetReason = __root.PyUnicodeEncodeError_GetReason;
    pub const PyUnicodeDecodeError_GetReason = __root.PyUnicodeDecodeError_GetReason;
    pub const PyUnicodeTranslateError_GetReason = __root.PyUnicodeTranslateError_GetReason;
    pub const PyUnicodeEncodeError_SetReason = __root.PyUnicodeEncodeError_SetReason;
    pub const PyUnicodeDecodeError_SetReason = __root.PyUnicodeDecodeError_SetReason;
    pub const PyUnicodeTranslateError_SetReason = __root.PyUnicodeTranslateError_SetReason;
    pub const _PyErr_ChainExceptions1 = __root._PyErr_ChainExceptions1;
    pub const PyUnstable_Exc_PrepReraiseStar = __root.PyUnstable_Exc_PrepReraiseStar;
    pub const PyErr_SyntaxLocationObject = __root.PyErr_SyntaxLocationObject;
    pub const PyErr_RangedSyntaxLocationObject = __root.PyErr_RangedSyntaxLocationObject;
    pub const PyErr_ProgramTextObject = __root.PyErr_ProgramTextObject;
    pub const PyLong_AsLong = __root.PyLong_AsLong;
    pub const PyLong_AsLongAndOverflow = __root.PyLong_AsLongAndOverflow;
    pub const PyLong_AsSsize_t = __root.PyLong_AsSsize_t;
    pub const PyLong_AsSize_t = __root.PyLong_AsSize_t;
    pub const PyLong_AsUnsignedLong = __root.PyLong_AsUnsignedLong;
    pub const PyLong_AsUnsignedLongMask = __root.PyLong_AsUnsignedLongMask;
    pub const PyLong_AsInt = __root.PyLong_AsInt;
    pub const PyLong_AsDouble = __root.PyLong_AsDouble;
    pub const PyLong_AsVoidPtr = __root.PyLong_AsVoidPtr;
    pub const PyLong_AsLongLong = __root.PyLong_AsLongLong;
    pub const PyLong_AsUnsignedLongLong = __root.PyLong_AsUnsignedLongLong;
    pub const PyLong_AsUnsignedLongLongMask = __root.PyLong_AsUnsignedLongLongMask;
    pub const PyLong_AsLongLongAndOverflow = __root.PyLong_AsLongLongAndOverflow;
    pub const PyLong_FromUnicodeObject = __root.PyLong_FromUnicodeObject;
    pub const PyLong_AsNativeBytes = __root.PyLong_AsNativeBytes;
    pub const _PyLong_Sign = __root._PyLong_Sign;
    pub const _PyLong_NumBits = __root._PyLong_NumBits;
    pub const _PyLong_GCD = __root._PyLong_GCD;
    pub const Py_IsTrue = __root.Py_IsTrue;
    pub const Py_IsFalse = __root.Py_IsFalse;
    pub const PyFloat_FromString = __root.PyFloat_FromString;
    pub const PyFloat_AsDouble = __root.PyFloat_AsDouble;
    pub const PyFloat_AS_DOUBLE = __root.PyFloat_AS_DOUBLE;
    pub const PyComplex_RealAsDouble = __root.PyComplex_RealAsDouble;
    pub const PyComplex_ImagAsDouble = __root.PyComplex_ImagAsDouble;
    pub const PyComplex_AsCComplex = __root.PyComplex_AsCComplex;
    pub const PyMemoryView_FromObject = __root.PyMemoryView_FromObject;
    pub const PyMemoryView_GetContiguous = __root.PyMemoryView_GetContiguous;
    pub const PyMemoryView_GET_BUFFER = __root.PyMemoryView_GET_BUFFER;
    pub const PyMemoryView_GET_BASE = __root.PyMemoryView_GET_BASE;
    pub const PyTuple_Size = __root.PyTuple_Size;
    pub const PyTuple_GetItem = __root.PyTuple_GetItem;
    pub const PyTuple_SetItem = __root.PyTuple_SetItem;
    pub const PyTuple_GetSlice = __root.PyTuple_GetSlice;
    pub const PyTuple_GET_SIZE = __root.PyTuple_GET_SIZE;
    pub const PyTuple_SET_ITEM = __root.PyTuple_SET_ITEM;
    pub const PyList_Size = __root.PyList_Size;
    pub const PyList_GetItem = __root.PyList_GetItem;
    pub const PyList_GetItemRef = __root.PyList_GetItemRef;
    pub const PyList_SetItem = __root.PyList_SetItem;
    pub const PyList_Insert = __root.PyList_Insert;
    pub const PyList_Append = __root.PyList_Append;
    pub const PyList_GetSlice = __root.PyList_GetSlice;
    pub const PyList_SetSlice = __root.PyList_SetSlice;
    pub const PyList_Sort = __root.PyList_Sort;
    pub const PyList_Reverse = __root.PyList_Reverse;
    pub const PyList_AsTuple = __root.PyList_AsTuple;
    pub const PyList_GET_SIZE = __root.PyList_GET_SIZE;
    pub const PyList_SET_ITEM = __root.PyList_SET_ITEM;
    pub const PyList_Extend = __root.PyList_Extend;
    pub const PyList_Clear = __root.PyList_Clear;
    pub const PyDict_GetItem = __root.PyDict_GetItem;
    pub const PyDict_GetItemWithError = __root.PyDict_GetItemWithError;
    pub const PyDict_SetItem = __root.PyDict_SetItem;
    pub const PyDict_DelItem = __root.PyDict_DelItem;
    pub const PyDict_Clear = __root.PyDict_Clear;
    pub const PyDict_Next = __root.PyDict_Next;
    pub const PyDict_Keys = __root.PyDict_Keys;
    pub const PyDict_Values = __root.PyDict_Values;
    pub const PyDict_Items = __root.PyDict_Items;
    pub const PyDict_Size = __root.PyDict_Size;
    pub const PyDict_Copy = __root.PyDict_Copy;
    pub const PyDict_Contains = __root.PyDict_Contains;
    pub const PyDict_Update = __root.PyDict_Update;
    pub const PyDict_Merge = __root.PyDict_Merge;
    pub const PyDict_MergeFromSeq2 = __root.PyDict_MergeFromSeq2;
    pub const PyDict_GetItemString = __root.PyDict_GetItemString;
    pub const PyDict_SetItemString = __root.PyDict_SetItemString;
    pub const PyDict_DelItemString = __root.PyDict_DelItemString;
    pub const PyDict_GetItemRef = __root.PyDict_GetItemRef;
    pub const PyDict_GetItemStringRef = __root.PyDict_GetItemStringRef;
    pub const PyObject_GenericGetDict = __root.PyObject_GenericGetDict;
    pub const _PyDict_GetItem_KnownHash = __root._PyDict_GetItem_KnownHash;
    pub const _PyDict_GetItemStringWithError = __root._PyDict_GetItemStringWithError;
    pub const PyDict_SetDefault = __root.PyDict_SetDefault;
    pub const PyDict_SetDefaultRef = __root.PyDict_SetDefaultRef;
    pub const PyDict_GET_SIZE = __root.PyDict_GET_SIZE;
    pub const PyDict_ContainsString = __root.PyDict_ContainsString;
    pub const PyDict_Pop = __root.PyDict_Pop;
    pub const PyDict_PopString = __root.PyDict_PopString;
    pub const _PyDict_Pop = __root._PyDict_Pop;
    pub const PyODict_SetItem = __root.PyODict_SetItem;
    pub const PyODict_DelItem = __root.PyODict_DelItem;
    pub const PySet_New = __root.PySet_New;
    pub const PyFrozenSet_New = __root.PyFrozenSet_New;
    pub const PySet_Add = __root.PySet_Add;
    pub const PySet_Clear = __root.PySet_Clear;
    pub const PySet_Contains = __root.PySet_Contains;
    pub const PySet_Discard = __root.PySet_Discard;
    pub const PySet_Pop = __root.PySet_Pop;
    pub const PySet_Size = __root.PySet_Size;
    pub const PySet_GET_SIZE = __root.PySet_GET_SIZE;
    pub const PyCFunction_GetFunction = __root.PyCFunction_GetFunction;
    pub const PyCFunction_GetSelf = __root.PyCFunction_GetSelf;
    pub const PyCFunction_GetFlags = __root.PyCFunction_GetFlags;
    pub const PyCFunction_GET_FUNCTION = __root.PyCFunction_GET_FUNCTION;
    pub const PyCFunction_GET_SELF = __root.PyCFunction_GET_SELF;
    pub const PyCFunction_GET_FLAGS = __root.PyCFunction_GET_FLAGS;
    pub const PyCFunction_GET_CLASS = __root.PyCFunction_GET_CLASS;
    pub const PyModule_NewObject = __root.PyModule_NewObject;
    pub const PyModule_GetDict = __root.PyModule_GetDict;
    pub const PyModule_GetNameObject = __root.PyModule_GetNameObject;
    pub const PyModule_GetName = __root.PyModule_GetName;
    pub const PyModule_GetFilename = __root.PyModule_GetFilename;
    pub const PyModule_GetFilenameObject = __root.PyModule_GetFilenameObject;
    pub const PyModule_GetDef = __root.PyModule_GetDef;
    pub const PyModule_GetState = __root.PyModule_GetState;
    pub const PyFunction_New = __root.PyFunction_New;
    pub const PyFunction_NewWithQualName = __root.PyFunction_NewWithQualName;
    pub const PyFunction_GetCode = __root.PyFunction_GetCode;
    pub const PyFunction_GetGlobals = __root.PyFunction_GetGlobals;
    pub const PyFunction_GetModule = __root.PyFunction_GetModule;
    pub const PyFunction_GetDefaults = __root.PyFunction_GetDefaults;
    pub const PyFunction_SetDefaults = __root.PyFunction_SetDefaults;
    pub const PyFunction_GetKwDefaults = __root.PyFunction_GetKwDefaults;
    pub const PyFunction_SetKwDefaults = __root.PyFunction_SetKwDefaults;
    pub const PyFunction_GetClosure = __root.PyFunction_GetClosure;
    pub const PyFunction_SetClosure = __root.PyFunction_SetClosure;
    pub const PyFunction_GetAnnotations = __root.PyFunction_GetAnnotations;
    pub const PyFunction_SetAnnotations = __root.PyFunction_SetAnnotations;
    pub const PyFunction_GET_CODE = __root.PyFunction_GET_CODE;
    pub const PyFunction_GET_GLOBALS = __root.PyFunction_GET_GLOBALS;
    pub const PyFunction_GET_MODULE = __root.PyFunction_GET_MODULE;
    pub const PyFunction_GET_DEFAULTS = __root.PyFunction_GET_DEFAULTS;
    pub const PyFunction_GET_KW_DEFAULTS = __root.PyFunction_GET_KW_DEFAULTS;
    pub const PyFunction_GET_CLOSURE = __root.PyFunction_GET_CLOSURE;
    pub const PyFunction_GET_ANNOTATIONS = __root.PyFunction_GET_ANNOTATIONS;
    pub const PyClassMethod_New = __root.PyClassMethod_New;
    pub const PyStaticMethod_New = __root.PyStaticMethod_New;
    pub const PyMethod_New = __root.PyMethod_New;
    pub const PyMethod_Function = __root.PyMethod_Function;
    pub const PyMethod_Self = __root.PyMethod_Self;
    pub const PyMethod_GET_FUNCTION = __root.PyMethod_GET_FUNCTION;
    pub const PyMethod_GET_SELF = __root.PyMethod_GET_SELF;
    pub const PyInstanceMethod_New = __root.PyInstanceMethod_New;
    pub const PyInstanceMethod_Function = __root.PyInstanceMethod_Function;
    pub const PyInstanceMethod_GET_FUNCTION = __root.PyInstanceMethod_GET_FUNCTION;
    pub const PyFile_GetLine = __root.PyFile_GetLine;
    pub const PyFile_WriteObject = __root.PyFile_WriteObject;
    pub const PyObject_AsFileDescriptor = __root.PyObject_AsFileDescriptor;
    pub const PyFile_OpenCodeObject = __root.PyFile_OpenCodeObject;
    pub const PyCapsule_GetPointer = __root.PyCapsule_GetPointer;
    pub const PyCapsule_GetDestructor = __root.PyCapsule_GetDestructor;
    pub const PyCapsule_GetName = __root.PyCapsule_GetName;
    pub const PyCapsule_GetContext = __root.PyCapsule_GetContext;
    pub const PyCapsule_IsValid = __root.PyCapsule_IsValid;
    pub const PyCapsule_SetPointer = __root.PyCapsule_SetPointer;
    pub const PyCapsule_SetDestructor = __root.PyCapsule_SetDestructor;
    pub const PyCapsule_SetName = __root.PyCapsule_SetName;
    pub const PyCapsule_SetContext = __root.PyCapsule_SetContext;
    pub const _PyCode_ConstantKey = __root._PyCode_ConstantKey;
    pub const PyCode_Optimize = __root.PyCode_Optimize;
    pub const PyUnstable_Code_GetExtra = __root.PyUnstable_Code_GetExtra;
    pub const PyUnstable_Code_SetExtra = __root.PyUnstable_Code_SetExtra;
    pub const _PyCode_GetExtra = __root._PyCode_GetExtra;
    pub const _PyCode_SetExtra = __root._PyCode_SetExtra;
    pub const PyTraceBack_Print = __root.PyTraceBack_Print;
    pub const PySlice_New = __root.PySlice_New;
    pub const PySlice_GetIndices = __root.PySlice_GetIndices;
    pub const PySlice_GetIndicesEx = __root.PySlice_GetIndicesEx;
    pub const PySlice_Unpack = __root.PySlice_Unpack;
    pub const PyCell_New = __root.PyCell_New;
    pub const PyCell_Get = __root.PyCell_Get;
    pub const PyCell_Set = __root.PyCell_Set;
    pub const PyCell_GET = __root.PyCell_GET;
    pub const PyCell_SET = __root.PyCell_SET;
    pub const PySeqIter_New = __root.PySeqIter_New;
    pub const PyCallIter_New = __root.PyCallIter_New;
    pub const PyState_AddModule = __root.PyState_AddModule;
    pub const PyDictProxy_New = __root.PyDictProxy_New;
    pub const PyWrapper_New = __root.PyWrapper_New;
    pub const PyDescr_IsData = __root.PyDescr_IsData;
    pub const Py_GenericAlias = __root.Py_GenericAlias;
    pub const PyErr_WarnEx = __root.PyErr_WarnEx;
    pub const PyErr_WarnFormat = __root.PyErr_WarnFormat;
    pub const PyErr_ResourceWarning = __root.PyErr_ResourceWarning;
    pub const PyErr_WarnExplicit = __root.PyErr_WarnExplicit;
    pub const PyErr_WarnExplicitObject = __root.PyErr_WarnExplicitObject;
    pub const PyErr_WarnExplicitFormat = __root.PyErr_WarnExplicitFormat;
    pub const PyWeakref_NewRef = __root.PyWeakref_NewRef;
    pub const PyWeakref_NewProxy = __root.PyWeakref_NewProxy;
    pub const PyWeakref_GetObject = __root.PyWeakref_GetObject;
    pub const PyWeakref_GetRef = __root.PyWeakref_GetRef;
    pub const PyWeakref_GET_OBJECT = __root.PyWeakref_GET_OBJECT;
    pub const PyStructSequence_SetItem = __root.PyStructSequence_SetItem;
    pub const PyStructSequence_GetItem = __root.PyStructSequence_GetItem;
    pub const PyPickleBuffer_FromObject = __root.PyPickleBuffer_FromObject;
    pub const PyPickleBuffer_GetBuffer = __root.PyPickleBuffer_GetBuffer;
    pub const PyPickleBuffer_Release = __root.PyPickleBuffer_Release;
    pub const PyCodec_Register = __root.PyCodec_Register;
    pub const PyCodec_Unregister = __root.PyCodec_Unregister;
    pub const PyCodec_Encode = __root.PyCodec_Encode;
    pub const PyCodec_Decode = __root.PyCodec_Decode;
    pub const PyCodec_StrictErrors = __root.PyCodec_StrictErrors;
    pub const PyCodec_IgnoreErrors = __root.PyCodec_IgnoreErrors;
    pub const PyCodec_ReplaceErrors = __root.PyCodec_ReplaceErrors;
    pub const PyCodec_XMLCharRefReplaceErrors = __root.PyCodec_XMLCharRefReplaceErrors;
    pub const PyCodec_BackslashReplaceErrors = __root.PyCodec_BackslashReplaceErrors;
    pub const PyCodec_NameReplaceErrors = __root.PyCodec_NameReplaceErrors;
    pub const PyContext_Copy = __root.PyContext_Copy;
    pub const PyContext_Enter = __root.PyContext_Enter;
    pub const PyContext_Exit = __root.PyContext_Exit;
    pub const PyContextVar_Get = __root.PyContextVar_Get;
    pub const PyContextVar_Set = __root.PyContextVar_Set;
    pub const PyContextVar_Reset = __root.PyContextVar_Reset;
    pub const PyArg_Parse = __root.PyArg_Parse;
    pub const PyArg_ParseTuple = __root.PyArg_ParseTuple;
    pub const PyArg_ParseTupleAndKeywords = __root.PyArg_ParseTupleAndKeywords;
    pub const PyArg_VaParse = __root.PyArg_VaParse;
    pub const PyArg_VaParseTupleAndKeywords = __root.PyArg_VaParseTupleAndKeywords;
    pub const PyArg_ValidateKeywordArguments = __root.PyArg_ValidateKeywordArguments;
    pub const PyArg_UnpackTuple = __root.PyArg_UnpackTuple;
    pub const PyModule_AddObjectRef = __root.PyModule_AddObjectRef;
    pub const PyModule_Add = __root.PyModule_Add;
    pub const PyModule_AddObject = __root.PyModule_AddObject;
    pub const PyModule_AddIntConstant = __root.PyModule_AddIntConstant;
    pub const PyModule_AddStringConstant = __root.PyModule_AddStringConstant;
    pub const PyModule_AddType = __root.PyModule_AddType;
    pub const PyModule_SetDocString = __root.PyModule_SetDocString;
    pub const PyModule_AddFunctions = __root.PyModule_AddFunctions;
    pub const PyModule_ExecDef = __root.PyModule_ExecDef;
    pub const _PyArg_ParseTupleAndKeywordsFast = __root._PyArg_ParseTupleAndKeywordsFast;
    pub const PyErr_Display = __root.PyErr_Display;
    pub const PyErr_DisplayException = __root.PyErr_DisplayException;
    pub const PyEval_EvalCode = __root.PyEval_EvalCode;
    pub const PyEval_EvalCodeEx = __root.PyEval_EvalCodeEx;
    pub const PyEval_GetFuncName = __root.PyEval_GetFuncName;
    pub const PyEval_GetFuncDesc = __root.PyEval_GetFuncDesc;
    pub const _PyEval_SliceIndex = __root._PyEval_SliceIndex;
    pub const _PyEval_SliceIndexNotNone = __root._PyEval_SliceIndexNotNone;
    pub const PyOS_FSPath = __root.PyOS_FSPath;
    pub const PyImport_ExecCodeModuleObject = __root.PyImport_ExecCodeModuleObject;
    pub const PyImport_GetModule = __root.PyImport_GetModule;
    pub const PyImport_AddModuleObject = __root.PyImport_AddModuleObject;
    pub const PyImport_ImportModuleLevelObject = __root.PyImport_ImportModuleLevelObject;
    pub const PyImport_GetImporter = __root.PyImport_GetImporter;
    pub const PyImport_Import = __root.PyImport_Import;
    pub const PyImport_ReloadModule = __root.PyImport_ReloadModule;
    pub const PyImport_ImportFrozenModuleObject = __root.PyImport_ImportFrozenModuleObject;
    pub const PyObject_CallNoArgs = __root.PyObject_CallNoArgs;
    pub const PyObject_Call = __root.PyObject_Call;
    pub const PyObject_CallObject = __root.PyObject_CallObject;
    pub const PyObject_CallFunction = __root.PyObject_CallFunction;
    pub const PyObject_CallMethod = __root.PyObject_CallMethod;
    pub const PyObject_CallFunctionObjArgs = __root.PyObject_CallFunctionObjArgs;
    pub const PyObject_CallMethodObjArgs = __root.PyObject_CallMethodObjArgs;
    pub const PyVectorcall_Call = __root.PyVectorcall_Call;
    pub const PyObject_Vectorcall = __root.PyObject_Vectorcall;
    pub const PyObject_VectorcallMethod = __root.PyObject_VectorcallMethod;
    pub const PyObject_Type = __root.PyObject_Type;
    pub const PyObject_Size = __root.PyObject_Size;
    pub const PyObject_Length = __root.PyObject_Length;
    pub const PyObject_GetItem = __root.PyObject_GetItem;
    pub const PyObject_SetItem = __root.PyObject_SetItem;
    pub const PyObject_DelItemString = __root.PyObject_DelItemString;
    pub const PyObject_DelItem = __root.PyObject_DelItem;
    pub const PyObject_Format = __root.PyObject_Format;
    pub const PyObject_GetIter = __root.PyObject_GetIter;
    pub const PyObject_GetAIter = __root.PyObject_GetAIter;
    pub const PyIter_Check = __root.PyIter_Check;
    pub const PyAIter_Check = __root.PyAIter_Check;
    pub const PyIter_Next = __root.PyIter_Next;
    pub const PyIter_Send = __root.PyIter_Send;
    pub const PyNumber_Check = __root.PyNumber_Check;
    pub const PyNumber_Add = __root.PyNumber_Add;
    pub const PyNumber_Subtract = __root.PyNumber_Subtract;
    pub const PyNumber_Multiply = __root.PyNumber_Multiply;
    pub const PyNumber_MatrixMultiply = __root.PyNumber_MatrixMultiply;
    pub const PyNumber_FloorDivide = __root.PyNumber_FloorDivide;
    pub const PyNumber_TrueDivide = __root.PyNumber_TrueDivide;
    pub const PyNumber_Remainder = __root.PyNumber_Remainder;
    pub const PyNumber_Divmod = __root.PyNumber_Divmod;
    pub const PyNumber_Power = __root.PyNumber_Power;
    pub const PyNumber_Negative = __root.PyNumber_Negative;
    pub const PyNumber_Positive = __root.PyNumber_Positive;
    pub const PyNumber_Absolute = __root.PyNumber_Absolute;
    pub const PyNumber_Invert = __root.PyNumber_Invert;
    pub const PyNumber_Lshift = __root.PyNumber_Lshift;
    pub const PyNumber_Rshift = __root.PyNumber_Rshift;
    pub const PyNumber_And = __root.PyNumber_And;
    pub const PyNumber_Xor = __root.PyNumber_Xor;
    pub const PyNumber_Or = __root.PyNumber_Or;
    pub const PyIndex_Check = __root.PyIndex_Check;
    pub const PyNumber_Index = __root.PyNumber_Index;
    pub const PyNumber_AsSsize_t = __root.PyNumber_AsSsize_t;
    pub const PyNumber_Long = __root.PyNumber_Long;
    pub const PyNumber_Float = __root.PyNumber_Float;
    pub const PyNumber_InPlaceAdd = __root.PyNumber_InPlaceAdd;
    pub const PyNumber_InPlaceSubtract = __root.PyNumber_InPlaceSubtract;
    pub const PyNumber_InPlaceMultiply = __root.PyNumber_InPlaceMultiply;
    pub const PyNumber_InPlaceMatrixMultiply = __root.PyNumber_InPlaceMatrixMultiply;
    pub const PyNumber_InPlaceFloorDivide = __root.PyNumber_InPlaceFloorDivide;
    pub const PyNumber_InPlaceTrueDivide = __root.PyNumber_InPlaceTrueDivide;
    pub const PyNumber_InPlaceRemainder = __root.PyNumber_InPlaceRemainder;
    pub const PyNumber_InPlacePower = __root.PyNumber_InPlacePower;
    pub const PyNumber_InPlaceLshift = __root.PyNumber_InPlaceLshift;
    pub const PyNumber_InPlaceRshift = __root.PyNumber_InPlaceRshift;
    pub const PyNumber_InPlaceAnd = __root.PyNumber_InPlaceAnd;
    pub const PyNumber_InPlaceXor = __root.PyNumber_InPlaceXor;
    pub const PyNumber_InPlaceOr = __root.PyNumber_InPlaceOr;
    pub const PyNumber_ToBase = __root.PyNumber_ToBase;
    pub const PySequence_Check = __root.PySequence_Check;
    pub const PySequence_Size = __root.PySequence_Size;
    pub const PySequence_Length = __root.PySequence_Length;
    pub const PySequence_Concat = __root.PySequence_Concat;
    pub const PySequence_Repeat = __root.PySequence_Repeat;
    pub const PySequence_GetItem = __root.PySequence_GetItem;
    pub const PySequence_GetSlice = __root.PySequence_GetSlice;
    pub const PySequence_SetItem = __root.PySequence_SetItem;
    pub const PySequence_DelItem = __root.PySequence_DelItem;
    pub const PySequence_SetSlice = __root.PySequence_SetSlice;
    pub const PySequence_DelSlice = __root.PySequence_DelSlice;
    pub const PySequence_Tuple = __root.PySequence_Tuple;
    pub const PySequence_List = __root.PySequence_List;
    pub const PySequence_Fast = __root.PySequence_Fast;
    pub const PySequence_Count = __root.PySequence_Count;
    pub const PySequence_Contains = __root.PySequence_Contains;
    pub const PySequence_In = __root.PySequence_In;
    pub const PySequence_Index = __root.PySequence_Index;
    pub const PySequence_InPlaceConcat = __root.PySequence_InPlaceConcat;
    pub const PySequence_InPlaceRepeat = __root.PySequence_InPlaceRepeat;
    pub const PyMapping_Check = __root.PyMapping_Check;
    pub const PyMapping_Size = __root.PyMapping_Size;
    pub const PyMapping_Length = __root.PyMapping_Length;
    pub const PyMapping_HasKeyString = __root.PyMapping_HasKeyString;
    pub const PyMapping_HasKey = __root.PyMapping_HasKey;
    pub const PyMapping_HasKeyWithError = __root.PyMapping_HasKeyWithError;
    pub const PyMapping_HasKeyStringWithError = __root.PyMapping_HasKeyStringWithError;
    pub const PyMapping_Keys = __root.PyMapping_Keys;
    pub const PyMapping_Values = __root.PyMapping_Values;
    pub const PyMapping_Items = __root.PyMapping_Items;
    pub const PyMapping_GetItemString = __root.PyMapping_GetItemString;
    pub const PyMapping_GetOptionalItem = __root.PyMapping_GetOptionalItem;
    pub const PyMapping_GetOptionalItemString = __root.PyMapping_GetOptionalItemString;
    pub const PyMapping_SetItemString = __root.PyMapping_SetItemString;
    pub const PyObject_IsInstance = __root.PyObject_IsInstance;
    pub const PyObject_IsSubclass = __root.PyObject_IsSubclass;
    pub const _PyObject_CallMethodId = __root._PyObject_CallMethodId;
    pub const PyVectorcall_Function = __root.PyVectorcall_Function;
    pub const PyObject_VectorcallDict = __root.PyObject_VectorcallDict;
    pub const PyObject_CallOneArg = __root.PyObject_CallOneArg;
    pub const PyObject_CallMethodNoArgs = __root.PyObject_CallMethodNoArgs;
    pub const PyObject_CallMethodOneArg = __root.PyObject_CallMethodOneArg;
    pub const PyObject_LengthHint = __root.PyObject_LengthHint;
    pub const _Py_fopen_obj = __root._Py_fopen_obj;
    pub const CheckBuffer = __root.PyObject_CheckBuffer;
    pub const GetBuffer = __root.PyObject_GetBuffer;
    pub const CopyData = __root.PyObject_CopyData;
    pub const Is = __root.Py_Is;
    pub const REFCNT = __root.Py_REFCNT;
    pub const TYPE = __root.Py_TYPE;
    pub const SIZE = __root.Py_SIZE;
    pub const IsImmortal = __root._Py_IsImmortal;
    pub const SetRefcnt = __root._Py_SetRefcnt;
    pub const FromModuleAndSpec = __root.PyType_FromModuleAndSpec;
    pub const GetTypeData = __root.PyObject_GetTypeData;
    pub const TypeCheck = __root.PyObject_TypeCheck;
    pub const Repr = __root.PyObject_Repr;
    pub const Str = __root.PyObject_Str;
    pub const ASCII = __root.PyObject_ASCII;
    pub const Bytes = __root.PyObject_Bytes;
    pub const RichCompare = __root.PyObject_RichCompare;
    pub const RichCompareBool = __root.PyObject_RichCompareBool;
    pub const GetAttrString = __root.PyObject_GetAttrString;
    pub const SetAttrString = __root.PyObject_SetAttrString;
    pub const DelAttrString = __root.PyObject_DelAttrString;
    pub const HasAttrString = __root.PyObject_HasAttrString;
    pub const GetAttr = __root.PyObject_GetAttr;
    pub const GetOptionalAttr = __root.PyObject_GetOptionalAttr;
    pub const GetOptionalAttrString = __root.PyObject_GetOptionalAttrString;
    pub const SetAttr = __root.PyObject_SetAttr;
    pub const DelAttr = __root.PyObject_DelAttr;
    pub const HasAttr = __root.PyObject_HasAttr;
    pub const HasAttrWithError = __root.PyObject_HasAttrWithError;
    pub const HasAttrStringWithError = __root.PyObject_HasAttrStringWithError;
    pub const SelfIter = __root.PyObject_SelfIter;
    pub const GenericGetAttr = __root.PyObject_GenericGetAttr;
    pub const GenericSetAttr = __root.PyObject_GenericSetAttr;
    pub const GenericSetDict = __root.PyObject_GenericSetDict;
    pub const Hash = __root.PyObject_Hash;
    pub const HashNotImplemented = __root.PyObject_HashNotImplemented;
    pub const IsTrue = __root.PyObject_IsTrue;
    pub const Not = __root.PyObject_Not;
    pub const Check = __root.PyCallable_Check;
    pub const ClearWeakRefs = __root.PyObject_ClearWeakRefs;
    pub const Dir = __root.PyObject_Dir;
    pub const ReprEnter = __root.Py_ReprEnter;
    pub const ReprLeave = __root.Py_ReprLeave;
    pub const Dealloc = __root._Py_Dealloc;
    pub const IncRef = __root.Py_IncRef;
    pub const DecRef = __root.Py_DecRef;
    pub const INCREF = __root.Py_INCREF;
    pub const DECREF = __root.Py_DECREF;
    pub const XINCREF = __root.Py_XINCREF;
    pub const XDECREF = __root.Py_XDECREF;
    pub const NewRef = __root.Py_NewRef;
    pub const XNewRef = __root.Py_XNewRef;
    pub const IsNone = __root.Py_IsNone;
    pub const NewReference = __root._Py_NewReference;
    pub const NewReferenceNoTotal = __root._Py_NewReferenceNoTotal;
    pub const ResurrectReference = __root._Py_ResurrectReference;
    pub const Print = __root.PyObject_Print;
    pub const Dump = __root._PyObject_Dump;
    pub const GetAttrId = __root._PyObject_GetAttrId;
    pub const GetDictPtr = __root._PyObject_GetDictPtr;
    pub const CallFinalizer = __root.PyObject_CallFinalizer;
    pub const CallFinalizerFromDealloc = __root.PyObject_CallFinalizerFromDealloc;
    pub const ClearWeakRefsNoCallbacks = __root.PyUnstable_Object_ClearWeakRefsNoCallbacks;
    pub const GenericGetAttrWithDict = __root._PyObject_GenericGetAttrWithDict;
    pub const GenericSetAttrWithDict = __root._PyObject_GenericSetAttrWithDict;
    pub const FunctionStr = __root._PyObject_FunctionStr;
    pub const AssertFailed = __root._PyObject_AssertFailed;
    pub const GetItemData = __root.PyObject_GetItemData;
    pub const VisitManagedDict = __root.PyObject_VisitManagedDict;
    pub const SetManagedDict = __root._PyObject_SetManagedDict;
    pub const ClearManagedDict = __root.PyObject_ClearManagedDict;
    pub const CheckExact = __root.PyType_CheckExact;
    pub const Init = __root.PyObject_Init;
    pub const IsTracked = __root.PyObject_GC_IsTracked;
    pub const IsFinalized = __root.PyObject_GC_IsFinalized;
    pub const GC = __root.PyObject_IS_GC;
    pub const LISTPTR = __root.PyObject_GET_WEAKREFS_LISTPTR;
    pub const HashDouble = __root._Py_HashDouble;
    pub const GenericHash = __root.PyObject_GenericHash;
    pub const FromObject = __root.PyByteArray_FromObject;
    pub const Concat = __root.PyByteArray_Concat;
    pub const Size = __root.PyByteArray_Size;
    pub const AsString = __root.PyByteArray_AsString;
    pub const Resize = __root.PyByteArray_Resize;
    pub const STRING = __root.PyByteArray_AS_STRING;
    pub const AsStringAndSize = __root.PyBytes_AsStringAndSize;
    pub const Join = __root._PyBytes_Join;
    pub const Substring = __root.PyUnicode_Substring;
    pub const AsUCS4 = __root.PyUnicode_AsUCS4;
    pub const AsUCS4Copy = __root.PyUnicode_AsUCS4Copy;
    pub const GetLength = __root.PyUnicode_GetLength;
    pub const ReadChar = __root.PyUnicode_ReadChar;
    pub const WriteChar = __root.PyUnicode_WriteChar;
    pub const FromEncodedObject = __root.PyUnicode_FromEncodedObject;
    pub const AsWideChar = __root.PyUnicode_AsWideChar;
    pub const AsWideCharString = __root.PyUnicode_AsWideCharString;
    pub const AsDecodedObject = __root.PyUnicode_AsDecodedObject;
    pub const AsDecodedUnicode = __root.PyUnicode_AsDecodedUnicode;
    pub const AsEncodedObject = __root.PyUnicode_AsEncodedObject;
    pub const AsEncodedString = __root.PyUnicode_AsEncodedString;
    pub const AsEncodedUnicode = __root.PyUnicode_AsEncodedUnicode;
    pub const BuildEncodingMap = __root.PyUnicode_BuildEncodingMap;
    pub const AsUTF8String = __root.PyUnicode_AsUTF8String;
    pub const AsUTF8AndSize = __root.PyUnicode_AsUTF8AndSize;
    pub const AsUTF32String = __root.PyUnicode_AsUTF32String;
    pub const AsUTF16String = __root.PyUnicode_AsUTF16String;
    pub const AsUnicodeEscapeString = __root.PyUnicode_AsUnicodeEscapeString;
    pub const AsRawUnicodeEscapeString = __root.PyUnicode_AsRawUnicodeEscapeString;
    pub const AsLatin1String = __root.PyUnicode_AsLatin1String;
    pub const AsASCIIString = __root.PyUnicode_AsASCIIString;
    pub const AsCharmapString = __root.PyUnicode_AsCharmapString;
    pub const AsMBCSString = __root.PyUnicode_AsMBCSString;
    pub const EncodeLocale = __root.PyUnicode_EncodeLocale;
    pub const FSConverter = __root.PyUnicode_FSConverter;
    pub const FSDecoder = __root.PyUnicode_FSDecoder;
    pub const EncodeFSDefault = __root.PyUnicode_EncodeFSDefault;
    pub const Split = __root.PyUnicode_Split;
    pub const Splitlines = __root.PyUnicode_Splitlines;
    pub const Partition = __root.PyUnicode_Partition;
    pub const RPartition = __root.PyUnicode_RPartition;
    pub const RSplit = __root.PyUnicode_RSplit;
    pub const Translate = __root.PyUnicode_Translate;
    pub const Tailmatch = __root.PyUnicode_Tailmatch;
    pub const Find = __root.PyUnicode_Find;
    pub const FindChar = __root.PyUnicode_FindChar;
    pub const Count = __root.PyUnicode_Count;
    pub const Replace = __root.PyUnicode_Replace;
    pub const Compare = __root.PyUnicode_Compare;
    pub const CompareWithASCIIString = __root.PyUnicode_CompareWithASCIIString;
    pub const EqualToUTF8 = __root.PyUnicode_EqualToUTF8;
    pub const EqualToUTF8AndSize = __root.PyUnicode_EqualToUTF8AndSize;
    pub const Format = __root.PyUnicode_Format;
    pub const Contains = __root.PyUnicode_Contains;
    pub const IsIdentifier = __root.PyUnicode_IsIdentifier;
    pub const READY = __root.PyUnicode_IS_READY;
    pub const DATA = __root._PyUnicode_COMPACT_DATA;
    pub const CopyCharacters = __root.PyUnicode_CopyCharacters;
    pub const Fill = __root.PyUnicode_Fill;
    pub const AsUTF8 = __root.PyUnicode_AsUTF8;
    pub const SetNone = __root.PyErr_SetNone;
    pub const SetObject = __root.PyErr_SetObject;
    pub const SetString = __root.PyErr_SetString;
    pub const Restore = __root.PyErr_Restore;
    pub const SetRaisedException = __root.PyErr_SetRaisedException;
    pub const SetHandledException = __root.PyErr_SetHandledException;
    pub const SetExcInfo = __root.PyErr_SetExcInfo;
    pub const GivenExceptionMatches = __root.PyErr_GivenExceptionMatches;
    pub const ExceptionMatches = __root.PyErr_ExceptionMatches;
    pub const SetTraceback = __root.PyException_SetTraceback;
    pub const GetTraceback = __root.PyException_GetTraceback;
    pub const GetCause = __root.PyException_GetCause;
    pub const SetCause = __root.PyException_SetCause;
    pub const GetContext = __root.PyException_GetContext;
    pub const SetContext = __root.PyException_SetContext;
    pub const GetArgs = __root.PyException_GetArgs;
    pub const SetArgs = __root.PyException_SetArgs;
    pub const Name = __root.PyExceptionClass_Name;
    pub const SetFromErrno = __root.PyErr_SetFromErrno;
    pub const SetFromErrnoWithFilenameObject = __root.PyErr_SetFromErrnoWithFilenameObject;
    pub const SetFromErrnoWithFilenameObjects = __root.PyErr_SetFromErrnoWithFilenameObjects;
    pub const SetFromErrnoWithFilename = __root.PyErr_SetFromErrnoWithFilename;
    pub const FormatV = __root.PyErr_FormatV;
    pub const SetExcFromWindowsErrWithFilenameObject = __root.PyErr_SetExcFromWindowsErrWithFilenameObject;
    pub const SetExcFromWindowsErrWithFilenameObjects = __root.PyErr_SetExcFromWindowsErrWithFilenameObjects;
    pub const SetExcFromWindowsErrWithFilename = __root.PyErr_SetExcFromWindowsErrWithFilename;
    pub const SetExcFromWindowsErr = __root.PyErr_SetExcFromWindowsErr;
    pub const SetImportErrorSubclass = __root.PyErr_SetImportErrorSubclass;
    pub const SetImportError = __root.PyErr_SetImportError;
    pub const WriteUnraisable = __root.PyErr_WriteUnraisable;
    pub const GetEncoding = __root.PyUnicodeEncodeError_GetEncoding;
    pub const GetObject = __root.PyUnicodeEncodeError_GetObject;
    pub const GetStart = __root.PyUnicodeEncodeError_GetStart;
    pub const SetStart = __root.PyUnicodeEncodeError_SetStart;
    pub const GetEnd = __root.PyUnicodeEncodeError_GetEnd;
    pub const SetEnd = __root.PyUnicodeEncodeError_SetEnd;
    pub const GetReason = __root.PyUnicodeEncodeError_GetReason;
    pub const SetReason = __root.PyUnicodeEncodeError_SetReason;
    pub const ChainExceptions1 = __root._PyErr_ChainExceptions1;
    pub const PrepReraiseStar = __root.PyUnstable_Exc_PrepReraiseStar;
    pub const SyntaxLocationObject = __root.PyErr_SyntaxLocationObject;
    pub const RangedSyntaxLocationObject = __root.PyErr_RangedSyntaxLocationObject;
    pub const ProgramTextObject = __root.PyErr_ProgramTextObject;
    pub const AsLong = __root.PyLong_AsLong;
    pub const AsLongAndOverflow = __root.PyLong_AsLongAndOverflow;
    pub const t = __root.PyLong_AsSsize_t;
    pub const AsUnsignedLong = __root.PyLong_AsUnsignedLong;
    pub const AsUnsignedLongMask = __root.PyLong_AsUnsignedLongMask;
    pub const AsInt = __root.PyLong_AsInt;
    pub const AsDouble = __root.PyLong_AsDouble;
    pub const AsVoidPtr = __root.PyLong_AsVoidPtr;
    pub const AsLongLong = __root.PyLong_AsLongLong;
    pub const AsUnsignedLongLong = __root.PyLong_AsUnsignedLongLong;
    pub const AsUnsignedLongLongMask = __root.PyLong_AsUnsignedLongLongMask;
    pub const AsLongLongAndOverflow = __root.PyLong_AsLongLongAndOverflow;
    pub const FromUnicodeObject = __root.PyLong_FromUnicodeObject;
    pub const AsNativeBytes = __root.PyLong_AsNativeBytes;
    pub const Sign = __root._PyLong_Sign;
    pub const NumBits = __root._PyLong_NumBits;
    pub const GCD = __root._PyLong_GCD;
    pub const IsFalse = __root.Py_IsFalse;
    pub const FromString = __root.PyFloat_FromString;
    pub const DOUBLE = __root.PyFloat_AS_DOUBLE;
    pub const RealAsDouble = __root.PyComplex_RealAsDouble;
    pub const ImagAsDouble = __root.PyComplex_ImagAsDouble;
    pub const AsCComplex = __root.PyComplex_AsCComplex;
    pub const GetContiguous = __root.PyMemoryView_GetContiguous;
    pub const BUFFER = __root.PyMemoryView_GET_BUFFER;
    pub const BASE = __root.PyMemoryView_GET_BASE;
    pub const GetItem = __root.PyTuple_GetItem;
    pub const SetItem = __root.PyTuple_SetItem;
    pub const GetSlice = __root.PyTuple_GetSlice;
    pub const ITEM = __root.PyTuple_SET_ITEM;
    pub const GetItemRef = __root.PyList_GetItemRef;
    pub const Insert = __root.PyList_Insert;
    pub const Append = __root.PyList_Append;
    pub const SetSlice = __root.PyList_SetSlice;
    pub const Sort = __root.PyList_Sort;
    pub const Reverse = __root.PyList_Reverse;
    pub const AsTuple = __root.PyList_AsTuple;
    pub const Extend = __root.PyList_Extend;
    pub const Clear = __root.PyList_Clear;
    pub const GetItemWithError = __root.PyDict_GetItemWithError;
    pub const DelItem = __root.PyDict_DelItem;
    pub const Next = __root.PyDict_Next;
    pub const Keys = __root.PyDict_Keys;
    pub const Values = __root.PyDict_Values;
    pub const Items = __root.PyDict_Items;
    pub const Copy = __root.PyDict_Copy;
    pub const Update = __root.PyDict_Update;
    pub const Merge = __root.PyDict_Merge;
    pub const MergeFromSeq2 = __root.PyDict_MergeFromSeq2;
    pub const GetItemString = __root.PyDict_GetItemString;
    pub const SetItemString = __root.PyDict_SetItemString;
    pub const DelItemString = __root.PyDict_DelItemString;
    pub const GetItemStringRef = __root.PyDict_GetItemStringRef;
    pub const GenericGetDict = __root.PyObject_GenericGetDict;
    pub const KnownHash = __root._PyDict_GetItem_KnownHash;
    pub const GetItemStringWithError = __root._PyDict_GetItemStringWithError;
    pub const SetDefault = __root.PyDict_SetDefault;
    pub const SetDefaultRef = __root.PyDict_SetDefaultRef;
    pub const ContainsString = __root.PyDict_ContainsString;
    pub const Pop = __root.PyDict_Pop;
    pub const PopString = __root.PyDict_PopString;
    pub const New = __root.PySet_New;
    pub const Add = __root.PySet_Add;
    pub const Discard = __root.PySet_Discard;
    pub const GetFunction = __root.PyCFunction_GetFunction;
    pub const GetSelf = __root.PyCFunction_GetSelf;
    pub const GetFlags = __root.PyCFunction_GetFlags;
    pub const FUNCTION = __root.PyCFunction_GET_FUNCTION;
    pub const SELF = __root.PyCFunction_GET_SELF;
    pub const FLAGS = __root.PyCFunction_GET_FLAGS;
    pub const CLASS = __root.PyCFunction_GET_CLASS;
    pub const NewObject = __root.PyModule_NewObject;
    pub const GetDict = __root.PyModule_GetDict;
    pub const GetNameObject = __root.PyModule_GetNameObject;
    pub const GetName = __root.PyModule_GetName;
    pub const GetFilename = __root.PyModule_GetFilename;
    pub const GetFilenameObject = __root.PyModule_GetFilenameObject;
    pub const GetDef = __root.PyModule_GetDef;
    pub const GetState = __root.PyModule_GetState;
    pub const NewWithQualName = __root.PyFunction_NewWithQualName;
    pub const GetCode = __root.PyFunction_GetCode;
    pub const GetGlobals = __root.PyFunction_GetGlobals;
    pub const GetModule = __root.PyFunction_GetModule;
    pub const GetDefaults = __root.PyFunction_GetDefaults;
    pub const SetDefaults = __root.PyFunction_SetDefaults;
    pub const GetKwDefaults = __root.PyFunction_GetKwDefaults;
    pub const SetKwDefaults = __root.PyFunction_SetKwDefaults;
    pub const GetClosure = __root.PyFunction_GetClosure;
    pub const SetClosure = __root.PyFunction_SetClosure;
    pub const GetAnnotations = __root.PyFunction_GetAnnotations;
    pub const SetAnnotations = __root.PyFunction_SetAnnotations;
    pub const CODE = __root.PyFunction_GET_CODE;
    pub const GLOBALS = __root.PyFunction_GET_GLOBALS;
    pub const MODULE = __root.PyFunction_GET_MODULE;
    pub const DEFAULTS = __root.PyFunction_GET_DEFAULTS;
    pub const CLOSURE = __root.PyFunction_GET_CLOSURE;
    pub const ANNOTATIONS = __root.PyFunction_GET_ANNOTATIONS;
    pub const Function = __root.PyMethod_Function;
    pub const Self = __root.PyMethod_Self;
    pub const GetLine = __root.PyFile_GetLine;
    pub const WriteObject = __root.PyFile_WriteObject;
    pub const AsFileDescriptor = __root.PyObject_AsFileDescriptor;
    pub const OpenCodeObject = __root.PyFile_OpenCodeObject;
    pub const GetPointer = __root.PyCapsule_GetPointer;
    pub const GetDestructor = __root.PyCapsule_GetDestructor;
    pub const IsValid = __root.PyCapsule_IsValid;
    pub const SetPointer = __root.PyCapsule_SetPointer;
    pub const SetDestructor = __root.PyCapsule_SetDestructor;
    pub const SetName = __root.PyCapsule_SetName;
    pub const ConstantKey = __root._PyCode_ConstantKey;
    pub const Optimize = __root.PyCode_Optimize;
    pub const GetExtra = __root.PyUnstable_Code_GetExtra;
    pub const SetExtra = __root.PyUnstable_Code_SetExtra;
    pub const GetIndices = __root.PySlice_GetIndices;
    pub const GetIndicesEx = __root.PySlice_GetIndicesEx;
    pub const Unpack = __root.PySlice_Unpack;
    pub const Get = __root.PyCell_Get;
    pub const Set = __root.PyCell_Set;
    pub const GET = __root.PyCell_GET;
    pub const SET = __root.PyCell_SET;
    pub const AddModule = __root.PyState_AddModule;
    pub const IsData = __root.PyDescr_IsData;
    pub const GenericAlias = __root.Py_GenericAlias;
    pub const WarnEx = __root.PyErr_WarnEx;
    pub const WarnFormat = __root.PyErr_WarnFormat;
    pub const ResourceWarning = __root.PyErr_ResourceWarning;
    pub const WarnExplicit = __root.PyErr_WarnExplicit;
    pub const WarnExplicitObject = __root.PyErr_WarnExplicitObject;
    pub const WarnExplicitFormat = __root.PyErr_WarnExplicitFormat;
    pub const NewProxy = __root.PyWeakref_NewProxy;
    pub const GetRef = __root.PyWeakref_GetRef;
    pub const OBJECT = __root.PyWeakref_GET_OBJECT;
    pub const Release = __root.PyPickleBuffer_Release;
    pub const Register = __root.PyCodec_Register;
    pub const Unregister = __root.PyCodec_Unregister;
    pub const Encode = __root.PyCodec_Encode;
    pub const Decode = __root.PyCodec_Decode;
    pub const StrictErrors = __root.PyCodec_StrictErrors;
    pub const IgnoreErrors = __root.PyCodec_IgnoreErrors;
    pub const ReplaceErrors = __root.PyCodec_ReplaceErrors;
    pub const XMLCharRefReplaceErrors = __root.PyCodec_XMLCharRefReplaceErrors;
    pub const BackslashReplaceErrors = __root.PyCodec_BackslashReplaceErrors;
    pub const NameReplaceErrors = __root.PyCodec_NameReplaceErrors;
    pub const Enter = __root.PyContext_Enter;
    pub const Exit = __root.PyContext_Exit;
    pub const Reset = __root.PyContextVar_Reset;
    pub const Parse = __root.PyArg_Parse;
    pub const ParseTuple = __root.PyArg_ParseTuple;
    pub const ParseTupleAndKeywords = __root.PyArg_ParseTupleAndKeywords;
    pub const VaParse = __root.PyArg_VaParse;
    pub const VaParseTupleAndKeywords = __root.PyArg_VaParseTupleAndKeywords;
    pub const ValidateKeywordArguments = __root.PyArg_ValidateKeywordArguments;
    pub const UnpackTuple = __root.PyArg_UnpackTuple;
    pub const AddObjectRef = __root.PyModule_AddObjectRef;
    pub const AddObject = __root.PyModule_AddObject;
    pub const AddIntConstant = __root.PyModule_AddIntConstant;
    pub const AddStringConstant = __root.PyModule_AddStringConstant;
    pub const AddType = __root.PyModule_AddType;
    pub const SetDocString = __root.PyModule_SetDocString;
    pub const AddFunctions = __root.PyModule_AddFunctions;
    pub const ExecDef = __root.PyModule_ExecDef;
    pub const ParseTupleAndKeywordsFast = __root._PyArg_ParseTupleAndKeywordsFast;
    pub const Display = __root.PyErr_Display;
    pub const DisplayException = __root.PyErr_DisplayException;
    pub const EvalCode = __root.PyEval_EvalCode;
    pub const EvalCodeEx = __root.PyEval_EvalCodeEx;
    pub const GetFuncName = __root.PyEval_GetFuncName;
    pub const GetFuncDesc = __root.PyEval_GetFuncDesc;
    pub const SliceIndex = __root._PyEval_SliceIndex;
    pub const SliceIndexNotNone = __root._PyEval_SliceIndexNotNone;
    pub const FSPath = __root.PyOS_FSPath;
    pub const ExecCodeModuleObject = __root.PyImport_ExecCodeModuleObject;
    pub const AddModuleObject = __root.PyImport_AddModuleObject;
    pub const ImportModuleLevelObject = __root.PyImport_ImportModuleLevelObject;
    pub const GetImporter = __root.PyImport_GetImporter;
    pub const Import = __root.PyImport_Import;
    pub const ReloadModule = __root.PyImport_ReloadModule;
    pub const ImportFrozenModuleObject = __root.PyImport_ImportFrozenModuleObject;
    pub const CallNoArgs = __root.PyObject_CallNoArgs;
    pub const Call = __root.PyObject_Call;
    pub const CallObject = __root.PyObject_CallObject;
    pub const CallFunction = __root.PyObject_CallFunction;
    pub const CallMethod = __root.PyObject_CallMethod;
    pub const CallFunctionObjArgs = __root.PyObject_CallFunctionObjArgs;
    pub const CallMethodObjArgs = __root.PyObject_CallMethodObjArgs;
    pub const Vectorcall = __root.PyObject_Vectorcall;
    pub const VectorcallMethod = __root.PyObject_VectorcallMethod;
    pub const Type = __root.PyObject_Type;
    pub const Length = __root.PyObject_Length;
    pub const GetIter = __root.PyObject_GetIter;
    pub const GetAIter = __root.PyObject_GetAIter;
    pub const Send = __root.PyIter_Send;
    pub const Subtract = __root.PyNumber_Subtract;
    pub const Multiply = __root.PyNumber_Multiply;
    pub const MatrixMultiply = __root.PyNumber_MatrixMultiply;
    pub const FloorDivide = __root.PyNumber_FloorDivide;
    pub const TrueDivide = __root.PyNumber_TrueDivide;
    pub const Remainder = __root.PyNumber_Remainder;
    pub const Divmod = __root.PyNumber_Divmod;
    pub const Power = __root.PyNumber_Power;
    pub const Negative = __root.PyNumber_Negative;
    pub const Positive = __root.PyNumber_Positive;
    pub const Absolute = __root.PyNumber_Absolute;
    pub const Invert = __root.PyNumber_Invert;
    pub const Lshift = __root.PyNumber_Lshift;
    pub const Rshift = __root.PyNumber_Rshift;
    pub const And = __root.PyNumber_And;
    pub const Xor = __root.PyNumber_Xor;
    pub const Or = __root.PyNumber_Or;
    pub const Index = __root.PyNumber_Index;
    pub const Long = __root.PyNumber_Long;
    pub const Float = __root.PyNumber_Float;
    pub const InPlaceAdd = __root.PyNumber_InPlaceAdd;
    pub const InPlaceSubtract = __root.PyNumber_InPlaceSubtract;
    pub const InPlaceMultiply = __root.PyNumber_InPlaceMultiply;
    pub const InPlaceMatrixMultiply = __root.PyNumber_InPlaceMatrixMultiply;
    pub const InPlaceFloorDivide = __root.PyNumber_InPlaceFloorDivide;
    pub const InPlaceTrueDivide = __root.PyNumber_InPlaceTrueDivide;
    pub const InPlaceRemainder = __root.PyNumber_InPlaceRemainder;
    pub const InPlacePower = __root.PyNumber_InPlacePower;
    pub const InPlaceLshift = __root.PyNumber_InPlaceLshift;
    pub const InPlaceRshift = __root.PyNumber_InPlaceRshift;
    pub const InPlaceAnd = __root.PyNumber_InPlaceAnd;
    pub const InPlaceXor = __root.PyNumber_InPlaceXor;
    pub const InPlaceOr = __root.PyNumber_InPlaceOr;
    pub const ToBase = __root.PyNumber_ToBase;
    pub const Repeat = __root.PySequence_Repeat;
    pub const DelSlice = __root.PySequence_DelSlice;
    pub const Tuple = __root.PySequence_Tuple;
    pub const List = __root.PySequence_List;
    pub const Fast = __root.PySequence_Fast;
    pub const In = __root.PySequence_In;
    pub const InPlaceConcat = __root.PySequence_InPlaceConcat;
    pub const InPlaceRepeat = __root.PySequence_InPlaceRepeat;
    pub const HasKeyString = __root.PyMapping_HasKeyString;
    pub const HasKey = __root.PyMapping_HasKey;
    pub const HasKeyWithError = __root.PyMapping_HasKeyWithError;
    pub const HasKeyStringWithError = __root.PyMapping_HasKeyStringWithError;
    pub const GetOptionalItem = __root.PyMapping_GetOptionalItem;
    pub const GetOptionalItemString = __root.PyMapping_GetOptionalItemString;
    pub const IsInstance = __root.PyObject_IsInstance;
    pub const IsSubclass = __root.PyObject_IsSubclass;
    pub const CallMethodId = __root._PyObject_CallMethodId;
    pub const VectorcallDict = __root.PyObject_VectorcallDict;
    pub const CallOneArg = __root.PyObject_CallOneArg;
    pub const CallMethodNoArgs = __root.PyObject_CallMethodNoArgs;
    pub const CallMethodOneArg = __root.PyObject_CallMethodOneArg;
    pub const LengthHint = __root.PyObject_LengthHint;
    pub const obj = __root._Py_fopen_obj;
};
pub const PyObject = struct__object;
pub const struct_PyModuleDef_Base = extern struct {
    ob_base: PyObject = @import("std").mem.zeroes(PyObject),
    m_init: ?*const fn () callconv(.c) [*c]PyObject = null,
    m_index: Py_ssize_t = 0,
    m_copy: [*c]PyObject = null,
};
pub const PyModuleDef_Base = struct_PyModuleDef_Base;
pub const struct_PyModuleDef_Slot = extern struct {
    slot: c_int = 0,
    value: ?*anyopaque = null,
};
pub const PyModuleDef_Slot = struct_PyModuleDef_Slot;
pub const struct_PyModuleDef = extern struct {
    m_base: PyModuleDef_Base = @import("std").mem.zeroes(PyModuleDef_Base),
    m_name: [*c]const u8 = null,
    m_doc: [*c]const u8 = null,
    m_size: Py_ssize_t = 0,
    m_methods: [*c]PyMethodDef = null,
    m_slots: [*c]PyModuleDef_Slot = null,
    m_traverse: traverseproc = null,
    m_clear: inquiry = null,
    m_free: freefunc = null,
    pub const PyModuleDef_Init = __root.PyModuleDef_Init;
    pub const PyState_RemoveModule = __root.PyState_RemoveModule;
    pub const PyState_FindModule = __root.PyState_FindModule;
    pub const PyModule_Create2 = __root.PyModule_Create2;
    pub const PyModule_FromDefAndSpec2 = __root.PyModule_FromDefAndSpec2;
    pub const Init = __root.PyModuleDef_Init;
    pub const RemoveModule = __root.PyState_RemoveModule;
    pub const FindModule = __root.PyState_FindModule;
    pub const Create2 = __root.PyModule_Create2;
    pub const FromDefAndSpec2 = __root.PyModule_FromDefAndSpec2;
};
pub const PyModuleDef = struct_PyModuleDef;
pub const digit = u32;
pub const struct__PyLongValue = extern struct {
    lv_tag: usize = 0,
    ob_digit: [1]digit = @import("std").mem.zeroes([1]digit),
};
pub const _PyLongValue = struct__PyLongValue;
pub const struct__longobject = extern struct {
    ob_base: PyObject = @import("std").mem.zeroes(PyObject),
    long_value: _PyLongValue = @import("std").mem.zeroes(_PyLongValue),
    pub const PyUnstable_Long_IsCompact = __root.PyUnstable_Long_IsCompact;
    pub const PyUnstable_Long_CompactValue = __root.PyUnstable_Long_CompactValue;
    pub const _PyLong_AsByteArray = __root._PyLong_AsByteArray;
    pub const _PyLong_Copy = __root._PyLong_Copy;
    pub const _PyLong_IsCompact = __root._PyLong_IsCompact;
    pub const _PyLong_CompactValue = __root._PyLong_CompactValue;
    pub const IsCompact = __root.PyUnstable_Long_IsCompact;
    pub const CompactValue = __root.PyUnstable_Long_CompactValue;
    pub const AsByteArray = __root._PyLong_AsByteArray;
    pub const Copy = __root._PyLong_Copy;
};
pub const PyLongObject = struct__longobject;
pub const struct_PyCodeObject = extern struct {
    ob_base: PyVarObject = @import("std").mem.zeroes(PyVarObject),
    co_consts: [*c]PyObject = null,
    co_names: [*c]PyObject = null,
    co_exceptiontable: [*c]PyObject = null,
    co_flags: c_int = 0,
    co_argcount: c_int = 0,
    co_posonlyargcount: c_int = 0,
    co_kwonlyargcount: c_int = 0,
    co_stacksize: c_int = 0,
    co_firstlineno: c_int = 0,
    co_nlocalsplus: c_int = 0,
    co_framesize: c_int = 0,
    co_nlocals: c_int = 0,
    co_ncellvars: c_int = 0,
    co_nfreevars: c_int = 0,
    co_version: u32 = 0,
    co_localsplusnames: [*c]PyObject = null,
    co_localspluskinds: [*c]PyObject = null,
    co_filename: [*c]PyObject = null,
    co_name: [*c]PyObject = null,
    co_qualname: [*c]PyObject = null,
    co_linetable: [*c]PyObject = null,
    co_weakreflist: [*c]PyObject = null,
    co_executors: [*c]_PyExecutorArray = null,
    _co_cached: [*c]_PyCoCached = null,
    _co_instrumentation_version: usize = 0,
    _co_monitoring: [*c]_PyCoMonitoringData = null,
    _co_firsttraceable: c_int = 0,
    co_extra: ?*anyopaque = null,
    co_code_adaptive: [1]u8 = @import("std").mem.zeroes([1]u8),
    pub const PyCode_GetNumFree = __root.PyCode_GetNumFree;
    pub const PyUnstable_Code_GetFirstFree = __root.PyUnstable_Code_GetFirstFree;
    pub const PyCode_GetFirstFree = __root.PyCode_GetFirstFree;
    pub const PyCode_Addr2Line = __root.PyCode_Addr2Line;
    pub const PyCode_Addr2Location = __root.PyCode_Addr2Location;
    pub const PyCode_GetCode = __root.PyCode_GetCode;
    pub const PyCode_GetVarnames = __root.PyCode_GetVarnames;
    pub const PyCode_GetCellvars = __root.PyCode_GetCellvars;
    pub const PyCode_GetFreevars = __root.PyCode_GetFreevars;
    pub const PyUnstable_PerfTrampoline_CompileCode = __root.PyUnstable_PerfTrampoline_CompileCode;
    pub const GetNumFree = __root.PyCode_GetNumFree;
    pub const GetFirstFree = __root.PyUnstable_Code_GetFirstFree;
    pub const Addr2Line = __root.PyCode_Addr2Line;
    pub const Addr2Location = __root.PyCode_Addr2Location;
    pub const GetCode = __root.PyCode_GetCode;
    pub const GetVarnames = __root.PyCode_GetVarnames;
    pub const GetCellvars = __root.PyCode_GetCellvars;
    pub const GetFreevars = __root.PyCode_GetFreevars;
    pub const CompileCode = __root.PyUnstable_PerfTrampoline_CompileCode;
};
pub const PyCodeObject = struct_PyCodeObject;
pub const struct__frame = opaque {
    pub const PyFrame_GetLineNumber = __root.PyFrame_GetLineNumber;
    pub const PyFrame_GetCode = __root.PyFrame_GetCode;
    pub const PyFrame_GetBack = __root.PyFrame_GetBack;
    pub const PyFrame_GetLocals = __root.PyFrame_GetLocals;
    pub const PyFrame_GetGlobals = __root.PyFrame_GetGlobals;
    pub const PyFrame_GetBuiltins = __root.PyFrame_GetBuiltins;
    pub const PyFrame_GetGenerator = __root.PyFrame_GetGenerator;
    pub const PyFrame_GetLasti = __root.PyFrame_GetLasti;
    pub const PyFrame_GetVar = __root.PyFrame_GetVar;
    pub const PyFrame_GetVarString = __root.PyFrame_GetVarString;
    pub const PyTraceBack_Here = __root.PyTraceBack_Here;
    pub const PyGen_New = __root.PyGen_New;
    pub const PyGen_NewWithQualName = __root.PyGen_NewWithQualName;
    pub const PyCoro_New = __root.PyCoro_New;
    pub const PyAsyncGen_New = __root.PyAsyncGen_New;
    pub const PyEval_EvalFrame = __root.PyEval_EvalFrame;
    pub const PyEval_EvalFrameEx = __root.PyEval_EvalFrameEx;
    pub const GetLineNumber = __root.PyFrame_GetLineNumber;
    pub const GetCode = __root.PyFrame_GetCode;
    pub const GetBack = __root.PyFrame_GetBack;
    pub const GetLocals = __root.PyFrame_GetLocals;
    pub const GetGlobals = __root.PyFrame_GetGlobals;
    pub const GetBuiltins = __root.PyFrame_GetBuiltins;
    pub const GetGenerator = __root.PyFrame_GetGenerator;
    pub const GetLasti = __root.PyFrame_GetLasti;
    pub const GetVar = __root.PyFrame_GetVar;
    pub const GetVarString = __root.PyFrame_GetVarString;
    pub const Here = __root.PyTraceBack_Here;
    pub const New = __root.PyGen_New;
    pub const NewWithQualName = __root.PyGen_NewWithQualName;
    pub const EvalFrame = __root.PyEval_EvalFrame;
    pub const EvalFrameEx = __root.PyEval_EvalFrameEx;
};
pub const PyFrameObject = struct__frame;
pub const PyThreadState = struct__ts;
pub const struct__is = opaque {
    pub const PyInterpreterState_Clear = __root.PyInterpreterState_Clear;
    pub const PyInterpreterState_Delete = __root.PyInterpreterState_Delete;
    pub const PyInterpreterState_GetDict = __root.PyInterpreterState_GetDict;
    pub const PyInterpreterState_GetID = __root.PyInterpreterState_GetID;
    pub const PyThreadState_New = __root.PyThreadState_New;
    pub const _PyInterpreterState_RequiresIDRef = __root._PyInterpreterState_RequiresIDRef;
    pub const _PyInterpreterState_RequireIDRef = __root._PyInterpreterState_RequireIDRef;
    pub const PyUnstable_InterpreterState_GetMainModule = __root.PyUnstable_InterpreterState_GetMainModule;
    pub const PyInterpreterState_Next = __root.PyInterpreterState_Next;
    pub const PyInterpreterState_ThreadHead = __root.PyInterpreterState_ThreadHead;
    pub const _PyInterpreterState_GetEvalFrameFunc = __root._PyInterpreterState_GetEvalFrameFunc;
    pub const _PyInterpreterState_SetEvalFrameFunc = __root._PyInterpreterState_SetEvalFrameFunc;
    pub const PyUnstable_AtExit = __root.PyUnstable_AtExit;
    pub const Clear = __root.PyInterpreterState_Clear;
    pub const Delete = __root.PyInterpreterState_Delete;
    pub const GetDict = __root.PyInterpreterState_GetDict;
    pub const GetID = __root.PyInterpreterState_GetID;
    pub const New = __root.PyThreadState_New;
    pub const RequiresIDRef = __root._PyInterpreterState_RequiresIDRef;
    pub const RequireIDRef = __root._PyInterpreterState_RequireIDRef;
    pub const GetMainModule = __root.PyUnstable_InterpreterState_GetMainModule;
    pub const Next = __root.PyInterpreterState_Next;
    pub const ThreadHead = __root.PyInterpreterState_ThreadHead;
    pub const GetEvalFrameFunc = __root._PyInterpreterState_GetEvalFrameFunc;
    pub const SetEvalFrameFunc = __root._PyInterpreterState_SetEvalFrameFunc;
    pub const AtExit = __root.PyUnstable_AtExit;
};
pub const PyInterpreterState = struct__is; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pystate.h:76:22: warning: struct demoted to opaque type - has bitfield
const struct_unnamed_4 = opaque {}; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pystate.h:96:7: warning: struct demoted to opaque type - has opaque field
pub const struct__ts = opaque {
    pub const _PyTrash_begin = __root._PyTrash_begin;
    pub const _PyTrash_end = __root._PyTrash_end;
    pub const _PyTrash_thread_deposit_object = __root._PyTrash_thread_deposit_object;
    pub const _PyTrash_thread_destroy_chain = __root._PyTrash_thread_destroy_chain;
    pub const PyThreadState_Clear = __root.PyThreadState_Clear;
    pub const PyThreadState_Delete = __root.PyThreadState_Delete;
    pub const PyThreadState_Swap = __root.PyThreadState_Swap;
    pub const PyThreadState_GetInterpreter = __root.PyThreadState_GetInterpreter;
    pub const PyThreadState_GetFrame = __root.PyThreadState_GetFrame;
    pub const PyThreadState_GetID = __root.PyThreadState_GetID;
    pub const PyThreadState_EnterTracing = __root.PyThreadState_EnterTracing;
    pub const PyThreadState_LeaveTracing = __root.PyThreadState_LeaveTracing;
    pub const PyThreadState_Next = __root.PyThreadState_Next;
    pub const Py_EndInterpreter = __root.Py_EndInterpreter;
    pub const PyEval_RestoreThread = __root.PyEval_RestoreThread;
    pub const PyEval_AcquireThread = __root.PyEval_AcquireThread;
    pub const PyEval_ReleaseThread = __root.PyEval_ReleaseThread;
    pub const _PyEval_EvalFrameDefault = __root._PyEval_EvalFrameDefault;
    pub const begin = __root._PyTrash_begin;
    pub const end = __root._PyTrash_end;
    pub const object = __root._PyTrash_thread_deposit_object;
    pub const chain = __root._PyTrash_thread_destroy_chain;
    pub const Clear = __root.PyThreadState_Clear;
    pub const Delete = __root.PyThreadState_Delete;
    pub const Swap = __root.PyThreadState_Swap;
    pub const GetInterpreter = __root.PyThreadState_GetInterpreter;
    pub const GetFrame = __root.PyThreadState_GetFrame;
    pub const GetID = __root.PyThreadState_GetID;
    pub const EnterTracing = __root.PyThreadState_EnterTracing;
    pub const LeaveTracing = __root.PyThreadState_LeaveTracing;
    pub const Next = __root.PyThreadState_Next;
    pub const EndInterpreter = __root.Py_EndInterpreter;
    pub const RestoreThread = __root.PyEval_RestoreThread;
    pub const AcquireThread = __root.PyEval_AcquireThread;
    pub const ReleaseThread = __root.PyEval_ReleaseThread;
    pub const EvalFrameDefault = __root._PyEval_EvalFrameDefault;
};
pub const Py_buffer = extern struct {
    buf: ?*anyopaque = null,
    obj: [*c]PyObject = null,
    len: Py_ssize_t = 0,
    itemsize: Py_ssize_t = 0,
    readonly: c_int = 0,
    ndim: c_int = 0,
    format: [*c]u8 = null,
    shape: [*c]Py_ssize_t = null,
    strides: [*c]Py_ssize_t = null,
    suboffsets: [*c]Py_ssize_t = null,
    internal: ?*anyopaque = null,
    pub const PyBuffer_GetPointer = __root.PyBuffer_GetPointer;
    pub const PyBuffer_FromContiguous = __root.PyBuffer_FromContiguous;
    pub const PyBuffer_IsContiguous = __root.PyBuffer_IsContiguous;
    pub const PyBuffer_FillInfo = __root.PyBuffer_FillInfo;
    pub const PyBuffer_Release = __root.PyBuffer_Release;
    pub const PyMemoryView_FromBuffer = __root.PyMemoryView_FromBuffer;
    pub const GetPointer = __root.PyBuffer_GetPointer;
    pub const FromContiguous = __root.PyBuffer_FromContiguous;
    pub const IsContiguous = __root.PyBuffer_IsContiguous;
    pub const FillInfo = __root.PyBuffer_FillInfo;
    pub const Release = __root.PyBuffer_Release;
    pub const FromBuffer = __root.PyMemoryView_FromBuffer;
};
pub const getbufferproc = ?*const fn ([*c]PyObject, [*c]Py_buffer, c_int) callconv(.c) c_int;
pub const releasebufferproc = ?*const fn ([*c]PyObject, [*c]Py_buffer) callconv(.c) void;
pub extern fn PyObject_CheckBuffer(obj: [*c]PyObject) c_int;
pub extern fn PyObject_GetBuffer(obj: [*c]PyObject, view: [*c]Py_buffer, flags: c_int) c_int;
pub extern fn PyBuffer_GetPointer(view: [*c]const Py_buffer, indices: [*c]const Py_ssize_t) ?*anyopaque;
pub extern fn PyBuffer_SizeFromFormat(format: [*c]const u8) Py_ssize_t;
pub extern fn PyBuffer_ToContiguous(buf: ?*anyopaque, view: [*c]const Py_buffer, len: Py_ssize_t, order: u8) c_int;
pub extern fn PyBuffer_FromContiguous(view: [*c]const Py_buffer, buf: ?*const anyopaque, len: Py_ssize_t, order: u8) c_int;
pub extern fn PyObject_CopyData(dest: [*c]PyObject, src: [*c]PyObject) c_int;
pub extern fn PyBuffer_IsContiguous(view: [*c]const Py_buffer, fort: u8) c_int;
pub extern fn PyBuffer_FillContiguousStrides(ndims: c_int, shape: [*c]Py_ssize_t, strides: [*c]Py_ssize_t, itemsize: c_int, fort: u8) void;
pub extern fn PyBuffer_FillInfo(view: [*c]Py_buffer, o: [*c]PyObject, buf: ?*anyopaque, len: Py_ssize_t, readonly: c_int, flags: c_int) c_int;
pub extern fn PyBuffer_Release(view: [*c]Py_buffer) void; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:15:10: warning: TODO implement function '__atomic_fetch_add' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:14:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_add_int(arg_obj: [*c]c_int, arg_value: c_int) callconv(.c) c_int; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:19:10: warning: TODO implement function '__atomic_fetch_add' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:18:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_add_int8(arg_obj: [*c]i8, arg_value: i8) callconv(.c) i8; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:23:10: warning: TODO implement function '__atomic_fetch_add' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:22:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_add_int16(arg_obj: [*c]i16, arg_value: i16) callconv(.c) i16; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:27:10: warning: TODO implement function '__atomic_fetch_add' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:26:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_add_int32(arg_obj: [*c]i32, arg_value: i32) callconv(.c) i32; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:31:10: warning: TODO implement function '__atomic_fetch_add' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:30:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_add_int64(arg_obj: [*c]i64, arg_value: i64) callconv(.c) i64; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:35:10: warning: TODO implement function '__atomic_fetch_add' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:34:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_add_intptr(arg_obj: [*c]isize, arg_value: isize) callconv(.c) isize; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:39:10: warning: TODO implement function '__atomic_fetch_add' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:38:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_add_uint(arg_obj: [*c]c_uint, arg_value: c_uint) callconv(.c) c_uint; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:43:10: warning: TODO implement function '__atomic_fetch_add' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:42:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_add_uint8(arg_obj: [*c]u8, arg_value: u8) callconv(.c) u8; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:47:10: warning: TODO implement function '__atomic_fetch_add' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:46:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_add_uint16(arg_obj: [*c]u16, arg_value: u16) callconv(.c) u16; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:51:10: warning: TODO implement function '__atomic_fetch_add' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:50:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_add_uint32(arg_obj: [*c]u32, arg_value: u32) callconv(.c) u32; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:55:10: warning: TODO implement function '__atomic_fetch_add' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:54:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_add_uint64(arg_obj: [*c]u64, arg_value: u64) callconv(.c) u64; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:59:10: warning: TODO implement function '__atomic_fetch_add' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:58:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_add_uintptr(arg_obj: [*c]usize, arg_value: usize) callconv(.c) usize; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:63:10: warning: TODO implement function '__atomic_fetch_add' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:62:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_add_ssize(arg_obj: [*c]Py_ssize_t, arg_value: Py_ssize_t) callconv(.c) Py_ssize_t; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:70:10: warning: TODO implement function '__atomic_compare_exchange_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:69:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_compare_exchange_int(arg_obj: [*c]c_int, arg_expected: [*c]c_int, arg_desired: c_int) callconv(.c) c_int; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:75:10: warning: TODO implement function '__atomic_compare_exchange_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:74:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_compare_exchange_int8(arg_obj: [*c]i8, arg_expected: [*c]i8, arg_desired: i8) callconv(.c) c_int; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:80:10: warning: TODO implement function '__atomic_compare_exchange_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:79:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_compare_exchange_int16(arg_obj: [*c]i16, arg_expected: [*c]i16, arg_desired: i16) callconv(.c) c_int; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:85:10: warning: TODO implement function '__atomic_compare_exchange_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:84:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_compare_exchange_int32(arg_obj: [*c]i32, arg_expected: [*c]i32, arg_desired: i32) callconv(.c) c_int; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:90:10: warning: TODO implement function '__atomic_compare_exchange_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:89:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_compare_exchange_int64(arg_obj: [*c]i64, arg_expected: [*c]i64, arg_desired: i64) callconv(.c) c_int; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:95:10: warning: TODO implement function '__atomic_compare_exchange_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:94:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_compare_exchange_intptr(arg_obj: [*c]isize, arg_expected: [*c]isize, arg_desired: isize) callconv(.c) c_int; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:100:10: warning: TODO implement function '__atomic_compare_exchange_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:99:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_compare_exchange_uint(arg_obj: [*c]c_uint, arg_expected: [*c]c_uint, arg_desired: c_uint) callconv(.c) c_int; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:105:10: warning: TODO implement function '__atomic_compare_exchange_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:104:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_compare_exchange_uint8(arg_obj: [*c]u8, arg_expected: [*c]u8, arg_desired: u8) callconv(.c) c_int; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:110:10: warning: TODO implement function '__atomic_compare_exchange_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:109:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_compare_exchange_uint16(arg_obj: [*c]u16, arg_expected: [*c]u16, arg_desired: u16) callconv(.c) c_int; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:115:10: warning: TODO implement function '__atomic_compare_exchange_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:114:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_compare_exchange_uint32(arg_obj: [*c]u32, arg_expected: [*c]u32, arg_desired: u32) callconv(.c) c_int; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:120:10: warning: TODO implement function '__atomic_compare_exchange_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:119:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_compare_exchange_uint64(arg_obj: [*c]u64, arg_expected: [*c]u64, arg_desired: u64) callconv(.c) c_int; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:125:10: warning: TODO implement function '__atomic_compare_exchange_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:124:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_compare_exchange_uintptr(arg_obj: [*c]usize, arg_expected: [*c]usize, arg_desired: usize) callconv(.c) c_int; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:130:10: warning: TODO implement function '__atomic_compare_exchange_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:129:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_compare_exchange_ssize(arg_obj: [*c]Py_ssize_t, arg_expected: [*c]Py_ssize_t, arg_desired: Py_ssize_t) callconv(.c) c_int; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:135:10: warning: TODO implement function '__atomic_compare_exchange_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:134:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_compare_exchange_ptr(arg_obj: ?*anyopaque, arg_expected: ?*anyopaque, arg_desired: ?*anyopaque) callconv(.c) c_int; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:143:10: warning: TODO implement function '__atomic_exchange_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:142:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_exchange_int(arg_obj: [*c]c_int, arg_value: c_int) callconv(.c) c_int; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:147:10: warning: TODO implement function '__atomic_exchange_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:146:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_exchange_int8(arg_obj: [*c]i8, arg_value: i8) callconv(.c) i8; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:151:10: warning: TODO implement function '__atomic_exchange_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:150:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_exchange_int16(arg_obj: [*c]i16, arg_value: i16) callconv(.c) i16; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:155:10: warning: TODO implement function '__atomic_exchange_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:154:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_exchange_int32(arg_obj: [*c]i32, arg_value: i32) callconv(.c) i32; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:159:10: warning: TODO implement function '__atomic_exchange_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:158:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_exchange_int64(arg_obj: [*c]i64, arg_value: i64) callconv(.c) i64; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:163:10: warning: TODO implement function '__atomic_exchange_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:162:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_exchange_intptr(arg_obj: [*c]isize, arg_value: isize) callconv(.c) isize; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:167:10: warning: TODO implement function '__atomic_exchange_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:166:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_exchange_uint(arg_obj: [*c]c_uint, arg_value: c_uint) callconv(.c) c_uint; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:171:10: warning: TODO implement function '__atomic_exchange_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:170:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_exchange_uint8(arg_obj: [*c]u8, arg_value: u8) callconv(.c) u8; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:175:10: warning: TODO implement function '__atomic_exchange_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:174:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_exchange_uint16(arg_obj: [*c]u16, arg_value: u16) callconv(.c) u16; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:179:10: warning: TODO implement function '__atomic_exchange_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:178:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_exchange_uint32(arg_obj: [*c]u32, arg_value: u32) callconv(.c) u32; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:183:10: warning: TODO implement function '__atomic_exchange_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:182:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_exchange_uint64(arg_obj: [*c]u64, arg_value: u64) callconv(.c) u64; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:187:10: warning: TODO implement function '__atomic_exchange_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:186:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_exchange_uintptr(arg_obj: [*c]usize, arg_value: usize) callconv(.c) usize; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:191:10: warning: TODO implement function '__atomic_exchange_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:190:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_exchange_ssize(arg_obj: [*c]Py_ssize_t, arg_value: Py_ssize_t) callconv(.c) Py_ssize_t; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:195:10: warning: TODO implement function '__atomic_exchange_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:194:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_exchange_ptr(arg_obj: ?*anyopaque, arg_value: ?*anyopaque) callconv(.c) ?*anyopaque; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:202:10: warning: TODO implement function '__atomic_fetch_and' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:201:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_and_uint8(arg_obj: [*c]u8, arg_value: u8) callconv(.c) u8; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:206:10: warning: TODO implement function '__atomic_fetch_and' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:205:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_and_uint16(arg_obj: [*c]u16, arg_value: u16) callconv(.c) u16; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:210:10: warning: TODO implement function '__atomic_fetch_and' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:209:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_and_uint32(arg_obj: [*c]u32, arg_value: u32) callconv(.c) u32; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:214:10: warning: TODO implement function '__atomic_fetch_and' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:213:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_and_uint64(arg_obj: [*c]u64, arg_value: u64) callconv(.c) u64; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:218:10: warning: TODO implement function '__atomic_fetch_and' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:217:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_and_uintptr(arg_obj: [*c]usize, arg_value: usize) callconv(.c) usize; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:225:10: warning: TODO implement function '__atomic_fetch_or' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:224:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_or_uint8(arg_obj: [*c]u8, arg_value: u8) callconv(.c) u8; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:229:10: warning: TODO implement function '__atomic_fetch_or' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:228:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_or_uint16(arg_obj: [*c]u16, arg_value: u16) callconv(.c) u16; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:233:10: warning: TODO implement function '__atomic_fetch_or' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:232:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_or_uint32(arg_obj: [*c]u32, arg_value: u32) callconv(.c) u32; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:237:10: warning: TODO implement function '__atomic_fetch_or' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:236:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_or_uint64(arg_obj: [*c]u64, arg_value: u64) callconv(.c) u64; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:241:10: warning: TODO implement function '__atomic_fetch_or' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:240:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_or_uintptr(arg_obj: [*c]usize, arg_value: usize) callconv(.c) usize; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:248:10: warning: TODO implement function '__atomic_load_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:247:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_load_int(arg_obj: [*c]const c_int) callconv(.c) c_int; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:252:10: warning: TODO implement function '__atomic_load_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:251:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_load_int8(arg_obj: [*c]const i8) callconv(.c) i8; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:256:10: warning: TODO implement function '__atomic_load_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:255:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_load_int16(arg_obj: [*c]const i16) callconv(.c) i16; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:260:10: warning: TODO implement function '__atomic_load_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:259:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_load_int32(arg_obj: [*c]const i32) callconv(.c) i32; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:264:10: warning: TODO implement function '__atomic_load_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:263:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_load_int64(arg_obj: [*c]const i64) callconv(.c) i64; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:268:10: warning: TODO implement function '__atomic_load_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:267:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_load_intptr(arg_obj: [*c]const isize) callconv(.c) isize; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:272:10: warning: TODO implement function '__atomic_load_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:271:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_load_uint8(arg_obj: [*c]const u8) callconv(.c) u8; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:276:10: warning: TODO implement function '__atomic_load_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:275:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_load_uint16(arg_obj: [*c]const u16) callconv(.c) u16; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:280:10: warning: TODO implement function '__atomic_load_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:279:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_load_uint32(arg_obj: [*c]const u32) callconv(.c) u32; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:284:10: warning: TODO implement function '__atomic_load_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:283:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_load_uint64(arg_obj: [*c]const u64) callconv(.c) u64; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:288:10: warning: TODO implement function '__atomic_load_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:287:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_load_uintptr(arg_obj: [*c]const usize) callconv(.c) usize; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:292:10: warning: TODO implement function '__atomic_load_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:291:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_load_uint(arg_obj: [*c]const c_uint) callconv(.c) c_uint; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:296:10: warning: TODO implement function '__atomic_load_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:295:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_load_ssize(arg_obj: [*c]const Py_ssize_t) callconv(.c) Py_ssize_t; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:300:18: warning: TODO implement function '__atomic_load_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:299:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_load_ptr(arg_obj: ?*const anyopaque) callconv(.c) ?*anyopaque; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:307:10: warning: TODO implement function '__atomic_load_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:306:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_load_int_relaxed(arg_obj: [*c]const c_int) callconv(.c) c_int; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:311:10: warning: TODO implement function '__atomic_load_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:310:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_load_int8_relaxed(arg_obj: [*c]const i8) callconv(.c) i8; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:315:10: warning: TODO implement function '__atomic_load_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:314:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_load_int16_relaxed(arg_obj: [*c]const i16) callconv(.c) i16; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:319:10: warning: TODO implement function '__atomic_load_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:318:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_load_int32_relaxed(arg_obj: [*c]const i32) callconv(.c) i32; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:323:10: warning: TODO implement function '__atomic_load_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:322:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_load_int64_relaxed(arg_obj: [*c]const i64) callconv(.c) i64; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:327:10: warning: TODO implement function '__atomic_load_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:326:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_load_intptr_relaxed(arg_obj: [*c]const isize) callconv(.c) isize; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:331:10: warning: TODO implement function '__atomic_load_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:330:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_load_uint8_relaxed(arg_obj: [*c]const u8) callconv(.c) u8; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:335:10: warning: TODO implement function '__atomic_load_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:334:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_load_uint16_relaxed(arg_obj: [*c]const u16) callconv(.c) u16; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:339:10: warning: TODO implement function '__atomic_load_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:338:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_load_uint32_relaxed(arg_obj: [*c]const u32) callconv(.c) u32; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:343:10: warning: TODO implement function '__atomic_load_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:342:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_load_uint64_relaxed(arg_obj: [*c]const u64) callconv(.c) u64; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:347:10: warning: TODO implement function '__atomic_load_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:346:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_load_uintptr_relaxed(arg_obj: [*c]const usize) callconv(.c) usize; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:351:10: warning: TODO implement function '__atomic_load_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:350:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_load_uint_relaxed(arg_obj: [*c]const c_uint) callconv(.c) c_uint; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:355:10: warning: TODO implement function '__atomic_load_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:354:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_load_ssize_relaxed(arg_obj: [*c]const Py_ssize_t) callconv(.c) Py_ssize_t; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:359:18: warning: TODO implement function '__atomic_load_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:358:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_load_ptr_relaxed(arg_obj: ?*const anyopaque) callconv(.c) ?*anyopaque; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:363:10: warning: TODO implement function '__atomic_load_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:362:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_load_ullong_relaxed(arg_obj: [*c]const c_ulonglong) callconv(.c) c_ulonglong; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:370:3: warning: TODO implement function '__atomic_store_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:369:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_store_int(arg_obj: [*c]c_int, arg_value: c_int) callconv(.c) void; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:374:3: warning: TODO implement function '__atomic_store_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:373:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_store_int8(arg_obj: [*c]i8, arg_value: i8) callconv(.c) void; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:378:3: warning: TODO implement function '__atomic_store_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:377:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_store_int16(arg_obj: [*c]i16, arg_value: i16) callconv(.c) void; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:382:3: warning: TODO implement function '__atomic_store_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:381:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_store_int32(arg_obj: [*c]i32, arg_value: i32) callconv(.c) void; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:386:3: warning: TODO implement function '__atomic_store_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:385:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_store_int64(arg_obj: [*c]i64, arg_value: i64) callconv(.c) void; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:390:3: warning: TODO implement function '__atomic_store_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:389:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_store_intptr(arg_obj: [*c]isize, arg_value: isize) callconv(.c) void; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:394:3: warning: TODO implement function '__atomic_store_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:393:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_store_uint8(arg_obj: [*c]u8, arg_value: u8) callconv(.c) void; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:398:3: warning: TODO implement function '__atomic_store_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:397:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_store_uint16(arg_obj: [*c]u16, arg_value: u16) callconv(.c) void; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:402:3: warning: TODO implement function '__atomic_store_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:401:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_store_uint32(arg_obj: [*c]u32, arg_value: u32) callconv(.c) void; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:406:3: warning: TODO implement function '__atomic_store_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:405:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_store_uint64(arg_obj: [*c]u64, arg_value: u64) callconv(.c) void; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:410:3: warning: TODO implement function '__atomic_store_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:409:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_store_uintptr(arg_obj: [*c]usize, arg_value: usize) callconv(.c) void; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:414:3: warning: TODO implement function '__atomic_store_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:413:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_store_uint(arg_obj: [*c]c_uint, arg_value: c_uint) callconv(.c) void; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:418:3: warning: TODO implement function '__atomic_store_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:417:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_store_ptr(arg_obj: ?*anyopaque, arg_value: ?*anyopaque) callconv(.c) void; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:422:3: warning: TODO implement function '__atomic_store_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:421:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_store_ssize(arg_obj: [*c]Py_ssize_t, arg_value: Py_ssize_t) callconv(.c) void; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:429:3: warning: TODO implement function '__atomic_store_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:428:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_store_int_relaxed(arg_obj: [*c]c_int, arg_value: c_int) callconv(.c) void; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:433:3: warning: TODO implement function '__atomic_store_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:432:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_store_int8_relaxed(arg_obj: [*c]i8, arg_value: i8) callconv(.c) void; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:437:3: warning: TODO implement function '__atomic_store_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:436:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_store_int16_relaxed(arg_obj: [*c]i16, arg_value: i16) callconv(.c) void; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:441:3: warning: TODO implement function '__atomic_store_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:440:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_store_int32_relaxed(arg_obj: [*c]i32, arg_value: i32) callconv(.c) void; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:445:3: warning: TODO implement function '__atomic_store_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:444:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_store_int64_relaxed(arg_obj: [*c]i64, arg_value: i64) callconv(.c) void; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:449:3: warning: TODO implement function '__atomic_store_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:448:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_store_intptr_relaxed(arg_obj: [*c]isize, arg_value: isize) callconv(.c) void; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:453:3: warning: TODO implement function '__atomic_store_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:452:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_store_uint8_relaxed(arg_obj: [*c]u8, arg_value: u8) callconv(.c) void; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:457:3: warning: TODO implement function '__atomic_store_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:456:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_store_uint16_relaxed(arg_obj: [*c]u16, arg_value: u16) callconv(.c) void; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:461:3: warning: TODO implement function '__atomic_store_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:460:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_store_uint32_relaxed(arg_obj: [*c]u32, arg_value: u32) callconv(.c) void; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:465:3: warning: TODO implement function '__atomic_store_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:464:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_store_uint64_relaxed(arg_obj: [*c]u64, arg_value: u64) callconv(.c) void; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:469:3: warning: TODO implement function '__atomic_store_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:468:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_store_uintptr_relaxed(arg_obj: [*c]usize, arg_value: usize) callconv(.c) void; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:473:3: warning: TODO implement function '__atomic_store_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:472:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_store_uint_relaxed(arg_obj: [*c]c_uint, arg_value: c_uint) callconv(.c) void; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:477:3: warning: TODO implement function '__atomic_store_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:476:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_store_ptr_relaxed(arg_obj: ?*anyopaque, arg_value: ?*anyopaque) callconv(.c) void; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:481:3: warning: TODO implement function '__atomic_store_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:480:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_store_ssize_relaxed(arg_obj: [*c]Py_ssize_t, arg_value: Py_ssize_t) callconv(.c) void; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:486:3: warning: TODO implement function '__atomic_store_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:484:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_store_ullong_relaxed(arg_obj: [*c]c_ulonglong, arg_value: c_ulonglong) callconv(.c) void; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:493:18: warning: TODO implement function '__atomic_load_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:492:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_load_ptr_acquire(arg_obj: ?*const anyopaque) callconv(.c) ?*anyopaque; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:497:21: warning: TODO implement function '__atomic_load_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:496:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_load_uintptr_acquire(arg_obj: [*c]const usize) callconv(.c) usize; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:501:3: warning: TODO implement function '__atomic_store_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:500:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_store_ptr_release(arg_obj: ?*anyopaque, arg_value: ?*anyopaque) callconv(.c) void; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:505:3: warning: TODO implement function '__atomic_store_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:504:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_store_uintptr_release(arg_obj: [*c]usize, arg_value: usize) callconv(.c) void; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:513:3: warning: TODO implement function '__atomic_store_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:512:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_store_ssize_release(arg_obj: [*c]Py_ssize_t, arg_value: Py_ssize_t) callconv(.c) void; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:509:3: warning: TODO implement function '__atomic_store_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:508:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_store_int_release(arg_obj: [*c]c_int, arg_value: c_int) callconv(.c) void; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:517:10: warning: TODO implement function '__atomic_load_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:516:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_load_int_acquire(arg_obj: [*c]const c_int) callconv(.c) c_int; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:521:3: warning: TODO implement function '__atomic_store_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:520:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_store_uint32_release(arg_obj: [*c]u32, arg_value: u32) callconv(.c) void; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:525:3: warning: TODO implement function '__atomic_store_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:524:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_store_uint64_release(arg_obj: [*c]u64, arg_value: u64) callconv(.c) void; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:529:10: warning: TODO implement function '__atomic_load_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:528:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_load_uint64_acquire(arg_obj: [*c]const u64) callconv(.c) u64; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:533:10: warning: TODO implement function '__atomic_load_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:532:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_load_uint32_acquire(arg_obj: [*c]const u32) callconv(.c) u32; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:537:10: warning: TODO implement function '__atomic_load_n' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:536:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_load_ssize_acquire(arg_obj: [*c]const Py_ssize_t) callconv(.c) Py_ssize_t; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:543:3: warning: TODO implement function '__atomic_thread_fence' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:542:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_fence_seq_cst() callconv(.c) void; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:547:3: warning: TODO implement function '__atomic_thread_fence' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:546:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_fence_acquire() callconv(.c) void; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:551:3: warning: TODO implement function '__atomic_thread_fence' in std.zig.c_builtins
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyatomic_gcc.h:550:1: warning: unable to translate function, demoted to extern
pub extern fn _Py_atomic_fence_release() callconv(.c) void;
pub const struct_PyMutex = extern struct {
    _bits: u8 = 0,
    pub const PyMutex_Lock = __root.PyMutex_Lock;
    pub const PyMutex_Unlock = __root.PyMutex_Unlock;
    pub const _PyMutex_Lock = __root._PyMutex_Lock;
    pub const _PyMutex_Unlock = __root._PyMutex_Unlock;
    pub const Lock = __root.PyMutex_Lock;
    pub const Unlock = __root.PyMutex_Unlock;
};
pub const PyMutex = struct_PyMutex;
pub extern fn PyMutex_Lock(m: [*c]PyMutex) void;
pub extern fn PyMutex_Unlock(m: [*c]PyMutex) void;
pub fn _PyMutex_Lock(arg_m: [*c]PyMutex) callconv(.c) void {
    var m = arg_m;
    _ = &m;
    var expected: u8 = _Py_UNLOCKED;
    _ = &expected;
    if (!(_Py_atomic_compare_exchange_uint8(&m.*._bits, &expected, _Py_LOCKED) != 0)) {
        PyMutex_Lock(m);
    }
}
pub fn _PyMutex_Unlock(arg_m: [*c]PyMutex) callconv(.c) void {
    var m = arg_m;
    _ = &m;
    var expected: u8 = _Py_LOCKED;
    _ = &expected;
    if (!(_Py_atomic_compare_exchange_uint8(&m.*._bits, &expected, _Py_UNLOCKED) != 0)) {
        PyMutex_Unlock(m);
    }
}
pub const PyVarObject = extern struct {
    ob_base: PyObject = @import("std").mem.zeroes(PyObject),
    ob_size: Py_ssize_t = 0,
    pub const Py_SET_SIZE = __root.Py_SET_SIZE;
    pub const PyObject_InitVar = __root.PyObject_InitVar;
    pub const _PyObject_GC_Resize = __root._PyObject_GC_Resize;
    pub const SIZE = __root.Py_SET_SIZE;
    pub const InitVar = __root.PyObject_InitVar;
    pub const Resize = __root._PyObject_GC_Resize;
};
pub extern fn Py_Is(x: [*c]PyObject, y: [*c]PyObject) c_int;
pub fn Py_REFCNT(arg_ob: [*c]PyObject) callconv(.c) Py_ssize_t {
    var ob = arg_ob;
    _ = &ob;
    return ob.*.unnamed_0.ob_refcnt;
}
pub fn Py_TYPE(arg_ob: [*c]PyObject) callconv(.c) [*c]PyTypeObject {
    var ob = arg_ob;
    _ = &ob;
    return ob.*.ob_type;
}
pub extern var PyLong_Type: PyTypeObject;
pub extern var PyBool_Type: PyTypeObject;
pub fn Py_SIZE(arg_ob: [*c]PyObject) callconv(.c) Py_ssize_t {
    var ob = arg_ob;
    _ = &ob;
    _ = !!(ob.*.ob_type != (&PyLong_Type)) or ((blk: {
        _assert("ob->ob_type != &PyLong_Type", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\object.h", 347);
        break :blk 0;
    }) != 0);
    _ = !!(ob.*.ob_type != (&PyBool_Type)) or ((blk: {
        _assert("ob->ob_type != &PyBool_Type", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\object.h", 348);
        break :blk 0;
    }) != 0);
    return @as([*c]PyVarObject, @ptrCast(@alignCast(ob))).*.ob_size;
}
pub inline fn _Py_IsImmortal(arg_op: [*c]PyObject) c_int {
    var op = arg_op;
    _ = &op;
    return @intFromBool(@as(i32, @truncate(op.*.unnamed_0.ob_refcnt)) < @as(c_int, 0));
}
pub fn Py_IS_TYPE(arg_ob: [*c]PyObject, arg_type: [*c]PyTypeObject) callconv(.c) c_int {
    var ob = arg_ob;
    _ = &ob;
    var @"type" = arg_type;
    _ = &@"type";
    return @intFromBool(Py_TYPE(ob) == @"type");
}
pub extern fn _Py_SetRefcnt(ob: [*c]PyObject, refcnt: Py_ssize_t) void;
pub fn Py_SET_REFCNT(arg_ob: [*c]PyObject, arg_refcnt: Py_ssize_t) callconv(.c) void {
    var ob = arg_ob;
    _ = &ob;
    var refcnt = arg_refcnt;
    _ = &refcnt;
    if (_Py_IsImmortal(ob) != 0) {
        return;
    }
    ob.*.unnamed_0.ob_refcnt = refcnt;
}
pub fn Py_SET_TYPE(arg_ob: [*c]PyObject, arg_type: [*c]PyTypeObject) callconv(.c) void {
    var ob = arg_ob;
    _ = &ob;
    var @"type" = arg_type;
    _ = &@"type";
    ob.*.ob_type = @"type";
}
pub fn Py_SET_SIZE(arg_ob: [*c]PyVarObject, arg_size: Py_ssize_t) callconv(.c) void {
    var ob = arg_ob;
    _ = &ob;
    var size = arg_size;
    _ = &size;
    _ = !!(ob.*.ob_base.ob_type != (&PyLong_Type)) or ((blk: {
        _assert("ob->ob_base.ob_type != &PyLong_Type", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\object.h", 433);
        break :blk 0;
    }) != 0);
    _ = !!(ob.*.ob_base.ob_type != (&PyBool_Type)) or ((blk: {
        _assert("ob->ob_base.ob_type != &PyBool_Type", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\object.h", 434);
        break :blk 0;
    }) != 0);
    ob.*.ob_size = size;
}
pub const unaryfunc = ?*const fn ([*c]PyObject) callconv(.c) [*c]PyObject;
pub const binaryfunc = ?*const fn ([*c]PyObject, [*c]PyObject) callconv(.c) [*c]PyObject;
pub const lenfunc = ?*const fn ([*c]PyObject) callconv(.c) Py_ssize_t;
pub const ssizeargfunc = ?*const fn ([*c]PyObject, Py_ssize_t) callconv(.c) [*c]PyObject;
pub const ssizessizeargfunc = ?*const fn ([*c]PyObject, Py_ssize_t, Py_ssize_t) callconv(.c) [*c]PyObject;
pub const ssizeobjargproc = ?*const fn ([*c]PyObject, Py_ssize_t, [*c]PyObject) callconv(.c) c_int;
pub const ssizessizeobjargproc = ?*const fn ([*c]PyObject, Py_ssize_t, Py_ssize_t, [*c]PyObject) callconv(.c) c_int;
pub const objobjargproc = ?*const fn ([*c]PyObject, [*c]PyObject, [*c]PyObject) callconv(.c) c_int;
pub const objobjproc = ?*const fn ([*c]PyObject, [*c]PyObject) callconv(.c) c_int;
pub const PyType_Slot = extern struct {
    slot: c_int = 0,
    pfunc: ?*anyopaque = null,
};
pub const PyType_Spec = extern struct {
    name: [*c]const u8 = null,
    basicsize: c_int = 0,
    itemsize: c_int = 0,
    flags: c_uint = 0,
    slots: [*c]PyType_Slot = null,
    pub const PyType_FromSpec = __root.PyType_FromSpec;
    pub const PyType_FromSpecWithBases = __root.PyType_FromSpecWithBases;
    pub const FromSpec = __root.PyType_FromSpec;
    pub const FromSpecWithBases = __root.PyType_FromSpecWithBases;
};
pub extern fn PyType_FromSpec([*c]PyType_Spec) [*c]PyObject;
pub extern fn PyType_FromSpecWithBases([*c]PyType_Spec, [*c]PyObject) [*c]PyObject;
pub extern fn PyType_GetSlot([*c]PyTypeObject, c_int) ?*anyopaque;
pub extern fn PyType_FromModuleAndSpec([*c]PyObject, [*c]PyType_Spec, [*c]PyObject) [*c]PyObject;
pub extern fn PyType_GetModule([*c]PyTypeObject) [*c]PyObject;
pub extern fn PyType_GetModuleState([*c]PyTypeObject) ?*anyopaque;
pub extern fn PyType_GetName([*c]PyTypeObject) [*c]PyObject;
pub extern fn PyType_GetQualName([*c]PyTypeObject) [*c]PyObject;
pub extern fn PyType_GetFullyQualifiedName(@"type": [*c]PyTypeObject) [*c]PyObject;
pub extern fn PyType_GetModuleName(@"type": [*c]PyTypeObject) [*c]PyObject;
pub extern fn PyType_FromMetaclass([*c]PyTypeObject, [*c]PyObject, [*c]PyType_Spec, [*c]PyObject) [*c]PyObject;
pub extern fn PyObject_GetTypeData(obj: [*c]PyObject, cls: [*c]PyTypeObject) ?*anyopaque;
pub extern fn PyType_GetTypeDataSize(cls: [*c]PyTypeObject) Py_ssize_t;
pub extern fn PyType_IsSubtype([*c]PyTypeObject, [*c]PyTypeObject) c_int;
pub fn PyObject_TypeCheck(arg_ob: [*c]PyObject, arg_type: [*c]PyTypeObject) callconv(.c) c_int {
    var ob = arg_ob;
    _ = &ob;
    var @"type" = arg_type;
    _ = &@"type";
    return @intFromBool((Py_IS_TYPE(ob, @"type") != 0) or (PyType_IsSubtype(Py_TYPE(ob), @"type") != 0));
}
pub extern var PyType_Type: PyTypeObject;
pub extern var PyBaseObject_Type: PyTypeObject;
pub extern var PySuper_Type: PyTypeObject;
pub extern fn PyType_GetFlags([*c]PyTypeObject) c_ulong;
pub extern fn PyType_Ready([*c]PyTypeObject) c_int;
pub extern fn PyType_GenericAlloc([*c]PyTypeObject, Py_ssize_t) [*c]PyObject;
pub extern fn PyType_GenericNew([*c]PyTypeObject, [*c]PyObject, [*c]PyObject) [*c]PyObject;
pub extern fn PyType_ClearCache() c_uint;
pub extern fn PyType_Modified([*c]PyTypeObject) void;
pub extern fn PyObject_Repr([*c]PyObject) [*c]PyObject;
pub extern fn PyObject_Str([*c]PyObject) [*c]PyObject;
pub extern fn PyObject_ASCII([*c]PyObject) [*c]PyObject;
pub extern fn PyObject_Bytes([*c]PyObject) [*c]PyObject;
pub extern fn PyObject_RichCompare([*c]PyObject, [*c]PyObject, c_int) [*c]PyObject;
pub extern fn PyObject_RichCompareBool([*c]PyObject, [*c]PyObject, c_int) c_int;
pub extern fn PyObject_GetAttrString([*c]PyObject, [*c]const u8) [*c]PyObject;
pub extern fn PyObject_SetAttrString([*c]PyObject, [*c]const u8, [*c]PyObject) c_int;
pub extern fn PyObject_DelAttrString(v: [*c]PyObject, name: [*c]const u8) c_int;
pub extern fn PyObject_HasAttrString([*c]PyObject, [*c]const u8) c_int;
pub extern fn PyObject_GetAttr([*c]PyObject, [*c]PyObject) [*c]PyObject;
pub extern fn PyObject_GetOptionalAttr([*c]PyObject, [*c]PyObject, [*c][*c]PyObject) c_int;
pub extern fn PyObject_GetOptionalAttrString([*c]PyObject, [*c]const u8, [*c][*c]PyObject) c_int;
pub extern fn PyObject_SetAttr([*c]PyObject, [*c]PyObject, [*c]PyObject) c_int;
pub extern fn PyObject_DelAttr(v: [*c]PyObject, name: [*c]PyObject) c_int;
pub extern fn PyObject_HasAttr([*c]PyObject, [*c]PyObject) c_int;
pub extern fn PyObject_HasAttrWithError([*c]PyObject, [*c]PyObject) c_int;
pub extern fn PyObject_HasAttrStringWithError([*c]PyObject, [*c]const u8) c_int;
pub extern fn PyObject_SelfIter([*c]PyObject) [*c]PyObject;
pub extern fn PyObject_GenericGetAttr([*c]PyObject, [*c]PyObject) [*c]PyObject;
pub extern fn PyObject_GenericSetAttr([*c]PyObject, [*c]PyObject, [*c]PyObject) c_int;
pub extern fn PyObject_GenericSetDict([*c]PyObject, [*c]PyObject, ?*anyopaque) c_int;
pub extern fn PyObject_Hash([*c]PyObject) Py_hash_t;
pub extern fn PyObject_HashNotImplemented([*c]PyObject) Py_hash_t;
pub extern fn PyObject_IsTrue([*c]PyObject) c_int;
pub extern fn PyObject_Not([*c]PyObject) c_int;
pub extern fn PyCallable_Check([*c]PyObject) c_int;
pub extern fn PyObject_ClearWeakRefs([*c]PyObject) void;
pub extern fn PyObject_Dir([*c]PyObject) [*c]PyObject;
pub extern fn Py_ReprEnter([*c]PyObject) c_int;
pub extern fn Py_ReprLeave([*c]PyObject) void;
pub extern fn _Py_Dealloc([*c]PyObject) void;
pub extern fn Py_IncRef([*c]PyObject) void;
pub extern fn Py_DecRef([*c]PyObject) void;
pub extern fn _Py_IncRef([*c]PyObject) void;
pub extern fn _Py_DecRef([*c]PyObject) void;
pub inline fn Py_INCREF(arg_op: [*c]PyObject) void {
    var op = arg_op;
    _ = &op;
    var cur_refcnt: u32 = op.*.unnamed_0.ob_refcnt_split[PY_BIG_ENDIAN];
    _ = &cur_refcnt;
    var new_refcnt: u32 = cur_refcnt +% @as(u32, 1);
    _ = &new_refcnt;
    if (new_refcnt == @as(u32, 0)) {
        return;
    }
    op.*.unnamed_0.ob_refcnt_split[PY_BIG_ENDIAN] = new_refcnt;
    _ = @as(c_int, 0);
}
pub inline fn Py_DECREF(arg_op: [*c]PyObject) void {
    var op = arg_op;
    _ = &op;
    if (_Py_IsImmortal(op) != 0) {
        return;
    }
    _ = @as(c_int, 0);
    if ((blk: {
        const ref = &op.*.unnamed_0.ob_refcnt;
        ref.* -= 1;
        break :blk ref.*;
    }) == @as(Py_ssize_t, 0)) {
        _Py_Dealloc(op);
    }
}
pub fn Py_XINCREF(arg_op: [*c]PyObject) callconv(.c) void {
    var op = arg_op;
    _ = &op;
    if (@as(?*anyopaque, @ptrCast(@alignCast(op))) != @as(?*anyopaque, null)) {
        Py_INCREF(op);
    }
}
pub fn Py_XDECREF(arg_op: [*c]PyObject) callconv(.c) void {
    var op = arg_op;
    _ = &op;
    if (@as(?*anyopaque, @ptrCast(@alignCast(op))) != @as(?*anyopaque, null)) {
        Py_DECREF(op);
    }
}
pub extern fn Py_NewRef(obj: [*c]PyObject) [*c]PyObject;
pub extern fn Py_XNewRef(obj: [*c]PyObject) [*c]PyObject;
pub fn _Py_NewRef(arg_obj: [*c]PyObject) callconv(.c) [*c]PyObject {
    var obj = arg_obj;
    _ = &obj;
    Py_INCREF(obj);
    return obj;
}
pub fn _Py_XNewRef(arg_obj: [*c]PyObject) callconv(.c) [*c]PyObject {
    var obj = arg_obj;
    _ = &obj;
    Py_XINCREF(obj);
    return obj;
}
pub extern fn Py_GetConstant(constant_id: c_uint) [*c]PyObject;
pub extern fn Py_GetConstantBorrowed(constant_id: c_uint) [*c]PyObject;
pub extern var _Py_NoneStruct: PyObject;
pub extern fn Py_IsNone(x: [*c]PyObject) c_int;
pub extern var _Py_NotImplementedStruct: PyObject;
pub const PYGEN_RETURN: c_int = 0;
pub const PYGEN_ERROR: c_int = -1;
pub const PYGEN_NEXT: c_int = 1;
pub const PySendResult = c_int;
pub extern fn _Py_NewReference(op: [*c]PyObject) void;
pub extern fn _Py_NewReferenceNoTotal(op: [*c]PyObject) void;
pub extern fn _Py_ResurrectReference(op: [*c]PyObject) void;
const struct_unnamed_5 = extern struct {
    v: u8 = 0,
};
pub const struct__Py_Identifier = extern struct {
    string: [*c]const u8 = null,
    index: Py_ssize_t = 0,
    mutex: struct_unnamed_5 = @import("std").mem.zeroes(struct_unnamed_5),
    pub const _PyUnicode_FromId = __root._PyUnicode_FromId;
    pub const FromId = __root._PyUnicode_FromId;
};
pub const _Py_Identifier = struct__Py_Identifier;
pub const PyNumberMethods = extern struct {
    nb_add: binaryfunc = null,
    nb_subtract: binaryfunc = null,
    nb_multiply: binaryfunc = null,
    nb_remainder: binaryfunc = null,
    nb_divmod: binaryfunc = null,
    nb_power: ternaryfunc = null,
    nb_negative: unaryfunc = null,
    nb_positive: unaryfunc = null,
    nb_absolute: unaryfunc = null,
    nb_bool: inquiry = null,
    nb_invert: unaryfunc = null,
    nb_lshift: binaryfunc = null,
    nb_rshift: binaryfunc = null,
    nb_and: binaryfunc = null,
    nb_xor: binaryfunc = null,
    nb_or: binaryfunc = null,
    nb_int: unaryfunc = null,
    nb_reserved: ?*anyopaque = null,
    nb_float: unaryfunc = null,
    nb_inplace_add: binaryfunc = null,
    nb_inplace_subtract: binaryfunc = null,
    nb_inplace_multiply: binaryfunc = null,
    nb_inplace_remainder: binaryfunc = null,
    nb_inplace_power: ternaryfunc = null,
    nb_inplace_lshift: binaryfunc = null,
    nb_inplace_rshift: binaryfunc = null,
    nb_inplace_and: binaryfunc = null,
    nb_inplace_xor: binaryfunc = null,
    nb_inplace_or: binaryfunc = null,
    nb_floor_divide: binaryfunc = null,
    nb_true_divide: binaryfunc = null,
    nb_inplace_floor_divide: binaryfunc = null,
    nb_inplace_true_divide: binaryfunc = null,
    nb_index: unaryfunc = null,
    nb_matrix_multiply: binaryfunc = null,
    nb_inplace_matrix_multiply: binaryfunc = null,
};
pub const PySequenceMethods = extern struct {
    sq_length: lenfunc = null,
    sq_concat: binaryfunc = null,
    sq_repeat: ssizeargfunc = null,
    sq_item: ssizeargfunc = null,
    was_sq_slice: ?*anyopaque = null,
    sq_ass_item: ssizeobjargproc = null,
    was_sq_ass_slice: ?*anyopaque = null,
    sq_contains: objobjproc = null,
    sq_inplace_concat: binaryfunc = null,
    sq_inplace_repeat: ssizeargfunc = null,
};
pub const PyMappingMethods = extern struct {
    mp_length: lenfunc = null,
    mp_subscript: binaryfunc = null,
    mp_ass_subscript: objobjargproc = null,
};
pub const sendfunc = ?*const fn (iter: [*c]PyObject, value: [*c]PyObject, result: [*c][*c]PyObject) callconv(.c) PySendResult;
pub const PyAsyncMethods = extern struct {
    am_await: unaryfunc = null,
    am_aiter: unaryfunc = null,
    am_anext: unaryfunc = null,
    am_send: sendfunc = null,
};
pub const PyBufferProcs = extern struct {
    bf_getbuffer: getbufferproc = null,
    bf_releasebuffer: releasebufferproc = null,
};
pub const printfunc = Py_ssize_t;
pub const struct__specialization_cache = extern struct {
    getitem: [*c]PyObject = null,
    getitem_version: u32 = 0,
    init: [*c]PyObject = null,
};
pub const struct__dictkeysobject_6 = opaque {};
pub const struct__heaptypeobject = extern struct {
    ht_type: PyTypeObject = @import("std").mem.zeroes(PyTypeObject),
    as_async: PyAsyncMethods = @import("std").mem.zeroes(PyAsyncMethods),
    as_number: PyNumberMethods = @import("std").mem.zeroes(PyNumberMethods),
    as_mapping: PyMappingMethods = @import("std").mem.zeroes(PyMappingMethods),
    as_sequence: PySequenceMethods = @import("std").mem.zeroes(PySequenceMethods),
    as_buffer: PyBufferProcs = @import("std").mem.zeroes(PyBufferProcs),
    ht_name: [*c]PyObject = null,
    ht_slots: [*c]PyObject = null,
    ht_qualname: [*c]PyObject = null,
    ht_cached_keys: ?*struct__dictkeysobject_6 = null,
    ht_module: [*c]PyObject = null,
    _ht_tpname: [*c]u8 = null,
    _spec_cache: struct__specialization_cache = @import("std").mem.zeroes(struct__specialization_cache),
};
pub const PyHeapTypeObject = struct__heaptypeobject;
pub extern fn _PyType_Name([*c]PyTypeObject) [*c]const u8;
pub extern fn _PyType_Lookup([*c]PyTypeObject, [*c]PyObject) [*c]PyObject;
pub extern fn _PyType_LookupRef([*c]PyTypeObject, [*c]PyObject) [*c]PyObject;
pub extern fn PyType_GetDict([*c]PyTypeObject) [*c]PyObject;
pub extern fn PyObject_Print([*c]PyObject, [*c]FILE, c_int) c_int;
pub extern fn _Py_BreakPoint() void;
pub extern fn _PyObject_Dump([*c]PyObject) void;
pub extern fn _PyObject_GetAttrId([*c]PyObject, [*c]_Py_Identifier) [*c]PyObject;
pub extern fn _PyObject_GetDictPtr([*c]PyObject) [*c][*c]PyObject;
pub extern fn PyObject_CallFinalizer([*c]PyObject) void;
pub extern fn PyObject_CallFinalizerFromDealloc([*c]PyObject) c_int;
pub extern fn PyUnstable_Object_ClearWeakRefsNoCallbacks([*c]PyObject) void;
pub extern fn _PyObject_GenericGetAttrWithDict([*c]PyObject, [*c]PyObject, [*c]PyObject, c_int) [*c]PyObject;
pub extern fn _PyObject_GenericSetAttrWithDict([*c]PyObject, [*c]PyObject, [*c]PyObject, [*c]PyObject) c_int;
pub extern fn _PyObject_FunctionStr([*c]PyObject) [*c]PyObject;
pub extern fn _PyObject_AssertFailed(obj: [*c]PyObject, expr: [*c]const u8, msg: [*c]const u8, file: [*c]const u8, line: c_int, function: [*c]const u8) noreturn;
pub extern fn _PyTrash_begin(tstate: ?*PyThreadState, op: [*c]PyObject) c_int;
pub extern fn _PyTrash_end(tstate: ?*PyThreadState) void;
pub extern fn _PyTrash_thread_deposit_object(tstate: ?*PyThreadState, op: [*c]PyObject) void;
pub extern fn _PyTrash_thread_destroy_chain(tstate: ?*PyThreadState) void;
pub extern fn PyObject_GetItemData(obj: [*c]PyObject) ?*anyopaque;
pub extern fn PyObject_VisitManagedDict(obj: [*c]PyObject, visit: visitproc, arg: ?*anyopaque) c_int;
pub extern fn _PyObject_SetManagedDict(obj: [*c]PyObject, new_dict: [*c]PyObject) c_int;
pub extern fn PyObject_ClearManagedDict(obj: [*c]PyObject) void;
pub const PyType_WatchCallback = ?*const fn ([*c]PyTypeObject) callconv(.c) c_int;
pub extern fn PyType_AddWatcher(callback: PyType_WatchCallback) c_int;
pub extern fn PyType_ClearWatcher(watcher_id: c_int) c_int;
pub extern fn PyType_Watch(watcher_id: c_int, @"type": [*c]PyObject) c_int;
pub extern fn PyType_Unwatch(watcher_id: c_int, @"type": [*c]PyObject) c_int;
pub extern fn PyUnstable_Type_AssignVersionTag(@"type": [*c]PyTypeObject) c_int;
pub const PyRefTracer_CREATE: c_int = 0;
pub const PyRefTracer_DESTROY: c_int = 1;
pub const PyRefTracerEvent = c_uint;
pub const PyRefTracer = ?*const fn ([*c]PyObject, event: PyRefTracerEvent, ?*anyopaque) callconv(.c) c_int;
pub extern fn PyRefTracer_SetTracer(tracer: PyRefTracer, data: ?*anyopaque) c_int;
pub extern fn PyRefTracer_GetTracer([*c]?*anyopaque) PyRefTracer;
pub fn PyType_HasFeature(arg_type: [*c]PyTypeObject, arg_feature: c_ulong) callconv(.c) c_int {
    var @"type" = arg_type;
    _ = &@"type";
    var feature = arg_feature;
    _ = &feature;
    var flags: c_ulong = undefined;
    _ = &flags;
    flags = @"type".*.tp_flags;
    return @intFromBool((flags & feature) != @as(c_ulong, 0));
}
pub fn PyType_Check(arg_op: [*c]PyObject) callconv(.c) c_int {
    var op = arg_op;
    _ = &op;
    return PyType_HasFeature(Py_TYPE(op), @as(c_ulong, 1) << @intCast(@as(c_ulong, 31)));
}
pub fn PyType_CheckExact(arg_op: [*c]PyObject) callconv(.c) c_int {
    var op = arg_op;
    _ = &op;
    return Py_IS_TYPE(op, &PyType_Type);
}
pub extern fn PyType_GetModuleByDef([*c]PyTypeObject, [*c]PyModuleDef) [*c]PyObject;
pub extern fn PyObject_Malloc(size: usize) ?*anyopaque;
pub extern fn PyObject_Calloc(nelem: usize, elsize: usize) ?*anyopaque;
pub extern fn PyObject_Realloc(ptr: ?*anyopaque, new_size: usize) ?*anyopaque;
pub extern fn PyObject_Free(ptr: ?*anyopaque) void;
pub extern fn PyObject_Init([*c]PyObject, [*c]PyTypeObject) [*c]PyObject;
pub extern fn PyObject_InitVar([*c]PyVarObject, [*c]PyTypeObject, Py_ssize_t) [*c]PyVarObject;
pub extern fn _PyObject_New([*c]PyTypeObject) [*c]PyObject;
pub extern fn _PyObject_NewVar([*c]PyTypeObject, Py_ssize_t) [*c]PyVarObject;
pub extern fn PyGC_Collect() Py_ssize_t;
pub extern fn PyGC_Enable() c_int;
pub extern fn PyGC_Disable() c_int;
pub extern fn PyGC_IsEnabled() c_int;
pub extern fn _PyObject_GC_Resize([*c]PyVarObject, Py_ssize_t) [*c]PyVarObject;
pub extern fn _PyObject_GC_New([*c]PyTypeObject) [*c]PyObject;
pub extern fn _PyObject_GC_NewVar([*c]PyTypeObject, Py_ssize_t) [*c]PyVarObject;
pub extern fn PyObject_GC_Track(?*anyopaque) void;
pub extern fn PyObject_GC_UnTrack(?*anyopaque) void;
pub extern fn PyObject_GC_Del(?*anyopaque) void;
pub extern fn PyObject_GC_IsTracked([*c]PyObject) c_int;
pub extern fn PyObject_GC_IsFinalized([*c]PyObject) c_int;
pub fn _PyObject_SIZE(arg_type: [*c]PyTypeObject) callconv(.c) usize {
    var @"type" = arg_type;
    _ = &@"type";
    return @as(usize, @bitCast(@as(c_longlong, @"type".*.tp_basicsize)));
}
pub fn _PyObject_VAR_SIZE(arg_type: [*c]PyTypeObject, arg_nitems: Py_ssize_t) callconv(.c) usize {
    var @"type" = arg_type;
    _ = &@"type";
    var nitems = arg_nitems;
    _ = &nitems;
    var size: usize = @as(usize, @bitCast(@as(c_longlong, @"type".*.tp_basicsize)));
    _ = &size;
    size +%= @as(usize, @bitCast(@as(c_longlong, nitems))) *% @as(usize, @bitCast(@as(c_longlong, @"type".*.tp_itemsize)));
    return (size +% @as(usize, @bitCast(@as(c_longlong, SIZEOF_VOID_P - @as(c_int, 1))))) & ~@as(usize, @bitCast(@as(c_longlong, SIZEOF_VOID_P - @as(c_int, 1))));
}
pub const PyObjectArenaAllocator = extern struct {
    ctx: ?*anyopaque = null,
    alloc: ?*const fn (ctx: ?*anyopaque, size: usize) callconv(.c) ?*anyopaque = null,
    free: ?*const fn (ctx: ?*anyopaque, ptr: ?*anyopaque, size: usize) callconv(.c) void = null,
    pub const PyObject_GetArenaAllocator = __root.PyObject_GetArenaAllocator;
    pub const PyObject_SetArenaAllocator = __root.PyObject_SetArenaAllocator;
    pub const GetArenaAllocator = __root.PyObject_GetArenaAllocator;
    pub const SetArenaAllocator = __root.PyObject_SetArenaAllocator;
};
pub extern fn PyObject_GetArenaAllocator(allocator: [*c]PyObjectArenaAllocator) void;
pub extern fn PyObject_SetArenaAllocator(allocator: [*c]PyObjectArenaAllocator) void;
pub extern fn PyObject_IS_GC(obj: [*c]PyObject) c_int;
pub extern fn PyType_SUPPORTS_WEAKREFS(@"type": [*c]PyTypeObject) c_int;
pub extern fn PyObject_GET_WEAKREFS_LISTPTR(op: [*c]PyObject) [*c][*c]PyObject;
pub extern fn PyUnstable_Object_GC_NewWithExtraData([*c]PyTypeObject, usize) [*c]PyObject;
pub const gcvisitobjects_t = ?*const fn ([*c]PyObject, ?*anyopaque) callconv(.c) c_int;
pub extern fn PyUnstable_GC_VisitObjects(callback: gcvisitobjects_t, arg: ?*anyopaque) void;
pub extern fn _Py_HashDouble([*c]PyObject, f64) Py_hash_t;
pub const PyHash_FuncDef = extern struct {
    hash: ?*const fn (?*const anyopaque, Py_ssize_t) callconv(.c) Py_hash_t = null,
    name: [*c]const u8 = null,
    hash_bits: c_int = 0,
    seed_bits: c_int = 0,
};
pub extern fn PyHash_GetFuncDef() [*c]PyHash_FuncDef;
pub extern fn Py_HashPointer(ptr: ?*const anyopaque) Py_hash_t;
pub extern fn PyObject_GenericHash([*c]PyObject) Py_hash_t;
pub extern var Py_DebugFlag: c_int;
pub extern var Py_VerboseFlag: c_int;
pub extern var Py_QuietFlag: c_int;
pub extern var Py_InteractiveFlag: c_int;
pub extern var Py_InspectFlag: c_int;
pub extern var Py_OptimizeFlag: c_int;
pub extern var Py_NoSiteFlag: c_int;
pub extern var Py_BytesWarningFlag: c_int;
pub extern var Py_FrozenFlag: c_int;
pub extern var Py_IgnoreEnvironmentFlag: c_int;
pub extern var Py_DontWriteBytecodeFlag: c_int;
pub extern var Py_NoUserSiteDirectory: c_int;
pub extern var Py_UnbufferedStdioFlag: c_int;
pub extern var Py_HashRandomizationFlag: c_int;
pub extern var Py_IsolatedFlag: c_int;
pub extern var Py_LegacyWindowsFSEncodingFlag: c_int;
pub extern var Py_LegacyWindowsStdioFlag: c_int;
pub extern fn Py_GETENV(name: [*c]const u8) [*c]u8;
pub extern var PyByteArray_Type: PyTypeObject;
pub extern var PyByteArrayIter_Type: PyTypeObject;
pub extern fn PyByteArray_FromObject([*c]PyObject) [*c]PyObject;
pub extern fn PyByteArray_Concat([*c]PyObject, [*c]PyObject) [*c]PyObject;
pub extern fn PyByteArray_FromStringAndSize([*c]const u8, Py_ssize_t) [*c]PyObject;
pub extern fn PyByteArray_Size([*c]PyObject) Py_ssize_t;
pub extern fn PyByteArray_AsString([*c]PyObject) [*c]u8;
pub extern fn PyByteArray_Resize([*c]PyObject, Py_ssize_t) c_int;
pub const PyByteArrayObject = extern struct {
    ob_base: PyVarObject = @import("std").mem.zeroes(PyVarObject),
    ob_alloc: Py_ssize_t = 0,
    ob_bytes: [*c]u8 = null,
    ob_start: [*c]u8 = null,
    ob_exports: Py_ssize_t = 0,
};
pub const _PyByteArray_empty_string: [*c]u8 = @extern([*c]u8, .{
    .name = "_PyByteArray_empty_string",
});
pub fn PyByteArray_AS_STRING(arg_op: [*c]PyObject) callconv(.c) [*c]u8 {
    var op = arg_op;
    _ = &op;
    var self: [*c]PyByteArrayObject = blk: {
        _ = !!(PyObject_TypeCheck(op, &PyByteArray_Type) != 0) or ((blk_1: {
            _assert("PyByteArray_Check(op)", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/bytearrayobject.h", 22);
            break :blk_1 0;
        }) != 0);
        break :blk @as([*c]PyByteArrayObject, @ptrCast(@alignCast(op)));
    };
    _ = &self;
    if (Py_SIZE(@as([*c]PyObject, @ptrCast(@alignCast(self)))) != 0) {
        return self.*.ob_start;
    }
    return _PyByteArray_empty_string;
}
pub fn PyByteArray_GET_SIZE(arg_op: [*c]PyObject) callconv(.c) Py_ssize_t {
    var op = arg_op;
    _ = &op;
    var self: [*c]PyByteArrayObject = blk: {
        _ = !!(PyObject_TypeCheck(op, &PyByteArray_Type) != 0) or ((blk_1: {
            _assert("PyByteArray_Check(op)", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/bytearrayobject.h", 31);
            break :blk_1 0;
        }) != 0);
        break :blk @as([*c]PyByteArrayObject, @ptrCast(@alignCast(op)));
    };
    _ = &self;
    return Py_SIZE(@as([*c]PyObject, @ptrCast(@alignCast(self))));
}
pub extern var PyBytes_Type: PyTypeObject;
pub extern var PyBytesIter_Type: PyTypeObject;
pub extern fn PyBytes_FromStringAndSize([*c]const u8, Py_ssize_t) [*c]PyObject;
pub extern fn PyBytes_FromString([*c]const u8) [*c]PyObject;
pub extern fn PyBytes_FromObject([*c]PyObject) [*c]PyObject;
pub extern fn PyBytes_FromFormatV([*c]const u8, va_list) [*c]PyObject;
pub extern fn PyBytes_FromFormat([*c]const u8, ...) [*c]PyObject;
pub extern fn PyBytes_Size([*c]PyObject) Py_ssize_t;
pub extern fn PyBytes_AsString([*c]PyObject) [*c]u8;
pub extern fn PyBytes_Repr([*c]PyObject, c_int) [*c]PyObject;
pub extern fn PyBytes_Concat([*c][*c]PyObject, [*c]PyObject) void;
pub extern fn PyBytes_ConcatAndDel([*c][*c]PyObject, [*c]PyObject) void;
pub extern fn PyBytes_DecodeEscape([*c]const u8, Py_ssize_t, [*c]const u8, Py_ssize_t, [*c]const u8) [*c]PyObject;
pub extern fn PyBytes_AsStringAndSize(obj: [*c]PyObject, s: [*c][*c]u8, len: [*c]Py_ssize_t) c_int;
pub const PyBytesObject = extern struct {
    ob_base: PyVarObject = @import("std").mem.zeroes(PyVarObject),
    ob_shash: Py_hash_t = 0,
    ob_sval: [1]u8 = @import("std").mem.zeroes([1]u8),
};
pub extern fn _PyBytes_Resize([*c][*c]PyObject, Py_ssize_t) c_int;
pub fn PyBytes_AS_STRING(arg_op: [*c]PyObject) callconv(.c) [*c]u8 {
    var op = arg_op;
    _ = &op;
    return @ptrCast(@alignCast(&(blk: {
        _ = !!(PyType_HasFeature(Py_TYPE(op), @as(c_ulong, 1) << @intCast(@as(c_ulong, 27))) != 0) or ((blk_1: {
            _assert("PyBytes_Check(op)", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/bytesobject.h", 25);
            break :blk_1 0;
        }) != 0);
        break :blk @as([*c]PyBytesObject, @ptrCast(@alignCast(op)));
    }).*.ob_sval));
}
pub fn PyBytes_GET_SIZE(arg_op: [*c]PyObject) callconv(.c) Py_ssize_t {
    var op = arg_op;
    _ = &op;
    var self: [*c]PyBytesObject = blk: {
        _ = !!(PyType_HasFeature(Py_TYPE(op), @as(c_ulong, 1) << @intCast(@as(c_ulong, 27))) != 0) or ((blk_1: {
            _assert("PyBytes_Check(op)", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/bytesobject.h", 30);
            break :blk_1 0;
        }) != 0);
        break :blk @as([*c]PyBytesObject, @ptrCast(@alignCast(op)));
    };
    _ = &self;
    return Py_SIZE(@as([*c]PyObject, @ptrCast(@alignCast(self))));
}
pub extern fn _PyBytes_Join(sep: [*c]PyObject, x: [*c]PyObject) [*c]PyObject;
pub const Py_UCS4 = u32;
pub const Py_UCS2 = u16;
pub const Py_UCS1 = u8;
pub extern var PyUnicode_Type: PyTypeObject;
pub extern var PyUnicodeIter_Type: PyTypeObject;
pub extern fn PyUnicode_FromStringAndSize(u: [*c]const u8, size: Py_ssize_t) [*c]PyObject;
pub extern fn PyUnicode_FromString(u: [*c]const u8) [*c]PyObject;
pub extern fn PyUnicode_Substring(str: [*c]PyObject, start: Py_ssize_t, end: Py_ssize_t) [*c]PyObject;
pub extern fn PyUnicode_AsUCS4(unicode: [*c]PyObject, buffer: [*c]Py_UCS4, buflen: Py_ssize_t, copy_null: c_int) [*c]Py_UCS4;
pub extern fn PyUnicode_AsUCS4Copy(unicode: [*c]PyObject) [*c]Py_UCS4;
pub extern fn PyUnicode_GetLength(unicode: [*c]PyObject) Py_ssize_t;
pub extern fn PyUnicode_ReadChar(unicode: [*c]PyObject, index: Py_ssize_t) Py_UCS4;
pub extern fn PyUnicode_WriteChar(unicode: [*c]PyObject, index: Py_ssize_t, character: Py_UCS4) c_int;
pub extern fn PyUnicode_Resize(unicode: [*c][*c]PyObject, length: Py_ssize_t) c_int;
pub extern fn PyUnicode_FromEncodedObject(obj: [*c]PyObject, encoding: [*c]const u8, errors: [*c]const u8) [*c]PyObject;
pub extern fn PyUnicode_FromObject(obj: [*c]PyObject) [*c]PyObject;
pub extern fn PyUnicode_FromFormatV(format: [*c]const u8, vargs: va_list) [*c]PyObject;
pub extern fn PyUnicode_FromFormat(format: [*c]const u8, ...) [*c]PyObject;
pub extern fn PyUnicode_InternInPlace([*c][*c]PyObject) void;
pub extern fn PyUnicode_InternFromString(u: [*c]const u8) [*c]PyObject;
pub extern fn PyUnicode_FromWideChar(w: [*c]const wchar_t, size: Py_ssize_t) [*c]PyObject;
pub extern fn PyUnicode_AsWideChar(unicode: [*c]PyObject, w: [*c]wchar_t, size: Py_ssize_t) Py_ssize_t;
pub extern fn PyUnicode_AsWideCharString(unicode: [*c]PyObject, size: [*c]Py_ssize_t) [*c]wchar_t;
pub extern fn PyUnicode_FromOrdinal(ordinal: c_int) [*c]PyObject;
pub extern fn PyUnicode_GetDefaultEncoding() [*c]const u8;
pub extern fn PyUnicode_Decode(s: [*c]const u8, size: Py_ssize_t, encoding: [*c]const u8, errors: [*c]const u8) [*c]PyObject;
pub extern fn PyUnicode_AsDecodedObject(unicode: [*c]PyObject, encoding: [*c]const u8, errors: [*c]const u8) [*c]PyObject;
pub extern fn PyUnicode_AsDecodedUnicode(unicode: [*c]PyObject, encoding: [*c]const u8, errors: [*c]const u8) [*c]PyObject;
pub extern fn PyUnicode_AsEncodedObject(unicode: [*c]PyObject, encoding: [*c]const u8, errors: [*c]const u8) [*c]PyObject;
pub extern fn PyUnicode_AsEncodedString(unicode: [*c]PyObject, encoding: [*c]const u8, errors: [*c]const u8) [*c]PyObject;
pub extern fn PyUnicode_AsEncodedUnicode(unicode: [*c]PyObject, encoding: [*c]const u8, errors: [*c]const u8) [*c]PyObject;
pub extern fn PyUnicode_BuildEncodingMap(string: [*c]PyObject) [*c]PyObject;
pub extern fn PyUnicode_DecodeUTF7(string: [*c]const u8, length: Py_ssize_t, errors: [*c]const u8) [*c]PyObject;
pub extern fn PyUnicode_DecodeUTF7Stateful(string: [*c]const u8, length: Py_ssize_t, errors: [*c]const u8, consumed: [*c]Py_ssize_t) [*c]PyObject;
pub extern fn PyUnicode_DecodeUTF8(string: [*c]const u8, length: Py_ssize_t, errors: [*c]const u8) [*c]PyObject;
pub extern fn PyUnicode_DecodeUTF8Stateful(string: [*c]const u8, length: Py_ssize_t, errors: [*c]const u8, consumed: [*c]Py_ssize_t) [*c]PyObject;
pub extern fn PyUnicode_AsUTF8String(unicode: [*c]PyObject) [*c]PyObject;
pub extern fn PyUnicode_AsUTF8AndSize(unicode: [*c]PyObject, size: [*c]Py_ssize_t) [*c]const u8;
pub extern fn PyUnicode_DecodeUTF32(string: [*c]const u8, length: Py_ssize_t, errors: [*c]const u8, byteorder: [*c]c_int) [*c]PyObject;
pub extern fn PyUnicode_DecodeUTF32Stateful(string: [*c]const u8, length: Py_ssize_t, errors: [*c]const u8, byteorder: [*c]c_int, consumed: [*c]Py_ssize_t) [*c]PyObject;
pub extern fn PyUnicode_AsUTF32String(unicode: [*c]PyObject) [*c]PyObject;
pub extern fn PyUnicode_DecodeUTF16(string: [*c]const u8, length: Py_ssize_t, errors: [*c]const u8, byteorder: [*c]c_int) [*c]PyObject;
pub extern fn PyUnicode_DecodeUTF16Stateful(string: [*c]const u8, length: Py_ssize_t, errors: [*c]const u8, byteorder: [*c]c_int, consumed: [*c]Py_ssize_t) [*c]PyObject;
pub extern fn PyUnicode_AsUTF16String(unicode: [*c]PyObject) [*c]PyObject;
pub extern fn PyUnicode_DecodeUnicodeEscape(string: [*c]const u8, length: Py_ssize_t, errors: [*c]const u8) [*c]PyObject;
pub extern fn PyUnicode_AsUnicodeEscapeString(unicode: [*c]PyObject) [*c]PyObject;
pub extern fn PyUnicode_DecodeRawUnicodeEscape(string: [*c]const u8, length: Py_ssize_t, errors: [*c]const u8) [*c]PyObject;
pub extern fn PyUnicode_AsRawUnicodeEscapeString(unicode: [*c]PyObject) [*c]PyObject;
pub extern fn PyUnicode_DecodeLatin1(string: [*c]const u8, length: Py_ssize_t, errors: [*c]const u8) [*c]PyObject;
pub extern fn PyUnicode_AsLatin1String(unicode: [*c]PyObject) [*c]PyObject;
pub extern fn PyUnicode_DecodeASCII(string: [*c]const u8, length: Py_ssize_t, errors: [*c]const u8) [*c]PyObject;
pub extern fn PyUnicode_AsASCIIString(unicode: [*c]PyObject) [*c]PyObject;
pub extern fn PyUnicode_DecodeCharmap(string: [*c]const u8, length: Py_ssize_t, mapping: [*c]PyObject, errors: [*c]const u8) [*c]PyObject;
pub extern fn PyUnicode_AsCharmapString(unicode: [*c]PyObject, mapping: [*c]PyObject) [*c]PyObject;
pub extern fn PyUnicode_DecodeMBCS(string: [*c]const u8, length: Py_ssize_t, errors: [*c]const u8) [*c]PyObject;
pub extern fn PyUnicode_DecodeMBCSStateful(string: [*c]const u8, length: Py_ssize_t, errors: [*c]const u8, consumed: [*c]Py_ssize_t) [*c]PyObject;
pub extern fn PyUnicode_DecodeCodePageStateful(code_page: c_int, string: [*c]const u8, length: Py_ssize_t, errors: [*c]const u8, consumed: [*c]Py_ssize_t) [*c]PyObject;
pub extern fn PyUnicode_AsMBCSString(unicode: [*c]PyObject) [*c]PyObject;
pub extern fn PyUnicode_EncodeCodePage(code_page: c_int, unicode: [*c]PyObject, errors: [*c]const u8) [*c]PyObject;
pub extern fn PyUnicode_DecodeLocaleAndSize(str: [*c]const u8, len: Py_ssize_t, errors: [*c]const u8) [*c]PyObject;
pub extern fn PyUnicode_DecodeLocale(str: [*c]const u8, errors: [*c]const u8) [*c]PyObject;
pub extern fn PyUnicode_EncodeLocale(unicode: [*c]PyObject, errors: [*c]const u8) [*c]PyObject;
pub extern fn PyUnicode_FSConverter([*c]PyObject, ?*anyopaque) c_int;
pub extern fn PyUnicode_FSDecoder([*c]PyObject, ?*anyopaque) c_int;
pub extern fn PyUnicode_DecodeFSDefault(s: [*c]const u8) [*c]PyObject;
pub extern fn PyUnicode_DecodeFSDefaultAndSize(s: [*c]const u8, size: Py_ssize_t) [*c]PyObject;
pub extern fn PyUnicode_EncodeFSDefault(unicode: [*c]PyObject) [*c]PyObject;
pub extern fn PyUnicode_Concat(left: [*c]PyObject, right: [*c]PyObject) [*c]PyObject;
pub extern fn PyUnicode_Append(pleft: [*c][*c]PyObject, right: [*c]PyObject) void;
pub extern fn PyUnicode_AppendAndDel(pleft: [*c][*c]PyObject, right: [*c]PyObject) void;
pub extern fn PyUnicode_Split(s: [*c]PyObject, sep: [*c]PyObject, maxsplit: Py_ssize_t) [*c]PyObject;
pub extern fn PyUnicode_Splitlines(s: [*c]PyObject, keepends: c_int) [*c]PyObject;
pub extern fn PyUnicode_Partition(s: [*c]PyObject, sep: [*c]PyObject) [*c]PyObject;
pub extern fn PyUnicode_RPartition(s: [*c]PyObject, sep: [*c]PyObject) [*c]PyObject;
pub extern fn PyUnicode_RSplit(s: [*c]PyObject, sep: [*c]PyObject, maxsplit: Py_ssize_t) [*c]PyObject;
pub extern fn PyUnicode_Translate(str: [*c]PyObject, table: [*c]PyObject, errors: [*c]const u8) [*c]PyObject;
pub extern fn PyUnicode_Join(separator: [*c]PyObject, seq: [*c]PyObject) [*c]PyObject;
pub extern fn PyUnicode_Tailmatch(str: [*c]PyObject, substr: [*c]PyObject, start: Py_ssize_t, end: Py_ssize_t, direction: c_int) Py_ssize_t;
pub extern fn PyUnicode_Find(str: [*c]PyObject, substr: [*c]PyObject, start: Py_ssize_t, end: Py_ssize_t, direction: c_int) Py_ssize_t;
pub extern fn PyUnicode_FindChar(str: [*c]PyObject, ch: Py_UCS4, start: Py_ssize_t, end: Py_ssize_t, direction: c_int) Py_ssize_t;
pub extern fn PyUnicode_Count(str: [*c]PyObject, substr: [*c]PyObject, start: Py_ssize_t, end: Py_ssize_t) Py_ssize_t;
pub extern fn PyUnicode_Replace(str: [*c]PyObject, substr: [*c]PyObject, replstr: [*c]PyObject, maxcount: Py_ssize_t) [*c]PyObject;
pub extern fn PyUnicode_Compare(left: [*c]PyObject, right: [*c]PyObject) c_int;
pub extern fn PyUnicode_CompareWithASCIIString(left: [*c]PyObject, right: [*c]const u8) c_int;
pub extern fn PyUnicode_EqualToUTF8([*c]PyObject, [*c]const u8) c_int;
pub extern fn PyUnicode_EqualToUTF8AndSize([*c]PyObject, [*c]const u8, Py_ssize_t) c_int;
pub extern fn PyUnicode_RichCompare(left: [*c]PyObject, right: [*c]PyObject, op: c_int) [*c]PyObject;
pub extern fn PyUnicode_Format(format: [*c]PyObject, args: [*c]PyObject) [*c]PyObject;
pub extern fn PyUnicode_Contains(container: [*c]PyObject, element: [*c]PyObject) c_int;
pub extern fn PyUnicode_IsIdentifier(s: [*c]PyObject) c_int;
pub const PY_UNICODE_TYPE = wchar_t;
pub const Py_UNICODE = wchar_t;
pub fn Py_UNICODE_IS_SURROGATE(arg_ch: Py_UCS4) callconv(.c) c_int {
    var ch = arg_ch;
    _ = &ch;
    return @intFromBool((@as(Py_UCS4, 55296) <= ch) and (ch <= @as(Py_UCS4, 57343)));
}
pub fn Py_UNICODE_IS_HIGH_SURROGATE(arg_ch: Py_UCS4) callconv(.c) c_int {
    var ch = arg_ch;
    _ = &ch;
    return @intFromBool((@as(Py_UCS4, 55296) <= ch) and (ch <= @as(Py_UCS4, 56319)));
}
pub fn Py_UNICODE_IS_LOW_SURROGATE(arg_ch: Py_UCS4) callconv(.c) c_int {
    var ch = arg_ch;
    _ = &ch;
    return @intFromBool((@as(Py_UCS4, 56320) <= ch) and (ch <= @as(Py_UCS4, 57343)));
}
pub fn Py_UNICODE_JOIN_SURROGATES(arg_high: Py_UCS4, arg_low: Py_UCS4) callconv(.c) Py_UCS4 {
    var high = arg_high;
    _ = &high;
    var low = arg_low;
    _ = &low;
    _ = !!(Py_UNICODE_IS_HIGH_SURROGATE(high) != 0) or ((blk: {
        _assert("Py_UNICODE_IS_HIGH_SURROGATE(high)", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/unicodeobject.h", 28);
        break :blk 0;
    }) != 0);
    _ = !!(Py_UNICODE_IS_LOW_SURROGATE(low) != 0) or ((blk: {
        _assert("Py_UNICODE_IS_LOW_SURROGATE(low)", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/unicodeobject.h", 29);
        break :blk 0;
    }) != 0);
    return @as(Py_UCS4, 65536) +% (((high & @as(Py_UCS4, 1023)) << @intCast(@as(Py_UCS4, 10))) | (low & @as(Py_UCS4, 1023)));
}
pub fn Py_UNICODE_HIGH_SURROGATE(arg_ch: Py_UCS4) callconv(.c) Py_UCS4 {
    var ch = arg_ch;
    _ = &ch;
    _ = !!((@as(Py_UCS4, 65536) <= ch) and (ch <= @as(Py_UCS4, 1114111))) or ((blk: {
        _assert("0x10000 <= ch && ch <= 0x10ffff", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/unicodeobject.h", 36);
        break :blk 0;
    }) != 0);
    return @as(Py_UCS4, @bitCast(@as(c_int, @as(c_int, 55296) - (@as(c_int, 65536) >> @intCast(@as(c_int, 10)))))) +% (ch >> @intCast(@as(Py_UCS4, 10)));
}
pub fn Py_UNICODE_LOW_SURROGATE(arg_ch: Py_UCS4) callconv(.c) Py_UCS4 {
    var ch = arg_ch;
    _ = &ch;
    _ = !!((@as(Py_UCS4, 65536) <= ch) and (ch <= @as(Py_UCS4, 1114111))) or ((blk: {
        _assert("0x10000 <= ch && ch <= 0x10ffff", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/unicodeobject.h", 43);
        break :blk 0;
    }) != 0);
    return @as(Py_UCS4, 56320) +% (ch & @as(Py_UCS4, 1023));
} // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/unicodeobject.h:112:22: warning: struct demoted to opaque type - has bitfield
const struct_unnamed_7 = opaque {}; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/unicodeobject.h:150:7: warning: struct demoted to opaque type - has opaque field
pub const PyASCIIObject = opaque {}; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/unicodeobject.h:157:19: warning: struct demoted to opaque type - has opaque field
pub const PyCompactUnicodeObject = opaque {}; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/unicodeobject.h:165:28: warning: struct demoted to opaque type - has opaque field
pub const PyUnicodeObject = opaque {}; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/unicodeobject.h:198:42: warning: member access of demoted record
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/unicodeobject.h:197:28: warning: unable to translate function, demoted to extern
pub extern fn PyUnicode_CHECK_INTERNED(arg_op: [*c]PyObject) callconv(.c) c_uint;
pub fn PyUnicode_IS_READY(arg__unused_op: [*c]PyObject) callconv(.c) c_uint {
    var _unused_op = arg__unused_op;
    _ = &_unused_op;
    return 1;
} // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/unicodeobject.h:212:42: warning: member access of demoted record
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/unicodeobject.h:211:28: warning: unable to translate function, demoted to extern
pub extern fn PyUnicode_IS_ASCII(arg_op: [*c]PyObject) callconv(.c) c_uint; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/unicodeobject.h:219:42: warning: member access of demoted record
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/unicodeobject.h:218:28: warning: unable to translate function, demoted to extern
pub extern fn PyUnicode_IS_COMPACT(arg_op: [*c]PyObject) callconv(.c) c_uint; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/unicodeobject.h:226:43: warning: member access of demoted record
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/unicodeobject.h:225:19: warning: unable to translate function, demoted to extern
pub extern fn PyUnicode_IS_COMPACT_ASCII(arg_op: [*c]PyObject) callconv(.c) c_int;
pub const PyUnicode_1BYTE_KIND: c_int = 1;
pub const PyUnicode_2BYTE_KIND: c_int = 2;
pub const PyUnicode_4BYTE_KIND: c_int = 4;
pub const enum_PyUnicode_Kind = c_uint;
pub fn _PyUnicode_COMPACT_DATA(arg_op: [*c]PyObject) callconv(.c) ?*anyopaque {
    var op = arg_op;
    _ = &op;
    if (PyUnicode_IS_ASCII(op) != 0) {
        return @as(?*anyopaque, @ptrCast(@alignCast((blk: {
            _ = !!(PyType_HasFeature(Py_TYPE(op), @as(c_ulong, 1) << @intCast(@as(c_ulong, 28))) != 0) or ((blk_1: {
                _assert("PyUnicode_Check(op)", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/unicodeobject.h", 248);
                break :blk_1 0;
            }) != 0);
            break :blk @as(?*PyASCIIObject, @ptrCast(@alignCast(op)));
        }) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))))));
    }
    return @as(?*anyopaque, @ptrCast(@alignCast((blk: {
        _ = !!(PyType_HasFeature(Py_TYPE(op), @as(c_ulong, 1) << @intCast(@as(c_ulong, 28))) != 0) or ((blk_1: {
            _assert("PyUnicode_Check(op)", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/unicodeobject.h", 250);
            break :blk_1 0;
        }) != 0);
        break :blk @as(?*PyCompactUnicodeObject, @ptrCast(@alignCast(op)));
    }) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))))));
} // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/unicodeobject.h:256:37: warning: member access of demoted record
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/unicodeobject.h:253:21: warning: unable to translate function, demoted to extern
pub extern fn _PyUnicode_NONCOMPACT_DATA(arg_op: [*c]PyObject) callconv(.c) ?*anyopaque;
pub fn PyUnicode_DATA(arg_op: [*c]PyObject) callconv(.c) ?*anyopaque {
    var op = arg_op;
    _ = &op;
    if (PyUnicode_IS_COMPACT(op) != 0) {
        return _PyUnicode_COMPACT_DATA(op);
    }
    return _PyUnicode_NONCOMPACT_DATA(op);
} // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/unicodeobject.h:280:35: warning: member access of demoted record
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/unicodeobject.h:279:26: warning: unable to translate function, demoted to extern
pub extern fn PyUnicode_GET_LENGTH(arg_op: [*c]PyObject) callconv(.c) Py_ssize_t;
pub fn PyUnicode_WRITE(arg_kind: c_int, arg_data: ?*anyopaque, arg_index: Py_ssize_t, arg_value: Py_UCS4) callconv(.c) void {
    var kind = arg_kind;
    _ = &kind;
    var data = arg_data;
    _ = &data;
    var index = arg_index;
    _ = &index;
    var value = arg_value;
    _ = &value;
    _ = !!(index >= @as(Py_ssize_t, 0)) or ((blk: {
        _assert("index >= 0", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/unicodeobject.h", 292);
        break :blk 0;
    }) != 0);
    if (kind == PyUnicode_1BYTE_KIND) {
        _ = !!(value <= @as(c_uint, 255)) or ((blk: {
            _assert("value <= 0xffU", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/unicodeobject.h", 294);
            break :blk 0;
        }) != 0);
        @as([*c]Py_UCS1, @ptrCast(@alignCast(data)))[@bitCast(@as(isize, @intCast(index)))] = @as(Py_UCS1, @truncate(value));
    } else if (kind == PyUnicode_2BYTE_KIND) {
        _ = !!(value <= @as(c_uint, 65535)) or ((blk: {
            _assert("value <= 0xffffU", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/unicodeobject.h", 298);
            break :blk 0;
        }) != 0);
        @as([*c]Py_UCS2, @ptrCast(@alignCast(data)))[@bitCast(@as(isize, @intCast(index)))] = @as(Py_UCS2, @truncate(value));
    } else {
        _ = !!(kind == PyUnicode_4BYTE_KIND) or ((blk: {
            _assert("kind == PyUnicode_4BYTE_KIND", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/unicodeobject.h", 302);
            break :blk 0;
        }) != 0);
        _ = !!(value <= @as(c_uint, 1114111)) or ((blk: {
            _assert("value <= 0x10ffffU", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/unicodeobject.h", 303);
            break :blk 0;
        }) != 0);
        @as([*c]Py_UCS4, @ptrCast(@alignCast(data)))[@bitCast(@as(isize, @intCast(index)))] = value;
    }
}
pub fn PyUnicode_READ(arg_kind: c_int, arg_data: ?*const anyopaque, arg_index: Py_ssize_t) callconv(.c) Py_UCS4 {
    var kind = arg_kind;
    _ = &kind;
    var data = arg_data;
    _ = &data;
    var index = arg_index;
    _ = &index;
    _ = !!(index >= @as(Py_ssize_t, 0)) or ((blk: {
        _assert("index >= 0", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/unicodeobject.h", 316);
        break :blk 0;
    }) != 0);
    if (kind == PyUnicode_1BYTE_KIND) {
        return @as([*c]const Py_UCS1, @ptrCast(@alignCast(data)))[@bitCast(@as(isize, @intCast(index)))];
    }
    if (kind == PyUnicode_2BYTE_KIND) {
        return @as([*c]const Py_UCS2, @ptrCast(@alignCast(data)))[@bitCast(@as(isize, @intCast(index)))];
    }
    _ = !!(kind == PyUnicode_4BYTE_KIND) or ((blk: {
        _assert("kind == PyUnicode_4BYTE_KIND", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/unicodeobject.h", 323);
        break :blk 0;
    }) != 0);
    return @as([*c]const Py_UCS4, @ptrCast(@alignCast(data)))[@bitCast(@as(isize, @intCast(index)))];
} // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/unicodeobject.h:243:69: warning: member access of demoted record
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/unicodeobject.h:335:23: warning: unable to translate function, demoted to extern
pub extern fn PyUnicode_READ_CHAR(arg_unicode: [*c]PyObject, arg_index: Py_ssize_t) callconv(.c) Py_UCS4; // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/unicodeobject.h:243:69: warning: member access of demoted record
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/unicodeobject.h:359:23: warning: unable to translate function, demoted to extern
pub extern fn PyUnicode_MAX_CHAR_VALUE(arg_op: [*c]PyObject) callconv(.c) Py_UCS4;
pub extern fn PyUnicode_New(size: Py_ssize_t, maxchar: Py_UCS4) [*c]PyObject;
pub fn PyUnicode_READY(arg__unused_op: [*c]PyObject) callconv(.c) c_int {
    var _unused_op = arg__unused_op;
    _ = &_unused_op;
    return 0;
}
pub extern fn PyUnicode_CopyCharacters(to: [*c]PyObject, to_start: Py_ssize_t, from: [*c]PyObject, from_start: Py_ssize_t, how_many: Py_ssize_t) Py_ssize_t;
pub extern fn PyUnicode_Fill(unicode: [*c]PyObject, start: Py_ssize_t, length: Py_ssize_t, fill_char: Py_UCS4) Py_ssize_t;
pub extern fn PyUnicode_FromKindAndData(kind: c_int, buffer: ?*const anyopaque, size: Py_ssize_t) [*c]PyObject;
pub const _PyUnicodeWriter = extern struct {
    buffer: [*c]PyObject = null,
    data: ?*anyopaque = null,
    kind: c_int = 0,
    maxchar: Py_UCS4 = 0,
    size: Py_ssize_t = 0,
    pos: Py_ssize_t = 0,
    min_length: Py_ssize_t = 0,
    min_char: Py_UCS4 = 0,
    overallocate: u8 = 0,
    readonly: u8 = 0,
    pub const _PyUnicodeWriter_Init = __root._PyUnicodeWriter_Init;
    pub const _PyUnicodeWriter_PrepareInternal = __root._PyUnicodeWriter_PrepareInternal;
    pub const _PyUnicodeWriter_PrepareKindInternal = __root._PyUnicodeWriter_PrepareKindInternal;
    pub const _PyUnicodeWriter_WriteChar = __root._PyUnicodeWriter_WriteChar;
    pub const _PyUnicodeWriter_WriteStr = __root._PyUnicodeWriter_WriteStr;
    pub const _PyUnicodeWriter_WriteSubstring = __root._PyUnicodeWriter_WriteSubstring;
    pub const _PyUnicodeWriter_WriteASCIIString = __root._PyUnicodeWriter_WriteASCIIString;
    pub const _PyUnicodeWriter_WriteLatin1String = __root._PyUnicodeWriter_WriteLatin1String;
    pub const _PyUnicodeWriter_Finish = __root._PyUnicodeWriter_Finish;
    pub const _PyUnicodeWriter_Dealloc = __root._PyUnicodeWriter_Dealloc;
    pub const Init = __root._PyUnicodeWriter_Init;
    pub const PrepareInternal = __root._PyUnicodeWriter_PrepareInternal;
    pub const PrepareKindInternal = __root._PyUnicodeWriter_PrepareKindInternal;
    pub const WriteChar = __root._PyUnicodeWriter_WriteChar;
    pub const WriteStr = __root._PyUnicodeWriter_WriteStr;
    pub const WriteSubstring = __root._PyUnicodeWriter_WriteSubstring;
    pub const WriteASCIIString = __root._PyUnicodeWriter_WriteASCIIString;
    pub const WriteLatin1String = __root._PyUnicodeWriter_WriteLatin1String;
    pub const Finish = __root._PyUnicodeWriter_Finish;
    pub const Dealloc = __root._PyUnicodeWriter_Dealloc;
};
pub extern fn _PyUnicodeWriter_Init(writer: [*c]_PyUnicodeWriter) void;
pub extern fn _PyUnicodeWriter_PrepareInternal(writer: [*c]_PyUnicodeWriter, length: Py_ssize_t, maxchar: Py_UCS4) c_int;
pub extern fn _PyUnicodeWriter_PrepareKindInternal(writer: [*c]_PyUnicodeWriter, kind: c_int) c_int;
pub extern fn _PyUnicodeWriter_WriteChar(writer: [*c]_PyUnicodeWriter, ch: Py_UCS4) c_int;
pub extern fn _PyUnicodeWriter_WriteStr(writer: [*c]_PyUnicodeWriter, str: [*c]PyObject) c_int;
pub extern fn _PyUnicodeWriter_WriteSubstring(writer: [*c]_PyUnicodeWriter, str: [*c]PyObject, start: Py_ssize_t, end: Py_ssize_t) c_int;
pub extern fn _PyUnicodeWriter_WriteASCIIString(writer: [*c]_PyUnicodeWriter, str: [*c]const u8, len: Py_ssize_t) c_int;
pub extern fn _PyUnicodeWriter_WriteLatin1String(writer: [*c]_PyUnicodeWriter, str: [*c]const u8, len: Py_ssize_t) c_int;
pub extern fn _PyUnicodeWriter_Finish(writer: [*c]_PyUnicodeWriter) [*c]PyObject;
pub extern fn _PyUnicodeWriter_Dealloc(writer: [*c]_PyUnicodeWriter) void;
pub extern fn PyUnicode_AsUTF8(unicode: [*c]PyObject) [*c]const u8;
pub extern fn _PyUnicode_IsLowercase(ch: Py_UCS4) c_int;
pub extern fn _PyUnicode_IsUppercase(ch: Py_UCS4) c_int;
pub extern fn _PyUnicode_IsTitlecase(ch: Py_UCS4) c_int;
pub extern fn _PyUnicode_IsWhitespace(ch: Py_UCS4) c_int;
pub extern fn _PyUnicode_IsLinebreak(ch: Py_UCS4) c_int;
pub extern fn _PyUnicode_ToLowercase(ch: Py_UCS4) Py_UCS4;
pub extern fn _PyUnicode_ToUppercase(ch: Py_UCS4) Py_UCS4;
pub extern fn _PyUnicode_ToTitlecase(ch: Py_UCS4) Py_UCS4;
pub extern fn _PyUnicode_ToDecimalDigit(ch: Py_UCS4) c_int;
pub extern fn _PyUnicode_ToDigit(ch: Py_UCS4) c_int;
pub extern fn _PyUnicode_ToNumeric(ch: Py_UCS4) f64;
pub extern fn _PyUnicode_IsDecimalDigit(ch: Py_UCS4) c_int;
pub extern fn _PyUnicode_IsDigit(ch: Py_UCS4) c_int;
pub extern fn _PyUnicode_IsNumeric(ch: Py_UCS4) c_int;
pub extern fn _PyUnicode_IsPrintable(ch: Py_UCS4) c_int;
pub extern fn _PyUnicode_IsAlpha(ch: Py_UCS4) c_int;
pub const _Py_ascii_whitespace: [*c]const u8 = @extern([*c]const u8, .{
    .name = "_Py_ascii_whitespace",
});
pub fn Py_UNICODE_ISSPACE(arg_ch: Py_UCS4) callconv(.c) c_int {
    var ch = arg_ch;
    _ = &ch;
    if (ch < @as(Py_UCS4, 128)) {
        return _Py_ascii_whitespace[ch];
    }
    return _PyUnicode_IsWhitespace(ch);
}
pub fn Py_UNICODE_ISALNUM(arg_ch: Py_UCS4) callconv(.c) c_int {
    var ch = arg_ch;
    _ = &ch;
    return @intFromBool((((_PyUnicode_IsAlpha(ch) != 0) or (_PyUnicode_IsDecimalDigit(ch) != 0)) or (_PyUnicode_IsDigit(ch) != 0)) or (_PyUnicode_IsNumeric(ch) != 0));
}
pub extern fn _PyUnicode_FromId([*c]_Py_Identifier) [*c]PyObject;
pub extern fn PyErr_SetNone([*c]PyObject) void;
pub extern fn PyErr_SetObject([*c]PyObject, [*c]PyObject) void;
pub extern fn PyErr_SetString(exception: [*c]PyObject, string: [*c]const u8) void;
pub extern fn PyErr_Occurred() [*c]PyObject;
pub extern fn PyErr_Clear() void;
pub extern fn PyErr_Fetch([*c][*c]PyObject, [*c][*c]PyObject, [*c][*c]PyObject) void;
pub extern fn PyErr_Restore([*c]PyObject, [*c]PyObject, [*c]PyObject) void;
pub extern fn PyErr_GetRaisedException() [*c]PyObject;
pub extern fn PyErr_SetRaisedException([*c]PyObject) void;
pub extern fn PyErr_GetHandledException() [*c]PyObject;
pub extern fn PyErr_SetHandledException([*c]PyObject) void;
pub extern fn PyErr_GetExcInfo([*c][*c]PyObject, [*c][*c]PyObject, [*c][*c]PyObject) void;
pub extern fn PyErr_SetExcInfo([*c]PyObject, [*c]PyObject, [*c]PyObject) void;
pub extern fn Py_FatalError(message: [*c]const u8) noreturn;
pub extern fn PyErr_GivenExceptionMatches([*c]PyObject, [*c]PyObject) c_int;
pub extern fn PyErr_ExceptionMatches([*c]PyObject) c_int;
pub extern fn PyErr_NormalizeException([*c][*c]PyObject, [*c][*c]PyObject, [*c][*c]PyObject) void;
pub extern fn PyException_SetTraceback([*c]PyObject, [*c]PyObject) c_int;
pub extern fn PyException_GetTraceback([*c]PyObject) [*c]PyObject;
pub extern fn PyException_GetCause([*c]PyObject) [*c]PyObject;
pub extern fn PyException_SetCause([*c]PyObject, [*c]PyObject) void;
pub extern fn PyException_GetContext([*c]PyObject) [*c]PyObject;
pub extern fn PyException_SetContext([*c]PyObject, [*c]PyObject) void;
pub extern fn PyException_GetArgs([*c]PyObject) [*c]PyObject;
pub extern fn PyException_SetArgs([*c]PyObject, [*c]PyObject) void;
pub extern fn PyExceptionClass_Name([*c]PyObject) [*c]const u8;
pub extern var PyExc_BaseException: [*c]PyObject;
pub extern var PyExc_Exception: [*c]PyObject;
pub extern var PyExc_BaseExceptionGroup: [*c]PyObject;
pub extern var PyExc_StopAsyncIteration: [*c]PyObject;
pub extern var PyExc_StopIteration: [*c]PyObject;
pub extern var PyExc_GeneratorExit: [*c]PyObject;
pub extern var PyExc_ArithmeticError: [*c]PyObject;
pub extern var PyExc_LookupError: [*c]PyObject;
pub extern var PyExc_AssertionError: [*c]PyObject;
pub extern var PyExc_AttributeError: [*c]PyObject;
pub extern var PyExc_BufferError: [*c]PyObject;
pub extern var PyExc_EOFError: [*c]PyObject;
pub extern var PyExc_FloatingPointError: [*c]PyObject;
pub extern var PyExc_OSError: [*c]PyObject;
pub extern var PyExc_ImportError: [*c]PyObject;
pub extern var PyExc_ModuleNotFoundError: [*c]PyObject;
pub extern var PyExc_IndexError: [*c]PyObject;
pub extern var PyExc_KeyError: [*c]PyObject;
pub extern var PyExc_KeyboardInterrupt: [*c]PyObject;
pub extern var PyExc_MemoryError: [*c]PyObject;
pub extern var PyExc_NameError: [*c]PyObject;
pub extern var PyExc_OverflowError: [*c]PyObject;
pub extern var PyExc_RuntimeError: [*c]PyObject;
pub extern var PyExc_RecursionError: [*c]PyObject;
pub extern var PyExc_NotImplementedError: [*c]PyObject;
pub extern var PyExc_SyntaxError: [*c]PyObject;
pub extern var PyExc_IndentationError: [*c]PyObject;
pub extern var PyExc_TabError: [*c]PyObject;
pub extern var PyExc_ReferenceError: [*c]PyObject;
pub extern var PyExc_SystemError: [*c]PyObject;
pub extern var PyExc_SystemExit: [*c]PyObject;
pub extern var PyExc_TypeError: [*c]PyObject;
pub extern var PyExc_UnboundLocalError: [*c]PyObject;
pub extern var PyExc_UnicodeError: [*c]PyObject;
pub extern var PyExc_UnicodeEncodeError: [*c]PyObject;
pub extern var PyExc_UnicodeDecodeError: [*c]PyObject;
pub extern var PyExc_UnicodeTranslateError: [*c]PyObject;
pub extern var PyExc_ValueError: [*c]PyObject;
pub extern var PyExc_ZeroDivisionError: [*c]PyObject;
pub extern var PyExc_BlockingIOError: [*c]PyObject;
pub extern var PyExc_BrokenPipeError: [*c]PyObject;
pub extern var PyExc_ChildProcessError: [*c]PyObject;
pub extern var PyExc_ConnectionError: [*c]PyObject;
pub extern var PyExc_ConnectionAbortedError: [*c]PyObject;
pub extern var PyExc_ConnectionRefusedError: [*c]PyObject;
pub extern var PyExc_ConnectionResetError: [*c]PyObject;
pub extern var PyExc_FileExistsError: [*c]PyObject;
pub extern var PyExc_FileNotFoundError: [*c]PyObject;
pub extern var PyExc_InterruptedError: [*c]PyObject;
pub extern var PyExc_IsADirectoryError: [*c]PyObject;
pub extern var PyExc_NotADirectoryError: [*c]PyObject;
pub extern var PyExc_PermissionError: [*c]PyObject;
pub extern var PyExc_ProcessLookupError: [*c]PyObject;
pub extern var PyExc_TimeoutError: [*c]PyObject;
pub extern var PyExc_EnvironmentError: [*c]PyObject;
pub extern var PyExc_IOError: [*c]PyObject;
pub extern var PyExc_WindowsError: [*c]PyObject;
pub extern var PyExc_Warning: [*c]PyObject;
pub extern var PyExc_UserWarning: [*c]PyObject;
pub extern var PyExc_DeprecationWarning: [*c]PyObject;
pub extern var PyExc_PendingDeprecationWarning: [*c]PyObject;
pub extern var PyExc_SyntaxWarning: [*c]PyObject;
pub extern var PyExc_RuntimeWarning: [*c]PyObject;
pub extern var PyExc_FutureWarning: [*c]PyObject;
pub extern var PyExc_ImportWarning: [*c]PyObject;
pub extern var PyExc_UnicodeWarning: [*c]PyObject;
pub extern var PyExc_BytesWarning: [*c]PyObject;
pub extern var PyExc_EncodingWarning: [*c]PyObject;
pub extern var PyExc_ResourceWarning: [*c]PyObject;
pub extern fn PyErr_BadArgument() c_int;
pub extern fn PyErr_NoMemory() [*c]PyObject;
pub extern fn PyErr_SetFromErrno([*c]PyObject) [*c]PyObject;
pub extern fn PyErr_SetFromErrnoWithFilenameObject([*c]PyObject, [*c]PyObject) [*c]PyObject;
pub extern fn PyErr_SetFromErrnoWithFilenameObjects([*c]PyObject, [*c]PyObject, [*c]PyObject) [*c]PyObject;
pub extern fn PyErr_SetFromErrnoWithFilename(exc: [*c]PyObject, filename: [*c]const u8) [*c]PyObject;
pub extern fn PyErr_Format(exception: [*c]PyObject, format: [*c]const u8, ...) [*c]PyObject;
pub extern fn PyErr_FormatV(exception: [*c]PyObject, format: [*c]const u8, vargs: va_list) [*c]PyObject;
pub extern fn PyErr_SetFromWindowsErrWithFilename(ierr: c_int, filename: [*c]const u8) [*c]PyObject;
pub extern fn PyErr_SetFromWindowsErr(c_int) [*c]PyObject;
pub extern fn PyErr_SetExcFromWindowsErrWithFilenameObject([*c]PyObject, c_int, [*c]PyObject) [*c]PyObject;
pub extern fn PyErr_SetExcFromWindowsErrWithFilenameObjects([*c]PyObject, c_int, [*c]PyObject, [*c]PyObject) [*c]PyObject;
pub extern fn PyErr_SetExcFromWindowsErrWithFilename(exc: [*c]PyObject, ierr: c_int, filename: [*c]const u8) [*c]PyObject;
pub extern fn PyErr_SetExcFromWindowsErr([*c]PyObject, c_int) [*c]PyObject;
pub extern fn PyErr_SetImportErrorSubclass([*c]PyObject, [*c]PyObject, [*c]PyObject, [*c]PyObject) [*c]PyObject;
pub extern fn PyErr_SetImportError([*c]PyObject, [*c]PyObject, [*c]PyObject) [*c]PyObject;
pub extern fn PyErr_BadInternalCall() void;
pub extern fn _PyErr_BadInternalCall(filename: [*c]const u8, lineno: c_int) void;
pub extern fn PyErr_NewException(name: [*c]const u8, base: [*c]PyObject, dict: [*c]PyObject) [*c]PyObject;
pub extern fn PyErr_NewExceptionWithDoc(name: [*c]const u8, doc: [*c]const u8, base: [*c]PyObject, dict: [*c]PyObject) [*c]PyObject;
pub extern fn PyErr_WriteUnraisable([*c]PyObject) void;
pub extern fn PyErr_CheckSignals() c_int;
pub extern fn PyErr_SetInterrupt() void;
pub extern fn PyErr_SetInterruptEx(signum: c_int) c_int;
pub extern fn PyErr_SyntaxLocation(filename: [*c]const u8, lineno: c_int) void;
pub extern fn PyErr_SyntaxLocationEx(filename: [*c]const u8, lineno: c_int, col_offset: c_int) void;
pub extern fn PyErr_ProgramText(filename: [*c]const u8, lineno: c_int) [*c]PyObject;
pub extern fn PyUnicodeDecodeError_Create(encoding: [*c]const u8, object: [*c]const u8, length: Py_ssize_t, start: Py_ssize_t, end: Py_ssize_t, reason: [*c]const u8) [*c]PyObject;
pub extern fn PyUnicodeEncodeError_GetEncoding([*c]PyObject) [*c]PyObject;
pub extern fn PyUnicodeDecodeError_GetEncoding([*c]PyObject) [*c]PyObject;
pub extern fn PyUnicodeEncodeError_GetObject([*c]PyObject) [*c]PyObject;
pub extern fn PyUnicodeDecodeError_GetObject([*c]PyObject) [*c]PyObject;
pub extern fn PyUnicodeTranslateError_GetObject([*c]PyObject) [*c]PyObject;
pub extern fn PyUnicodeEncodeError_GetStart([*c]PyObject, [*c]Py_ssize_t) c_int;
pub extern fn PyUnicodeDecodeError_GetStart([*c]PyObject, [*c]Py_ssize_t) c_int;
pub extern fn PyUnicodeTranslateError_GetStart([*c]PyObject, [*c]Py_ssize_t) c_int;
pub extern fn PyUnicodeEncodeError_SetStart([*c]PyObject, Py_ssize_t) c_int;
pub extern fn PyUnicodeDecodeError_SetStart([*c]PyObject, Py_ssize_t) c_int;
pub extern fn PyUnicodeTranslateError_SetStart([*c]PyObject, Py_ssize_t) c_int;
pub extern fn PyUnicodeEncodeError_GetEnd([*c]PyObject, [*c]Py_ssize_t) c_int;
pub extern fn PyUnicodeDecodeError_GetEnd([*c]PyObject, [*c]Py_ssize_t) c_int;
pub extern fn PyUnicodeTranslateError_GetEnd([*c]PyObject, [*c]Py_ssize_t) c_int;
pub extern fn PyUnicodeEncodeError_SetEnd([*c]PyObject, Py_ssize_t) c_int;
pub extern fn PyUnicodeDecodeError_SetEnd([*c]PyObject, Py_ssize_t) c_int;
pub extern fn PyUnicodeTranslateError_SetEnd([*c]PyObject, Py_ssize_t) c_int;
pub extern fn PyUnicodeEncodeError_GetReason([*c]PyObject) [*c]PyObject;
pub extern fn PyUnicodeDecodeError_GetReason([*c]PyObject) [*c]PyObject;
pub extern fn PyUnicodeTranslateError_GetReason([*c]PyObject) [*c]PyObject;
pub extern fn PyUnicodeEncodeError_SetReason(exc: [*c]PyObject, reason: [*c]const u8) c_int;
pub extern fn PyUnicodeDecodeError_SetReason(exc: [*c]PyObject, reason: [*c]const u8) c_int;
pub extern fn PyUnicodeTranslateError_SetReason(exc: [*c]PyObject, reason: [*c]const u8) c_int;
pub extern fn PyOS_snprintf(str: [*c]u8, size: usize, format: [*c]const u8, ...) c_int;
pub extern fn PyOS_vsnprintf(str: [*c]u8, size: usize, format: [*c]const u8, va: va_list) c_int;
pub const PyBaseExceptionObject = extern struct {
    ob_base: PyObject = @import("std").mem.zeroes(PyObject),
    dict: [*c]PyObject = null,
    args: [*c]PyObject = null,
    notes: [*c]PyObject = null,
    traceback: [*c]PyObject = null,
    context: [*c]PyObject = null,
    cause: [*c]PyObject = null,
    suppress_context: u8 = 0,
};
pub const PyBaseExceptionGroupObject = extern struct {
    ob_base: PyObject = @import("std").mem.zeroes(PyObject),
    dict: [*c]PyObject = null,
    args: [*c]PyObject = null,
    notes: [*c]PyObject = null,
    traceback: [*c]PyObject = null,
    context: [*c]PyObject = null,
    cause: [*c]PyObject = null,
    suppress_context: u8 = 0,
    msg: [*c]PyObject = null,
    excs: [*c]PyObject = null,
};
pub const PySyntaxErrorObject = extern struct {
    ob_base: PyObject = @import("std").mem.zeroes(PyObject),
    dict: [*c]PyObject = null,
    args: [*c]PyObject = null,
    notes: [*c]PyObject = null,
    traceback: [*c]PyObject = null,
    context: [*c]PyObject = null,
    cause: [*c]PyObject = null,
    suppress_context: u8 = 0,
    msg: [*c]PyObject = null,
    filename: [*c]PyObject = null,
    lineno: [*c]PyObject = null,
    offset: [*c]PyObject = null,
    end_lineno: [*c]PyObject = null,
    end_offset: [*c]PyObject = null,
    text: [*c]PyObject = null,
    print_file_and_line: [*c]PyObject = null,
};
pub const PyImportErrorObject = extern struct {
    ob_base: PyObject = @import("std").mem.zeroes(PyObject),
    dict: [*c]PyObject = null,
    args: [*c]PyObject = null,
    notes: [*c]PyObject = null,
    traceback: [*c]PyObject = null,
    context: [*c]PyObject = null,
    cause: [*c]PyObject = null,
    suppress_context: u8 = 0,
    msg: [*c]PyObject = null,
    name: [*c]PyObject = null,
    path: [*c]PyObject = null,
    name_from: [*c]PyObject = null,
};
pub const PyUnicodeErrorObject = extern struct {
    ob_base: PyObject = @import("std").mem.zeroes(PyObject),
    dict: [*c]PyObject = null,
    args: [*c]PyObject = null,
    notes: [*c]PyObject = null,
    traceback: [*c]PyObject = null,
    context: [*c]PyObject = null,
    cause: [*c]PyObject = null,
    suppress_context: u8 = 0,
    encoding: [*c]PyObject = null,
    object: [*c]PyObject = null,
    start: Py_ssize_t = 0,
    end: Py_ssize_t = 0,
    reason: [*c]PyObject = null,
};
pub const PySystemExitObject = extern struct {
    ob_base: PyObject = @import("std").mem.zeroes(PyObject),
    dict: [*c]PyObject = null,
    args: [*c]PyObject = null,
    notes: [*c]PyObject = null,
    traceback: [*c]PyObject = null,
    context: [*c]PyObject = null,
    cause: [*c]PyObject = null,
    suppress_context: u8 = 0,
    code: [*c]PyObject = null,
};
pub const PyOSErrorObject = extern struct {
    ob_base: PyObject = @import("std").mem.zeroes(PyObject),
    dict: [*c]PyObject = null,
    args: [*c]PyObject = null,
    notes: [*c]PyObject = null,
    traceback: [*c]PyObject = null,
    context: [*c]PyObject = null,
    cause: [*c]PyObject = null,
    suppress_context: u8 = 0,
    myerrno: [*c]PyObject = null,
    strerror: [*c]PyObject = null,
    filename: [*c]PyObject = null,
    filename2: [*c]PyObject = null,
    winerror: [*c]PyObject = null,
    written: Py_ssize_t = 0,
};
pub const PyStopIterationObject = extern struct {
    ob_base: PyObject = @import("std").mem.zeroes(PyObject),
    dict: [*c]PyObject = null,
    args: [*c]PyObject = null,
    notes: [*c]PyObject = null,
    traceback: [*c]PyObject = null,
    context: [*c]PyObject = null,
    cause: [*c]PyObject = null,
    suppress_context: u8 = 0,
    value: [*c]PyObject = null,
};
pub const PyNameErrorObject = extern struct {
    ob_base: PyObject = @import("std").mem.zeroes(PyObject),
    dict: [*c]PyObject = null,
    args: [*c]PyObject = null,
    notes: [*c]PyObject = null,
    traceback: [*c]PyObject = null,
    context: [*c]PyObject = null,
    cause: [*c]PyObject = null,
    suppress_context: u8 = 0,
    name: [*c]PyObject = null,
};
pub const PyAttributeErrorObject = extern struct {
    ob_base: PyObject = @import("std").mem.zeroes(PyObject),
    dict: [*c]PyObject = null,
    args: [*c]PyObject = null,
    notes: [*c]PyObject = null,
    traceback: [*c]PyObject = null,
    context: [*c]PyObject = null,
    cause: [*c]PyObject = null,
    suppress_context: u8 = 0,
    obj: [*c]PyObject = null,
    name: [*c]PyObject = null,
};
pub const PyEnvironmentErrorObject = PyOSErrorObject;
pub const PyWindowsErrorObject = PyOSErrorObject;
pub extern fn _PyErr_ChainExceptions1([*c]PyObject) void;
pub extern fn PyUnstable_Exc_PrepReraiseStar(orig: [*c]PyObject, excs: [*c]PyObject) [*c]PyObject;
pub extern fn PySignal_SetWakeupFd(fd: c_int) c_int;
pub extern fn PyErr_SyntaxLocationObject(filename: [*c]PyObject, lineno: c_int, col_offset: c_int) void;
pub extern fn PyErr_RangedSyntaxLocationObject(filename: [*c]PyObject, lineno: c_int, col_offset: c_int, end_lineno: c_int, end_col_offset: c_int) void;
pub extern fn PyErr_ProgramTextObject(filename: [*c]PyObject, lineno: c_int) [*c]PyObject;
pub extern fn _Py_FatalErrorFunc(func: [*c]const u8, message: [*c]const u8) noreturn;
pub extern fn PyErr_FormatUnraisable([*c]const u8, ...) void;
pub extern var PyExc_PythonFinalizationError: [*c]PyObject;
pub extern fn PyLong_FromLong(c_long) [*c]PyObject;
pub extern fn PyLong_FromUnsignedLong(c_ulong) [*c]PyObject;
pub extern fn PyLong_FromSize_t(usize) [*c]PyObject;
pub extern fn PyLong_FromSsize_t(Py_ssize_t) [*c]PyObject;
pub extern fn PyLong_FromDouble(f64) [*c]PyObject;
pub extern fn PyLong_AsLong([*c]PyObject) c_long;
pub extern fn PyLong_AsLongAndOverflow([*c]PyObject, [*c]c_int) c_long;
pub extern fn PyLong_AsSsize_t([*c]PyObject) Py_ssize_t;
pub extern fn PyLong_AsSize_t([*c]PyObject) usize;
pub extern fn PyLong_AsUnsignedLong([*c]PyObject) c_ulong;
pub extern fn PyLong_AsUnsignedLongMask([*c]PyObject) c_ulong;
pub extern fn PyLong_AsInt([*c]PyObject) c_int;
pub extern fn PyLong_GetInfo() [*c]PyObject;
pub extern fn PyLong_AsDouble([*c]PyObject) f64;
pub extern fn PyLong_FromVoidPtr(?*anyopaque) [*c]PyObject;
pub extern fn PyLong_AsVoidPtr([*c]PyObject) ?*anyopaque;
pub extern fn PyLong_FromLongLong(c_longlong) [*c]PyObject;
pub extern fn PyLong_FromUnsignedLongLong(c_ulonglong) [*c]PyObject;
pub extern fn PyLong_AsLongLong([*c]PyObject) c_longlong;
pub extern fn PyLong_AsUnsignedLongLong([*c]PyObject) c_ulonglong;
pub extern fn PyLong_AsUnsignedLongLongMask([*c]PyObject) c_ulonglong;
pub extern fn PyLong_AsLongLongAndOverflow([*c]PyObject, [*c]c_int) c_longlong;
pub extern fn PyLong_FromString([*c]const u8, [*c][*c]u8, c_int) [*c]PyObject;
pub extern fn PyOS_strtoul([*c]const u8, [*c][*c]u8, c_int) c_ulong;
pub extern fn PyOS_strtol([*c]const u8, [*c][*c]u8, c_int) c_long;
pub extern fn PyLong_FromUnicodeObject(u: [*c]PyObject, base: c_int) [*c]PyObject;
pub extern fn PyLong_AsNativeBytes(v: [*c]PyObject, buffer: ?*anyopaque, n_bytes: Py_ssize_t, flags: c_int) Py_ssize_t;
pub extern fn PyLong_FromNativeBytes(buffer: ?*const anyopaque, n_bytes: usize, flags: c_int) [*c]PyObject;
pub extern fn PyLong_FromUnsignedNativeBytes(buffer: ?*const anyopaque, n_bytes: usize, flags: c_int) [*c]PyObject;
pub extern fn PyUnstable_Long_IsCompact(op: [*c]const PyLongObject) c_int;
pub extern fn PyUnstable_Long_CompactValue(op: [*c]const PyLongObject) Py_ssize_t;
pub extern fn _PyLong_Sign(v: [*c]PyObject) c_int;
pub extern fn _PyLong_NumBits(v: [*c]PyObject) usize;
pub extern fn _PyLong_FromByteArray(bytes: [*c]const u8, n: usize, little_endian: c_int, is_signed: c_int) [*c]PyObject;
pub extern fn _PyLong_AsByteArray(v: [*c]PyLongObject, bytes: [*c]u8, n: usize, little_endian: c_int, is_signed: c_int, with_exceptions: c_int) c_int;
pub extern fn _PyLong_GCD([*c]PyObject, [*c]PyObject) [*c]PyObject;
pub const sdigit = i32;
pub const twodigits = u64;
pub const stwodigits = i64;
pub extern fn _PyLong_New(Py_ssize_t) [*c]PyLongObject;
pub extern fn _PyLong_Copy(src: [*c]PyLongObject) [*c]PyObject;
pub extern fn _PyLong_FromDigits(negative: c_int, digit_count: Py_ssize_t, digits: [*c]digit) [*c]PyLongObject;
pub fn _PyLong_IsCompact(arg_op: [*c]const PyLongObject) callconv(.c) c_int {
    var op = arg_op;
    _ = &op;
    _ = !!(PyType_HasFeature(op.*.ob_base.ob_type, @as(c_ulong, 1) << @intCast(@as(c_ulong, 24))) != 0) or ((blk: {
        _assert("PyType_HasFeature((op)->ob_base.ob_type, Py_TPFLAGS_LONG_SUBCLASS)", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/longintrepr.h", 123);
        break :blk 0;
    }) != 0);
    return @intFromBool(op.*.long_value.lv_tag < @as(usize, @bitCast(@as(c_longlong, @as(c_int, 2) << @intCast(_PyLong_NON_SIZE_BITS)))));
}
pub fn _PyLong_CompactValue(arg_op: [*c]const PyLongObject) callconv(.c) Py_ssize_t {
    var op = arg_op;
    _ = &op;
    var sign: Py_ssize_t = undefined;
    _ = &sign;
    _ = !!(PyType_HasFeature(op.*.ob_base.ob_type, @as(c_ulong, 1) << @intCast(@as(c_ulong, 24))) != 0) or ((blk: {
        _assert("PyType_HasFeature((op)->ob_base.ob_type, Py_TPFLAGS_LONG_SUBCLASS)", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/longintrepr.h", 133);
        break :blk 0;
    }) != 0);
    _ = !!(_PyLong_IsCompact(op) != 0) or ((blk: {
        _assert("PyUnstable_Long_IsCompact(op)", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/longintrepr.h", 134);
        break :blk 0;
    }) != 0);
    sign = @bitCast(@as(c_ulonglong, @truncate(@as(usize, 1) -% (op.*.long_value.lv_tag & @as(usize, _PyLong_SIGN_MASK)))));
    return sign * @as(Py_ssize_t, op.*.long_value.ob_digit[@as(c_int, 0)]);
}
pub extern var _Py_FalseStruct: PyLongObject;
pub extern var _Py_TrueStruct: PyLongObject;
pub extern fn Py_IsTrue(x: [*c]PyObject) c_int;
pub extern fn Py_IsFalse(x: [*c]PyObject) c_int;
pub extern fn PyBool_FromLong(c_long) [*c]PyObject;
pub extern var PyFloat_Type: PyTypeObject;
pub extern fn PyFloat_GetMax() f64;
pub extern fn PyFloat_GetMin() f64;
pub extern fn PyFloat_GetInfo() [*c]PyObject;
pub extern fn PyFloat_FromString([*c]PyObject) [*c]PyObject;
pub extern fn PyFloat_FromDouble(f64) [*c]PyObject;
pub extern fn PyFloat_AsDouble([*c]PyObject) f64;
pub const PyFloatObject = extern struct {
    ob_base: PyObject = @import("std").mem.zeroes(PyObject),
    ob_fval: f64 = 0,
};
pub fn PyFloat_AS_DOUBLE(arg_op: [*c]PyObject) callconv(.c) f64 {
    var op = arg_op;
    _ = &op;
    return (blk: {
        _ = !!(PyObject_TypeCheck(op, &PyFloat_Type) != 0) or ((blk_1: {
            _assert("PyFloat_Check(op)", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/floatobject.h", 16);
            break :blk_1 0;
        }) != 0);
        break :blk @as([*c]PyFloatObject, @ptrCast(@alignCast(op)));
    }).*.ob_fval;
}
pub extern fn PyFloat_Pack2(x: f64, p: [*c]u8, le: c_int) c_int;
pub extern fn PyFloat_Pack4(x: f64, p: [*c]u8, le: c_int) c_int;
pub extern fn PyFloat_Pack8(x: f64, p: [*c]u8, le: c_int) c_int;
pub extern fn PyFloat_Unpack2(p: [*c]const u8, le: c_int) f64;
pub extern fn PyFloat_Unpack4(p: [*c]const u8, le: c_int) f64;
pub extern fn PyFloat_Unpack8(p: [*c]const u8, le: c_int) f64;
pub extern var PyComplex_Type: PyTypeObject;
pub extern fn PyComplex_FromDoubles(real: f64, imag: f64) [*c]PyObject;
pub extern fn PyComplex_RealAsDouble(op: [*c]PyObject) f64;
pub extern fn PyComplex_ImagAsDouble(op: [*c]PyObject) f64;
pub const Py_complex = extern struct {
    real: f64 = 0,
    imag: f64 = 0,
    pub const _Py_c_sum = __root._Py_c_sum;
    pub const _Py_c_diff = __root._Py_c_diff;
    pub const _Py_c_neg = __root._Py_c_neg;
    pub const _Py_c_prod = __root._Py_c_prod;
    pub const _Py_c_quot = __root._Py_c_quot;
    pub const _Py_c_pow = __root._Py_c_pow;
    pub const _Py_c_abs = __root._Py_c_abs;
    pub const PyComplex_FromCComplex = __root.PyComplex_FromCComplex;
    pub const sum = __root._Py_c_sum;
    pub const diff = __root._Py_c_diff;
    pub const neg = __root._Py_c_neg;
    pub const prod = __root._Py_c_prod;
    pub const quot = __root._Py_c_quot;
    pub const FromCComplex = __root.PyComplex_FromCComplex;
};
pub extern fn _Py_c_sum(Py_complex, Py_complex) Py_complex;
pub extern fn _Py_c_diff(Py_complex, Py_complex) Py_complex;
pub extern fn _Py_c_neg(Py_complex) Py_complex;
pub extern fn _Py_c_prod(Py_complex, Py_complex) Py_complex;
pub extern fn _Py_c_quot(Py_complex, Py_complex) Py_complex;
pub extern fn _Py_c_pow(Py_complex, Py_complex) Py_complex;
pub extern fn _Py_c_abs(Py_complex) f64;
pub const PyComplexObject = extern struct {
    ob_base: PyObject = @import("std").mem.zeroes(PyObject),
    cval: Py_complex = @import("std").mem.zeroes(Py_complex),
};
pub extern fn PyComplex_FromCComplex(Py_complex) [*c]PyObject;
pub extern fn PyComplex_AsCComplex(op: [*c]PyObject) Py_complex;
pub extern var PyRange_Type: PyTypeObject;
pub extern var PyRangeIter_Type: PyTypeObject;
pub extern var PyLongRangeIter_Type: PyTypeObject;
pub extern var PyMemoryView_Type: PyTypeObject;
pub extern fn PyMemoryView_FromObject(base: [*c]PyObject) [*c]PyObject;
pub extern fn PyMemoryView_FromMemory(mem: [*c]u8, size: Py_ssize_t, flags: c_int) [*c]PyObject;
pub extern fn PyMemoryView_FromBuffer(info: [*c]const Py_buffer) [*c]PyObject;
pub extern fn PyMemoryView_GetContiguous(base: [*c]PyObject, buffertype: c_int, order: u8) [*c]PyObject;
pub const _PyManagedBufferObject = extern struct {
    ob_base: PyObject = @import("std").mem.zeroes(PyObject),
    flags: c_int = 0,
    exports: Py_ssize_t = 0,
    master: Py_buffer = @import("std").mem.zeroes(Py_buffer),
};
pub const PyMemoryViewObject = extern struct {
    ob_base: PyVarObject = @import("std").mem.zeroes(PyVarObject),
    mbuf: [*c]_PyManagedBufferObject = null,
    hash: Py_hash_t = 0,
    flags: c_int = 0,
    exports: Py_ssize_t = 0,
    view: Py_buffer = @import("std").mem.zeroes(Py_buffer),
    weakreflist: [*c]PyObject = null,
    ob_array: [1]Py_ssize_t = @import("std").mem.zeroes([1]Py_ssize_t),
};
pub fn PyMemoryView_GET_BUFFER(arg_op: [*c]PyObject) callconv(.c) [*c]Py_buffer {
    var op = arg_op;
    _ = &op;
    return &@as([*c]PyMemoryViewObject, @ptrCast(@alignCast(op))).*.view;
}
pub fn PyMemoryView_GET_BASE(arg_op: [*c]PyObject) callconv(.c) [*c]PyObject {
    var op = arg_op;
    _ = &op;
    return @as([*c]PyMemoryViewObject, @ptrCast(@alignCast(op))).*.view.obj;
}
pub extern var PyTuple_Type: PyTypeObject;
pub extern var PyTupleIter_Type: PyTypeObject;
pub extern fn PyTuple_New(size: Py_ssize_t) [*c]PyObject;
pub extern fn PyTuple_Size([*c]PyObject) Py_ssize_t;
pub extern fn PyTuple_GetItem([*c]PyObject, Py_ssize_t) [*c]PyObject;
pub extern fn PyTuple_SetItem([*c]PyObject, Py_ssize_t, [*c]PyObject) c_int;
pub extern fn PyTuple_GetSlice([*c]PyObject, Py_ssize_t, Py_ssize_t) [*c]PyObject;
pub extern fn PyTuple_Pack(Py_ssize_t, ...) [*c]PyObject;
pub const PyTupleObject = extern struct {
    ob_base: PyVarObject = @import("std").mem.zeroes(PyVarObject),
    ob_item: [1][*c]PyObject = @import("std").mem.zeroes([1][*c]PyObject),
};
pub extern fn _PyTuple_Resize([*c][*c]PyObject, Py_ssize_t) c_int;
pub fn PyTuple_GET_SIZE(arg_op: [*c]PyObject) callconv(.c) Py_ssize_t {
    var op = arg_op;
    _ = &op;
    var tuple: [*c]PyTupleObject = blk: {
        _ = !!(PyType_HasFeature(Py_TYPE(op), @as(c_ulong, 1) << @intCast(@as(c_ulong, 26))) != 0) or ((blk_1: {
            _assert("PyTuple_Check(op)", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/tupleobject.h", 22);
            break :blk_1 0;
        }) != 0);
        break :blk @as([*c]PyTupleObject, @ptrCast(@alignCast(op)));
    };
    _ = &tuple;
    return Py_SIZE(@as([*c]PyObject, @ptrCast(@alignCast(tuple))));
}
pub fn PyTuple_SET_ITEM(arg_op: [*c]PyObject, arg_index: Py_ssize_t, arg_value: [*c]PyObject) callconv(.c) void {
    var op = arg_op;
    _ = &op;
    var index = arg_index;
    _ = &index;
    var value = arg_value;
    _ = &value;
    var tuple: [*c]PyTupleObject = blk: {
        _ = !!(PyType_HasFeature(Py_TYPE(op), @as(c_ulong, 1) << @intCast(@as(c_ulong, 26))) != 0) or ((blk_1: {
            _assert("PyTuple_Check(op)", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/tupleobject.h", 32);
            break :blk_1 0;
        }) != 0);
        break :blk @as([*c]PyTupleObject, @ptrCast(@alignCast(op)));
    };
    _ = &tuple;
    _ = !!(@as(Py_ssize_t, 0) <= index) or ((blk: {
        _assert("0 <= index", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/tupleobject.h", 33);
        break :blk 0;
    }) != 0);
    _ = !!(index < Py_SIZE(@as([*c]PyObject, @ptrCast(@alignCast(tuple))))) or ((blk: {
        _assert("index < Py_SIZE(tuple)", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/tupleobject.h", 34);
        break :blk 0;
    }) != 0);
    tuple.*.ob_item[@bitCast(@as(isize, @intCast(index)))] = value;
}
pub extern var PyList_Type: PyTypeObject;
pub extern var PyListIter_Type: PyTypeObject;
pub extern var PyListRevIter_Type: PyTypeObject;
pub extern fn PyList_New(size: Py_ssize_t) [*c]PyObject;
pub extern fn PyList_Size([*c]PyObject) Py_ssize_t;
pub extern fn PyList_GetItem([*c]PyObject, Py_ssize_t) [*c]PyObject;
pub extern fn PyList_GetItemRef([*c]PyObject, Py_ssize_t) [*c]PyObject;
pub extern fn PyList_SetItem([*c]PyObject, Py_ssize_t, [*c]PyObject) c_int;
pub extern fn PyList_Insert([*c]PyObject, Py_ssize_t, [*c]PyObject) c_int;
pub extern fn PyList_Append([*c]PyObject, [*c]PyObject) c_int;
pub extern fn PyList_GetSlice([*c]PyObject, Py_ssize_t, Py_ssize_t) [*c]PyObject;
pub extern fn PyList_SetSlice([*c]PyObject, Py_ssize_t, Py_ssize_t, [*c]PyObject) c_int;
pub extern fn PyList_Sort([*c]PyObject) c_int;
pub extern fn PyList_Reverse([*c]PyObject) c_int;
pub extern fn PyList_AsTuple([*c]PyObject) [*c]PyObject;
pub const PyListObject = extern struct {
    ob_base: PyVarObject = @import("std").mem.zeroes(PyVarObject),
    ob_item: [*c][*c]PyObject = null,
    allocated: Py_ssize_t = 0,
};
pub fn PyList_GET_SIZE(arg_op: [*c]PyObject) callconv(.c) Py_ssize_t {
    var op = arg_op;
    _ = &op;
    var list: [*c]PyListObject = blk: {
        _ = !!(PyType_HasFeature(Py_TYPE(op), @as(c_ulong, 1) << @intCast(@as(c_ulong, 25))) != 0) or ((blk_1: {
            _assert("PyList_Check(op)", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/listobject.h", 31);
            break :blk_1 0;
        }) != 0);
        break :blk @as([*c]PyListObject, @ptrCast(@alignCast(op)));
    };
    _ = &list;
    return Py_SIZE(@as([*c]PyObject, @ptrCast(@alignCast(list))));
}
pub fn PyList_SET_ITEM(arg_op: [*c]PyObject, arg_index: Py_ssize_t, arg_value: [*c]PyObject) callconv(.c) void {
    var op = arg_op;
    _ = &op;
    var index = arg_index;
    _ = &index;
    var value = arg_value;
    _ = &value;
    var list: [*c]PyListObject = blk: {
        _ = !!(PyType_HasFeature(Py_TYPE(op), @as(c_ulong, 1) << @intCast(@as(c_ulong, 25))) != 0) or ((blk_1: {
            _assert("PyList_Check(op)", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/listobject.h", 44);
            break :blk_1 0;
        }) != 0);
        break :blk @as([*c]PyListObject, @ptrCast(@alignCast(op)));
    };
    _ = &list;
    _ = !!(@as(Py_ssize_t, 0) <= index) or ((blk: {
        _assert("0 <= index", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/listobject.h", 45);
        break :blk 0;
    }) != 0);
    _ = !!(index < list.*.allocated) or ((blk: {
        _assert("index < list->allocated", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/listobject.h", 46);
        break :blk 0;
    }) != 0);
    list.*.ob_item[@bitCast(@as(isize, @intCast(index)))] = value;
}
pub extern fn PyList_Extend(self: [*c]PyObject, iterable: [*c]PyObject) c_int;
pub extern fn PyList_Clear(self: [*c]PyObject) c_int;
pub extern var PyDict_Type: PyTypeObject;
pub extern fn PyDict_New() [*c]PyObject;
pub extern fn PyDict_GetItem(mp: [*c]PyObject, key: [*c]PyObject) [*c]PyObject;
pub extern fn PyDict_GetItemWithError(mp: [*c]PyObject, key: [*c]PyObject) [*c]PyObject;
pub extern fn PyDict_SetItem(mp: [*c]PyObject, key: [*c]PyObject, item: [*c]PyObject) c_int;
pub extern fn PyDict_DelItem(mp: [*c]PyObject, key: [*c]PyObject) c_int;
pub extern fn PyDict_Clear(mp: [*c]PyObject) void;
pub extern fn PyDict_Next(mp: [*c]PyObject, pos: [*c]Py_ssize_t, key: [*c][*c]PyObject, value: [*c][*c]PyObject) c_int;
pub extern fn PyDict_Keys(mp: [*c]PyObject) [*c]PyObject;
pub extern fn PyDict_Values(mp: [*c]PyObject) [*c]PyObject;
pub extern fn PyDict_Items(mp: [*c]PyObject) [*c]PyObject;
pub extern fn PyDict_Size(mp: [*c]PyObject) Py_ssize_t;
pub extern fn PyDict_Copy(mp: [*c]PyObject) [*c]PyObject;
pub extern fn PyDict_Contains(mp: [*c]PyObject, key: [*c]PyObject) c_int;
pub extern fn PyDict_Update(mp: [*c]PyObject, other: [*c]PyObject) c_int;
pub extern fn PyDict_Merge(mp: [*c]PyObject, other: [*c]PyObject, override: c_int) c_int;
pub extern fn PyDict_MergeFromSeq2(d: [*c]PyObject, seq2: [*c]PyObject, override: c_int) c_int;
pub extern fn PyDict_GetItemString(dp: [*c]PyObject, key: [*c]const u8) [*c]PyObject;
pub extern fn PyDict_SetItemString(dp: [*c]PyObject, key: [*c]const u8, item: [*c]PyObject) c_int;
pub extern fn PyDict_DelItemString(dp: [*c]PyObject, key: [*c]const u8) c_int;
pub extern fn PyDict_GetItemRef(mp: [*c]PyObject, key: [*c]PyObject, result: [*c][*c]PyObject) c_int;
pub extern fn PyDict_GetItemStringRef(mp: [*c]PyObject, key: [*c]const u8, result: [*c][*c]PyObject) c_int;
pub extern fn PyObject_GenericGetDict([*c]PyObject, ?*anyopaque) [*c]PyObject;
pub extern var PyDictKeys_Type: PyTypeObject;
pub extern var PyDictValues_Type: PyTypeObject;
pub extern var PyDictItems_Type: PyTypeObject;
pub extern var PyDictIterKey_Type: PyTypeObject;
pub extern var PyDictIterValue_Type: PyTypeObject;
pub extern var PyDictIterItem_Type: PyTypeObject;
pub extern var PyDictRevIterKey_Type: PyTypeObject;
pub extern var PyDictRevIterItem_Type: PyTypeObject;
pub extern var PyDictRevIterValue_Type: PyTypeObject;
pub const PyDictKeysObject = struct__dictkeysobject_6;
pub const struct__dictvalues = opaque {};
pub const PyDictValues = struct__dictvalues;
pub const PyDictObject = extern struct {
    ob_base: PyObject = @import("std").mem.zeroes(PyObject),
    ma_used: Py_ssize_t = 0,
    ma_version_tag: u64 = 0,
    ma_keys: ?*PyDictKeysObject = null,
    ma_values: ?*PyDictValues = null,
};
pub extern fn _PyDict_GetItem_KnownHash(mp: [*c]PyObject, key: [*c]PyObject, hash: Py_hash_t) [*c]PyObject;
pub extern fn _PyDict_GetItemStringWithError([*c]PyObject, [*c]const u8) [*c]PyObject;
pub extern fn PyDict_SetDefault(mp: [*c]PyObject, key: [*c]PyObject, defaultobj: [*c]PyObject) [*c]PyObject;
pub extern fn PyDict_SetDefaultRef(mp: [*c]PyObject, key: [*c]PyObject, default_value: [*c]PyObject, result: [*c][*c]PyObject) c_int;
pub fn PyDict_GET_SIZE(arg_op: [*c]PyObject) callconv(.c) Py_ssize_t {
    var op = arg_op;
    _ = &op;
    var mp: [*c]PyDictObject = undefined;
    _ = &mp;
    _ = !!(PyType_HasFeature(Py_TYPE(op), @as(c_ulong, 1) << @intCast(@as(c_ulong, 29))) != 0) or ((blk: {
        _assert("PyDict_Check(op)", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/dictobject.h", 57);
        break :blk 0;
    }) != 0);
    mp = @as([*c]PyDictObject, @ptrCast(@alignCast(op)));
    return mp.*.ma_used;
}
pub extern fn PyDict_ContainsString(mp: [*c]PyObject, key: [*c]const u8) c_int;
pub extern fn _PyDict_NewPresized(minused: Py_ssize_t) [*c]PyObject;
pub extern fn PyDict_Pop(dict: [*c]PyObject, key: [*c]PyObject, result: [*c][*c]PyObject) c_int;
pub extern fn PyDict_PopString(dict: [*c]PyObject, key: [*c]const u8, result: [*c][*c]PyObject) c_int;
pub extern fn _PyDict_Pop(dict: [*c]PyObject, key: [*c]PyObject, default_value: [*c]PyObject) [*c]PyObject;
pub const PyDict_EVENT_ADDED: c_int = 0;
pub const PyDict_EVENT_MODIFIED: c_int = 1;
pub const PyDict_EVENT_DELETED: c_int = 2;
pub const PyDict_EVENT_CLONED: c_int = 3;
pub const PyDict_EVENT_CLEARED: c_int = 4;
pub const PyDict_EVENT_DEALLOCATED: c_int = 5;
pub const PyDict_WatchEvent = c_uint;
pub const PyDict_WatchCallback = ?*const fn (event: PyDict_WatchEvent, dict: [*c]PyObject, key: [*c]PyObject, new_value: [*c]PyObject) callconv(.c) c_int;
pub extern fn PyDict_AddWatcher(callback: PyDict_WatchCallback) c_int;
pub extern fn PyDict_ClearWatcher(watcher_id: c_int) c_int;
pub extern fn PyDict_Watch(watcher_id: c_int, dict: [*c]PyObject) c_int;
pub extern fn PyDict_Unwatch(watcher_id: c_int, dict: [*c]PyObject) c_int;
pub const struct__odictobject = opaque {};
pub const PyODictObject = struct__odictobject;
pub extern var PyODict_Type: PyTypeObject;
pub extern var PyODictIter_Type: PyTypeObject;
pub extern var PyODictKeys_Type: PyTypeObject;
pub extern var PyODictItems_Type: PyTypeObject;
pub extern var PyODictValues_Type: PyTypeObject;
pub extern fn PyODict_New() [*c]PyObject;
pub extern fn PyODict_SetItem(od: [*c]PyObject, key: [*c]PyObject, item: [*c]PyObject) c_int;
pub extern fn PyODict_DelItem(od: [*c]PyObject, key: [*c]PyObject) c_int;
pub extern var PyEnum_Type: PyTypeObject;
pub extern var PyReversed_Type: PyTypeObject;
pub extern var PySet_Type: PyTypeObject;
pub extern var PyFrozenSet_Type: PyTypeObject;
pub extern var PySetIter_Type: PyTypeObject;
pub extern fn PySet_New([*c]PyObject) [*c]PyObject;
pub extern fn PyFrozenSet_New([*c]PyObject) [*c]PyObject;
pub extern fn PySet_Add(set: [*c]PyObject, key: [*c]PyObject) c_int;
pub extern fn PySet_Clear(set: [*c]PyObject) c_int;
pub extern fn PySet_Contains(anyset: [*c]PyObject, key: [*c]PyObject) c_int;
pub extern fn PySet_Discard(set: [*c]PyObject, key: [*c]PyObject) c_int;
pub extern fn PySet_Pop(set: [*c]PyObject) [*c]PyObject;
pub extern fn PySet_Size(anyset: [*c]PyObject) Py_ssize_t;
pub const setentry = extern struct {
    key: [*c]PyObject = null,
    hash: Py_hash_t = 0,
};
pub const PySetObject = extern struct {
    ob_base: PyObject = @import("std").mem.zeroes(PyObject),
    fill: Py_ssize_t = 0,
    used: Py_ssize_t = 0,
    mask: Py_ssize_t = 0,
    table: [*c]setentry = null,
    hash: Py_hash_t = 0,
    finger: Py_ssize_t = 0,
    smalltable: [8]setentry = @import("std").mem.zeroes([8]setentry),
    weakreflist: [*c]PyObject = null,
};
pub fn PySet_GET_SIZE(arg_so: [*c]PyObject) callconv(.c) Py_ssize_t {
    var so = arg_so;
    _ = &so;
    return (blk: {
        _ = !!((((Py_IS_TYPE(so, &PySet_Type) != 0) or (Py_IS_TYPE(so, &PyFrozenSet_Type) != 0)) or (PyType_IsSubtype(Py_TYPE(so), &PySet_Type) != 0)) or (PyType_IsSubtype(Py_TYPE(so), &PyFrozenSet_Type) != 0)) or ((blk_1: {
            _assert("PyAnySet_Check(so)", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/setobject.h", 68);
            break :blk_1 0;
        }) != 0);
        break :blk @as([*c]PySetObject, @ptrCast(@alignCast(so)));
    }).*.used;
}
pub extern var PyCFunction_Type: PyTypeObject;
pub const PyCFunctionFast = ?*const fn ([*c]PyObject, [*c]const [*c]PyObject, Py_ssize_t) callconv(.c) [*c]PyObject;
pub const PyCFunctionWithKeywords = ?*const fn ([*c]PyObject, [*c]PyObject, [*c]PyObject) callconv(.c) [*c]PyObject;
pub const PyCFunctionFastWithKeywords = ?*const fn ([*c]PyObject, [*c]const [*c]PyObject, Py_ssize_t, [*c]PyObject) callconv(.c) [*c]PyObject;
pub const PyCMethod = ?*const fn ([*c]PyObject, [*c]PyTypeObject, [*c]const [*c]PyObject, usize, [*c]PyObject) callconv(.c) [*c]PyObject;
pub const _PyCFunctionFast = PyCFunctionFast;
pub const _PyCFunctionFastWithKeywords = PyCFunctionFastWithKeywords;
pub extern fn PyCFunction_GetFunction([*c]PyObject) PyCFunction;
pub extern fn PyCFunction_GetSelf([*c]PyObject) [*c]PyObject;
pub extern fn PyCFunction_GetFlags([*c]PyObject) c_int;
pub extern fn PyCFunction_New([*c]PyMethodDef, [*c]PyObject) [*c]PyObject;
pub extern fn PyCFunction_NewEx([*c]PyMethodDef, [*c]PyObject, [*c]PyObject) [*c]PyObject;
pub extern fn PyCMethod_New([*c]PyMethodDef, [*c]PyObject, [*c]PyObject, [*c]PyTypeObject) [*c]PyObject;
pub const PyCFunctionObject = extern struct {
    ob_base: PyObject = @import("std").mem.zeroes(PyObject),
    m_ml: [*c]PyMethodDef = null,
    m_self: [*c]PyObject = null,
    m_module: [*c]PyObject = null,
    m_weakreflist: [*c]PyObject = null,
    vectorcall: vectorcallfunc = null,
};
pub const PyCMethodObject = extern struct {
    func: PyCFunctionObject = @import("std").mem.zeroes(PyCFunctionObject),
    mm_class: [*c]PyTypeObject = null,
};
pub extern var PyCMethod_Type: PyTypeObject;
pub fn PyCFunction_GET_FUNCTION(arg_func: [*c]PyObject) callconv(.c) PyCFunction {
    var func = arg_func;
    _ = &func;
    return (blk: {
        _ = !!(PyObject_TypeCheck(func, &PyCFunction_Type) != 0) or ((blk_1: {
            _assert("PyCFunction_Check(func)", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/methodobject.h", 41);
            break :blk_1 0;
        }) != 0);
        break :blk @as([*c]PyCFunctionObject, @ptrCast(@alignCast(func)));
    }).*.m_ml.*.ml_meth;
}
pub fn PyCFunction_GET_SELF(arg_func_obj: [*c]PyObject) callconv(.c) [*c]PyObject {
    var func_obj = arg_func_obj;
    _ = &func_obj;
    var func: [*c]PyCFunctionObject = blk: {
        _ = !!(PyObject_TypeCheck(func_obj, &PyCFunction_Type) != 0) or ((blk_1: {
            _assert("PyCFunction_Check(func_obj)", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/methodobject.h", 46);
            break :blk_1 0;
        }) != 0);
        break :blk @as([*c]PyCFunctionObject, @ptrCast(@alignCast(func_obj)));
    };
    _ = &func;
    if ((func.*.m_ml.*.ml_flags & METH_STATIC) != 0) {
        return null;
    }
    return func.*.m_self;
}
pub fn PyCFunction_GET_FLAGS(arg_func: [*c]PyObject) callconv(.c) c_int {
    var func = arg_func;
    _ = &func;
    return (blk: {
        _ = !!(PyObject_TypeCheck(func, &PyCFunction_Type) != 0) or ((blk_1: {
            _assert("PyCFunction_Check(func)", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/methodobject.h", 55);
            break :blk_1 0;
        }) != 0);
        break :blk @as([*c]PyCFunctionObject, @ptrCast(@alignCast(func)));
    }).*.m_ml.*.ml_flags;
}
pub fn PyCFunction_GET_CLASS(arg_func_obj: [*c]PyObject) callconv(.c) [*c]PyTypeObject {
    var func_obj = arg_func_obj;
    _ = &func_obj;
    var func: [*c]PyCFunctionObject = blk: {
        _ = !!(PyObject_TypeCheck(func_obj, &PyCFunction_Type) != 0) or ((blk_1: {
            _assert("PyCFunction_Check(func_obj)", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/methodobject.h", 60);
            break :blk_1 0;
        }) != 0);
        break :blk @as([*c]PyCFunctionObject, @ptrCast(@alignCast(func_obj)));
    };
    _ = &func;
    if ((func.*.m_ml.*.ml_flags & METH_METHOD) != 0) {
        return (blk: {
            _ = !!(PyObject_TypeCheck(@as([*c]PyObject, @ptrCast(@alignCast(func))), &PyCMethod_Type) != 0) or ((blk_1: {
                _assert("PyCMethod_Check(func)", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/methodobject.h", 62);
                break :blk_1 0;
            }) != 0);
            break :blk @as([*c]PyCMethodObject, @ptrCast(@alignCast(func)));
        }).*.mm_class;
    }
    return null;
}
pub extern var PyModule_Type: PyTypeObject;
pub extern fn PyModule_NewObject(name: [*c]PyObject) [*c]PyObject;
pub extern fn PyModule_New(name: [*c]const u8) [*c]PyObject;
pub extern fn PyModule_GetDict([*c]PyObject) [*c]PyObject;
pub extern fn PyModule_GetNameObject([*c]PyObject) [*c]PyObject;
pub extern fn PyModule_GetName([*c]PyObject) [*c]const u8;
pub extern fn PyModule_GetFilename([*c]PyObject) [*c]const u8;
pub extern fn PyModule_GetFilenameObject([*c]PyObject) [*c]PyObject;
pub extern fn PyModule_GetDef([*c]PyObject) [*c]PyModuleDef;
pub extern fn PyModule_GetState([*c]PyObject) ?*anyopaque;
pub extern fn PyModuleDef_Init([*c]PyModuleDef) [*c]PyObject;
pub extern var PyModuleDef_Type: PyTypeObject;
pub const struct__PyMonitoringState = extern struct {
    active: u8 = 0,
    @"opaque": u8 = 0,
    pub const PyMonitoring_EnterScope = __root.PyMonitoring_EnterScope;
    pub const _PyMonitoring_FirePyStartEvent = __root._PyMonitoring_FirePyStartEvent;
    pub const _PyMonitoring_FirePyResumeEvent = __root._PyMonitoring_FirePyResumeEvent;
    pub const _PyMonitoring_FirePyReturnEvent = __root._PyMonitoring_FirePyReturnEvent;
    pub const _PyMonitoring_FirePyYieldEvent = __root._PyMonitoring_FirePyYieldEvent;
    pub const _PyMonitoring_FireCallEvent = __root._PyMonitoring_FireCallEvent;
    pub const _PyMonitoring_FireLineEvent = __root._PyMonitoring_FireLineEvent;
    pub const _PyMonitoring_FireJumpEvent = __root._PyMonitoring_FireJumpEvent;
    pub const _PyMonitoring_FireBranchEvent = __root._PyMonitoring_FireBranchEvent;
    pub const _PyMonitoring_FireCReturnEvent = __root._PyMonitoring_FireCReturnEvent;
    pub const _PyMonitoring_FirePyThrowEvent = __root._PyMonitoring_FirePyThrowEvent;
    pub const _PyMonitoring_FireRaiseEvent = __root._PyMonitoring_FireRaiseEvent;
    pub const _PyMonitoring_FireReraiseEvent = __root._PyMonitoring_FireReraiseEvent;
    pub const _PyMonitoring_FireExceptionHandledEvent = __root._PyMonitoring_FireExceptionHandledEvent;
    pub const _PyMonitoring_FireCRaiseEvent = __root._PyMonitoring_FireCRaiseEvent;
    pub const _PyMonitoring_FirePyUnwindEvent = __root._PyMonitoring_FirePyUnwindEvent;
    pub const _PyMonitoring_FireStopIterationEvent = __root._PyMonitoring_FireStopIterationEvent;
    pub const PyMonitoring_FirePyStartEvent = __root.PyMonitoring_FirePyStartEvent;
    pub const PyMonitoring_FirePyResumeEvent = __root.PyMonitoring_FirePyResumeEvent;
    pub const PyMonitoring_FirePyReturnEvent = __root.PyMonitoring_FirePyReturnEvent;
    pub const PyMonitoring_FirePyYieldEvent = __root.PyMonitoring_FirePyYieldEvent;
    pub const PyMonitoring_FireCallEvent = __root.PyMonitoring_FireCallEvent;
    pub const PyMonitoring_FireLineEvent = __root.PyMonitoring_FireLineEvent;
    pub const PyMonitoring_FireJumpEvent = __root.PyMonitoring_FireJumpEvent;
    pub const PyMonitoring_FireBranchEvent = __root.PyMonitoring_FireBranchEvent;
    pub const PyMonitoring_FireCReturnEvent = __root.PyMonitoring_FireCReturnEvent;
    pub const PyMonitoring_FirePyThrowEvent = __root.PyMonitoring_FirePyThrowEvent;
    pub const PyMonitoring_FireRaiseEvent = __root.PyMonitoring_FireRaiseEvent;
    pub const PyMonitoring_FireReraiseEvent = __root.PyMonitoring_FireReraiseEvent;
    pub const PyMonitoring_FireExceptionHandledEvent = __root.PyMonitoring_FireExceptionHandledEvent;
    pub const PyMonitoring_FireCRaiseEvent = __root.PyMonitoring_FireCRaiseEvent;
    pub const PyMonitoring_FirePyUnwindEvent = __root.PyMonitoring_FirePyUnwindEvent;
    pub const PyMonitoring_FireStopIterationEvent = __root.PyMonitoring_FireStopIterationEvent;
    pub const EnterScope = __root.PyMonitoring_EnterScope;
    pub const FirePyStartEvent = __root._PyMonitoring_FirePyStartEvent;
    pub const FirePyResumeEvent = __root._PyMonitoring_FirePyResumeEvent;
    pub const FirePyReturnEvent = __root._PyMonitoring_FirePyReturnEvent;
    pub const FirePyYieldEvent = __root._PyMonitoring_FirePyYieldEvent;
    pub const FireCallEvent = __root._PyMonitoring_FireCallEvent;
    pub const FireLineEvent = __root._PyMonitoring_FireLineEvent;
    pub const FireJumpEvent = __root._PyMonitoring_FireJumpEvent;
    pub const FireBranchEvent = __root._PyMonitoring_FireBranchEvent;
    pub const FireCReturnEvent = __root._PyMonitoring_FireCReturnEvent;
    pub const FirePyThrowEvent = __root._PyMonitoring_FirePyThrowEvent;
    pub const FireRaiseEvent = __root._PyMonitoring_FireRaiseEvent;
    pub const FireReraiseEvent = __root._PyMonitoring_FireReraiseEvent;
    pub const FireExceptionHandledEvent = __root._PyMonitoring_FireExceptionHandledEvent;
    pub const FireCRaiseEvent = __root._PyMonitoring_FireCRaiseEvent;
    pub const FirePyUnwindEvent = __root._PyMonitoring_FirePyUnwindEvent;
    pub const FireStopIterationEvent = __root._PyMonitoring_FireStopIterationEvent;
};
pub const PyMonitoringState = struct__PyMonitoringState;
pub extern fn PyMonitoring_EnterScope(state_array: [*c]PyMonitoringState, version: [*c]u64, event_types: [*c]const u8, length: Py_ssize_t) c_int;
pub extern fn PyMonitoring_ExitScope() c_int;
pub extern fn _PyMonitoring_FirePyStartEvent(state: [*c]PyMonitoringState, codelike: [*c]PyObject, offset: i32) c_int;
pub extern fn _PyMonitoring_FirePyResumeEvent(state: [*c]PyMonitoringState, codelike: [*c]PyObject, offset: i32) c_int;
pub extern fn _PyMonitoring_FirePyReturnEvent(state: [*c]PyMonitoringState, codelike: [*c]PyObject, offset: i32, retval: [*c]PyObject) c_int;
pub extern fn _PyMonitoring_FirePyYieldEvent(state: [*c]PyMonitoringState, codelike: [*c]PyObject, offset: i32, retval: [*c]PyObject) c_int;
pub extern fn _PyMonitoring_FireCallEvent(state: [*c]PyMonitoringState, codelike: [*c]PyObject, offset: i32, callable: [*c]PyObject, arg0: [*c]PyObject) c_int;
pub extern fn _PyMonitoring_FireLineEvent(state: [*c]PyMonitoringState, codelike: [*c]PyObject, offset: i32, lineno: c_int) c_int;
pub extern fn _PyMonitoring_FireJumpEvent(state: [*c]PyMonitoringState, codelike: [*c]PyObject, offset: i32, target_offset: [*c]PyObject) c_int;
pub extern fn _PyMonitoring_FireBranchEvent(state: [*c]PyMonitoringState, codelike: [*c]PyObject, offset: i32, target_offset: [*c]PyObject) c_int;
pub extern fn _PyMonitoring_FireCReturnEvent(state: [*c]PyMonitoringState, codelike: [*c]PyObject, offset: i32, retval: [*c]PyObject) c_int;
pub extern fn _PyMonitoring_FirePyThrowEvent(state: [*c]PyMonitoringState, codelike: [*c]PyObject, offset: i32) c_int;
pub extern fn _PyMonitoring_FireRaiseEvent(state: [*c]PyMonitoringState, codelike: [*c]PyObject, offset: i32) c_int;
pub extern fn _PyMonitoring_FireReraiseEvent(state: [*c]PyMonitoringState, codelike: [*c]PyObject, offset: i32) c_int;
pub extern fn _PyMonitoring_FireExceptionHandledEvent(state: [*c]PyMonitoringState, codelike: [*c]PyObject, offset: i32) c_int;
pub extern fn _PyMonitoring_FireCRaiseEvent(state: [*c]PyMonitoringState, codelike: [*c]PyObject, offset: i32) c_int;
pub extern fn _PyMonitoring_FirePyUnwindEvent(state: [*c]PyMonitoringState, codelike: [*c]PyObject, offset: i32) c_int;
pub extern fn _PyMonitoring_FireStopIterationEvent(state: [*c]PyMonitoringState, codelike: [*c]PyObject, offset: i32, value: [*c]PyObject) c_int;
pub fn PyMonitoring_FirePyStartEvent(arg_state: [*c]PyMonitoringState, arg_codelike: [*c]PyObject, arg_offset: i32) callconv(.c) c_int {
    var state = arg_state;
    _ = &state;
    var codelike = arg_codelike;
    _ = &codelike;
    var offset = arg_offset;
    _ = &offset;
    if (@as(c_int, state.*.active) != 0) {
        return _PyMonitoring_FirePyStartEvent(state, codelike, offset);
    } else {
        return 0;
    }
    return undefined;
}
pub fn PyMonitoring_FirePyResumeEvent(arg_state: [*c]PyMonitoringState, arg_codelike: [*c]PyObject, arg_offset: i32) callconv(.c) c_int {
    var state = arg_state;
    _ = &state;
    var codelike = arg_codelike;
    _ = &codelike;
    var offset = arg_offset;
    _ = &offset;
    if (@as(c_int, state.*.active) != 0) {
        return _PyMonitoring_FirePyResumeEvent(state, codelike, offset);
    } else {
        return 0;
    }
    return undefined;
}
pub fn PyMonitoring_FirePyReturnEvent(arg_state: [*c]PyMonitoringState, arg_codelike: [*c]PyObject, arg_offset: i32, arg_retval: [*c]PyObject) callconv(.c) c_int {
    var state = arg_state;
    _ = &state;
    var codelike = arg_codelike;
    _ = &codelike;
    var offset = arg_offset;
    _ = &offset;
    var retval = arg_retval;
    _ = &retval;
    if (@as(c_int, state.*.active) != 0) {
        return _PyMonitoring_FirePyReturnEvent(state, codelike, offset, retval);
    } else {
        return 0;
    }
    return undefined;
}
pub fn PyMonitoring_FirePyYieldEvent(arg_state: [*c]PyMonitoringState, arg_codelike: [*c]PyObject, arg_offset: i32, arg_retval: [*c]PyObject) callconv(.c) c_int {
    var state = arg_state;
    _ = &state;
    var codelike = arg_codelike;
    _ = &codelike;
    var offset = arg_offset;
    _ = &offset;
    var retval = arg_retval;
    _ = &retval;
    if (@as(c_int, state.*.active) != 0) {
        return _PyMonitoring_FirePyYieldEvent(state, codelike, offset, retval);
    } else {
        return 0;
    }
    return undefined;
}
pub fn PyMonitoring_FireCallEvent(arg_state: [*c]PyMonitoringState, arg_codelike: [*c]PyObject, arg_offset: i32, arg_callable: [*c]PyObject, arg_arg0: [*c]PyObject) callconv(.c) c_int {
    var state = arg_state;
    _ = &state;
    var codelike = arg_codelike;
    _ = &codelike;
    var offset = arg_offset;
    _ = &offset;
    var callable = arg_callable;
    _ = &callable;
    var arg0 = arg_arg0;
    _ = &arg0;
    if (@as(c_int, state.*.active) != 0) {
        return _PyMonitoring_FireCallEvent(state, codelike, offset, callable, arg0);
    } else {
        return 0;
    }
    return undefined;
}
pub fn PyMonitoring_FireLineEvent(arg_state: [*c]PyMonitoringState, arg_codelike: [*c]PyObject, arg_offset: i32, arg_lineno: c_int) callconv(.c) c_int {
    var state = arg_state;
    _ = &state;
    var codelike = arg_codelike;
    _ = &codelike;
    var offset = arg_offset;
    _ = &offset;
    var lineno = arg_lineno;
    _ = &lineno;
    if (@as(c_int, state.*.active) != 0) {
        return _PyMonitoring_FireLineEvent(state, codelike, offset, lineno);
    } else {
        return 0;
    }
    return undefined;
}
pub fn PyMonitoring_FireJumpEvent(arg_state: [*c]PyMonitoringState, arg_codelike: [*c]PyObject, arg_offset: i32, arg_target_offset: [*c]PyObject) callconv(.c) c_int {
    var state = arg_state;
    _ = &state;
    var codelike = arg_codelike;
    _ = &codelike;
    var offset = arg_offset;
    _ = &offset;
    var target_offset = arg_target_offset;
    _ = &target_offset;
    if (@as(c_int, state.*.active) != 0) {
        return _PyMonitoring_FireJumpEvent(state, codelike, offset, target_offset);
    } else {
        return 0;
    }
    return undefined;
}
pub fn PyMonitoring_FireBranchEvent(arg_state: [*c]PyMonitoringState, arg_codelike: [*c]PyObject, arg_offset: i32, arg_target_offset: [*c]PyObject) callconv(.c) c_int {
    var state = arg_state;
    _ = &state;
    var codelike = arg_codelike;
    _ = &codelike;
    var offset = arg_offset;
    _ = &offset;
    var target_offset = arg_target_offset;
    _ = &target_offset;
    if (@as(c_int, state.*.active) != 0) {
        return _PyMonitoring_FireBranchEvent(state, codelike, offset, target_offset);
    } else {
        return 0;
    }
    return undefined;
}
pub fn PyMonitoring_FireCReturnEvent(arg_state: [*c]PyMonitoringState, arg_codelike: [*c]PyObject, arg_offset: i32, arg_retval: [*c]PyObject) callconv(.c) c_int {
    var state = arg_state;
    _ = &state;
    var codelike = arg_codelike;
    _ = &codelike;
    var offset = arg_offset;
    _ = &offset;
    var retval = arg_retval;
    _ = &retval;
    if (@as(c_int, state.*.active) != 0) {
        return _PyMonitoring_FireCReturnEvent(state, codelike, offset, retval);
    } else {
        return 0;
    }
    return undefined;
}
pub fn PyMonitoring_FirePyThrowEvent(arg_state: [*c]PyMonitoringState, arg_codelike: [*c]PyObject, arg_offset: i32) callconv(.c) c_int {
    var state = arg_state;
    _ = &state;
    var codelike = arg_codelike;
    _ = &codelike;
    var offset = arg_offset;
    _ = &offset;
    if (@as(c_int, state.*.active) != 0) {
        return _PyMonitoring_FirePyThrowEvent(state, codelike, offset);
    } else {
        return 0;
    }
    return undefined;
}
pub fn PyMonitoring_FireRaiseEvent(arg_state: [*c]PyMonitoringState, arg_codelike: [*c]PyObject, arg_offset: i32) callconv(.c) c_int {
    var state = arg_state;
    _ = &state;
    var codelike = arg_codelike;
    _ = &codelike;
    var offset = arg_offset;
    _ = &offset;
    if (@as(c_int, state.*.active) != 0) {
        return _PyMonitoring_FireRaiseEvent(state, codelike, offset);
    } else {
        return 0;
    }
    return undefined;
}
pub fn PyMonitoring_FireReraiseEvent(arg_state: [*c]PyMonitoringState, arg_codelike: [*c]PyObject, arg_offset: i32) callconv(.c) c_int {
    var state = arg_state;
    _ = &state;
    var codelike = arg_codelike;
    _ = &codelike;
    var offset = arg_offset;
    _ = &offset;
    if (@as(c_int, state.*.active) != 0) {
        return _PyMonitoring_FireReraiseEvent(state, codelike, offset);
    } else {
        return 0;
    }
    return undefined;
}
pub fn PyMonitoring_FireExceptionHandledEvent(arg_state: [*c]PyMonitoringState, arg_codelike: [*c]PyObject, arg_offset: i32) callconv(.c) c_int {
    var state = arg_state;
    _ = &state;
    var codelike = arg_codelike;
    _ = &codelike;
    var offset = arg_offset;
    _ = &offset;
    if (@as(c_int, state.*.active) != 0) {
        return _PyMonitoring_FireExceptionHandledEvent(state, codelike, offset);
    } else {
        return 0;
    }
    return undefined;
}
pub fn PyMonitoring_FireCRaiseEvent(arg_state: [*c]PyMonitoringState, arg_codelike: [*c]PyObject, arg_offset: i32) callconv(.c) c_int {
    var state = arg_state;
    _ = &state;
    var codelike = arg_codelike;
    _ = &codelike;
    var offset = arg_offset;
    _ = &offset;
    if (@as(c_int, state.*.active) != 0) {
        return _PyMonitoring_FireCRaiseEvent(state, codelike, offset);
    } else {
        return 0;
    }
    return undefined;
}
pub fn PyMonitoring_FirePyUnwindEvent(arg_state: [*c]PyMonitoringState, arg_codelike: [*c]PyObject, arg_offset: i32) callconv(.c) c_int {
    var state = arg_state;
    _ = &state;
    var codelike = arg_codelike;
    _ = &codelike;
    var offset = arg_offset;
    _ = &offset;
    if (@as(c_int, state.*.active) != 0) {
        return _PyMonitoring_FirePyUnwindEvent(state, codelike, offset);
    } else {
        return 0;
    }
    return undefined;
}
pub fn PyMonitoring_FireStopIterationEvent(arg_state: [*c]PyMonitoringState, arg_codelike: [*c]PyObject, arg_offset: i32, arg_value: [*c]PyObject) callconv(.c) c_int {
    var state = arg_state;
    _ = &state;
    var codelike = arg_codelike;
    _ = &codelike;
    var offset = arg_offset;
    _ = &offset;
    var value = arg_value;
    _ = &value;
    if (@as(c_int, state.*.active) != 0) {
        return _PyMonitoring_FireStopIterationEvent(state, codelike, offset, value);
    } else {
        return 0;
    }
    return undefined;
}
pub const PyFrameConstructor = extern struct {
    fc_globals: [*c]PyObject = null,
    fc_builtins: [*c]PyObject = null,
    fc_name: [*c]PyObject = null,
    fc_qualname: [*c]PyObject = null,
    fc_code: [*c]PyObject = null,
    fc_defaults: [*c]PyObject = null,
    fc_kwdefaults: [*c]PyObject = null,
    fc_closure: [*c]PyObject = null,
};
pub const PyFunctionObject = extern struct {
    ob_base: PyObject = @import("std").mem.zeroes(PyObject),
    func_globals: [*c]PyObject = null,
    func_builtins: [*c]PyObject = null,
    func_name: [*c]PyObject = null,
    func_qualname: [*c]PyObject = null,
    func_code: [*c]PyObject = null,
    func_defaults: [*c]PyObject = null,
    func_kwdefaults: [*c]PyObject = null,
    func_closure: [*c]PyObject = null,
    func_doc: [*c]PyObject = null,
    func_dict: [*c]PyObject = null,
    func_weakreflist: [*c]PyObject = null,
    func_module: [*c]PyObject = null,
    func_annotations: [*c]PyObject = null,
    func_typeparams: [*c]PyObject = null,
    vectorcall: vectorcallfunc = null,
    func_version: u32 = 0,
    pub const PyFunction_SetVectorcall = __root.PyFunction_SetVectorcall;
    pub const SetVectorcall = __root.PyFunction_SetVectorcall;
};
pub extern var PyFunction_Type: PyTypeObject;
pub extern fn PyFunction_New([*c]PyObject, [*c]PyObject) [*c]PyObject;
pub extern fn PyFunction_NewWithQualName([*c]PyObject, [*c]PyObject, [*c]PyObject) [*c]PyObject;
pub extern fn PyFunction_GetCode([*c]PyObject) [*c]PyObject;
pub extern fn PyFunction_GetGlobals([*c]PyObject) [*c]PyObject;
pub extern fn PyFunction_GetModule([*c]PyObject) [*c]PyObject;
pub extern fn PyFunction_GetDefaults([*c]PyObject) [*c]PyObject;
pub extern fn PyFunction_SetDefaults([*c]PyObject, [*c]PyObject) c_int;
pub extern fn PyFunction_SetVectorcall([*c]PyFunctionObject, vectorcallfunc) void;
pub extern fn PyFunction_GetKwDefaults([*c]PyObject) [*c]PyObject;
pub extern fn PyFunction_SetKwDefaults([*c]PyObject, [*c]PyObject) c_int;
pub extern fn PyFunction_GetClosure([*c]PyObject) [*c]PyObject;
pub extern fn PyFunction_SetClosure([*c]PyObject, [*c]PyObject) c_int;
pub extern fn PyFunction_GetAnnotations([*c]PyObject) [*c]PyObject;
pub extern fn PyFunction_SetAnnotations([*c]PyObject, [*c]PyObject) c_int;
pub fn PyFunction_GET_CODE(arg_func: [*c]PyObject) callconv(.c) [*c]PyObject {
    var func = arg_func;
    _ = &func;
    return (blk: {
        _ = !!(Py_IS_TYPE(func, &PyFunction_Type) != 0) or ((blk_1: {
            _assert("PyFunction_Check(func)", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/funcobject.h", 90);
            break :blk_1 0;
        }) != 0);
        break :blk @as([*c]PyFunctionObject, @ptrCast(@alignCast(func)));
    }).*.func_code;
}
pub fn PyFunction_GET_GLOBALS(arg_func: [*c]PyObject) callconv(.c) [*c]PyObject {
    var func = arg_func;
    _ = &func;
    return (blk: {
        _ = !!(Py_IS_TYPE(func, &PyFunction_Type) != 0) or ((blk_1: {
            _assert("PyFunction_Check(func)", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/funcobject.h", 95);
            break :blk_1 0;
        }) != 0);
        break :blk @as([*c]PyFunctionObject, @ptrCast(@alignCast(func)));
    }).*.func_globals;
}
pub fn PyFunction_GET_MODULE(arg_func: [*c]PyObject) callconv(.c) [*c]PyObject {
    var func = arg_func;
    _ = &func;
    return (blk: {
        _ = !!(Py_IS_TYPE(func, &PyFunction_Type) != 0) or ((blk_1: {
            _assert("PyFunction_Check(func)", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/funcobject.h", 100);
            break :blk_1 0;
        }) != 0);
        break :blk @as([*c]PyFunctionObject, @ptrCast(@alignCast(func)));
    }).*.func_module;
}
pub fn PyFunction_GET_DEFAULTS(arg_func: [*c]PyObject) callconv(.c) [*c]PyObject {
    var func = arg_func;
    _ = &func;
    return (blk: {
        _ = !!(Py_IS_TYPE(func, &PyFunction_Type) != 0) or ((blk_1: {
            _assert("PyFunction_Check(func)", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/funcobject.h", 105);
            break :blk_1 0;
        }) != 0);
        break :blk @as([*c]PyFunctionObject, @ptrCast(@alignCast(func)));
    }).*.func_defaults;
}
pub fn PyFunction_GET_KW_DEFAULTS(arg_func: [*c]PyObject) callconv(.c) [*c]PyObject {
    var func = arg_func;
    _ = &func;
    return (blk: {
        _ = !!(Py_IS_TYPE(func, &PyFunction_Type) != 0) or ((blk_1: {
            _assert("PyFunction_Check(func)", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/funcobject.h", 110);
            break :blk_1 0;
        }) != 0);
        break :blk @as([*c]PyFunctionObject, @ptrCast(@alignCast(func)));
    }).*.func_kwdefaults;
}
pub fn PyFunction_GET_CLOSURE(arg_func: [*c]PyObject) callconv(.c) [*c]PyObject {
    var func = arg_func;
    _ = &func;
    return (blk: {
        _ = !!(Py_IS_TYPE(func, &PyFunction_Type) != 0) or ((blk_1: {
            _assert("PyFunction_Check(func)", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/funcobject.h", 115);
            break :blk_1 0;
        }) != 0);
        break :blk @as([*c]PyFunctionObject, @ptrCast(@alignCast(func)));
    }).*.func_closure;
}
pub fn PyFunction_GET_ANNOTATIONS(arg_func: [*c]PyObject) callconv(.c) [*c]PyObject {
    var func = arg_func;
    _ = &func;
    return (blk: {
        _ = !!(Py_IS_TYPE(func, &PyFunction_Type) != 0) or ((blk_1: {
            _assert("PyFunction_Check(func)", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/funcobject.h", 120);
            break :blk_1 0;
        }) != 0);
        break :blk @as([*c]PyFunctionObject, @ptrCast(@alignCast(func)));
    }).*.func_annotations;
}
pub extern var PyClassMethod_Type: PyTypeObject;
pub extern var PyStaticMethod_Type: PyTypeObject;
pub extern fn PyClassMethod_New([*c]PyObject) [*c]PyObject;
pub extern fn PyStaticMethod_New([*c]PyObject) [*c]PyObject;
pub const PyFunction_EVENT_CREATE: c_int = 0;
pub const PyFunction_EVENT_DESTROY: c_int = 1;
pub const PyFunction_EVENT_MODIFY_CODE: c_int = 2;
pub const PyFunction_EVENT_MODIFY_DEFAULTS: c_int = 3;
pub const PyFunction_EVENT_MODIFY_KWDEFAULTS: c_int = 4;
pub const PyFunction_WatchEvent = c_uint;
pub const PyFunction_WatchCallback = ?*const fn (event: PyFunction_WatchEvent, func: [*c]PyFunctionObject, new_value: [*c]PyObject) callconv(.c) c_int;
pub extern fn PyFunction_AddWatcher(callback: PyFunction_WatchCallback) c_int;
pub extern fn PyFunction_ClearWatcher(watcher_id: c_int) c_int;
pub const PyMethodObject = extern struct {
    ob_base: PyObject = @import("std").mem.zeroes(PyObject),
    im_func: [*c]PyObject = null,
    im_self: [*c]PyObject = null,
    im_weakreflist: [*c]PyObject = null,
    vectorcall: vectorcallfunc = null,
};
pub extern var PyMethod_Type: PyTypeObject;
pub extern fn PyMethod_New([*c]PyObject, [*c]PyObject) [*c]PyObject;
pub extern fn PyMethod_Function([*c]PyObject) [*c]PyObject;
pub extern fn PyMethod_Self([*c]PyObject) [*c]PyObject;
pub fn PyMethod_GET_FUNCTION(arg_meth: [*c]PyObject) callconv(.c) [*c]PyObject {
    var meth = arg_meth;
    _ = &meth;
    return (blk: {
        _ = !!(Py_IS_TYPE(meth, &PyMethod_Type) != 0) or ((blk_1: {
            _assert("PyMethod_Check(meth)", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/classobject.h", 35);
            break :blk_1 0;
        }) != 0);
        break :blk @as([*c]PyMethodObject, @ptrCast(@alignCast(meth)));
    }).*.im_func;
}
pub fn PyMethod_GET_SELF(arg_meth: [*c]PyObject) callconv(.c) [*c]PyObject {
    var meth = arg_meth;
    _ = &meth;
    return (blk: {
        _ = !!(Py_IS_TYPE(meth, &PyMethod_Type) != 0) or ((blk_1: {
            _assert("PyMethod_Check(meth)", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/classobject.h", 40);
            break :blk_1 0;
        }) != 0);
        break :blk @as([*c]PyMethodObject, @ptrCast(@alignCast(meth)));
    }).*.im_self;
}
pub const PyInstanceMethodObject = extern struct {
    ob_base: PyObject = @import("std").mem.zeroes(PyObject),
    func: [*c]PyObject = null,
};
pub extern var PyInstanceMethod_Type: PyTypeObject;
pub extern fn PyInstanceMethod_New([*c]PyObject) [*c]PyObject;
pub extern fn PyInstanceMethod_Function([*c]PyObject) [*c]PyObject;
pub fn PyInstanceMethod_GET_FUNCTION(arg_meth: [*c]PyObject) callconv(.c) [*c]PyObject {
    var meth = arg_meth;
    _ = &meth;
    return (blk: {
        _ = !!(Py_IS_TYPE(meth, &PyInstanceMethod_Type) != 0) or ((blk_1: {
            _assert("PyInstanceMethod_Check(meth)", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/classobject.h", 63);
            break :blk_1 0;
        }) != 0);
        break :blk @as([*c]PyInstanceMethodObject, @ptrCast(@alignCast(meth)));
    }).*.func;
}
pub extern fn PyFile_FromFd(c_int, [*c]const u8, [*c]const u8, c_int, [*c]const u8, [*c]const u8, [*c]const u8, c_int) [*c]PyObject;
pub extern fn PyFile_GetLine([*c]PyObject, c_int) [*c]PyObject;
pub extern fn PyFile_WriteObject([*c]PyObject, [*c]PyObject, c_int) c_int;
pub extern fn PyFile_WriteString([*c]const u8, [*c]PyObject) c_int;
pub extern fn PyObject_AsFileDescriptor([*c]PyObject) c_int;
pub extern var Py_FileSystemDefaultEncoding: [*c]const u8;
pub extern var Py_FileSystemDefaultEncodeErrors: [*c]const u8;
pub extern var Py_HasFileSystemDefaultEncoding: c_int;
pub extern var Py_UTF8Mode: c_int;
pub extern fn Py_UniversalNewlineFgets([*c]u8, c_int, [*c]FILE, [*c]PyObject) [*c]u8;
pub extern fn PyFile_NewStdPrinter(c_int) [*c]PyObject;
pub extern var PyStdPrinter_Type: PyTypeObject;
pub const Py_OpenCodeHookFunction = ?*const fn ([*c]PyObject, ?*anyopaque) callconv(.c) [*c]PyObject;
pub extern fn PyFile_OpenCode(utf8path: [*c]const u8) [*c]PyObject;
pub extern fn PyFile_OpenCodeObject(path: [*c]PyObject) [*c]PyObject;
pub extern fn PyFile_SetOpenCodeHook(hook: Py_OpenCodeHookFunction, userData: ?*anyopaque) c_int;
pub extern var PyCapsule_Type: PyTypeObject;
pub const PyCapsule_Destructor = ?*const fn ([*c]PyObject) callconv(.c) void;
pub extern fn PyCapsule_New(pointer: ?*anyopaque, name: [*c]const u8, destructor: PyCapsule_Destructor) [*c]PyObject;
pub extern fn PyCapsule_GetPointer(capsule: [*c]PyObject, name: [*c]const u8) ?*anyopaque;
pub extern fn PyCapsule_GetDestructor(capsule: [*c]PyObject) PyCapsule_Destructor;
pub extern fn PyCapsule_GetName(capsule: [*c]PyObject) [*c]const u8;
pub extern fn PyCapsule_GetContext(capsule: [*c]PyObject) ?*anyopaque;
pub extern fn PyCapsule_IsValid(capsule: [*c]PyObject, name: [*c]const u8) c_int;
pub extern fn PyCapsule_SetPointer(capsule: [*c]PyObject, pointer: ?*anyopaque) c_int;
pub extern fn PyCapsule_SetDestructor(capsule: [*c]PyObject, destructor: PyCapsule_Destructor) c_int;
pub extern fn PyCapsule_SetName(capsule: [*c]PyObject, name: [*c]const u8) c_int;
pub extern fn PyCapsule_SetContext(capsule: [*c]PyObject, context: ?*anyopaque) c_int;
pub extern fn PyCapsule_Import(name: [*c]const u8, no_block: c_int) ?*anyopaque;
pub const struct__Py_LocalMonitors = extern struct {
    tools: [10]u8 = @import("std").mem.zeroes([10]u8),
};
pub const _Py_LocalMonitors = struct__Py_LocalMonitors;
pub const struct__Py_GlobalMonitors = extern struct {
    tools: [15]u8 = @import("std").mem.zeroes([15]u8),
};
pub const _Py_GlobalMonitors = struct__Py_GlobalMonitors;
pub const _PyCoCached = extern struct {
    _co_code: [*c]PyObject = null,
    _co_varnames: [*c]PyObject = null,
    _co_cellvars: [*c]PyObject = null,
    _co_freevars: [*c]PyObject = null,
};
pub const _PyCoLineInstrumentationData = extern struct {
    original_opcode: u8 = 0,
    line_delta: i8 = 0,
};
pub const struct__PyExecutorObject_8 = opaque {};
pub const _PyExecutorArray = extern struct {
    size: c_int = 0,
    capacity: c_int = 0,
    executors: [1]?*struct__PyExecutorObject_8 = @import("std").mem.zeroes([1]?*struct__PyExecutorObject_8),
};
pub const _PyCoMonitoringData = extern struct {
    local_monitors: _Py_LocalMonitors = @import("std").mem.zeroes(_Py_LocalMonitors),
    active_monitors: _Py_LocalMonitors = @import("std").mem.zeroes(_Py_LocalMonitors),
    tools: [*c]u8 = null,
    lines: [*c]_PyCoLineInstrumentationData = null,
    line_tools: [*c]u8 = null,
    per_instruction_opcodes: [*c]u8 = null,
    per_instruction_tools: [*c]u8 = null,
};
pub extern var PyCode_Type: PyTypeObject;
pub fn PyCode_GetNumFree(arg_op: [*c]PyCodeObject) callconv(.c) Py_ssize_t {
    var op = arg_op;
    _ = &op;
    _ = !!(Py_IS_TYPE(@as([*c]PyObject, @ptrCast(@alignCast(op))), &PyCode_Type) != 0) or ((blk: {
        _assert("PyCode_Check(op)", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/code.h", 184);
        break :blk 0;
    }) != 0);
    return op.*.co_nfreevars;
}
pub fn PyUnstable_Code_GetFirstFree(arg_op: [*c]PyCodeObject) callconv(.c) c_int {
    var op = arg_op;
    _ = &op;
    _ = !!(Py_IS_TYPE(@as([*c]PyObject, @ptrCast(@alignCast(op))), &PyCode_Type) != 0) or ((blk: {
        _assert("PyCode_Check(op)", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/code.h", 189);
        break :blk 0;
    }) != 0);
    return op.*.co_nlocalsplus - op.*.co_nfreevars;
}
pub fn PyCode_GetFirstFree(arg_op: [*c]PyCodeObject) callconv(.c) c_int {
    var op = arg_op;
    _ = &op;
    return PyUnstable_Code_GetFirstFree(op);
}
pub extern fn PyUnstable_Code_New(c_int, c_int, c_int, c_int, c_int, [*c]PyObject, [*c]PyObject, [*c]PyObject, [*c]PyObject, [*c]PyObject, [*c]PyObject, [*c]PyObject, [*c]PyObject, [*c]PyObject, c_int, [*c]PyObject, [*c]PyObject) [*c]PyCodeObject;
pub extern fn PyUnstable_Code_NewWithPosOnlyArgs(c_int, c_int, c_int, c_int, c_int, c_int, [*c]PyObject, [*c]PyObject, [*c]PyObject, [*c]PyObject, [*c]PyObject, [*c]PyObject, [*c]PyObject, [*c]PyObject, [*c]PyObject, c_int, [*c]PyObject, [*c]PyObject) [*c]PyCodeObject;
pub fn PyCode_New(arg_a: c_int, arg_b: c_int, arg_c: c_int, arg_d: c_int, arg_e: c_int, arg_f: [*c]PyObject, arg_g: [*c]PyObject, arg_h: [*c]PyObject, arg_i: [*c]PyObject, arg_j: [*c]PyObject, arg_k: [*c]PyObject, arg_l: [*c]PyObject, arg_m: [*c]PyObject, arg_n: [*c]PyObject, arg_o: c_int, arg_p: [*c]PyObject, arg_q: [*c]PyObject) callconv(.c) [*c]PyCodeObject {
    var a = arg_a;
    _ = &a;
    var b = arg_b;
    _ = &b;
    var c = arg_c;
    _ = &c;
    var d = arg_d;
    _ = &d;
    var e = arg_e;
    _ = &e;
    var f = arg_f;
    _ = &f;
    var g = arg_g;
    _ = &g;
    var h = arg_h;
    _ = &h;
    var i = arg_i;
    _ = &i;
    var j = arg_j;
    _ = &j;
    var k = arg_k;
    _ = &k;
    var l = arg_l;
    _ = &l;
    var m = arg_m;
    _ = &m;
    var n = arg_n;
    _ = &n;
    var o = arg_o;
    _ = &o;
    var p = arg_p;
    _ = &p;
    var q = arg_q;
    _ = &q;
    return PyUnstable_Code_New(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q);
}
pub fn PyCode_NewWithPosOnlyArgs(arg_a: c_int, arg_poac: c_int, arg_b: c_int, arg_c: c_int, arg_d: c_int, arg_e: c_int, arg_f: [*c]PyObject, arg_g: [*c]PyObject, arg_h: [*c]PyObject, arg_i: [*c]PyObject, arg_j: [*c]PyObject, arg_k: [*c]PyObject, arg_l: [*c]PyObject, arg_m: [*c]PyObject, arg_n: [*c]PyObject, arg_o: c_int, arg_p: [*c]PyObject, arg_q: [*c]PyObject) callconv(.c) [*c]PyCodeObject {
    var a = arg_a;
    _ = &a;
    var poac = arg_poac;
    _ = &poac;
    var b = arg_b;
    _ = &b;
    var c = arg_c;
    _ = &c;
    var d = arg_d;
    _ = &d;
    var e = arg_e;
    _ = &e;
    var f = arg_f;
    _ = &f;
    var g = arg_g;
    _ = &g;
    var h = arg_h;
    _ = &h;
    var i = arg_i;
    _ = &i;
    var j = arg_j;
    _ = &j;
    var k = arg_k;
    _ = &k;
    var l = arg_l;
    _ = &l;
    var m = arg_m;
    _ = &m;
    var n = arg_n;
    _ = &n;
    var o = arg_o;
    _ = &o;
    var p = arg_p;
    _ = &p;
    var q = arg_q;
    _ = &q;
    return PyUnstable_Code_NewWithPosOnlyArgs(a, poac, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q);
}
pub extern fn PyCode_NewEmpty(filename: [*c]const u8, funcname: [*c]const u8, firstlineno: c_int) [*c]PyCodeObject;
pub extern fn PyCode_Addr2Line([*c]PyCodeObject, c_int) c_int;
pub extern fn PyCode_Addr2Location([*c]PyCodeObject, c_int, [*c]c_int, [*c]c_int, [*c]c_int, [*c]c_int) c_int;
pub const PY_CODE_EVENT_CREATE: c_int = 0;
pub const PY_CODE_EVENT_DESTROY: c_int = 1;
pub const PyCodeEvent = c_uint;
pub const PyCode_WatchCallback = ?*const fn (event: PyCodeEvent, co: [*c]PyCodeObject) callconv(.c) c_int;
pub extern fn PyCode_AddWatcher(callback: PyCode_WatchCallback) c_int;
pub extern fn PyCode_ClearWatcher(watcher_id: c_int) c_int;
pub const struct__opaque = extern struct {
    computed_line: c_int = 0,
    lo_next: [*c]const u8 = null,
    limit: [*c]const u8 = null,
};
pub const struct__line_offsets = extern struct {
    ar_start: c_int = 0,
    ar_end: c_int = 0,
    ar_line: c_int = 0,
    @"opaque": struct__opaque = @import("std").mem.zeroes(struct__opaque),
};
pub const PyCodeAddressRange = struct__line_offsets;
pub extern fn _PyCode_CheckLineNumber(lasti: c_int, bounds: [*c]PyCodeAddressRange) c_int;
pub extern fn _PyCode_ConstantKey(obj: [*c]PyObject) [*c]PyObject;
pub extern fn PyCode_Optimize(code: [*c]PyObject, consts: [*c]PyObject, names: [*c]PyObject, lnotab: [*c]PyObject) [*c]PyObject;
pub extern fn PyUnstable_Code_GetExtra(code: [*c]PyObject, index: Py_ssize_t, extra: [*c]?*anyopaque) c_int;
pub extern fn PyUnstable_Code_SetExtra(code: [*c]PyObject, index: Py_ssize_t, extra: ?*anyopaque) c_int;
pub fn _PyCode_GetExtra(arg_code: [*c]PyObject, arg_index: Py_ssize_t, arg_extra: [*c]?*anyopaque) callconv(.c) c_int {
    var code = arg_code;
    _ = &code;
    var index = arg_index;
    _ = &index;
    var extra = arg_extra;
    _ = &extra;
    return PyUnstable_Code_GetExtra(code, index, extra);
}
pub fn _PyCode_SetExtra(arg_code: [*c]PyObject, arg_index: Py_ssize_t, arg_extra: ?*anyopaque) callconv(.c) c_int {
    var code = arg_code;
    _ = &code;
    var index = arg_index;
    _ = &index;
    var extra = arg_extra;
    _ = &extra;
    return PyUnstable_Code_SetExtra(code, index, extra);
}
pub extern fn PyCode_GetCode(code: [*c]PyCodeObject) [*c]PyObject;
pub extern fn PyCode_GetVarnames(code: [*c]PyCodeObject) [*c]PyObject;
pub extern fn PyCode_GetCellvars(code: [*c]PyCodeObject) [*c]PyObject;
pub extern fn PyCode_GetFreevars(code: [*c]PyCodeObject) [*c]PyObject;
pub const PY_CODE_LOCATION_INFO_SHORT0: c_int = 0;
pub const PY_CODE_LOCATION_INFO_ONE_LINE0: c_int = 10;
pub const PY_CODE_LOCATION_INFO_ONE_LINE1: c_int = 11;
pub const PY_CODE_LOCATION_INFO_ONE_LINE2: c_int = 12;
pub const PY_CODE_LOCATION_INFO_NO_COLUMNS: c_int = 13;
pub const PY_CODE_LOCATION_INFO_LONG: c_int = 14;
pub const PY_CODE_LOCATION_INFO_NONE: c_int = 15;
pub const enum__PyCodeLocationInfoKind = c_uint;
pub const _PyCodeLocationInfoKind = enum__PyCodeLocationInfoKind;
pub extern fn PyFrame_GetLineNumber(?*PyFrameObject) c_int;
pub extern fn PyFrame_GetCode(frame: ?*PyFrameObject) [*c]PyCodeObject;
pub extern var PyFrame_Type: PyTypeObject;
pub extern var PyFrameLocalsProxy_Type: PyTypeObject;
pub extern fn PyFrame_GetBack(frame: ?*PyFrameObject) ?*PyFrameObject;
pub extern fn PyFrame_GetLocals(frame: ?*PyFrameObject) [*c]PyObject;
pub extern fn PyFrame_GetGlobals(frame: ?*PyFrameObject) [*c]PyObject;
pub extern fn PyFrame_GetBuiltins(frame: ?*PyFrameObject) [*c]PyObject;
pub extern fn PyFrame_GetGenerator(frame: ?*PyFrameObject) [*c]PyObject;
pub extern fn PyFrame_GetLasti(frame: ?*PyFrameObject) c_int;
pub extern fn PyFrame_GetVar(frame: ?*PyFrameObject, name: [*c]PyObject) [*c]PyObject;
pub extern fn PyFrame_GetVarString(frame: ?*PyFrameObject, name: [*c]const u8) [*c]PyObject;
pub const struct__PyInterpreterFrame = opaque {
    pub const PyUnstable_InterpreterFrame_GetCode = __root.PyUnstable_InterpreterFrame_GetCode;
    pub const PyUnstable_InterpreterFrame_GetLasti = __root.PyUnstable_InterpreterFrame_GetLasti;
    pub const PyUnstable_InterpreterFrame_GetLine = __root.PyUnstable_InterpreterFrame_GetLine;
    pub const GetCode = __root.PyUnstable_InterpreterFrame_GetCode;
    pub const GetLasti = __root.PyUnstable_InterpreterFrame_GetLasti;
    pub const GetLine = __root.PyUnstable_InterpreterFrame_GetLine;
};
pub extern fn PyUnstable_InterpreterFrame_GetCode(frame: ?*struct__PyInterpreterFrame) [*c]PyObject;
pub extern fn PyUnstable_InterpreterFrame_GetLasti(frame: ?*struct__PyInterpreterFrame) c_int;
pub extern fn PyUnstable_InterpreterFrame_GetLine(frame: ?*struct__PyInterpreterFrame) c_int;
pub extern const PyUnstable_ExecutableKinds: [6][*c]const PyTypeObject;
pub extern fn PyTraceBack_Here(?*PyFrameObject) c_int;
pub extern fn PyTraceBack_Print([*c]PyObject, [*c]PyObject) c_int;
pub extern var PyTraceBack_Type: PyTypeObject;
pub const PyTracebackObject = struct__traceback;
pub const struct__traceback = extern struct {
    ob_base: PyObject = @import("std").mem.zeroes(PyObject),
    tb_next: [*c]PyTracebackObject = null,
    tb_frame: ?*PyFrameObject = null,
    tb_lasti: c_int = 0,
    tb_lineno: c_int = 0,
};
pub extern var _Py_EllipsisObject: PyObject;
pub const PySliceObject = extern struct {
    ob_base: PyObject = @import("std").mem.zeroes(PyObject),
    start: [*c]PyObject = null,
    stop: [*c]PyObject = null,
    step: [*c]PyObject = null,
    pub const _PySlice_GetLongIndices = __root._PySlice_GetLongIndices;
    pub const GetLongIndices = __root._PySlice_GetLongIndices;
};
pub extern var PySlice_Type: PyTypeObject;
pub extern var PyEllipsis_Type: PyTypeObject;
pub extern fn PySlice_New(start: [*c]PyObject, stop: [*c]PyObject, step: [*c]PyObject) [*c]PyObject;
pub extern fn _PySlice_FromIndices(start: Py_ssize_t, stop: Py_ssize_t) [*c]PyObject;
pub extern fn _PySlice_GetLongIndices(self: [*c]PySliceObject, length: [*c]PyObject, start_ptr: [*c][*c]PyObject, stop_ptr: [*c][*c]PyObject, step_ptr: [*c][*c]PyObject) c_int;
pub extern fn PySlice_GetIndices(r: [*c]PyObject, length: Py_ssize_t, start: [*c]Py_ssize_t, stop: [*c]Py_ssize_t, step: [*c]Py_ssize_t) c_int;
pub extern fn PySlice_GetIndicesEx(r: [*c]PyObject, length: Py_ssize_t, start: [*c]Py_ssize_t, stop: [*c]Py_ssize_t, step: [*c]Py_ssize_t, slicelength: [*c]Py_ssize_t) c_int;
pub extern fn PySlice_Unpack(slice: [*c]PyObject, start: [*c]Py_ssize_t, stop: [*c]Py_ssize_t, step: [*c]Py_ssize_t) c_int;
pub extern fn PySlice_AdjustIndices(length: Py_ssize_t, start: [*c]Py_ssize_t, stop: [*c]Py_ssize_t, step: Py_ssize_t) Py_ssize_t;
pub const PyCellObject = extern struct {
    ob_base: PyObject = @import("std").mem.zeroes(PyObject),
    ob_ref: [*c]PyObject = null,
};
pub extern var PyCell_Type: PyTypeObject;
pub extern fn PyCell_New([*c]PyObject) [*c]PyObject;
pub extern fn PyCell_Get([*c]PyObject) [*c]PyObject;
pub extern fn PyCell_Set([*c]PyObject, [*c]PyObject) c_int;
pub fn PyCell_GET(arg_op: [*c]PyObject) callconv(.c) [*c]PyObject {
    var op = arg_op;
    _ = &op;
    var cell: [*c]PyCellObject = undefined;
    _ = &cell;
    _ = !!(Py_IS_TYPE(op, &PyCell_Type) != 0) or ((blk: {
        _assert("PyCell_Check(op)", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/cellobject.h", 26);
        break :blk 0;
    }) != 0);
    cell = @as([*c]PyCellObject, @ptrCast(@alignCast(op)));
    return cell.*.ob_ref;
}
pub fn PyCell_SET(arg_op: [*c]PyObject, arg_value: [*c]PyObject) callconv(.c) void {
    var op = arg_op;
    _ = &op;
    var value = arg_value;
    _ = &value;
    var cell: [*c]PyCellObject = undefined;
    _ = &cell;
    _ = !!(Py_IS_TYPE(op, &PyCell_Type) != 0) or ((blk: {
        _assert("PyCell_Check(op)", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/cellobject.h", 34);
        break :blk 0;
    }) != 0);
    cell = @as([*c]PyCellObject, @ptrCast(@alignCast(op)));
    cell.*.ob_ref = value;
}
pub extern var PySeqIter_Type: PyTypeObject;
pub extern var PyCallIter_Type: PyTypeObject;
pub extern fn PySeqIter_New([*c]PyObject) [*c]PyObject;
pub extern fn PyCallIter_New([*c]PyObject, [*c]PyObject) [*c]PyObject;
pub const _PyStatus_TYPE_OK: c_int = 0;
pub const _PyStatus_TYPE_ERROR: c_int = 1;
pub const _PyStatus_TYPE_EXIT: c_int = 2;
const enum_unnamed_9 = c_uint;
pub const PyStatus = extern struct {
    _type: enum_unnamed_9 = @import("std").mem.zeroes(enum_unnamed_9),
    func: [*c]const u8 = null,
    err_msg: [*c]const u8 = null,
    exitcode: c_int = 0,
    pub const PyStatus_IsError = __root.PyStatus_IsError;
    pub const PyStatus_IsExit = __root.PyStatus_IsExit;
    pub const PyStatus_Exception = __root.PyStatus_Exception;
    pub const Py_ExitStatusException = __root.Py_ExitStatusException;
    pub const IsError = __root.PyStatus_IsError;
    pub const IsExit = __root.PyStatus_IsExit;
    pub const Exception = __root.PyStatus_Exception;
    pub const ExitStatusException = __root.Py_ExitStatusException;
};
pub extern fn PyStatus_Ok() PyStatus;
pub extern fn PyStatus_Error(err_msg: [*c]const u8) PyStatus;
pub extern fn PyStatus_NoMemory() PyStatus;
pub extern fn PyStatus_Exit(exitcode: c_int) PyStatus;
pub extern fn PyStatus_IsError(err: PyStatus) c_int;
pub extern fn PyStatus_IsExit(err: PyStatus) c_int;
pub extern fn PyStatus_Exception(err: PyStatus) c_int;
pub const PyWideStringList = extern struct {
    length: Py_ssize_t = 0,
    items: [*c][*c]wchar_t = null,
    pub const PyWideStringList_Append = __root.PyWideStringList_Append;
    pub const PyWideStringList_Insert = __root.PyWideStringList_Insert;
    pub const Append = __root.PyWideStringList_Append;
    pub const Insert = __root.PyWideStringList_Insert;
};
pub extern fn PyWideStringList_Append(list: [*c]PyWideStringList, item: [*c]const wchar_t) PyStatus;
pub extern fn PyWideStringList_Insert(list: [*c]PyWideStringList, index: Py_ssize_t, item: [*c]const wchar_t) PyStatus;
pub const struct_PyPreConfig = extern struct {
    _config_init: c_int = 0,
    parse_argv: c_int = 0,
    isolated: c_int = 0,
    use_environment: c_int = 0,
    configure_locale: c_int = 0,
    coerce_c_locale: c_int = 0,
    coerce_c_locale_warn: c_int = 0,
    legacy_windows_fs_encoding: c_int = 0,
    utf8_mode: c_int = 0,
    dev_mode: c_int = 0,
    allocator: c_int = 0,
    pub const PyPreConfig_InitPythonConfig = __root.PyPreConfig_InitPythonConfig;
    pub const PyPreConfig_InitIsolatedConfig = __root.PyPreConfig_InitIsolatedConfig;
    pub const Py_PreInitialize = __root.Py_PreInitialize;
    pub const Py_PreInitializeFromBytesArgs = __root.Py_PreInitializeFromBytesArgs;
    pub const Py_PreInitializeFromArgs = __root.Py_PreInitializeFromArgs;
    pub const InitPythonConfig = __root.PyPreConfig_InitPythonConfig;
    pub const InitIsolatedConfig = __root.PyPreConfig_InitIsolatedConfig;
    pub const PreInitialize = __root.Py_PreInitialize;
    pub const PreInitializeFromBytesArgs = __root.Py_PreInitializeFromBytesArgs;
    pub const PreInitializeFromArgs = __root.Py_PreInitializeFromArgs;
};
pub const PyPreConfig = struct_PyPreConfig;
pub extern fn PyPreConfig_InitPythonConfig(config: [*c]PyPreConfig) void;
pub extern fn PyPreConfig_InitIsolatedConfig(config: [*c]PyPreConfig) void;
pub const struct_PyConfig = extern struct {
    _config_init: c_int = 0,
    isolated: c_int = 0,
    use_environment: c_int = 0,
    dev_mode: c_int = 0,
    install_signal_handlers: c_int = 0,
    use_hash_seed: c_int = 0,
    hash_seed: c_ulong = 0,
    faulthandler: c_int = 0,
    tracemalloc: c_int = 0,
    perf_profiling: c_int = 0,
    import_time: c_int = 0,
    code_debug_ranges: c_int = 0,
    show_ref_count: c_int = 0,
    dump_refs: c_int = 0,
    dump_refs_file: [*c]wchar_t = null,
    malloc_stats: c_int = 0,
    filesystem_encoding: [*c]wchar_t = null,
    filesystem_errors: [*c]wchar_t = null,
    pycache_prefix: [*c]wchar_t = null,
    parse_argv: c_int = 0,
    orig_argv: PyWideStringList = @import("std").mem.zeroes(PyWideStringList),
    argv: PyWideStringList = @import("std").mem.zeroes(PyWideStringList),
    xoptions: PyWideStringList = @import("std").mem.zeroes(PyWideStringList),
    warnoptions: PyWideStringList = @import("std").mem.zeroes(PyWideStringList),
    site_import: c_int = 0,
    bytes_warning: c_int = 0,
    warn_default_encoding: c_int = 0,
    inspect: c_int = 0,
    interactive: c_int = 0,
    optimization_level: c_int = 0,
    parser_debug: c_int = 0,
    write_bytecode: c_int = 0,
    verbose: c_int = 0,
    quiet: c_int = 0,
    user_site_directory: c_int = 0,
    configure_c_stdio: c_int = 0,
    buffered_stdio: c_int = 0,
    stdio_encoding: [*c]wchar_t = null,
    stdio_errors: [*c]wchar_t = null,
    legacy_windows_stdio: c_int = 0,
    check_hash_pycs_mode: [*c]wchar_t = null,
    use_frozen_modules: c_int = 0,
    safe_path: c_int = 0,
    int_max_str_digits: c_int = 0,
    cpu_count: c_int = 0,
    pathconfig_warnings: c_int = 0,
    program_name: [*c]wchar_t = null,
    pythonpath_env: [*c]wchar_t = null,
    home: [*c]wchar_t = null,
    platlibdir: [*c]wchar_t = null,
    module_search_paths_set: c_int = 0,
    module_search_paths: PyWideStringList = @import("std").mem.zeroes(PyWideStringList),
    stdlib_dir: [*c]wchar_t = null,
    executable: [*c]wchar_t = null,
    base_executable: [*c]wchar_t = null,
    prefix: [*c]wchar_t = null,
    base_prefix: [*c]wchar_t = null,
    exec_prefix: [*c]wchar_t = null,
    base_exec_prefix: [*c]wchar_t = null,
    skip_source_first_line: c_int = 0,
    run_command: [*c]wchar_t = null,
    run_module: [*c]wchar_t = null,
    run_filename: [*c]wchar_t = null,
    sys_path_0: [*c]wchar_t = null,
    _install_importlib: c_int = 0,
    _init_main: c_int = 0,
    _is_python_build: c_int = 0,
    pub const PyConfig_InitPythonConfig = __root.PyConfig_InitPythonConfig;
    pub const PyConfig_InitIsolatedConfig = __root.PyConfig_InitIsolatedConfig;
    pub const PyConfig_Clear = __root.PyConfig_Clear;
    pub const PyConfig_SetString = __root.PyConfig_SetString;
    pub const PyConfig_SetBytesString = __root.PyConfig_SetBytesString;
    pub const PyConfig_Read = __root.PyConfig_Read;
    pub const PyConfig_SetBytesArgv = __root.PyConfig_SetBytesArgv;
    pub const PyConfig_SetArgv = __root.PyConfig_SetArgv;
    pub const PyConfig_SetWideStringList = __root.PyConfig_SetWideStringList;
    pub const Py_InitializeFromConfig = __root.Py_InitializeFromConfig;
    pub const InitPythonConfig = __root.PyConfig_InitPythonConfig;
    pub const InitIsolatedConfig = __root.PyConfig_InitIsolatedConfig;
    pub const Clear = __root.PyConfig_Clear;
    pub const SetString = __root.PyConfig_SetString;
    pub const SetBytesString = __root.PyConfig_SetBytesString;
    pub const Read = __root.PyConfig_Read;
    pub const SetBytesArgv = __root.PyConfig_SetBytesArgv;
    pub const SetArgv = __root.PyConfig_SetArgv;
    pub const SetWideStringList = __root.PyConfig_SetWideStringList;
    pub const InitializeFromConfig = __root.Py_InitializeFromConfig;
};
pub const PyConfig = struct_PyConfig;
pub extern fn PyConfig_InitPythonConfig(config: [*c]PyConfig) void;
pub extern fn PyConfig_InitIsolatedConfig(config: [*c]PyConfig) void;
pub extern fn PyConfig_Clear([*c]PyConfig) void;
pub extern fn PyConfig_SetString(config: [*c]PyConfig, config_str: [*c][*c]wchar_t, str: [*c]const wchar_t) PyStatus;
pub extern fn PyConfig_SetBytesString(config: [*c]PyConfig, config_str: [*c][*c]wchar_t, str: [*c]const u8) PyStatus;
pub extern fn PyConfig_Read(config: [*c]PyConfig) PyStatus;
pub extern fn PyConfig_SetBytesArgv(config: [*c]PyConfig, argc: Py_ssize_t, argv: [*c]const [*c]u8) PyStatus;
pub extern fn PyConfig_SetArgv(config: [*c]PyConfig, argc: Py_ssize_t, argv: [*c]const [*c]wchar_t) PyStatus;
pub extern fn PyConfig_SetWideStringList(config: [*c]PyConfig, list: [*c]PyWideStringList, length: Py_ssize_t, items: [*c][*c]wchar_t) PyStatus;
pub extern fn Py_GetArgcArgv(argc: [*c]c_int, argv: [*c][*c][*c]wchar_t) void;
pub extern fn PyInterpreterState_New() ?*PyInterpreterState;
pub extern fn PyInterpreterState_Clear(?*PyInterpreterState) void;
pub extern fn PyInterpreterState_Delete(?*PyInterpreterState) void;
pub extern fn PyInterpreterState_Get() ?*PyInterpreterState;
pub extern fn PyInterpreterState_GetDict(?*PyInterpreterState) [*c]PyObject;
pub extern fn PyInterpreterState_GetID(?*PyInterpreterState) i64;
pub extern fn PyState_AddModule([*c]PyObject, [*c]PyModuleDef) c_int;
pub extern fn PyState_RemoveModule([*c]PyModuleDef) c_int;
pub extern fn PyState_FindModule([*c]PyModuleDef) [*c]PyObject;
pub extern fn PyThreadState_New(?*PyInterpreterState) ?*PyThreadState;
pub extern fn PyThreadState_Clear(?*PyThreadState) void;
pub extern fn PyThreadState_Delete(?*PyThreadState) void;
pub extern fn PyThreadState_Get() ?*PyThreadState;
pub extern fn PyThreadState_Swap(?*PyThreadState) ?*PyThreadState;
pub extern fn PyThreadState_GetDict() [*c]PyObject;
pub extern fn PyThreadState_SetAsyncExc(c_ulong, [*c]PyObject) c_int;
pub extern fn PyThreadState_GetInterpreter(tstate: ?*PyThreadState) ?*PyInterpreterState;
pub extern fn PyThreadState_GetFrame(tstate: ?*PyThreadState) ?*PyFrameObject;
pub extern fn PyThreadState_GetID(tstate: ?*PyThreadState) u64;
pub const PyGILState_LOCKED: c_int = 0;
pub const PyGILState_UNLOCKED: c_int = 1;
pub const PyGILState_STATE = c_uint;
pub extern fn PyGILState_Ensure() PyGILState_STATE;
pub extern fn PyGILState_Release(PyGILState_STATE) void;
pub extern fn PyGILState_GetThisThreadState() ?*PyThreadState;
pub extern fn _PyInterpreterState_RequiresIDRef(?*PyInterpreterState) c_int;
pub extern fn _PyInterpreterState_RequireIDRef(?*PyInterpreterState, c_int) void;
pub extern fn PyUnstable_InterpreterState_GetMainModule(?*PyInterpreterState) [*c]PyObject;
pub const Py_tracefunc = ?*const fn ([*c]PyObject, ?*PyFrameObject, c_int, [*c]PyObject) callconv(.c) c_int;
pub const struct__err_stackitem = extern struct {
    exc_value: [*c]PyObject = null,
    previous_item: [*c]struct__err_stackitem = null,
};
pub const _PyErr_StackItem = struct__err_stackitem;
pub const struct__stack_chunk = extern struct {
    previous: [*c]struct__stack_chunk = null,
    size: usize = 0,
    top: usize = 0,
    data: [1][*c]PyObject = @import("std").mem.zeroes([1][*c]PyObject),
};
pub const _PyStackChunk = struct__stack_chunk;
pub extern fn PyThreadState_GetUnchecked() ?*PyThreadState;
pub extern fn PyThreadState_EnterTracing(tstate: ?*PyThreadState) void;
pub extern fn PyThreadState_LeaveTracing(tstate: ?*PyThreadState) void;
pub extern fn PyGILState_Check() c_int;
pub extern fn _PyThread_CurrentFrames() [*c]PyObject;
pub extern fn PyInterpreterState_Main() ?*PyInterpreterState;
pub extern fn PyInterpreterState_Head() ?*PyInterpreterState;
pub extern fn PyInterpreterState_Next(?*PyInterpreterState) ?*PyInterpreterState;
pub extern fn PyInterpreterState_ThreadHead(?*PyInterpreterState) ?*PyThreadState;
pub extern fn PyThreadState_Next(?*PyThreadState) ?*PyThreadState;
pub extern fn PyThreadState_DeleteCurrent() void;
pub const _PyFrameEvalFunction = ?*const fn (tstate: ?*PyThreadState, ?*struct__PyInterpreterFrame, c_int) callconv(.c) [*c]PyObject;
pub extern fn _PyInterpreterState_GetEvalFrameFunc(interp: ?*PyInterpreterState) _PyFrameEvalFunction;
pub extern fn _PyInterpreterState_SetEvalFrameFunc(interp: ?*PyInterpreterState, eval_frame: _PyFrameEvalFunction) void;
pub const PyGenObject = extern struct {
    ob_base: PyObject = @import("std").mem.zeroes(PyObject),
    gi_weakreflist: [*c]PyObject = null,
    gi_name: [*c]PyObject = null,
    gi_qualname: [*c]PyObject = null,
    gi_exc_state: _PyErr_StackItem = @import("std").mem.zeroes(_PyErr_StackItem),
    gi_origin_or_finalizer: [*c]PyObject = null,
    gi_hooks_inited: u8 = 0,
    gi_closed: u8 = 0,
    gi_running_async: u8 = 0,
    gi_frame_state: i8 = 0,
    gi_iframe: [1][*c]PyObject = @import("std").mem.zeroes([1][*c]PyObject),
    pub const PyGen_GetCode = __root.PyGen_GetCode;
    pub const GetCode = __root.PyGen_GetCode;
};
pub extern var PyGen_Type: PyTypeObject;
pub extern fn PyGen_New(?*PyFrameObject) [*c]PyObject;
pub extern fn PyGen_NewWithQualName(?*PyFrameObject, name: [*c]PyObject, qualname: [*c]PyObject) [*c]PyObject;
pub extern fn PyGen_GetCode(gen: [*c]PyGenObject) [*c]PyCodeObject;
pub const PyCoroObject = extern struct {
    ob_base: PyObject = @import("std").mem.zeroes(PyObject),
    cr_weakreflist: [*c]PyObject = null,
    cr_name: [*c]PyObject = null,
    cr_qualname: [*c]PyObject = null,
    cr_exc_state: _PyErr_StackItem = @import("std").mem.zeroes(_PyErr_StackItem),
    cr_origin_or_finalizer: [*c]PyObject = null,
    cr_hooks_inited: u8 = 0,
    cr_closed: u8 = 0,
    cr_running_async: u8 = 0,
    cr_frame_state: i8 = 0,
    cr_iframe: [1][*c]PyObject = @import("std").mem.zeroes([1][*c]PyObject),
};
pub extern var PyCoro_Type: PyTypeObject;
pub extern fn PyCoro_New(?*PyFrameObject, name: [*c]PyObject, qualname: [*c]PyObject) [*c]PyObject;
pub const PyAsyncGenObject = extern struct {
    ob_base: PyObject = @import("std").mem.zeroes(PyObject),
    ag_weakreflist: [*c]PyObject = null,
    ag_name: [*c]PyObject = null,
    ag_qualname: [*c]PyObject = null,
    ag_exc_state: _PyErr_StackItem = @import("std").mem.zeroes(_PyErr_StackItem),
    ag_origin_or_finalizer: [*c]PyObject = null,
    ag_hooks_inited: u8 = 0,
    ag_closed: u8 = 0,
    ag_running_async: u8 = 0,
    ag_frame_state: i8 = 0,
    ag_iframe: [1][*c]PyObject = @import("std").mem.zeroes([1][*c]PyObject),
};
pub extern var PyAsyncGen_Type: PyTypeObject;
pub extern var _PyAsyncGenASend_Type: PyTypeObject;
pub extern fn PyAsyncGen_New(?*PyFrameObject, name: [*c]PyObject, qualname: [*c]PyObject) [*c]PyObject;
pub extern var PyClassMethodDescr_Type: PyTypeObject;
pub extern var PyGetSetDescr_Type: PyTypeObject;
pub extern var PyMemberDescr_Type: PyTypeObject;
pub extern var PyMethodDescr_Type: PyTypeObject;
pub extern var PyWrapperDescr_Type: PyTypeObject;
pub extern var PyDictProxy_Type: PyTypeObject;
pub extern var PyProperty_Type: PyTypeObject;
pub extern fn PyDescr_NewMethod([*c]PyTypeObject, [*c]PyMethodDef) [*c]PyObject;
pub extern fn PyDescr_NewClassMethod([*c]PyTypeObject, [*c]PyMethodDef) [*c]PyObject;
pub extern fn PyDescr_NewMember([*c]PyTypeObject, [*c]PyMemberDef) [*c]PyObject;
pub extern fn PyDescr_NewGetSet([*c]PyTypeObject, [*c]PyGetSetDef) [*c]PyObject;
pub extern fn PyDictProxy_New([*c]PyObject) [*c]PyObject;
pub extern fn PyWrapper_New([*c]PyObject, [*c]PyObject) [*c]PyObject;
pub extern fn PyMember_GetOne([*c]const u8, [*c]PyMemberDef) [*c]PyObject;
pub extern fn PyMember_SetOne([*c]u8, [*c]PyMemberDef, [*c]PyObject) c_int;
pub const wrapperfunc = ?*const fn (self: [*c]PyObject, args: [*c]PyObject, wrapped: ?*anyopaque) callconv(.c) [*c]PyObject;
pub const wrapperfunc_kwds = ?*const fn (self: [*c]PyObject, args: [*c]PyObject, wrapped: ?*anyopaque, kwds: [*c]PyObject) callconv(.c) [*c]PyObject;
pub const struct_wrapperbase = extern struct {
    name: [*c]const u8 = null,
    offset: c_int = 0,
    function: ?*anyopaque = null,
    wrapper: wrapperfunc = null,
    doc: [*c]const u8 = null,
    flags: c_int = 0,
    name_strobj: [*c]PyObject = null,
};
pub const PyDescrObject = extern struct {
    ob_base: PyObject = @import("std").mem.zeroes(PyObject),
    d_type: [*c]PyTypeObject = null,
    d_name: [*c]PyObject = null,
    d_qualname: [*c]PyObject = null,
};
pub const PyMethodDescrObject = extern struct {
    d_common: PyDescrObject = @import("std").mem.zeroes(PyDescrObject),
    d_method: [*c]PyMethodDef = null,
    vectorcall: vectorcallfunc = null,
};
pub const PyMemberDescrObject = extern struct {
    d_common: PyDescrObject = @import("std").mem.zeroes(PyDescrObject),
    d_member: [*c]PyMemberDef = null,
};
pub const PyGetSetDescrObject = extern struct {
    d_common: PyDescrObject = @import("std").mem.zeroes(PyDescrObject),
    d_getset: [*c]PyGetSetDef = null,
};
pub const PyWrapperDescrObject = extern struct {
    d_common: PyDescrObject = @import("std").mem.zeroes(PyDescrObject),
    d_base: [*c]struct_wrapperbase = null,
    d_wrapped: ?*anyopaque = null,
};
pub extern fn PyDescr_NewWrapper([*c]PyTypeObject, [*c]struct_wrapperbase, ?*anyopaque) [*c]PyObject;
pub extern fn PyDescr_IsData([*c]PyObject) c_int;
pub extern fn Py_GenericAlias([*c]PyObject, [*c]PyObject) [*c]PyObject;
pub extern var Py_GenericAliasType: PyTypeObject;
pub extern fn PyErr_WarnEx(category: [*c]PyObject, message: [*c]const u8, stack_level: Py_ssize_t) c_int;
pub extern fn PyErr_WarnFormat(category: [*c]PyObject, stack_level: Py_ssize_t, format: [*c]const u8, ...) c_int;
pub extern fn PyErr_ResourceWarning(source: [*c]PyObject, stack_level: Py_ssize_t, format: [*c]const u8, ...) c_int;
pub extern fn PyErr_WarnExplicit(category: [*c]PyObject, message: [*c]const u8, filename: [*c]const u8, lineno: c_int, module: [*c]const u8, registry: [*c]PyObject) c_int;
pub extern fn PyErr_WarnExplicitObject(category: [*c]PyObject, message: [*c]PyObject, filename: [*c]PyObject, lineno: c_int, module: [*c]PyObject, registry: [*c]PyObject) c_int;
pub extern fn PyErr_WarnExplicitFormat(category: [*c]PyObject, filename: [*c]const u8, lineno: c_int, module: [*c]const u8, registry: [*c]PyObject, format: [*c]const u8, ...) c_int;
pub const PyWeakReference = struct__PyWeakReference;
pub const struct__PyWeakReference = extern struct {
    ob_base: PyObject = @import("std").mem.zeroes(PyObject),
    wr_object: [*c]PyObject = null,
    wr_callback: [*c]PyObject = null,
    hash: Py_hash_t = 0,
    wr_prev: [*c]PyWeakReference = null,
    wr_next: [*c]PyWeakReference = null,
    vectorcall: vectorcallfunc = null,
    pub const _PyWeakref_ClearRef = __root._PyWeakref_ClearRef;
    pub const ClearRef = __root._PyWeakref_ClearRef;
};
pub extern var _PyWeakref_RefType: PyTypeObject;
pub extern var _PyWeakref_ProxyType: PyTypeObject;
pub extern var _PyWeakref_CallableProxyType: PyTypeObject;
pub extern fn PyWeakref_NewRef(ob: [*c]PyObject, callback: [*c]PyObject) [*c]PyObject;
pub extern fn PyWeakref_NewProxy(ob: [*c]PyObject, callback: [*c]PyObject) [*c]PyObject;
pub extern fn PyWeakref_GetObject(ref: [*c]PyObject) [*c]PyObject;
pub extern fn PyWeakref_GetRef(ref: [*c]PyObject, pobj: [*c][*c]PyObject) c_int;
pub extern fn _PyWeakref_ClearRef(self: [*c]PyWeakReference) void;
pub fn PyWeakref_GET_OBJECT(arg_ref_obj: [*c]PyObject) callconv(.c) [*c]PyObject {
    var ref_obj = arg_ref_obj;
    _ = &ref_obj;
    var ref: [*c]PyWeakReference = undefined;
    _ = &ref;
    var obj: [*c]PyObject = undefined;
    _ = &obj;
    _ = !!((PyObject_TypeCheck(ref_obj, &_PyWeakref_RefType) != 0) or ((Py_IS_TYPE(ref_obj, &_PyWeakref_ProxyType) != 0) or (Py_IS_TYPE(ref_obj, &_PyWeakref_CallableProxyType) != 0))) or ((blk: {
        _assert("PyWeakref_Check(ref_obj)", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/weakrefobject.h", 49);
        break :blk 0;
    }) != 0);
    ref = @as([*c]PyWeakReference, @ptrCast(@alignCast(ref_obj)));
    obj = ref.*.wr_object;
    if (Py_REFCNT(obj) > @as(Py_ssize_t, 0)) {
        return obj;
    }
    return &_Py_NoneStruct;
}
pub const struct_PyStructSequence_Field = extern struct {
    name: [*c]const u8 = null,
    doc: [*c]const u8 = null,
};
pub const PyStructSequence_Field = struct_PyStructSequence_Field;
pub const struct_PyStructSequence_Desc = extern struct {
    name: [*c]const u8 = null,
    doc: [*c]const u8 = null,
    fields: [*c]PyStructSequence_Field = null,
    n_in_sequence: c_int = 0,
    pub const PyStructSequence_NewType = __root.PyStructSequence_NewType;
    pub const NewType = __root.PyStructSequence_NewType;
};
pub const PyStructSequence_Desc = struct_PyStructSequence_Desc;
pub extern const PyStructSequence_UnnamedField: [*c]const u8;
pub extern fn PyStructSequence_InitType(@"type": [*c]PyTypeObject, desc: [*c]PyStructSequence_Desc) void;
pub extern fn PyStructSequence_InitType2(@"type": [*c]PyTypeObject, desc: [*c]PyStructSequence_Desc) c_int;
pub extern fn PyStructSequence_NewType(desc: [*c]PyStructSequence_Desc) [*c]PyTypeObject;
pub extern fn PyStructSequence_New(@"type": [*c]PyTypeObject) [*c]PyObject;
pub extern fn PyStructSequence_SetItem([*c]PyObject, Py_ssize_t, [*c]PyObject) void;
pub extern fn PyStructSequence_GetItem([*c]PyObject, Py_ssize_t) [*c]PyObject;
pub const PyStructSequence = PyTupleObject;
pub extern var PyPickleBuffer_Type: PyTypeObject;
pub extern fn PyPickleBuffer_FromObject([*c]PyObject) [*c]PyObject;
pub extern fn PyPickleBuffer_GetBuffer([*c]PyObject) [*c]const Py_buffer;
pub extern fn PyPickleBuffer_Release([*c]PyObject) c_int;
pub const PyTime_t = i64;
pub extern fn PyTime_AsSecondsDouble(t: PyTime_t) f64;
pub extern fn PyTime_Monotonic(result: [*c]PyTime_t) c_int;
pub extern fn PyTime_PerfCounter(result: [*c]PyTime_t) c_int;
pub extern fn PyTime_Time(result: [*c]PyTime_t) c_int;
pub extern fn PyTime_MonotonicRaw(result: [*c]PyTime_t) c_int;
pub extern fn PyTime_PerfCounterRaw(result: [*c]PyTime_t) c_int;
pub extern fn PyTime_TimeRaw(result: [*c]PyTime_t) c_int;
pub extern fn PyCodec_Register(search_function: [*c]PyObject) c_int;
pub extern fn PyCodec_Unregister(search_function: [*c]PyObject) c_int;
pub extern fn PyCodec_KnownEncoding(encoding: [*c]const u8) c_int;
pub extern fn PyCodec_Encode(object: [*c]PyObject, encoding: [*c]const u8, errors: [*c]const u8) [*c]PyObject;
pub extern fn PyCodec_Decode(object: [*c]PyObject, encoding: [*c]const u8, errors: [*c]const u8) [*c]PyObject;
pub extern fn PyCodec_Encoder(encoding: [*c]const u8) [*c]PyObject;
pub extern fn PyCodec_Decoder(encoding: [*c]const u8) [*c]PyObject;
pub extern fn PyCodec_IncrementalEncoder(encoding: [*c]const u8, errors: [*c]const u8) [*c]PyObject;
pub extern fn PyCodec_IncrementalDecoder(encoding: [*c]const u8, errors: [*c]const u8) [*c]PyObject;
pub extern fn PyCodec_StreamReader(encoding: [*c]const u8, stream: [*c]PyObject, errors: [*c]const u8) [*c]PyObject;
pub extern fn PyCodec_StreamWriter(encoding: [*c]const u8, stream: [*c]PyObject, errors: [*c]const u8) [*c]PyObject;
pub extern fn PyCodec_RegisterError(name: [*c]const u8, @"error": [*c]PyObject) c_int;
pub extern fn PyCodec_LookupError(name: [*c]const u8) [*c]PyObject;
pub extern fn PyCodec_StrictErrors(exc: [*c]PyObject) [*c]PyObject;
pub extern fn PyCodec_IgnoreErrors(exc: [*c]PyObject) [*c]PyObject;
pub extern fn PyCodec_ReplaceErrors(exc: [*c]PyObject) [*c]PyObject;
pub extern fn PyCodec_XMLCharRefReplaceErrors(exc: [*c]PyObject) [*c]PyObject;
pub extern fn PyCodec_BackslashReplaceErrors(exc: [*c]PyObject) [*c]PyObject;
pub extern fn PyCodec_NameReplaceErrors(exc: [*c]PyObject) [*c]PyObject;
pub extern var Py_hexdigits: [*c]const u8;
pub const PyThread_type_lock = ?*anyopaque;
pub const PY_LOCK_FAILURE: c_int = 0;
pub const PY_LOCK_ACQUIRED: c_int = 1;
pub const PY_LOCK_INTR: c_int = 2;
pub const enum_PyLockStatus = c_uint;
pub const PyLockStatus = enum_PyLockStatus;
pub extern fn PyThread_init_thread() void;
pub extern fn PyThread_start_new_thread(?*const fn (?*anyopaque) callconv(.c) void, ?*anyopaque) c_ulong;
pub extern fn PyThread_exit_thread() noreturn;
pub extern fn PyThread_get_thread_ident() c_ulong;
pub extern fn PyThread_get_thread_native_id() c_ulong;
pub extern fn PyThread_allocate_lock() PyThread_type_lock;
pub extern fn PyThread_free_lock(PyThread_type_lock) void;
pub extern fn PyThread_acquire_lock(PyThread_type_lock, c_int) c_int;
pub extern fn PyThread_acquire_lock_timed(PyThread_type_lock, microseconds: c_longlong, intr_flag: c_int) PyLockStatus;
pub extern fn PyThread_release_lock(PyThread_type_lock) void;
pub extern fn PyThread_get_stacksize() usize;
pub extern fn PyThread_set_stacksize(usize) c_int;
pub extern fn PyThread_GetInfo() [*c]PyObject;
pub extern fn PyThread_create_key() c_int;
pub extern fn PyThread_delete_key(key: c_int) void;
pub extern fn PyThread_set_key_value(key: c_int, value: ?*anyopaque) c_int;
pub extern fn PyThread_get_key_value(key: c_int) ?*anyopaque;
pub extern fn PyThread_delete_key_value(key: c_int) void;
pub extern fn PyThread_ReInitTLS() void;
pub const struct__Py_tss_t = extern struct {
    _is_initialized: c_int = 0,
    _key: c_ulong = 0,
    pub const PyThread_tss_free = __root.PyThread_tss_free;
    pub const PyThread_tss_is_created = __root.PyThread_tss_is_created;
    pub const PyThread_tss_create = __root.PyThread_tss_create;
    pub const PyThread_tss_delete = __root.PyThread_tss_delete;
    pub const PyThread_tss_set = __root.PyThread_tss_set;
    pub const PyThread_tss_get = __root.PyThread_tss_get;
    pub const created = __root.PyThread_tss_is_created;
    pub const create = __root.PyThread_tss_create;
    pub const delete = __root.PyThread_tss_delete;
    pub const set = __root.PyThread_tss_set;
    pub const get = __root.PyThread_tss_get;
};
pub const Py_tss_t = struct__Py_tss_t;
pub extern fn PyThread_tss_alloc() [*c]Py_tss_t;
pub extern fn PyThread_tss_free(key: [*c]Py_tss_t) void;
pub extern fn PyThread_tss_is_created(key: [*c]Py_tss_t) c_int;
pub extern fn PyThread_tss_create(key: [*c]Py_tss_t) c_int;
pub extern fn PyThread_tss_delete(key: [*c]Py_tss_t) void;
pub extern fn PyThread_tss_set(key: [*c]Py_tss_t, value: ?*anyopaque) c_int;
pub extern fn PyThread_tss_get(key: [*c]Py_tss_t) ?*anyopaque;
pub extern const PY_TIMEOUT_MAX: c_longlong;
pub extern var PyContext_Type: PyTypeObject;
pub const struct__pycontextobject = opaque {};
pub const PyContext = struct__pycontextobject;
pub extern var PyContextVar_Type: PyTypeObject;
pub const struct__pycontextvarobject = opaque {};
pub const PyContextVar = struct__pycontextvarobject;
pub extern var PyContextToken_Type: PyTypeObject;
pub const struct__pycontexttokenobject = opaque {};
pub const PyContextToken = struct__pycontexttokenobject;
pub extern fn PyContext_New() [*c]PyObject;
pub extern fn PyContext_Copy([*c]PyObject) [*c]PyObject;
pub extern fn PyContext_CopyCurrent() [*c]PyObject;
pub extern fn PyContext_Enter([*c]PyObject) c_int;
pub extern fn PyContext_Exit([*c]PyObject) c_int;
pub extern fn PyContextVar_New(name: [*c]const u8, default_value: [*c]PyObject) [*c]PyObject;
pub extern fn PyContextVar_Get(@"var": [*c]PyObject, default_value: [*c]PyObject, value: [*c][*c]PyObject) c_int;
pub extern fn PyContextVar_Set(@"var": [*c]PyObject, value: [*c]PyObject) [*c]PyObject;
pub extern fn PyContextVar_Reset(@"var": [*c]PyObject, token: [*c]PyObject) c_int;
pub extern fn PyArg_Parse([*c]PyObject, [*c]const u8, ...) c_int;
pub extern fn PyArg_ParseTuple([*c]PyObject, [*c]const u8, ...) c_int;
pub extern fn PyArg_ParseTupleAndKeywords([*c]PyObject, [*c]PyObject, [*c]const u8, [*c]const [*c]u8, ...) c_int;
pub extern fn PyArg_VaParse([*c]PyObject, [*c]const u8, va_list) c_int;
pub extern fn PyArg_VaParseTupleAndKeywords([*c]PyObject, [*c]PyObject, [*c]const u8, [*c]const [*c]u8, va_list) c_int;
pub extern fn PyArg_ValidateKeywordArguments([*c]PyObject) c_int;
pub extern fn PyArg_UnpackTuple([*c]PyObject, [*c]const u8, Py_ssize_t, Py_ssize_t, ...) c_int;
pub extern fn Py_BuildValue([*c]const u8, ...) [*c]PyObject;
pub extern fn Py_VaBuildValue([*c]const u8, va_list) [*c]PyObject;
pub extern fn PyModule_AddObjectRef(mod: [*c]PyObject, name: [*c]const u8, value: [*c]PyObject) c_int;
pub extern fn PyModule_Add(mod: [*c]PyObject, name: [*c]const u8, value: [*c]PyObject) c_int;
pub extern fn PyModule_AddObject(mod: [*c]PyObject, [*c]const u8, value: [*c]PyObject) c_int;
pub extern fn PyModule_AddIntConstant([*c]PyObject, [*c]const u8, c_long) c_int;
pub extern fn PyModule_AddStringConstant([*c]PyObject, [*c]const u8, [*c]const u8) c_int;
pub extern fn PyModule_AddType(module: [*c]PyObject, @"type": [*c]PyTypeObject) c_int;
pub extern fn PyModule_SetDocString([*c]PyObject, [*c]const u8) c_int;
pub extern fn PyModule_AddFunctions([*c]PyObject, [*c]PyMethodDef) c_int;
pub extern fn PyModule_ExecDef(module: [*c]PyObject, def: [*c]PyModuleDef) c_int;
pub extern fn PyModule_Create2([*c]PyModuleDef, apiver: c_int) [*c]PyObject;
pub extern fn PyModule_FromDefAndSpec2(def: [*c]PyModuleDef, spec: [*c]PyObject, module_api_version: c_int) [*c]PyObject;
pub const _PyOnceFlag = extern struct {
    v: u8 = 0,
};
pub const struct__PyArg_Parser = extern struct {
    format: [*c]const u8 = null,
    keywords: [*c]const [*c]const u8 = null,
    fname: [*c]const u8 = null,
    custom_msg: [*c]const u8 = null,
    once: _PyOnceFlag = @import("std").mem.zeroes(_PyOnceFlag),
    is_kwtuple_owned: c_int = 0,
    pos: c_int = 0,
    min: c_int = 0,
    max: c_int = 0,
    kwtuple: [*c]PyObject = null,
    next: [*c]struct__PyArg_Parser = null,
};
pub const _PyArg_Parser = struct__PyArg_Parser;
pub extern fn _PyArg_ParseTupleAndKeywordsFast([*c]PyObject, [*c]PyObject, [*c]struct__PyArg_Parser, ...) c_int;
pub const PyCompilerFlags = extern struct {
    cf_flags: c_int = 0,
    cf_feature_version: c_int = 0,
    pub const PyEval_MergeCompilerFlags = __root.PyEval_MergeCompilerFlags;
    pub const MergeCompilerFlags = __root.PyEval_MergeCompilerFlags;
};
pub extern fn PyCompile_OpcodeStackEffect(opcode: c_int, oparg: c_int) c_int;
pub extern fn PyCompile_OpcodeStackEffectWithJump(opcode: c_int, oparg: c_int, jump: c_int) c_int;
pub extern fn Py_CompileString([*c]const u8, [*c]const u8, c_int) [*c]PyObject;
pub extern fn PyErr_Print() void;
pub extern fn PyErr_PrintEx(c_int) void;
pub extern fn PyErr_Display([*c]PyObject, [*c]PyObject, [*c]PyObject) void;
pub extern fn PyErr_DisplayException([*c]PyObject) void;
pub extern var PyOS_InputHook: ?*const fn () callconv(.c) c_int;
pub extern fn PyRun_SimpleStringFlags([*c]const u8, [*c]PyCompilerFlags) c_int;
pub extern fn PyRun_AnyFileExFlags(fp: [*c]FILE, filename: [*c]const u8, closeit: c_int, flags: [*c]PyCompilerFlags) c_int;
pub extern fn PyRun_SimpleFileExFlags(fp: [*c]FILE, filename: [*c]const u8, closeit: c_int, flags: [*c]PyCompilerFlags) c_int;
pub extern fn PyRun_InteractiveOneFlags(fp: [*c]FILE, filename: [*c]const u8, flags: [*c]PyCompilerFlags) c_int;
pub extern fn PyRun_InteractiveOneObject(fp: [*c]FILE, filename: [*c]PyObject, flags: [*c]PyCompilerFlags) c_int;
pub extern fn PyRun_InteractiveLoopFlags(fp: [*c]FILE, filename: [*c]const u8, flags: [*c]PyCompilerFlags) c_int;
pub extern fn PyRun_StringFlags([*c]const u8, c_int, [*c]PyObject, [*c]PyObject, [*c]PyCompilerFlags) [*c]PyObject;
pub extern fn PyRun_FileExFlags(fp: [*c]FILE, filename: [*c]const u8, start: c_int, globals: [*c]PyObject, locals: [*c]PyObject, closeit: c_int, flags: [*c]PyCompilerFlags) [*c]PyObject;
pub extern fn Py_CompileStringExFlags(str: [*c]const u8, filename: [*c]const u8, start: c_int, flags: [*c]PyCompilerFlags, optimize: c_int) [*c]PyObject;
pub extern fn Py_CompileStringObject(str: [*c]const u8, filename: [*c]PyObject, start: c_int, flags: [*c]PyCompilerFlags, optimize: c_int) [*c]PyObject;
pub extern fn PyRun_String(str: [*c]const u8, s: c_int, g: [*c]PyObject, l: [*c]PyObject) [*c]PyObject;
pub extern fn PyRun_AnyFile(fp: [*c]FILE, name: [*c]const u8) c_int;
pub extern fn PyRun_AnyFileEx(fp: [*c]FILE, name: [*c]const u8, closeit: c_int) c_int;
pub extern fn PyRun_AnyFileFlags([*c]FILE, [*c]const u8, [*c]PyCompilerFlags) c_int;
pub extern fn PyRun_SimpleString(s: [*c]const u8) c_int;
pub extern fn PyRun_SimpleFile(f: [*c]FILE, p: [*c]const u8) c_int;
pub extern fn PyRun_SimpleFileEx(f: [*c]FILE, p: [*c]const u8, c: c_int) c_int;
pub extern fn PyRun_InteractiveOne(f: [*c]FILE, p: [*c]const u8) c_int;
pub extern fn PyRun_InteractiveLoop(f: [*c]FILE, p: [*c]const u8) c_int;
pub extern fn PyRun_File(fp: [*c]FILE, p: [*c]const u8, s: c_int, g: [*c]PyObject, l: [*c]PyObject) [*c]PyObject;
pub extern fn PyRun_FileEx(fp: [*c]FILE, p: [*c]const u8, s: c_int, g: [*c]PyObject, l: [*c]PyObject, c: c_int) [*c]PyObject;
pub extern fn PyRun_FileFlags(fp: [*c]FILE, p: [*c]const u8, s: c_int, g: [*c]PyObject, l: [*c]PyObject, flags: [*c]PyCompilerFlags) [*c]PyObject;
pub extern fn PyOS_Readline([*c]FILE, [*c]FILE, [*c]const u8) [*c]u8;
pub extern var PyOS_ReadlineFunctionPointer: ?*const fn ([*c]FILE, [*c]FILE, [*c]const u8) callconv(.c) [*c]u8;
pub extern fn Py_Initialize() void;
pub extern fn Py_InitializeEx(c_int) void;
pub extern fn Py_Finalize() void;
pub extern fn Py_FinalizeEx() c_int;
pub extern fn Py_IsInitialized() c_int;
pub extern fn Py_NewInterpreter() ?*PyThreadState;
pub extern fn Py_EndInterpreter(?*PyThreadState) void;
pub extern fn Py_AtExit(func: ?*const fn () callconv(.c) void) c_int;
pub extern fn Py_Exit(c_int) noreturn;
pub extern fn Py_Main(argc: c_int, argv: [*c][*c]wchar_t) c_int;
pub extern fn Py_BytesMain(argc: c_int, argv: [*c][*c]u8) c_int;
pub extern fn Py_SetProgramName([*c]const wchar_t) void;
pub extern fn Py_GetProgramName() [*c]wchar_t;
pub extern fn Py_SetPythonHome([*c]const wchar_t) void;
pub extern fn Py_GetPythonHome() [*c]wchar_t;
pub extern fn Py_GetProgramFullPath() [*c]wchar_t;
pub extern fn Py_GetPrefix() [*c]wchar_t;
pub extern fn Py_GetExecPrefix() [*c]wchar_t;
pub extern fn Py_GetPath() [*c]wchar_t;
pub extern fn _Py_CheckPython3() c_int;
pub extern fn Py_GetVersion() [*c]const u8;
pub extern fn Py_GetPlatform() [*c]const u8;
pub extern fn Py_GetCopyright() [*c]const u8;
pub extern fn Py_GetCompiler() [*c]const u8;
pub extern fn Py_GetBuildInfo() [*c]const u8;
pub const PyOS_sighandler_t = ?*const fn (c_int) callconv(.c) void;
pub extern fn PyOS_getsig(c_int) PyOS_sighandler_t;
pub extern fn PyOS_setsig(c_int, PyOS_sighandler_t) PyOS_sighandler_t;
pub extern const Py_Version: c_ulong;
pub extern fn Py_IsFinalizing() c_int;
pub extern fn Py_FrozenMain(argc: c_int, argv: [*c][*c]u8) c_int;
pub extern fn Py_PreInitialize(src_config: [*c]const PyPreConfig) PyStatus;
pub extern fn Py_PreInitializeFromBytesArgs(src_config: [*c]const PyPreConfig, argc: Py_ssize_t, argv: [*c][*c]u8) PyStatus;
pub extern fn Py_PreInitializeFromArgs(src_config: [*c]const PyPreConfig, argc: Py_ssize_t, argv: [*c][*c]wchar_t) PyStatus;
pub extern fn Py_InitializeFromConfig(config: [*c]const PyConfig) PyStatus;
pub extern fn _Py_InitializeMain() PyStatus;
pub extern fn Py_RunMain() c_int;
pub extern fn Py_ExitStatusException(err: PyStatus) noreturn;
pub extern fn Py_FdIsInteractive([*c]FILE, [*c]const u8) c_int;
pub const PyInterpreterConfig = extern struct {
    use_main_obmalloc: c_int = 0,
    allow_fork: c_int = 0,
    allow_exec: c_int = 0,
    allow_threads: c_int = 0,
    allow_daemon_threads: c_int = 0,
    check_multi_interp_extensions: c_int = 0,
    gil: c_int = 0,
};
pub extern fn Py_NewInterpreterFromConfig(tstate_p: [*c]?*PyThreadState, config: [*c]const PyInterpreterConfig) PyStatus;
pub const atexit_datacallbackfunc = ?*const fn (?*anyopaque) callconv(.c) void;
pub extern fn PyUnstable_AtExit(?*PyInterpreterState, atexit_datacallbackfunc, ?*anyopaque) c_int;
pub extern fn PyEval_EvalCode([*c]PyObject, [*c]PyObject, [*c]PyObject) [*c]PyObject;
pub extern fn PyEval_EvalCodeEx(co: [*c]PyObject, globals: [*c]PyObject, locals: [*c]PyObject, args: [*c]const [*c]PyObject, argc: c_int, kwds: [*c]const [*c]PyObject, kwdc: c_int, defs: [*c]const [*c]PyObject, defc: c_int, kwdefs: [*c]PyObject, closure: [*c]PyObject) [*c]PyObject;
pub extern fn PyEval_GetBuiltins() [*c]PyObject;
pub extern fn PyEval_GetGlobals() [*c]PyObject;
pub extern fn PyEval_GetLocals() [*c]PyObject;
pub extern fn PyEval_GetFrame() ?*PyFrameObject;
pub extern fn PyEval_GetFrameBuiltins() [*c]PyObject;
pub extern fn PyEval_GetFrameGlobals() [*c]PyObject;
pub extern fn PyEval_GetFrameLocals() [*c]PyObject;
pub extern fn Py_AddPendingCall(func: ?*const fn (?*anyopaque) callconv(.c) c_int, arg: ?*anyopaque) c_int;
pub extern fn Py_MakePendingCalls() c_int;
pub extern fn Py_SetRecursionLimit(c_int) void;
pub extern fn Py_GetRecursionLimit() c_int;
pub extern fn Py_EnterRecursiveCall(where: [*c]const u8) c_int;
pub extern fn Py_LeaveRecursiveCall() void;
pub extern fn PyEval_GetFuncName([*c]PyObject) [*c]const u8;
pub extern fn PyEval_GetFuncDesc([*c]PyObject) [*c]const u8;
pub extern fn PyEval_EvalFrame(?*PyFrameObject) [*c]PyObject;
pub extern fn PyEval_EvalFrameEx(f: ?*PyFrameObject, exc: c_int) [*c]PyObject;
pub extern fn PyEval_SaveThread() ?*PyThreadState;
pub extern fn PyEval_RestoreThread(?*PyThreadState) void;
pub extern fn PyEval_InitThreads() void;
pub extern fn PyEval_AcquireThread(tstate: ?*PyThreadState) void;
pub extern fn PyEval_ReleaseThread(tstate: ?*PyThreadState) void;
pub extern fn PyEval_SetProfile(Py_tracefunc, [*c]PyObject) void;
pub extern fn PyEval_SetProfileAllThreads(Py_tracefunc, [*c]PyObject) void;
pub extern fn PyEval_SetTrace(Py_tracefunc, [*c]PyObject) void;
pub extern fn PyEval_SetTraceAllThreads(Py_tracefunc, [*c]PyObject) void;
pub extern fn PyEval_MergeCompilerFlags(cf: [*c]PyCompilerFlags) c_int;
pub extern fn _PyEval_EvalFrameDefault(tstate: ?*PyThreadState, f: ?*struct__PyInterpreterFrame, exc: c_int) [*c]PyObject;
pub extern fn PyUnstable_Eval_RequestCodeExtraIndex(freefunc) Py_ssize_t;
pub fn _PyEval_RequestCodeExtraIndex(arg_f: freefunc) callconv(.c) Py_ssize_t {
    var f = arg_f;
    _ = &f;
    return PyUnstable_Eval_RequestCodeExtraIndex(f);
}
pub extern fn _PyEval_SliceIndex([*c]PyObject, [*c]Py_ssize_t) c_int;
pub extern fn _PyEval_SliceIndexNotNone([*c]PyObject, [*c]Py_ssize_t) c_int;
pub extern fn PySys_GetObject([*c]const u8) [*c]PyObject;
pub extern fn PySys_SetObject([*c]const u8, [*c]PyObject) c_int;
pub extern fn PySys_SetArgv(c_int, [*c][*c]wchar_t) void;
pub extern fn PySys_SetArgvEx(c_int, [*c][*c]wchar_t, c_int) void;
pub extern fn PySys_WriteStdout(format: [*c]const u8, ...) void;
pub extern fn PySys_WriteStderr(format: [*c]const u8, ...) void;
pub extern fn PySys_FormatStdout(format: [*c]const u8, ...) void;
pub extern fn PySys_FormatStderr(format: [*c]const u8, ...) void;
pub extern fn PySys_ResetWarnOptions() void;
pub extern fn PySys_GetXOptions() [*c]PyObject;
pub extern fn PySys_Audit(event: [*c]const u8, argFormat: [*c]const u8, ...) c_int;
pub extern fn PySys_AuditTuple(event: [*c]const u8, args: [*c]PyObject) c_int;
pub const Py_AuditHookFunction = ?*const fn ([*c]const u8, [*c]PyObject, ?*anyopaque) callconv(.c) c_int;
pub extern fn PySys_AddAuditHook(Py_AuditHookFunction, ?*anyopaque) c_int;
pub const PerfMapState = extern struct {
    perf_map: [*c]FILE = null,
    map_lock: PyThread_type_lock = null,
};
pub extern fn PyUnstable_PerfMapState_Init() c_int;
pub extern fn PyUnstable_WritePerfMapEntry(code_addr: ?*const anyopaque, code_size: c_uint, entry_name: [*c]const u8) c_int;
pub extern fn PyUnstable_PerfMapState_Fini() void;
pub extern fn PyUnstable_CopyPerfMapFile(parent_filename: [*c]const u8) c_int;
pub extern fn PyUnstable_PerfTrampoline_CompileCode([*c]PyCodeObject) c_int;
pub extern fn PyUnstable_PerfTrampoline_SetPersistAfterFork(enable: c_int) c_int;
pub extern fn PyOS_FSPath(path: [*c]PyObject) [*c]PyObject;
pub extern fn PyOS_InterruptOccurred() c_int;
pub extern fn PyOS_AfterFork() void;
pub extern fn PyImport_GetMagicNumber() c_long;
pub extern fn PyImport_GetMagicTag() [*c]const u8;
pub extern fn PyImport_ExecCodeModule(name: [*c]const u8, co: [*c]PyObject) [*c]PyObject;
pub extern fn PyImport_ExecCodeModuleEx(name: [*c]const u8, co: [*c]PyObject, pathname: [*c]const u8) [*c]PyObject;
pub extern fn PyImport_ExecCodeModuleWithPathnames(name: [*c]const u8, co: [*c]PyObject, pathname: [*c]const u8, cpathname: [*c]const u8) [*c]PyObject;
pub extern fn PyImport_ExecCodeModuleObject(name: [*c]PyObject, co: [*c]PyObject, pathname: [*c]PyObject, cpathname: [*c]PyObject) [*c]PyObject;
pub extern fn PyImport_GetModuleDict() [*c]PyObject;
pub extern fn PyImport_GetModule(name: [*c]PyObject) [*c]PyObject;
pub extern fn PyImport_AddModuleObject(name: [*c]PyObject) [*c]PyObject;
pub extern fn PyImport_AddModule(name: [*c]const u8) [*c]PyObject;
pub extern fn PyImport_AddModuleRef(name: [*c]const u8) [*c]PyObject;
pub extern fn PyImport_ImportModule(name: [*c]const u8) [*c]PyObject;
pub extern fn PyImport_ImportModuleNoBlock(name: [*c]const u8) [*c]PyObject;
pub extern fn PyImport_ImportModuleLevel(name: [*c]const u8, globals: [*c]PyObject, locals: [*c]PyObject, fromlist: [*c]PyObject, level: c_int) [*c]PyObject;
pub extern fn PyImport_ImportModuleLevelObject(name: [*c]PyObject, globals: [*c]PyObject, locals: [*c]PyObject, fromlist: [*c]PyObject, level: c_int) [*c]PyObject;
pub extern fn PyImport_GetImporter(path: [*c]PyObject) [*c]PyObject;
pub extern fn PyImport_Import(name: [*c]PyObject) [*c]PyObject;
pub extern fn PyImport_ReloadModule(m: [*c]PyObject) [*c]PyObject;
pub extern fn PyImport_ImportFrozenModuleObject(name: [*c]PyObject) c_int;
pub extern fn PyImport_ImportFrozenModule(name: [*c]const u8) c_int;
pub extern fn PyImport_AppendInittab(name: [*c]const u8, initfunc: ?*const fn () callconv(.c) [*c]PyObject) c_int;
pub extern fn PyInit__imp() [*c]PyObject;
pub const struct__inittab = extern struct {
    name: [*c]const u8 = null,
    initfunc: ?*const fn () callconv(.c) [*c]PyObject = null,
    pub const PyImport_ExtendInittab = __root.PyImport_ExtendInittab;
    pub const ExtendInittab = __root.PyImport_ExtendInittab;
};
pub extern var PyImport_Inittab: [*c]struct__inittab;
pub extern fn PyImport_ExtendInittab(newtab: [*c]struct__inittab) c_int;
pub const struct__frozen = extern struct {
    name: [*c]const u8 = null,
    code: [*c]const u8 = null,
    size: c_int = 0,
    is_package: c_int = 0,
};
pub extern var PyImport_FrozenModules: [*c]const struct__frozen;
pub extern fn PyObject_CallNoArgs(func: [*c]PyObject) [*c]PyObject;
pub extern fn PyObject_Call(callable: [*c]PyObject, args: [*c]PyObject, kwargs: [*c]PyObject) [*c]PyObject;
pub extern fn PyObject_CallObject(callable: [*c]PyObject, args: [*c]PyObject) [*c]PyObject;
pub extern fn PyObject_CallFunction(callable: [*c]PyObject, format: [*c]const u8, ...) [*c]PyObject;
pub extern fn PyObject_CallMethod(obj: [*c]PyObject, name: [*c]const u8, format: [*c]const u8, ...) [*c]PyObject;
pub extern fn PyObject_CallFunctionObjArgs(callable: [*c]PyObject, ...) [*c]PyObject;
pub extern fn PyObject_CallMethodObjArgs(obj: [*c]PyObject, name: [*c]PyObject, ...) [*c]PyObject;
pub extern fn PyVectorcall_NARGS(nargsf: usize) Py_ssize_t;
pub extern fn PyVectorcall_Call(callable: [*c]PyObject, tuple: [*c]PyObject, dict: [*c]PyObject) [*c]PyObject;
pub extern fn PyObject_Vectorcall(callable: [*c]PyObject, args: [*c]const [*c]PyObject, nargsf: usize, kwnames: [*c]PyObject) [*c]PyObject;
pub extern fn PyObject_VectorcallMethod(name: [*c]PyObject, args: [*c]const [*c]PyObject, nargsf: usize, kwnames: [*c]PyObject) [*c]PyObject;
pub extern fn PyObject_Type(o: [*c]PyObject) [*c]PyObject;
pub extern fn PyObject_Size(o: [*c]PyObject) Py_ssize_t;
pub extern fn PyObject_Length(o: [*c]PyObject) Py_ssize_t;
pub extern fn PyObject_GetItem(o: [*c]PyObject, key: [*c]PyObject) [*c]PyObject;
pub extern fn PyObject_SetItem(o: [*c]PyObject, key: [*c]PyObject, v: [*c]PyObject) c_int;
pub extern fn PyObject_DelItemString(o: [*c]PyObject, key: [*c]const u8) c_int;
pub extern fn PyObject_DelItem(o: [*c]PyObject, key: [*c]PyObject) c_int;
pub extern fn PyObject_Format(obj: [*c]PyObject, format_spec: [*c]PyObject) [*c]PyObject;
pub extern fn PyObject_GetIter([*c]PyObject) [*c]PyObject;
pub extern fn PyObject_GetAIter([*c]PyObject) [*c]PyObject;
pub extern fn PyIter_Check([*c]PyObject) c_int;
pub extern fn PyAIter_Check([*c]PyObject) c_int;
pub extern fn PyIter_Next([*c]PyObject) [*c]PyObject;
pub extern fn PyIter_Send([*c]PyObject, [*c]PyObject, [*c][*c]PyObject) PySendResult;
pub extern fn PyNumber_Check(o: [*c]PyObject) c_int;
pub extern fn PyNumber_Add(o1: [*c]PyObject, o2: [*c]PyObject) [*c]PyObject;
pub extern fn PyNumber_Subtract(o1: [*c]PyObject, o2: [*c]PyObject) [*c]PyObject;
pub extern fn PyNumber_Multiply(o1: [*c]PyObject, o2: [*c]PyObject) [*c]PyObject;
pub extern fn PyNumber_MatrixMultiply(o1: [*c]PyObject, o2: [*c]PyObject) [*c]PyObject;
pub extern fn PyNumber_FloorDivide(o1: [*c]PyObject, o2: [*c]PyObject) [*c]PyObject;
pub extern fn PyNumber_TrueDivide(o1: [*c]PyObject, o2: [*c]PyObject) [*c]PyObject;
pub extern fn PyNumber_Remainder(o1: [*c]PyObject, o2: [*c]PyObject) [*c]PyObject;
pub extern fn PyNumber_Divmod(o1: [*c]PyObject, o2: [*c]PyObject) [*c]PyObject;
pub extern fn PyNumber_Power(o1: [*c]PyObject, o2: [*c]PyObject, o3: [*c]PyObject) [*c]PyObject;
pub extern fn PyNumber_Negative(o: [*c]PyObject) [*c]PyObject;
pub extern fn PyNumber_Positive(o: [*c]PyObject) [*c]PyObject;
pub extern fn PyNumber_Absolute(o: [*c]PyObject) [*c]PyObject;
pub extern fn PyNumber_Invert(o: [*c]PyObject) [*c]PyObject;
pub extern fn PyNumber_Lshift(o1: [*c]PyObject, o2: [*c]PyObject) [*c]PyObject;
pub extern fn PyNumber_Rshift(o1: [*c]PyObject, o2: [*c]PyObject) [*c]PyObject;
pub extern fn PyNumber_And(o1: [*c]PyObject, o2: [*c]PyObject) [*c]PyObject;
pub extern fn PyNumber_Xor(o1: [*c]PyObject, o2: [*c]PyObject) [*c]PyObject;
pub extern fn PyNumber_Or(o1: [*c]PyObject, o2: [*c]PyObject) [*c]PyObject;
pub extern fn PyIndex_Check([*c]PyObject) c_int;
pub extern fn PyNumber_Index(o: [*c]PyObject) [*c]PyObject;
pub extern fn PyNumber_AsSsize_t(o: [*c]PyObject, exc: [*c]PyObject) Py_ssize_t;
pub extern fn PyNumber_Long(o: [*c]PyObject) [*c]PyObject;
pub extern fn PyNumber_Float(o: [*c]PyObject) [*c]PyObject;
pub extern fn PyNumber_InPlaceAdd(o1: [*c]PyObject, o2: [*c]PyObject) [*c]PyObject;
pub extern fn PyNumber_InPlaceSubtract(o1: [*c]PyObject, o2: [*c]PyObject) [*c]PyObject;
pub extern fn PyNumber_InPlaceMultiply(o1: [*c]PyObject, o2: [*c]PyObject) [*c]PyObject;
pub extern fn PyNumber_InPlaceMatrixMultiply(o1: [*c]PyObject, o2: [*c]PyObject) [*c]PyObject;
pub extern fn PyNumber_InPlaceFloorDivide(o1: [*c]PyObject, o2: [*c]PyObject) [*c]PyObject;
pub extern fn PyNumber_InPlaceTrueDivide(o1: [*c]PyObject, o2: [*c]PyObject) [*c]PyObject;
pub extern fn PyNumber_InPlaceRemainder(o1: [*c]PyObject, o2: [*c]PyObject) [*c]PyObject;
pub extern fn PyNumber_InPlacePower(o1: [*c]PyObject, o2: [*c]PyObject, o3: [*c]PyObject) [*c]PyObject;
pub extern fn PyNumber_InPlaceLshift(o1: [*c]PyObject, o2: [*c]PyObject) [*c]PyObject;
pub extern fn PyNumber_InPlaceRshift(o1: [*c]PyObject, o2: [*c]PyObject) [*c]PyObject;
pub extern fn PyNumber_InPlaceAnd(o1: [*c]PyObject, o2: [*c]PyObject) [*c]PyObject;
pub extern fn PyNumber_InPlaceXor(o1: [*c]PyObject, o2: [*c]PyObject) [*c]PyObject;
pub extern fn PyNumber_InPlaceOr(o1: [*c]PyObject, o2: [*c]PyObject) [*c]PyObject;
pub extern fn PyNumber_ToBase(n: [*c]PyObject, base: c_int) [*c]PyObject;
pub extern fn PySequence_Check(o: [*c]PyObject) c_int;
pub extern fn PySequence_Size(o: [*c]PyObject) Py_ssize_t;
pub extern fn PySequence_Length(o: [*c]PyObject) Py_ssize_t;
pub extern fn PySequence_Concat(o1: [*c]PyObject, o2: [*c]PyObject) [*c]PyObject;
pub extern fn PySequence_Repeat(o: [*c]PyObject, count: Py_ssize_t) [*c]PyObject;
pub extern fn PySequence_GetItem(o: [*c]PyObject, i: Py_ssize_t) [*c]PyObject;
pub extern fn PySequence_GetSlice(o: [*c]PyObject, @"i1": Py_ssize_t, @"i2": Py_ssize_t) [*c]PyObject;
pub extern fn PySequence_SetItem(o: [*c]PyObject, i: Py_ssize_t, v: [*c]PyObject) c_int;
pub extern fn PySequence_DelItem(o: [*c]PyObject, i: Py_ssize_t) c_int;
pub extern fn PySequence_SetSlice(o: [*c]PyObject, @"i1": Py_ssize_t, @"i2": Py_ssize_t, v: [*c]PyObject) c_int;
pub extern fn PySequence_DelSlice(o: [*c]PyObject, @"i1": Py_ssize_t, @"i2": Py_ssize_t) c_int;
pub extern fn PySequence_Tuple(o: [*c]PyObject) [*c]PyObject;
pub extern fn PySequence_List(o: [*c]PyObject) [*c]PyObject;
pub extern fn PySequence_Fast(o: [*c]PyObject, m: [*c]const u8) [*c]PyObject;
pub extern fn PySequence_Count(o: [*c]PyObject, value: [*c]PyObject) Py_ssize_t;
pub extern fn PySequence_Contains(seq: [*c]PyObject, ob: [*c]PyObject) c_int;
pub extern fn PySequence_In(o: [*c]PyObject, value: [*c]PyObject) c_int;
pub extern fn PySequence_Index(o: [*c]PyObject, value: [*c]PyObject) Py_ssize_t;
pub extern fn PySequence_InPlaceConcat(o1: [*c]PyObject, o2: [*c]PyObject) [*c]PyObject;
pub extern fn PySequence_InPlaceRepeat(o: [*c]PyObject, count: Py_ssize_t) [*c]PyObject;
pub extern fn PyMapping_Check(o: [*c]PyObject) c_int;
pub extern fn PyMapping_Size(o: [*c]PyObject) Py_ssize_t;
pub extern fn PyMapping_Length(o: [*c]PyObject) Py_ssize_t;
pub extern fn PyMapping_HasKeyString(o: [*c]PyObject, key: [*c]const u8) c_int;
pub extern fn PyMapping_HasKey(o: [*c]PyObject, key: [*c]PyObject) c_int;
pub extern fn PyMapping_HasKeyWithError(o: [*c]PyObject, key: [*c]PyObject) c_int;
pub extern fn PyMapping_HasKeyStringWithError(o: [*c]PyObject, key: [*c]const u8) c_int;
pub extern fn PyMapping_Keys(o: [*c]PyObject) [*c]PyObject;
pub extern fn PyMapping_Values(o: [*c]PyObject) [*c]PyObject;
pub extern fn PyMapping_Items(o: [*c]PyObject) [*c]PyObject;
pub extern fn PyMapping_GetItemString(o: [*c]PyObject, key: [*c]const u8) [*c]PyObject;
pub extern fn PyMapping_GetOptionalItem([*c]PyObject, [*c]PyObject, [*c][*c]PyObject) c_int;
pub extern fn PyMapping_GetOptionalItemString([*c]PyObject, [*c]const u8, [*c][*c]PyObject) c_int;
pub extern fn PyMapping_SetItemString(o: [*c]PyObject, key: [*c]const u8, value: [*c]PyObject) c_int;
pub extern fn PyObject_IsInstance(object: [*c]PyObject, typeorclass: [*c]PyObject) c_int;
pub extern fn PyObject_IsSubclass(object: [*c]PyObject, typeorclass: [*c]PyObject) c_int;
pub extern fn _PyObject_CallMethodId(obj: [*c]PyObject, name: [*c]_Py_Identifier, format: [*c]const u8, ...) [*c]PyObject;
pub extern fn _PyStack_AsDict(values: [*c]const [*c]PyObject, kwnames: [*c]PyObject) [*c]PyObject;
pub fn _PyVectorcall_NARGS(arg_n: usize) callconv(.c) Py_ssize_t {
    var n = arg_n;
    _ = &n;
    return @bitCast(@as(c_ulonglong, @truncate(n & ~(@as(usize, @bitCast(@as(c_longlong, @as(c_int, 1)))) << @intCast((@as(c_ulonglong, 8) *% @sizeOf(usize)) -% @as(c_ulonglong, 1))))));
}
pub extern fn PyVectorcall_Function(callable: [*c]PyObject) vectorcallfunc;
pub extern fn PyObject_VectorcallDict(callable: [*c]PyObject, args: [*c]const [*c]PyObject, nargsf: usize, kwargs: [*c]PyObject) [*c]PyObject;
pub extern fn PyObject_CallOneArg(func: [*c]PyObject, arg: [*c]PyObject) [*c]PyObject;
pub fn PyObject_CallMethodNoArgs(arg_self: [*c]PyObject, arg_name: [*c]PyObject) callconv(.c) [*c]PyObject {
    var self = arg_self;
    _ = &self;
    var name = arg_name;
    _ = &name;
    var nargsf: usize = @as(usize, 1) | (@as(usize, @bitCast(@as(c_longlong, @as(c_int, 1)))) << @intCast((@as(c_ulonglong, 8) *% @sizeOf(usize)) -% @as(c_ulonglong, 1)));
    _ = &nargsf;
    return PyObject_VectorcallMethod(name, &self, nargsf, null);
}
pub fn PyObject_CallMethodOneArg(arg_self: [*c]PyObject, arg_name: [*c]PyObject, arg_arg: [*c]PyObject) callconv(.c) [*c]PyObject {
    var self = arg_self;
    _ = &self;
    var name = arg_name;
    _ = &name;
    var arg = arg_arg;
    _ = &arg;
    var args: [2][*c]PyObject = [2][*c]PyObject{
        self,
        arg,
    };
    _ = &args;
    var nargsf: usize = @as(usize, 2) | (@as(usize, @bitCast(@as(c_longlong, @as(c_int, 1)))) << @intCast((@as(c_ulonglong, 8) *% @sizeOf(usize)) -% @as(c_ulonglong, 1)));
    _ = &nargsf;
    _ = !!(@as(?*anyopaque, @ptrCast(@alignCast(arg))) != @as(?*anyopaque, null)) or ((blk: {
        _assert("arg != NULL", "C:\\Users\\jango\\Desktop\\b_x_utils\\py_modules\\zig_modules\\src\\include\\cpython/abstract.h", 73);
        break :blk 0;
    }) != 0);
    return PyObject_VectorcallMethod(name, @ptrCast(@alignCast(&args)), nargsf, null);
}
pub extern fn PyObject_LengthHint(o: [*c]PyObject, Py_ssize_t) Py_ssize_t;
pub extern var PyFilter_Type: PyTypeObject;
pub extern var PyMap_Type: PyTypeObject;
pub extern var PyZip_Type: PyTypeObject;
pub const struct_PyCriticalSection = opaque {
    pub const PyCriticalSection_Begin = __root.PyCriticalSection_Begin;
    pub const PyCriticalSection_End = __root.PyCriticalSection_End;
    pub const Begin = __root.PyCriticalSection_Begin;
    pub const End = __root.PyCriticalSection_End;
};
pub const PyCriticalSection = struct_PyCriticalSection;
pub const struct_PyCriticalSection2 = opaque {
    pub const PyCriticalSection2_Begin = __root.PyCriticalSection2_Begin;
    pub const PyCriticalSection2_End = __root.PyCriticalSection2_End;
    pub const Begin = __root.PyCriticalSection2_Begin;
    pub const End = __root.PyCriticalSection2_End;
};
pub const PyCriticalSection2 = struct_PyCriticalSection2;
pub extern fn PyCriticalSection_Begin(c: ?*PyCriticalSection, op: [*c]PyObject) void;
pub extern fn PyCriticalSection_End(c: ?*PyCriticalSection) void;
pub extern fn PyCriticalSection2_Begin(c: ?*PyCriticalSection2, a: [*c]PyObject, b: [*c]PyObject) void;
pub extern fn PyCriticalSection2_End(c: ?*PyCriticalSection2) void;
pub extern const _Py_ctype_table: [256]c_uint;
pub extern const _Py_ctype_tolower: [256]u8;
pub extern const _Py_ctype_toupper: [256]u8;
pub extern fn PyOS_string_to_double(str: [*c]const u8, endptr: [*c][*c]u8, overflow_exception: [*c]PyObject) f64;
pub extern fn PyOS_double_to_string(val: f64, format_code: u8, precision: c_int, flags: c_int, @"type": [*c]c_int) [*c]u8;
pub extern fn PyOS_mystrnicmp([*c]const u8, [*c]const u8, Py_ssize_t) c_int;
pub extern fn PyOS_mystricmp([*c]const u8, [*c]const u8) c_int;
pub extern fn _fstat32(_FileDes: c_int, _Stat: [*c]struct__stat32) c_int;
pub extern fn _stat32(_Name: [*c]const u8, _Stat: [*c]struct__stat32) c_int;
pub extern fn _fstat64(_FileDes: c_int, _Stat: [*c]struct__stat64) c_int;
pub extern fn _fstat32i64(_FileDes: c_int, _Stat: [*c]struct__stat32i64) c_int;
pub extern fn _fstat64i32(_FileDes: c_int, _Stat: [*c]struct__stat64i32) c_int;
pub extern fn _stat64(_Name: [*c]const u8, _Stat: [*c]struct__stat64) c_int;
pub extern fn _stat32i64(_Name: [*c]const u8, _Stat: [*c]struct__stat32i64) c_int;
pub extern fn _stat64i32(_Name: [*c]const u8, _Stat: [*c]struct__stat64i32) c_int;
pub const struct_stat = extern struct {
    st_dev: _dev_t = 0,
    st_ino: _ino_t = 0,
    st_mode: c_ushort = 0,
    st_nlink: c_short = 0,
    st_uid: c_short = 0,
    st_gid: c_short = 0,
    st_rdev: _dev_t = 0,
    st_size: off_t = 0,
    st_atime: time_t = 0,
    st_mtime: time_t = 0,
    st_ctime: time_t = 0,
};
pub extern fn fstat(_Desc: c_int, _Stat: [*c]struct_stat) c_int;
pub extern fn stat(_Filename: [*c]const u8, _Stat: [*c]struct_stat) c_int;
pub extern fn wstat(_Filename: [*c]const wchar_t, _Stat: [*c]struct_stat) c_int;
pub const struct_stat64 = extern struct {
    st_dev: _dev_t = 0,
    st_ino: _ino_t = 0,
    st_mode: c_ushort = 0,
    st_nlink: c_short = 0,
    st_uid: c_short = 0,
    st_gid: c_short = 0,
    st_rdev: _dev_t = 0,
    st_size: c_longlong = 0,
    st_atime: __time64_t = 0,
    st_mtime: __time64_t = 0,
    st_ctime: __time64_t = 0,
};
pub extern fn fstat64(_Desc: c_int, _Stat: [*c]struct_stat64) c_int;
pub extern fn stat64(_Filename: [*c]const u8, _Stat: [*c]struct_stat64) c_int;
pub extern fn wstat64(_Filename: [*c]const wchar_t, _Stat: [*c]struct_stat64) c_int;
pub extern fn Py_DecodeLocale(arg: [*c]const u8, size: [*c]usize) [*c]wchar_t;
pub extern fn Py_EncodeLocale(text: [*c]const wchar_t, error_pos: [*c]usize) [*c]u8;
pub extern fn _Py_fopen_obj(path: [*c]PyObject, mode: [*c]const u8) [*c]FILE;
pub extern fn PyTraceMalloc_Track(domain: c_uint, ptr: usize, size: usize) c_int;
pub extern fn PyTraceMalloc_Untrack(domain: c_uint, ptr: usize) c_int;

pub const __VERSION__ = "Aro aro-zig";
pub const __Aro__ = "";
pub const __STDC__ = @as(c_int, 1);
pub const __STDC_HOSTED__ = @as(c_int, 1);
pub const __STDC_UTF_16__ = @as(c_int, 1);
pub const __STDC_UTF_32__ = @as(c_int, 1);
pub const __STDC_EMBED_NOT_FOUND__ = @as(c_int, 0);
pub const __STDC_EMBED_FOUND__ = @as(c_int, 1);
pub const __STDC_EMBED_EMPTY__ = @as(c_int, 2);
pub const __STDC_VERSION__ = @as(c_long, 201710);
pub const __GNUC__ = @as(c_int, 7);
pub const __GNUC_MINOR__ = @as(c_int, 1);
pub const __GNUC_PATCHLEVEL__ = @as(c_int, 0);
pub const __ARO_EMULATE_NO__ = @as(c_int, 0);
pub const __ARO_EMULATE_CLANG__ = @as(c_int, 1);
pub const __ARO_EMULATE_GCC__ = @as(c_int, 2);
pub const __ARO_EMULATE_MSVC__ = @as(c_int, 3);
pub const __ARO_EMULATE__ = __ARO_EMULATE_GCC__;
pub inline fn __building_module(x: anytype) @TypeOf(@as(c_int, 0)) {
    _ = &x;
    return @as(c_int, 0);
}
pub const _WIN32 = @as(c_int, 1);
pub const _WIN64 = @as(c_int, 1);
pub const WIN32 = @as(c_int, 1);
pub const __WIN32 = @as(c_int, 1);
pub const __WIN32__ = @as(c_int, 1);
pub const WINNT = @as(c_int, 1);
pub const __WINNT = @as(c_int, 1);
pub const __WINNT__ = @as(c_int, 1);
pub const WIN64 = @as(c_int, 1);
pub const __WIN64 = @as(c_int, 1);
pub const __WIN64__ = @as(c_int, 1);
pub const __MINGW64__ = @as(c_int, 1);
pub const __MSVCRT__ = @as(c_int, 1);
pub const __MINGW32__ = @as(c_int, 1);
pub const __declspec = @compileError("unable to translate C expr: unexpected token '__attribute__'"); // <builtin>:34:9
pub const _cdecl = @compileError("unable to translate macro: undefined identifier `__cdecl__`"); // <builtin>:35:9
pub const __cdecl = @compileError("unable to translate macro: undefined identifier `__cdecl__`"); // <builtin>:36:9
pub const _stdcall = @compileError("unable to translate macro: undefined identifier `__stdcall__`"); // <builtin>:37:9
pub const __stdcall = @compileError("unable to translate macro: undefined identifier `__stdcall__`"); // <builtin>:38:9
pub const _fastcall = @compileError("unable to translate macro: undefined identifier `__fastcall__`"); // <builtin>:39:9
pub const __fastcall = @compileError("unable to translate macro: undefined identifier `__fastcall__`"); // <builtin>:40:9
pub const _thiscall = @compileError("unable to translate macro: undefined identifier `__thiscall__`"); // <builtin>:41:9
pub const __thiscall = @compileError("unable to translate macro: undefined identifier `__thiscall__`"); // <builtin>:42:9
pub const unix = @as(c_int, 1);
pub const __unix = @as(c_int, 1);
pub const __unix__ = @as(c_int, 1);
pub const __code_model_small__ = @as(c_int, 1);
pub const __amd64__ = @as(c_int, 1);
pub const __amd64 = @as(c_int, 1);
pub const __x86_64__ = @as(c_int, 1);
pub const __x86_64 = @as(c_int, 1);
pub const __SEG_GS = @as(c_int, 1);
pub const __SEG_FS = @as(c_int, 1);
pub const __seg_gs = @compileError("unable to translate macro: undefined identifier `address_space`"); // <builtin>:53:9
pub const __seg_fs = @compileError("unable to translate macro: undefined identifier `address_space`"); // <builtin>:54:9
pub const __FXSR__ = @as(c_int, 1);
pub const __SSE2__ = @as(c_int, 1);
pub const __SSE__ = @as(c_int, 1);
pub const __SSE_MATH__ = @as(c_int, 1);
pub const __MMX__ = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = @as(c_int, 1);
pub const __ORDER_LITTLE_ENDIAN__ = @as(c_int, 1234);
pub const __ORDER_BIG_ENDIAN__ = @as(c_int, 4321);
pub const __ORDER_PDP_ENDIAN__ = @as(c_int, 3412);
pub const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
pub const __LITTLE_ENDIAN__ = @as(c_int, 1);
pub const __ATOMIC_RELAXED = @as(c_int, 0);
pub const __ATOMIC_CONSUME = @as(c_int, 1);
pub const __ATOMIC_ACQUIRE = @as(c_int, 2);
pub const __ATOMIC_RELEASE = @as(c_int, 3);
pub const __ATOMIC_ACQ_REL = @as(c_int, 4);
pub const __ATOMIC_SEQ_CST = @as(c_int, 5);
pub const __ATOMIC_BOOL_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_CHAR_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_WINT_T_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_SHORT_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_INT_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_LONG_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_LLONG_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_POINTER_LOCK_FREE = @as(c_int, 1);
pub const __WCHAR_UNSIGNED__ = @as(c_int, 1);
pub const __WINT_UNSIGNED__ = @as(c_int, 1);
pub const __CHAR_BIT__ = @as(c_int, 8);
pub const __BOOL_WIDTH__ = @as(c_int, 8);
pub const __SCHAR_MAX__ = @as(c_int, 127);
pub const __SCHAR_WIDTH__ = @as(c_int, 8);
pub const __SHRT_MAX__ = @as(c_int, 32767);
pub const __SHRT_WIDTH__ = @as(c_int, 16);
pub const __INT_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_WIDTH__ = @as(c_int, 32);
pub const __LONG_MAX__ = @as(c_long, 2147483647);
pub const __LONG_WIDTH__ = @as(c_int, 32);
pub const __LONG_LONG_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __LONG_LONG_WIDTH__ = @as(c_int, 64);
pub const __WCHAR_MAX__ = __helpers.promoteIntLiteral(c_int, 65535, .decimal);
pub const __WCHAR_WIDTH__ = @as(c_int, 16);
pub const __WINT_MAX__ = __helpers.promoteIntLiteral(c_int, 65535, .decimal);
pub const __WINT_WIDTH__ = @as(c_int, 16);
pub const __INTMAX_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INTMAX_WIDTH__ = @as(c_int, 64);
pub const __SIZE_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __SIZE_WIDTH__ = @as(c_int, 64);
pub const __UINTMAX_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __UINTMAX_WIDTH__ = @as(c_int, 64);
pub const __PTRDIFF_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __PTRDIFF_WIDTH__ = @as(c_int, 64);
pub const __INTPTR_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INTPTR_WIDTH__ = @as(c_int, 64);
pub const __UINTPTR_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __UINTPTR_WIDTH__ = @as(c_int, 64);
pub const __SIG_ATOMIC_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __SIG_ATOMIC_WIDTH__ = @as(c_int, 32);
pub const __BITINT_MAXWIDTH__ = __helpers.promoteIntLiteral(c_int, 65535, .decimal);
pub const __SIZEOF_FLOAT__ = @as(c_int, 4);
pub const __SIZEOF_DOUBLE__ = @as(c_int, 8);
pub const __SIZEOF_LONG_DOUBLE__ = @as(c_int, 10);
pub const __SIZEOF_SHORT__ = @as(c_int, 2);
pub const __SIZEOF_INT__ = @as(c_int, 4);
pub const __SIZEOF_LONG__ = @as(c_int, 4);
pub const __SIZEOF_LONG_LONG__ = @as(c_int, 8);
pub const __SIZEOF_POINTER__ = @as(c_int, 8);
pub const __SIZEOF_PTRDIFF_T__ = @as(c_int, 8);
pub const __SIZEOF_SIZE_T__ = @as(c_int, 8);
pub const __SIZEOF_WCHAR_T__ = @as(c_int, 2);
pub const __SIZEOF_WINT_T__ = @as(c_int, 2);
pub const __SIZEOF_INT128__ = @as(c_int, 16);
pub const __INTPTR_TYPE__ = c_longlong;
pub const __UINTPTR_TYPE__ = c_ulonglong;
pub const __INTMAX_TYPE__ = c_longlong;
pub const __INTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `LL`"); // <builtin>:132:9
pub const __INTMAX_C = __helpers.LL_SUFFIX;
pub const __UINTMAX_TYPE__ = c_ulonglong;
pub const __UINTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `ULL`"); // <builtin>:135:9
pub const __UINTMAX_C = __helpers.ULL_SUFFIX;
pub const __PTRDIFF_TYPE__ = c_longlong;
pub const __SIZE_TYPE__ = c_ulonglong;
pub const __WCHAR_TYPE__ = c_ushort;
pub const __WINT_TYPE__ = c_ushort;
pub const __CHAR16_TYPE__ = c_ushort;
pub const __CHAR32_TYPE__ = c_uint;
pub const __INT8_TYPE__ = i8;
pub const __INT8_FMTd__ = "hhd";
pub const __INT8_FMTi__ = "hhi";
pub const __INT8_C_SUFFIX__ = "";
pub inline fn __INT8_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const __INT16_TYPE__ = c_short;
pub const __INT16_FMTd__ = "hd";
pub const __INT16_FMTi__ = "hi";
pub const __INT16_C_SUFFIX__ = "";
pub inline fn __INT16_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const __INT32_TYPE__ = c_int;
pub const __INT32_FMTd__ = "d";
pub const __INT32_FMTi__ = "i";
pub const __INT32_C_SUFFIX__ = "";
pub inline fn __INT32_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const __INT64_TYPE__ = c_longlong;
pub const __INT64_FMTd__ = "lld";
pub const __INT64_FMTi__ = "lli";
pub const __INT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `LL`"); // <builtin>:161:9
pub const __INT64_C = __helpers.LL_SUFFIX;
pub const __UINT8_TYPE__ = u8;
pub const __UINT8_FMTo__ = "hho";
pub const __UINT8_FMTu__ = "hhu";
pub const __UINT8_FMTx__ = "hhx";
pub const __UINT8_FMTX__ = "hhX";
pub const __UINT8_C_SUFFIX__ = "";
pub inline fn __UINT8_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const __UINT8_MAX__ = @as(c_int, 255);
pub const __INT8_MAX__ = @as(c_int, 127);
pub const __UINT16_TYPE__ = c_ushort;
pub const __UINT16_FMTo__ = "ho";
pub const __UINT16_FMTu__ = "hu";
pub const __UINT16_FMTx__ = "hx";
pub const __UINT16_FMTX__ = "hX";
pub const __UINT16_C_SUFFIX__ = "";
pub inline fn __UINT16_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const __UINT16_MAX__ = __helpers.promoteIntLiteral(c_int, 65535, .decimal);
pub const __INT16_MAX__ = @as(c_int, 32767);
pub const __UINT32_TYPE__ = c_uint;
pub const __UINT32_FMTo__ = "o";
pub const __UINT32_FMTu__ = "u";
pub const __UINT32_FMTx__ = "x";
pub const __UINT32_FMTX__ = "X";
pub const __UINT32_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `U`"); // <builtin>:186:9
pub const __UINT32_C = __helpers.U_SUFFIX;
pub const __UINT32_MAX__ = __helpers.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __INT32_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __UINT64_TYPE__ = c_ulonglong;
pub const __UINT64_FMTo__ = "llo";
pub const __UINT64_FMTu__ = "llu";
pub const __UINT64_FMTx__ = "llx";
pub const __UINT64_FMTX__ = "llX";
pub const __UINT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `ULL`"); // <builtin>:195:9
pub const __UINT64_C = __helpers.ULL_SUFFIX;
pub const __UINT64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __INT64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_LEAST8_TYPE__ = i8;
pub const __INT_LEAST8_MAX__ = @as(c_int, 127);
pub const __INT_LEAST8_WIDTH__ = @as(c_int, 8);
pub const INT_LEAST8_FMTd__ = "hhd";
pub const INT_LEAST8_FMTi__ = "hhi";
pub const __UINT_LEAST8_TYPE__ = u8;
pub const __UINT_LEAST8_MAX__ = @as(c_int, 255);
pub const UINT_LEAST8_FMTo__ = "hho";
pub const UINT_LEAST8_FMTu__ = "hhu";
pub const UINT_LEAST8_FMTx__ = "hhx";
pub const UINT_LEAST8_FMTX__ = "hhX";
pub const __INT_FAST8_TYPE__ = i8;
pub const __INT_FAST8_MAX__ = @as(c_int, 127);
pub const __INT_FAST8_WIDTH__ = @as(c_int, 8);
pub const INT_FAST8_FMTd__ = "hhd";
pub const INT_FAST8_FMTi__ = "hhi";
pub const __UINT_FAST8_TYPE__ = u8;
pub const __UINT_FAST8_MAX__ = @as(c_int, 255);
pub const UINT_FAST8_FMTo__ = "hho";
pub const UINT_FAST8_FMTu__ = "hhu";
pub const UINT_FAST8_FMTx__ = "hhx";
pub const UINT_FAST8_FMTX__ = "hhX";
pub const __INT_LEAST16_TYPE__ = c_short;
pub const __INT_LEAST16_MAX__ = @as(c_int, 32767);
pub const __INT_LEAST16_WIDTH__ = @as(c_int, 16);
pub const INT_LEAST16_FMTd__ = "hd";
pub const INT_LEAST16_FMTi__ = "hi";
pub const __UINT_LEAST16_TYPE__ = c_ushort;
pub const __UINT_LEAST16_MAX__ = __helpers.promoteIntLiteral(c_int, 65535, .decimal);
pub const UINT_LEAST16_FMTo__ = "ho";
pub const UINT_LEAST16_FMTu__ = "hu";
pub const UINT_LEAST16_FMTx__ = "hx";
pub const UINT_LEAST16_FMTX__ = "hX";
pub const __INT_FAST16_TYPE__ = c_short;
pub const __INT_FAST16_MAX__ = @as(c_int, 32767);
pub const __INT_FAST16_WIDTH__ = @as(c_int, 16);
pub const INT_FAST16_FMTd__ = "hd";
pub const INT_FAST16_FMTi__ = "hi";
pub const __UINT_FAST16_TYPE__ = c_ushort;
pub const __UINT_FAST16_MAX__ = __helpers.promoteIntLiteral(c_int, 65535, .decimal);
pub const UINT_FAST16_FMTo__ = "ho";
pub const UINT_FAST16_FMTu__ = "hu";
pub const UINT_FAST16_FMTx__ = "hx";
pub const UINT_FAST16_FMTX__ = "hX";
pub const __INT_LEAST32_TYPE__ = c_int;
pub const __INT_LEAST32_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_LEAST32_WIDTH__ = @as(c_int, 32);
pub const INT_LEAST32_FMTd__ = "d";
pub const INT_LEAST32_FMTi__ = "i";
pub const __UINT_LEAST32_TYPE__ = c_uint;
pub const __UINT_LEAST32_MAX__ = __helpers.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const UINT_LEAST32_FMTo__ = "o";
pub const UINT_LEAST32_FMTu__ = "u";
pub const UINT_LEAST32_FMTx__ = "x";
pub const UINT_LEAST32_FMTX__ = "X";
pub const __INT_FAST32_TYPE__ = c_int;
pub const __INT_FAST32_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_FAST32_WIDTH__ = @as(c_int, 32);
pub const INT_FAST32_FMTd__ = "d";
pub const INT_FAST32_FMTi__ = "i";
pub const __UINT_FAST32_TYPE__ = c_uint;
pub const __UINT_FAST32_MAX__ = __helpers.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const UINT_FAST32_FMTo__ = "o";
pub const UINT_FAST32_FMTu__ = "u";
pub const UINT_FAST32_FMTx__ = "x";
pub const UINT_FAST32_FMTX__ = "X";
pub const __INT_LEAST64_TYPE__ = c_longlong;
pub const __INT_LEAST64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_LEAST64_WIDTH__ = @as(c_int, 64);
pub const INT_LEAST64_FMTd__ = "lld";
pub const INT_LEAST64_FMTi__ = "lli";
pub const __UINT_LEAST64_TYPE__ = c_ulonglong;
pub const __UINT_LEAST64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const UINT_LEAST64_FMTo__ = "llo";
pub const UINT_LEAST64_FMTu__ = "llu";
pub const UINT_LEAST64_FMTx__ = "llx";
pub const UINT_LEAST64_FMTX__ = "llX";
pub const __INT_FAST64_TYPE__ = c_longlong;
pub const __INT_FAST64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_FAST64_WIDTH__ = @as(c_int, 64);
pub const INT_FAST64_FMTd__ = "lld";
pub const INT_FAST64_FMTi__ = "lli";
pub const __UINT_FAST64_TYPE__ = c_ulonglong;
pub const __UINT_FAST64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const UINT_FAST64_FMTo__ = "llo";
pub const UINT_FAST64_FMTu__ = "llu";
pub const UINT_FAST64_FMTx__ = "llx";
pub const UINT_FAST64_FMTX__ = "llX";
pub const __FLT16_DENORM_MIN__ = @as(f16, 5.9604644775390625e-8);
pub const __FLT16_HAS_DENORM__ = "";
pub const __FLT16_DIG__ = @as(c_int, 3);
pub const __FLT16_DECIMAL_DIG__ = @as(c_int, 5);
pub const __FLT16_EPSILON__ = @as(f16, 9.765625e-4);
pub const __FLT16_HAS_INFINITY__ = "";
pub const __FLT16_HAS_QUIET_NAN__ = "";
pub const __FLT16_MANT_DIG__ = @as(c_int, 11);
pub const __FLT16_MAX_10_EXP__ = @as(c_int, 4);
pub const __FLT16_MAX_EXP__ = @as(c_int, 16);
pub const __FLT16_MAX__ = @as(f16, 6.5504e+4);
pub const __FLT16_MIN_10_EXP__ = -@as(c_int, 4);
pub const __FLT16_MIN_EXP__ = -@as(c_int, 13);
pub const __FLT16_MIN__ = @as(f16, 6.103515625e-5);
pub const __FLT_DENORM_MIN__ = @as(f32, 1.40129846e-45);
pub const __FLT_HAS_DENORM__ = "";
pub const __FLT_DIG__ = @as(c_int, 6);
pub const __FLT_DECIMAL_DIG__ = @as(c_int, 9);
pub const __FLT_EPSILON__ = @as(f32, 1.19209290e-7);
pub const __FLT_HAS_INFINITY__ = "";
pub const __FLT_HAS_QUIET_NAN__ = "";
pub const __FLT_MANT_DIG__ = @as(c_int, 24);
pub const __FLT_MAX_10_EXP__ = @as(c_int, 38);
pub const __FLT_MAX_EXP__ = @as(c_int, 128);
pub const __FLT_MAX__ = @as(f32, 3.40282347e+38);
pub const __FLT_MIN_10_EXP__ = -@as(c_int, 37);
pub const __FLT_MIN_EXP__ = -@as(c_int, 125);
pub const __FLT_MIN__ = @as(f32, 1.17549435e-38);
pub const __DBL_DENORM_MIN__ = @as(f64, 4.9406564584124654e-324);
pub const __DBL_HAS_DENORM__ = "";
pub const __DBL_DIG__ = @as(c_int, 15);
pub const __DBL_DECIMAL_DIG__ = @as(c_int, 17);
pub const __DBL_EPSILON__ = @as(f64, 2.2204460492503131e-16);
pub const __DBL_HAS_INFINITY__ = "";
pub const __DBL_HAS_QUIET_NAN__ = "";
pub const __DBL_MANT_DIG__ = @as(c_int, 53);
pub const __DBL_MAX_10_EXP__ = @as(c_int, 308);
pub const __DBL_MAX_EXP__ = @as(c_int, 1024);
pub const __DBL_MAX__ = @as(f64, 1.7976931348623157e+308);
pub const __DBL_MIN_10_EXP__ = -@as(c_int, 307);
pub const __DBL_MIN_EXP__ = -@as(c_int, 1021);
pub const __DBL_MIN__ = @as(f64, 2.2250738585072014e-308);
pub const __LDBL_DENORM_MIN__ = @as(c_longdouble, 3.64519953188247460253e-4951);
pub const __LDBL_HAS_DENORM__ = "";
pub const __LDBL_DIG__ = @as(c_int, 18);
pub const __LDBL_DECIMAL_DIG__ = @as(c_int, 21);
pub const __LDBL_EPSILON__ = @as(c_longdouble, 1.08420217248550443401e-19);
pub const __LDBL_HAS_INFINITY__ = "";
pub const __LDBL_HAS_QUIET_NAN__ = "";
pub const __LDBL_MANT_DIG__ = @as(c_int, 64);
pub const __LDBL_MAX_10_EXP__ = @as(c_int, 4932);
pub const __LDBL_MAX_EXP__ = @as(c_int, 16384);
pub const __LDBL_MAX__ = @as(c_longdouble, 1.18973149535723176502e+4932);
pub const __LDBL_MIN_10_EXP__ = -@as(c_int, 4931);
pub const __LDBL_MIN_EXP__ = -@as(c_int, 16381);
pub const __LDBL_MIN__ = @as(c_longdouble, 3.36210314311209350626e-4932);
pub const __FLT_EVAL_METHOD__ = @as(c_int, 0);
pub const __FLT_RADIX__ = @as(c_int, 2);
pub const __DECIMAL_DIG__ = __LDBL_DECIMAL_DIG__;
pub const __pic__ = @as(c_int, 2);
pub const __PIC__ = @as(c_int, 2);
pub const __MSVCRT_VERSION__ = @as(c_int, 0xE00);
pub const _WIN32_WINNT = @as(c_int, 0x0a00);
pub const PY_SSIZE_T_CLEAN = "";
pub const Py_PYTHON_H = "";
pub const PY_RELEASE_LEVEL_ALPHA = @as(c_int, 0xA);
pub const PY_RELEASE_LEVEL_BETA = @as(c_int, 0xB);
pub const PY_RELEASE_LEVEL_GAMMA = @as(c_int, 0xC);
pub const PY_RELEASE_LEVEL_FINAL = @as(c_int, 0xF);
pub const PY_MAJOR_VERSION = @as(c_int, 3);
pub const PY_MINOR_VERSION = @as(c_int, 13);
pub const PY_MICRO_VERSION = @as(c_int, 0);
pub const PY_RELEASE_LEVEL = PY_RELEASE_LEVEL_FINAL;
pub const PY_RELEASE_SERIAL = @as(c_int, 0);
pub const PY_VERSION = "3.13.0";
pub const PY_VERSION_HEX = ((((PY_MAJOR_VERSION << @as(c_int, 24)) | (PY_MINOR_VERSION << @as(c_int, 16))) | (PY_MICRO_VERSION << @as(c_int, 8))) | (PY_RELEASE_LEVEL << @as(c_int, 4))) | (PY_RELEASE_SERIAL << @as(c_int, 0));
pub const Py_CONFIG_H = "";
pub const _CRT_SECURE_NO_DEPRECATE = @as(c_int, 1);
pub const _CRT_NONSTDC_NO_DEPRECATE = @as(c_int, 1);
pub const HAVE_IO_H = "";
pub const HAVE_SYS_UTIME_H = "";
pub const HAVE_TEMPNAM = "";
pub const HAVE_TMPFILE = "";
pub const HAVE_TMPNAM = "";
pub const HAVE_CLOCK = "";
pub const HAVE_STRERROR = "";
pub const _IO_H_ = "";
pub const _INC_CRTDEFS = "";
pub const _INC_CORECRT = "";
pub const _INC__MINGW_H = "";
pub const _INC_CRTDEFS_MACRO = "";
pub const __MINGW64_PASTE2 = @compileError("unable to translate C expr: unexpected token '##'"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw_mac.h:10:9
pub inline fn __MINGW64_PASTE(x: anytype, y: anytype) @TypeOf(__MINGW64_PASTE2(x, y)) {
    _ = &x;
    _ = &y;
    return __MINGW64_PASTE2(x, y);
}
pub const __STRINGIFY = @compileError("unable to translate C expr: unexpected token ''"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw_mac.h:13:9
pub inline fn __MINGW64_STRINGIFY(x: anytype) @TypeOf(__STRINGIFY(x)) {
    _ = &x;
    return __STRINGIFY(x);
}
pub const __MINGW64_VERSION_MAJOR = @as(c_int, 13);
pub const __MINGW64_VERSION_MINOR = @as(c_int, 0);
pub const __MINGW64_VERSION_BUGFIX = @as(c_int, 0);
pub const __MINGW64_VERSION_RC = @as(c_int, 0);
pub const __MINGW64_VERSION_STR = __MINGW64_STRINGIFY(__MINGW64_VERSION_MAJOR) ++ "." ++ __MINGW64_STRINGIFY(__MINGW64_VERSION_MINOR) ++ "." ++ __MINGW64_STRINGIFY(__MINGW64_VERSION_BUGFIX);
pub const __MINGW64_VERSION_STATE = "alpha";
pub const __MINGW32_MAJOR_VERSION = @as(c_int, 3);
pub const __MINGW32_MINOR_VERSION = @as(c_int, 11);
pub const _M_AMD64 = @as(c_int, 100);
pub const _M_X64 = @as(c_int, 100);
pub const __MINGW_USE_UNDERSCORE_PREFIX = @as(c_int, 0);
pub const __MINGW_IMP_SYMBOL = @compileError("unable to translate macro: undefined identifier `__imp_`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw_mac.h:129:11
pub const __MINGW_IMP_LSYMBOL = @compileError("unable to translate macro: undefined identifier `__imp_`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw_mac.h:130:11
pub inline fn __MINGW_USYMBOL(sym: anytype) @TypeOf(sym) {
    _ = &sym;
    return sym;
}
pub const __MINGW_LSYMBOL = @compileError("unable to translate macro: undefined identifier `_`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw_mac.h:132:11
pub const __MINGW_ASM_CALL = @compileError("unable to translate C expr: unexpected token '__asm__'"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw_mac.h:140:9
pub const __MINGW_ASM_CRT_CALL = @compileError("unable to translate C expr: unexpected token '__asm__'"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw_mac.h:141:9
pub const __MINGW_EXTENSION = @compileError("unable to translate C expr: unexpected token '__extension__'"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw_mac.h:173:13
pub const __C89_NAMELESS = __MINGW_EXTENSION;
pub const __C89_NAMELESSSTRUCTNAME = "";
pub const __C89_NAMELESSSTRUCTNAME1 = "";
pub const __C89_NAMELESSSTRUCTNAME2 = "";
pub const __C89_NAMELESSSTRUCTNAME3 = "";
pub const __C89_NAMELESSSTRUCTNAME4 = "";
pub const __C89_NAMELESSSTRUCTNAME5 = "";
pub const __C89_NAMELESSUNIONNAME = "";
pub const __C89_NAMELESSUNIONNAME1 = "";
pub const __C89_NAMELESSUNIONNAME2 = "";
pub const __C89_NAMELESSUNIONNAME3 = "";
pub const __C89_NAMELESSUNIONNAME4 = "";
pub const __C89_NAMELESSUNIONNAME5 = "";
pub const __C89_NAMELESSUNIONNAME6 = "";
pub const __C89_NAMELESSUNIONNAME7 = "";
pub const __C89_NAMELESSUNIONNAME8 = "";
pub const __GNU_EXTENSION = __MINGW_EXTENSION;
pub const __MINGW_HAVE_ANSI_C99_PRINTF = @as(c_int, 1);
pub const __MINGW_HAVE_WIDE_C99_PRINTF = @as(c_int, 1);
pub const __MINGW_HAVE_ANSI_C99_SCANF = @as(c_int, 1);
pub const __MINGW_HAVE_WIDE_C99_SCANF = @as(c_int, 1);
pub const __MINGW_POISON_NAME = @compileError("unable to translate macro: undefined identifier `_layout_has_not_been_verified_and_its_declaration_is_most_likely_incorrect`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw_mac.h:213:11
pub const __MSABI_LONG = __helpers.L_SUFFIX;
pub const __MINGW_GCC_VERSION = ((__GNUC__ * @as(c_int, 10000)) + (__GNUC_MINOR__ * @as(c_int, 100))) + __GNUC_PATCHLEVEL__;
pub inline fn __MINGW_GNUC_PREREQ(major: anytype, minor: anytype) @TypeOf((__GNUC__ > major) or ((__GNUC__ == major) and (__GNUC_MINOR__ >= minor))) {
    _ = &major;
    _ = &minor;
    return (__GNUC__ > major) or ((__GNUC__ == major) and (__GNUC_MINOR__ >= minor));
}
pub inline fn __MINGW_MSC_PREREQ(major: anytype, minor: anytype) @TypeOf(@as(c_int, 0)) {
    _ = &major;
    _ = &minor;
    return @as(c_int, 0);
}
pub inline fn __MINGW_ATTRIB_DEPRECATED_STR(X: anytype) void {
    _ = &X;
    return;
}
pub const __MINGW_SEC_WARN_STR = "This function or variable may be unsafe, use _CRT_SECURE_NO_WARNINGS to disable deprecation";
pub const __MINGW_MSVC2005_DEPREC_STR = "This POSIX function is deprecated beginning in Visual C++ 2005, use _CRT_NONSTDC_NO_DEPRECATE to disable deprecation";
pub const __MINGW_ATTRIB_DEPRECATED_MSVC2005 = "";
pub const __MINGW_ATTRIB_DEPRECATED_SEC_WARN = __MINGW_ATTRIB_DEPRECATED_STR(__MINGW_SEC_WARN_STR);
pub const __MINGW_MS_PRINTF = @compileError("unable to translate macro: undefined identifier `__format__`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw_mac.h:293:9
pub const __MINGW_MS_SCANF = @compileError("unable to translate macro: undefined identifier `__format__`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw_mac.h:296:9
pub const __MINGW_GNU_PRINTF = @compileError("unable to translate macro: undefined identifier `__format__`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw_mac.h:299:9
pub const __MINGW_GNU_SCANF = @compileError("unable to translate macro: undefined identifier `__format__`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw_mac.h:302:9
pub const __mingw_ovr = @compileError("unable to translate macro: undefined identifier `__unused__`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw_mac.h:311:11
pub const __mingw_attribute_artificial = @compileError("unable to translate macro: undefined identifier `__artificial__`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw_mac.h:318:11
pub const __MINGW_SELECTANY = @compileError("unable to translate macro: undefined identifier `__selectany__`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw_mac.h:324:9
pub const __MINGW_FORTIFY_LEVEL = @as(c_int, 0);
pub const __mingw_bos_ovr = __mingw_ovr;
pub const __MINGW_FORTIFY_VA_ARG = @as(c_int, 0);
pub const _INC_MINGW_SECAPI = "";
pub const _CRT_SECURE_CPP_OVERLOAD_SECURE_NAMES = @as(c_int, 0);
pub const _CRT_SECURE_CPP_OVERLOAD_SECURE_NAMES_MEMORY = @as(c_int, 0);
pub const _CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES = @as(c_int, 0);
pub const _CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES_COUNT = @as(c_int, 0);
pub const _CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES_MEMORY = @as(c_int, 0);
pub const __MINGW_CRT_NAME_CONCAT2 = @compileError("unable to translate macro: undefined identifier `_s`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw_secapi.h:41:9
pub const __CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES_MEMORY_0_3_ = @compileError("unable to translate C expr: unexpected token '__cdecl'"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw_secapi.h:69:9
pub const __LONG32 = c_long;
pub const __MINGW_IMPORT = @compileError("unable to translate macro: undefined identifier `__dllimport__`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw.h:44:12
pub const __USE_CRTIMP = @as(c_int, 1);
pub const _CRTIMP = @compileError("unable to translate macro: undefined identifier `__dllimport__`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw.h:52:15
pub const __DECLSPEC_SUPPORTED = "";
pub const USE___UUIDOF = @as(c_int, 0);
pub const _inline = @compileError("unable to translate C expr: unexpected token '__inline'"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw.h:74:9
pub const __CRT_INLINE = @compileError("unable to translate macro: undefined identifier `__gnu_inline__`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw.h:83:11
pub const __MINGW_INTRIN_INLINE = @compileError("unable to translate macro: undefined identifier `__always_inline__`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw.h:90:9
pub const __MINGW_CXX11_CONSTEXPR = "";
pub const __MINGW_CXX14_CONSTEXPR = "";
pub const __UNUSED_PARAM = @compileError("unable to translate macro: undefined identifier `__unused__`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw.h:118:11
pub const __restrict_arr = @compileError("unable to translate C expr: unexpected token '__restrict'"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw.h:133:10
pub const __MINGW_ATTRIB_NORETURN = @compileError("unable to translate macro: undefined identifier `__noreturn__`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw.h:149:9
pub const __MINGW_ATTRIB_CONST = @compileError("unable to translate C expr: unexpected token '__attribute__'"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw.h:150:9
pub const __MINGW_ATTRIB_MALLOC = @compileError("unable to translate macro: undefined identifier `__malloc__`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw.h:160:9
pub const __MINGW_ATTRIB_PURE = @compileError("unable to translate macro: undefined identifier `__pure__`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw.h:161:9
pub const __MINGW_ATTRIB_NONNULL = @compileError("unable to translate macro: undefined identifier `__nonnull__`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw.h:174:9
pub const __MINGW_ATTRIB_UNUSED = @compileError("unable to translate macro: undefined identifier `__unused__`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw.h:180:9
pub const __MINGW_ATTRIB_USED = @compileError("unable to translate macro: undefined identifier `__used__`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw.h:186:9
pub const __MINGW_ATTRIB_DEPRECATED = @compileError("unable to translate macro: undefined identifier `__deprecated__`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw.h:187:9
pub const __MINGW_ATTRIB_DEPRECATED_MSG = @compileError("unable to translate macro: undefined identifier `__deprecated__`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw.h:189:9
pub const __MINGW_NOTHROW = @compileError("unable to translate macro: undefined identifier `__nothrow__`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw.h:204:9
pub const __MINGW_ATTRIB_NO_OPTIMIZE = @compileError("unable to translate macro: undefined identifier `__optimize__`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw.h:212:9
pub const __MINGW_PRAGMA_PARAM = @compileError("unable to translate macro: undefined identifier `_Pragma`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw.h:218:9
pub const __MINGW_BROKEN_INTERFACE = @compileError("unable to translate macro: undefined identifier `message`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw.h:225:9
pub const _UCRT = "";
pub inline fn __MINGW_UCRT_ASM_CALL(func: anytype) @TypeOf(__MINGW_ASM_CALL(func)) {
    _ = &func;
    return __MINGW_ASM_CALL(func);
}
pub const _INT128_DEFINED = "";
pub const __int8 = u8;
pub const __int16 = c_short;
pub const __int32 = c_int;
pub const __int64 = c_longlong;
pub const __ptr32 = "";
pub const __ptr64 = "";
pub const __unaligned = "";
pub const __w64 = "";
pub const __forceinline = @compileError("unable to translate macro: undefined identifier `__always_inline__`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw.h:290:9
pub const __nothrow = "";
pub const _INC_VADEFS = "";
pub const MINGW_SDK_INIT = "";
pub const MINGW_HAS_SECURE_API = @as(c_int, 1);
pub const __STDC_SECURE_LIB__ = @as(c_long, 200411);
pub const __GOT_SECURE_LIB__ = __STDC_SECURE_LIB__;
pub const MINGW_DDK_H = "";
pub const MINGW_HAS_DDK_H = @as(c_int, 1);
pub const __GNUC_VA_LIST = "";
pub const _VA_LIST_DEFINED = "";
pub inline fn _ADDRESSOF(v: anytype) @TypeOf(&v) {
    _ = &v;
    return &v;
}
pub const _crt_va_start = @compileError("unable to translate macro: undefined identifier `__builtin_va_start`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\vadefs.h:48:9
pub const _crt_va_arg = @compileError("unable to translate macro: undefined identifier `__builtin_va_arg`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\vadefs.h:49:9
pub const _crt_va_end = @compileError("unable to translate macro: undefined identifier `__builtin_va_end`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\vadefs.h:50:9
pub const _crt_va_copy = @compileError("unable to translate macro: undefined identifier `__builtin_va_copy`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\vadefs.h:51:9
pub const __CRT_STRINGIZE = @compileError("unable to translate C expr: unexpected token ''"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw.h:309:9
pub inline fn _CRT_STRINGIZE(_Value: anytype) @TypeOf(__CRT_STRINGIZE(_Value)) {
    _ = &_Value;
    return __CRT_STRINGIZE(_Value);
}
pub const __CRT_WIDE = @compileError("unable to translate macro: undefined identifier `L`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw.h:314:9
pub inline fn _CRT_WIDE(_String: anytype) @TypeOf(__CRT_WIDE(_String)) {
    _ = &_String;
    return __CRT_WIDE(_String);
}
pub const _W64 = "";
pub const _CRTIMP_NOIA64 = _CRTIMP;
pub const _CRTIMP2 = _CRTIMP;
pub const _CRTIMP_ALTERNATIVE = _CRTIMP;
pub const _CRT_ALTERNATIVE_IMPORTED = "";
pub const _MRTIMP2 = _CRTIMP;
pub const _DLL = "";
pub const _MT = "";
pub const _MCRTIMP = _CRTIMP;
pub const _CRTIMP_PURE = _CRTIMP;
pub const _PGLOBAL = "";
pub const _AGLOBAL = "";
pub const _SECURECRT_FILL_BUFFER_PATTERN = @as(c_int, 0xFD);
pub const _CRT_DEPRECATE_TEXT = @compileError("unable to translate macro: undefined identifier `deprecated`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw.h:373:9
pub inline fn _CRT_INSECURE_DEPRECATE_MEMORY(_Replacement: anytype) void {
    _ = &_Replacement;
    return;
}
pub inline fn _CRT_INSECURE_DEPRECATE_GLOBALS(_Replacement: anytype) void {
    _ = &_Replacement;
    return;
}
pub const _CRT_MANAGED_HEAP_DEPRECATE = "";
pub inline fn _CRT_OBSOLETE(_NewItem: anytype) void {
    _ = &_NewItem;
    return;
}
pub const _CONST_RETURN = "";
pub const UNALIGNED = "";
pub const _CRT_ALIGN = @compileError("unable to translate macro: undefined identifier `__aligned__`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw.h:415:9
pub const __CRTDECL = @compileError("unable to translate C expr: unexpected token '__cdecl'"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw.h:422:9
pub const _ARGMAX = @as(c_int, 100);
pub const _TRUNCATE = __helpers.cast(usize, -@as(c_int, 1));
pub inline fn _CRT_UNUSED(x: anytype) anyopaque {
    _ = &x;
    return __helpers.cast(anyopaque, x);
}
pub const __USE_MINGW_ANSI_STDIO = @as(c_int, 0);
pub const _CRT_glob = @compileError("unable to translate macro: undefined identifier `_dowildcard`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw.h:479:9
pub const __ANONYMOUS_DEFINED = "";
pub const _ANONYMOUS_UNION = __MINGW_EXTENSION;
pub const _ANONYMOUS_STRUCT = __MINGW_EXTENSION;
pub inline fn _UNION_NAME(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn _STRUCT_NAME(x: anytype) void {
    _ = &x;
    return;
}
pub const DUMMYUNIONNAME = "";
pub const DUMMYUNIONNAME1 = "";
pub const DUMMYUNIONNAME2 = "";
pub const DUMMYUNIONNAME3 = "";
pub const DUMMYUNIONNAME4 = "";
pub const DUMMYUNIONNAME5 = "";
pub const DUMMYUNIONNAME6 = "";
pub const DUMMYUNIONNAME7 = "";
pub const DUMMYUNIONNAME8 = "";
pub const DUMMYUNIONNAME9 = "";
pub const DUMMYSTRUCTNAME = "";
pub const DUMMYSTRUCTNAME1 = "";
pub const DUMMYSTRUCTNAME2 = "";
pub const DUMMYSTRUCTNAME3 = "";
pub const DUMMYSTRUCTNAME4 = "";
pub const DUMMYSTRUCTNAME5 = "";
pub inline fn __CRT_UUID_DECL(@"type": anytype, l: anytype, w1: anytype, w2: anytype, b1: anytype, b2: anytype, b3: anytype, b4: anytype, b5: anytype, b6: anytype, b7: anytype, b8: anytype) void {
    _ = &@"type";
    _ = &l;
    _ = &w1;
    _ = &w2;
    _ = &b1;
    _ = &b2;
    _ = &b3;
    _ = &b4;
    _ = &b5;
    _ = &b6;
    _ = &b7;
    _ = &b8;
    return;
}
pub const __MINGW_DEBUGBREAK_IMPL = @compileError("unable to translate macro: undefined identifier `__debugbreak`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw.h:599:9
pub const __MINGW_FASTFAIL_IMPL = @compileError("unable to translate macro: undefined identifier `__fastfail`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw.h:620:9
pub const __MINGW_PREFETCH_IMPL = @compileError("unable to translate macro: undefined identifier `__prefetch`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\_mingw.h:644:9
pub const _CRT_PACKING = @as(c_int, 8);
pub const _CRTNOALIAS = "";
pub const _CRTRESTRICT = "";
pub const _SIZE_T_DEFINED = "";
pub const _SSIZE_T_DEFINED = "";
pub const _RSIZE_T_DEFINED = "";
pub const _INTPTR_T_DEFINED = "";
pub const __intptr_t_defined = "";
pub const _UINTPTR_T_DEFINED = "";
pub const __uintptr_t_defined = "";
pub const _PTRDIFF_T_DEFINED = "";
pub const _PTRDIFF_T_ = "";
pub const _WCHAR_T_DEFINED = "";
pub const _WCTYPE_T_DEFINED = "";
pub const _WINT_T = "";
pub const _ERRCODE_DEFINED = "";
pub const _TIME32_T_DEFINED = "";
pub const _TIME64_T_DEFINED = "";
pub const _TIME_T_DEFINED = "";
pub const _CRT_SECURE_CPP_NOTHROW = @compileError("unable to translate macro: undefined identifier `throw`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\corecrt.h:143:9
pub inline fn __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_0(__ret: anytype, __func: anytype, __dsttype: anytype, __dst: anytype) void {
    _ = &__ret;
    _ = &__func;
    _ = &__dsttype;
    _ = &__dst;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_1(__ret: anytype, __func: anytype, __dsttype: anytype, __dst: anytype, __type1: anytype, __arg1: anytype) void {
    _ = &__ret;
    _ = &__func;
    _ = &__dsttype;
    _ = &__dst;
    _ = &__type1;
    _ = &__arg1;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_2(__ret: anytype, __func: anytype, __dsttype: anytype, __dst: anytype, __type1: anytype, __arg1: anytype, __type2: anytype, __arg2: anytype) void {
    _ = &__ret;
    _ = &__func;
    _ = &__dsttype;
    _ = &__dst;
    _ = &__type1;
    _ = &__arg1;
    _ = &__type2;
    _ = &__arg2;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_3(__ret: anytype, __func: anytype, __dsttype: anytype, __dst: anytype, __type1: anytype, __arg1: anytype, __type2: anytype, __arg2: anytype, __type3: anytype, __arg3: anytype) void {
    _ = &__ret;
    _ = &__func;
    _ = &__dsttype;
    _ = &__dst;
    _ = &__type1;
    _ = &__arg1;
    _ = &__type2;
    _ = &__arg2;
    _ = &__type3;
    _ = &__arg3;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_4(__ret: anytype, __func: anytype, __dsttype: anytype, __dst: anytype, __type1: anytype, __arg1: anytype, __type2: anytype, __arg2: anytype, __type3: anytype, __arg3: anytype, __type4: anytype, __arg4: anytype) void {
    _ = &__ret;
    _ = &__func;
    _ = &__dsttype;
    _ = &__dst;
    _ = &__type1;
    _ = &__arg1;
    _ = &__type2;
    _ = &__arg2;
    _ = &__type3;
    _ = &__arg3;
    _ = &__type4;
    _ = &__arg4;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_SECURE_FUNC_1_1(__ret: anytype, __func: anytype, __type0: anytype, __arg0: anytype, __dsttype: anytype, __dst: anytype, __type1: anytype, __arg1: anytype) void {
    _ = &__ret;
    _ = &__func;
    _ = &__type0;
    _ = &__arg0;
    _ = &__dsttype;
    _ = &__dst;
    _ = &__type1;
    _ = &__arg1;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_SECURE_FUNC_1_2(__ret: anytype, __func: anytype, __type0: anytype, __arg0: anytype, __dsttype: anytype, __dst: anytype, __type1: anytype, __arg1: anytype, __type2: anytype, __arg2: anytype) void {
    _ = &__ret;
    _ = &__func;
    _ = &__type0;
    _ = &__arg0;
    _ = &__dsttype;
    _ = &__dst;
    _ = &__type1;
    _ = &__arg1;
    _ = &__type2;
    _ = &__arg2;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_SECURE_FUNC_1_3(__ret: anytype, __func: anytype, __type0: anytype, __arg0: anytype, __dsttype: anytype, __dst: anytype, __type1: anytype, __arg1: anytype, __type2: anytype, __arg2: anytype, __type3: anytype, __arg3: anytype) void {
    _ = &__ret;
    _ = &__func;
    _ = &__type0;
    _ = &__arg0;
    _ = &__dsttype;
    _ = &__dst;
    _ = &__type1;
    _ = &__arg1;
    _ = &__type2;
    _ = &__arg2;
    _ = &__type3;
    _ = &__arg3;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_SECURE_FUNC_2_0(__ret: anytype, __func: anytype, __type1: anytype, __arg1: anytype, __type2: anytype, __arg2: anytype, __dsttype: anytype, __dst: anytype) void {
    _ = &__ret;
    _ = &__func;
    _ = &__type1;
    _ = &__arg1;
    _ = &__type2;
    _ = &__arg2;
    _ = &__dsttype;
    _ = &__dst;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_1_ARGLIST(__ret: anytype, __func: anytype, __vfunc: anytype, __dsttype: anytype, __dst: anytype, __type1: anytype, __arg1: anytype) void {
    _ = &__ret;
    _ = &__func;
    _ = &__vfunc;
    _ = &__dsttype;
    _ = &__dst;
    _ = &__type1;
    _ = &__arg1;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_2_ARGLIST(__ret: anytype, __func: anytype, __vfunc: anytype, __dsttype: anytype, __dst: anytype, __type1: anytype, __arg1: anytype, __type2: anytype, __arg2: anytype) void {
    _ = &__ret;
    _ = &__func;
    _ = &__vfunc;
    _ = &__dsttype;
    _ = &__dst;
    _ = &__type1;
    _ = &__arg1;
    _ = &__type2;
    _ = &__arg2;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_SECURE_FUNC_SPLITPATH(__ret: anytype, __func: anytype, __dsttype: anytype, __src: anytype) void {
    _ = &__ret;
    _ = &__func;
    _ = &__dsttype;
    _ = &__src;
    return;
}
pub const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_0 = @compileError("unable to translate macro: undefined identifier `__func_name`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\corecrt.h:277:9
pub const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_1 = @compileError("unable to translate macro: undefined identifier `__func_name`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\corecrt.h:279:9
pub const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_2 = @compileError("unable to translate macro: undefined identifier `__func_name`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\corecrt.h:281:9
pub const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_3 = @compileError("unable to translate macro: undefined identifier `__func_name`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\corecrt.h:283:9
pub const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_4 = @compileError("unable to translate macro: undefined identifier `__func_name`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\corecrt.h:285:9
pub inline fn __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_0_EX(__ret_type: anytype, __ret_policy: anytype, __decl_spec: anytype, __name: anytype, __sec_name: anytype, __dst_attr: anytype, __dst_type: anytype, __dst: anytype) void {
    _ = &__ret_type;
    _ = &__ret_policy;
    _ = &__decl_spec;
    _ = &__name;
    _ = &__sec_name;
    _ = &__dst_attr;
    _ = &__dst_type;
    _ = &__dst;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_1_EX(__ret_type: anytype, __ret_policy: anytype, __decl_spec: anytype, __name: anytype, __sec_name: anytype, __dst_attr: anytype, __dst_type: anytype, __dst: anytype, __arg1_type: anytype, __arg1: anytype) void {
    _ = &__ret_type;
    _ = &__ret_policy;
    _ = &__decl_spec;
    _ = &__name;
    _ = &__sec_name;
    _ = &__dst_attr;
    _ = &__dst_type;
    _ = &__dst;
    _ = &__arg1_type;
    _ = &__arg1;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_2_EX(__ret_type: anytype, __ret_policy: anytype, __decl_spec: anytype, __name: anytype, __sec_name: anytype, __dst_attr: anytype, __dst_type: anytype, __dst: anytype, __arg1_type: anytype, __arg1: anytype, __arg2_type: anytype, __arg2: anytype) void {
    _ = &__ret_type;
    _ = &__ret_policy;
    _ = &__decl_spec;
    _ = &__name;
    _ = &__sec_name;
    _ = &__dst_attr;
    _ = &__dst_type;
    _ = &__dst;
    _ = &__arg1_type;
    _ = &__arg1;
    _ = &__arg2_type;
    _ = &__arg2;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_3_EX(__ret_type: anytype, __ret_policy: anytype, __decl_spec: anytype, __name: anytype, __sec_name: anytype, __dst_attr: anytype, __dst_type: anytype, __dst: anytype, __arg1_type: anytype, __arg1: anytype, __arg2_type: anytype, __arg2: anytype, __arg3_type: anytype, __arg3: anytype) void {
    _ = &__ret_type;
    _ = &__ret_policy;
    _ = &__decl_spec;
    _ = &__name;
    _ = &__sec_name;
    _ = &__dst_attr;
    _ = &__dst_type;
    _ = &__dst;
    _ = &__arg1_type;
    _ = &__arg1;
    _ = &__arg2_type;
    _ = &__arg2;
    _ = &__arg3_type;
    _ = &__arg3;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_4_EX(__ret_type: anytype, __ret_policy: anytype, __decl_spec: anytype, __name: anytype, __sec_name: anytype, __dst_attr: anytype, __dst_type: anytype, __dst: anytype, __arg1_type: anytype, __arg1: anytype, __arg2_type: anytype, __arg2: anytype, __arg3_type: anytype, __arg3: anytype, __arg4_type: anytype, __arg4: anytype) void {
    _ = &__ret_type;
    _ = &__ret_policy;
    _ = &__decl_spec;
    _ = &__name;
    _ = &__sec_name;
    _ = &__dst_attr;
    _ = &__dst_type;
    _ = &__dst;
    _ = &__arg1_type;
    _ = &__arg1;
    _ = &__arg2_type;
    _ = &__arg2;
    _ = &__arg3_type;
    _ = &__arg3;
    _ = &__arg4_type;
    _ = &__arg4;
    return;
}
pub const _TAGLC_ID_DEFINED = "";
pub const _THREADLOCALEINFO = "";
pub inline fn __crt_typefix(ctype: anytype) void {
    _ = &ctype;
    return;
}
pub const _CRT_USE_WINAPI_FAMILY_DESKTOP_APP = "";
pub const _INC_STRING = "";
pub const _SECIMP = @compileError("unable to translate macro: undefined identifier `dllimport`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\string.h:16:9
pub const _NLSCMP_DEFINED = "";
pub const _NLSCMPERROR = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const NULL = __helpers.cast(?*anyopaque, @as(c_int, 0));
pub const _WConst_return = "";
pub const _CRT_MEMORY_DEFINED = "";
pub const _WSTRING_DEFINED = "";
pub const wcswcs = wcsstr;
pub const _INC_STRING_S = "";
pub const _WSTRING_S_DEFINED = "";
pub const _FSIZE_T_DEFINED = "";
pub const _finddata_t = _finddata64i32_t;
pub const _finddatai64_t = __finddata64_t;
pub const _findfirst = _findfirst64i32;
pub const _findnext = _findnext64i32;
pub const _findfirsti64 = _findfirst64;
pub const _findnexti64 = _findnext64;
pub const _FINDDATA_T_DEFINED = "";
pub const _wfinddata_t = _wfinddata64i32_t;
pub const _wfinddatai64_t = _wfinddata64_t;
pub const _wfindfirst = _wfindfirst64i32;
pub const _wfindnext = _wfindnext64i32;
pub const _wfindfirsti64 = _wfindfirst64;
pub const _wfindnexti64 = _wfindnext64;
pub const _WFINDDATA_T_DEFINED = "";
pub const _A_NORMAL = @as(c_int, 0x00);
pub const _A_RDONLY = @as(c_int, 0x01);
pub const _A_HIDDEN = @as(c_int, 0x02);
pub const _A_SYSTEM = @as(c_int, 0x04);
pub const _A_SUBDIR = @as(c_int, 0x10);
pub const _A_ARCH = @as(c_int, 0x20);
pub const _OFF_T_DEFINED = "";
pub const _OFF_T_ = "";
pub const _OFF64_T_DEFINED = "";
pub const _FILE_OFFSET_BITS_SET_OFFT = "";
pub const F_OK = @as(c_int, 0);
pub const X_OK = @as(c_int, 1);
pub const W_OK = @as(c_int, 2);
pub const R_OK = @as(c_int, 4);
pub const _CRT_DIRECTORY_DEFINED = "";
pub const _WIO_DEFINED = "";
pub const _FILE_OFFSET_BITS_SET_LSEEK = "";
pub const HAVE_STRFTIME = "";
pub const DONT_HAVE_SIG_ALARM = "";
pub const DONT_HAVE_SIG_PAUSE = "";
pub const LONG_BIT = @as(c_int, 32);
pub const WORD_BIT = @as(c_int, 32);
pub const MS_WIN32 = "";
pub const MS_WINDOWS = "";
pub const NT_THREADS = "";
pub const WITH_THREAD = "";
pub const USE_SOCKET = "";
pub const MS_WIN64 = "";
pub const COMPILER = "[gcc]";
pub const PY_LONG_LONG = c_longlong;
pub const PY_LLONG_MIN = LLONG_MIN;
pub const PY_LLONG_MAX = LLONG_MAX;
pub const PY_ULLONG_MAX = ULLONG_MAX;
pub const _INC_STDIO = "";
pub const _STDIO_CONFIG_DEFINED = "";
pub const _CRT_INTERNAL_PRINTF_LEGACY_VSPRINTF_NULL_TERMINATION = @as(c_ulonglong, 0x0001);
pub const _CRT_INTERNAL_PRINTF_STANDARD_SNPRINTF_BEHAVIOR = @as(c_ulonglong, 0x0002);
pub const _CRT_INTERNAL_PRINTF_LEGACY_WIDE_SPECIFIERS = @as(c_ulonglong, 0x0004);
pub const _CRT_INTERNAL_PRINTF_LEGACY_MSVCRT_COMPATIBILITY = @as(c_ulonglong, 0x0008);
pub const _CRT_INTERNAL_PRINTF_LEGACY_THREE_DIGIT_EXPONENTS = @as(c_ulonglong, 0x0010);
pub const _CRT_INTERNAL_PRINTF_STANDARD_ROUNDING = @as(c_ulonglong, 0x0020);
pub const _CRT_INTERNAL_SCANF_SECURECRT = @as(c_ulonglong, 0x0001);
pub const _CRT_INTERNAL_SCANF_LEGACY_WIDE_SPECIFIERS = @as(c_ulonglong, 0x0002);
pub const _CRT_INTERNAL_SCANF_LEGACY_MSVCRT_COMPATIBILITY = @as(c_ulonglong, 0x0004);
pub const _CRT_INTERNAL_LOCAL_PRINTF_OPTIONS = __local_stdio_printf_options().*;
pub const _CRT_INTERNAL_LOCAL_SCANF_OPTIONS = __local_stdio_scanf_options().*;
pub const BUFSIZ = @as(c_int, 512);
pub const _NFILE = _NSTREAM_;
pub const _NSTREAM_ = @as(c_int, 512);
pub const _IOB_ENTRIES = @as(c_int, 20);
pub const EOF = -@as(c_int, 1);
pub const _FILE_DEFINED = "";
pub const _P_tmpdir = "\\";
pub const _wP_tmpdir = "\\";
pub const L_tmpnam = @as(c_int, 260);
pub const SEEK_CUR = @as(c_int, 1);
pub const SEEK_END = @as(c_int, 2);
pub const SEEK_SET = @as(c_int, 0);
pub const STDIN_FILENO = @as(c_int, 0);
pub const STDOUT_FILENO = @as(c_int, 1);
pub const STDERR_FILENO = @as(c_int, 2);
pub const FILENAME_MAX = @as(c_int, 260);
pub const FOPEN_MAX = @as(c_int, 20);
pub const _SYS_OPEN = @as(c_int, 20);
pub const TMP_MAX = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const _iob = __iob_func();
pub const _FPOS_T_DEFINED = "";
pub inline fn _FPOSOFF(fp: anytype) c_long {
    _ = &fp;
    return __helpers.cast(c_long, fp);
}
pub const _STDSTREAM_DEFINED = "";
pub const stdin = __acrt_iob_func(@as(c_int, 0));
pub const stdout = __acrt_iob_func(@as(c_int, 1));
pub const stderr = __acrt_iob_func(@as(c_int, 2));
pub const _IOFBF = @as(c_int, 0x0000);
pub const _IOLBF = @as(c_int, 0x0040);
pub const _IONBF = @as(c_int, 0x0004);
pub const __MINGW_PRINTF_FORMAT = @compileError("unable to translate macro: undefined identifier `__gnu_printf__`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\stdio.h:280:9
pub const __MINGW_SCANF_FORMAT = @compileError("unable to translate macro: undefined identifier `__gnu_scanf__`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\stdio.h:281:9
pub const _FILE_OFFSET_BITS_SET_FSEEKO = "";
pub const _FILE_OFFSET_BITS_SET_FTELLO = "";
pub const _CRT_PERROR_DEFINED = "";
pub const popen = _popen;
pub const pclose = _pclose;
pub const _WSTDIO_DEFINED = "";
pub const WEOF = __helpers.cast(wint_t, __helpers.promoteIntLiteral(c_int, 0xFFFF, .hex));
pub const _INC_SWPRINTF_INL = "";
pub const _CRT_WPERROR_DEFINED = "";
pub const wpopen = _wpopen;
pub inline fn _putwc_nolock(_c: anytype, _stm: anytype) @TypeOf(_fputwc_nolock(_c, _stm)) {
    _ = &_c;
    _ = &_stm;
    return _fputwc_nolock(_c, _stm);
}
pub inline fn _getwc_nolock(_c: anytype) @TypeOf(_fgetwc_nolock(_c)) {
    _ = &_c;
    return _fgetwc_nolock(_c);
}
pub const _STDIO_DEFINED = "";
pub inline fn _getchar_nolock() @TypeOf(_getc_nolock(stdin)) {
    return _getc_nolock(stdin);
}
pub inline fn _putchar_nolock(_c: anytype) @TypeOf(_putc_nolock(_c, stdout)) {
    _ = &_c;
    return _putc_nolock(_c, stdout);
}
pub inline fn _getwchar_nolock() @TypeOf(_getwc_nolock(stdin)) {
    return _getwc_nolock(stdin);
}
pub inline fn _putwchar_nolock(_c: anytype) @TypeOf(_putwc_nolock(_c, stdout)) {
    _ = &_c;
    return _putwc_nolock(_c, stdout);
}
pub const P_tmpdir = _P_tmpdir;
pub const SYS_OPEN = _SYS_OPEN;
pub const __MINGW_MBWC_CONVERT_DEFINED = "";
pub const _WSPAWN_DEFINED = "";
pub const _P_WAIT = @as(c_int, 0);
pub const _P_NOWAIT = @as(c_int, 1);
pub const _OLD_P_OVERLAY = @as(c_int, 2);
pub const _P_NOWAITO = @as(c_int, 3);
pub const _P_DETACH = @as(c_int, 4);
pub const _P_OVERLAY = @as(c_int, 2);
pub const _WAIT_CHILD = @as(c_int, 0);
pub const _WAIT_GRANDCHILD = @as(c_int, 1);
pub const _SPAWNV_DEFINED = "";
pub const _INC_STDIO_S = "";
pub const _STDIO_S_DEFINED = "";
pub const L_tmpnam_s = L_tmpnam;
pub const TMP_MAX_S = TMP_MAX;
pub const _WSTDIO_S_DEFINED = "";
pub const Py_ENABLE_SHARED = @as(c_int, 1);
pub const MS_COREDLL = "";
pub const HAVE_DECLSPEC_DLL = "";
pub const PLATFORM = "win32";
pub const SIZEOF_VOID_P = @as(c_int, 8);
pub const SIZEOF_TIME_T = @as(c_int, 8);
pub const SIZEOF_OFF_T = @as(c_int, 4);
pub const SIZEOF_FPOS_T = @as(c_int, 8);
pub const SIZEOF_HKEY = @as(c_int, 8);
pub const SIZEOF_SIZE_T = @as(c_int, 8);
pub const ALIGNOF_SIZE_T = @as(c_int, 8);
pub const ALIGNOF_MAX_ALIGN_T = @as(c_int, 8);
pub const HAVE_LARGEFILE_SUPPORT = "";
pub const SIZEOF_SHORT = @as(c_int, 2);
pub const SIZEOF_INT = @as(c_int, 4);
pub const SIZEOF_LONG = @as(c_int, 4);
pub const ALIGNOF_LONG = @as(c_int, 4);
pub const SIZEOF_LONG_LONG = @as(c_int, 8);
pub const SIZEOF_DOUBLE = @as(c_int, 8);
pub const SIZEOF_FLOAT = @as(c_int, 4);
pub const PY_UINT32_T = u32;
pub const PY_UINT64_T = u64;
pub const PY_INT32_T = i32;
pub const PY_INT64_T = i64;
pub const HAVE_CONIO_H = @as(c_int, 1);
pub const HAVE_DIRECT_H = @as(c_int, 1);
pub const HAVE_DECL_TZNAME = @as(c_int, 1);
pub const HAVE_TZNAME = "";
pub const RETSIGTYPE = anyopaque;
pub const STDC_HEADERS = @as(c_int, 1);
pub const HAVE_PUTENV = "";
pub const HAVE_PROTOTYPES = "";
pub const WITH_DECIMAL_CONTEXTVAR = @as(c_int, 1);
pub const WITH_DOC_STRINGS = @as(c_int, 1);
pub const WITH_PYMALLOC = @as(c_int, 1);
pub const WITH_MIMALLOC = @as(c_int, 1);
pub const WITH_FREELISTS = @as(c_int, 1);
pub const HAVE_DYNAMIC_LOADING = "";
pub const HAVE_FTIME = "";
pub const HAVE_GETPEERNAME = "";
pub const HAVE_GETPID = "";
pub const HAVE_MKTIME = "";
pub const HAVE_SETVBUF = "";
pub const HAVE_SHUTDOWN = @as(c_int, 1);
pub const HAVE_UMASK = @as(c_int, 1);
pub const HAVE_WCSCOLL = @as(c_int, 1);
pub const HAVE_WCSXFRM = @as(c_int, 1);
pub const HAVE_ZLIB_COPY = @as(c_int, 1);
pub const HAVE_ERRNO_H = @as(c_int, 1);
pub const HAVE_FCNTL_H = @as(c_int, 1);
pub const HAVE_PROCESS_H = @as(c_int, 1);
pub const HAVE_SIGNAL_H = @as(c_int, 1);
pub const HAVE_STDDEF_H = @as(c_int, 1);
pub const HAVE_SYS_STAT_H = @as(c_int, 1);
pub const HAVE_SYS_TYPES_H = @as(c_int, 1);
pub const HAVE_WCHAR_H = @as(c_int, 1);
pub const SIZEOF_WCHAR_T = @as(c_int, 2);
pub const SIZEOF__BOOL = @as(c_int, 1);
pub const SIZEOF_PID_T = SIZEOF_INT;
pub const HAVE_LIBSOCKET = @as(c_int, 1);
pub const Py_SOCKET_FD_CAN_BE_GE_FD_SETSIZE = "";
pub const DOUBLE_IS_LITTLE_ENDIAN_IEEE754 = @as(c_int, 1);
pub const HAVE_ERF = @as(c_int, 1);
pub const HAVE_ERFC = @as(c_int, 1);
pub const HAVE_GETHOSTNAME = @as(c_int, 1);
pub const HAVE_GETHOSTBYADDR = @as(c_int, 1);
pub const HAVE_GETHOSTBYNAME = @as(c_int, 1);
pub const HAVE_GETPROTOBYNAME = @as(c_int, 1);
pub const HAVE_GETSERVBYNAME = @as(c_int, 1);
pub const HAVE_GETSERVBYPORT = @as(c_int, 1);
pub const HAVE_INET_PTON = @as(c_int, 1);
pub const HAVE_INET_NTOA = @as(c_int, 1);
pub const HAVE_ACCEPT = @as(c_int, 1);
pub const HAVE_BIND = @as(c_int, 1);
pub const HAVE_CONNECT = @as(c_int, 1);
pub const HAVE_GETSOCKNAME = @as(c_int, 1);
pub const HAVE_LISTEN = @as(c_int, 1);
pub const HAVE_RECVFROM = @as(c_int, 1);
pub const HAVE_SENDTO = @as(c_int, 1);
pub const HAVE_SETSOCKOPT = @as(c_int, 1);
pub const HAVE_SOCKET = @as(c_int, 1);
pub const HAVE_DUP = @as(c_int, 1);
pub const _PYTHONFRAMEWORK = "";
pub const HAVE_X509_VERIFY_PARAM_SET1_HOST = @as(c_int, 1);
pub const PY_MACCONFIG_H = "";
pub const __ASSERT_H_ = "";
pub const static_assert = @compileError("unable to translate C expr: unexpected token '_Static_assert'"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\assert.h:38:9
pub const assert = @compileError("unable to translate macro: undefined identifier `__FILE__`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\assert.h:50:9
pub const __CLANG_INTTYPES_H = "";
pub const _INTTYPES_H_ = "";
pub const __CLANG_STDINT_H = "";
pub const _STDINT_H = "";
pub const __need_wint_t = "";
pub const __need_wchar_t = "";
pub const __STDC_VERSION_STDDEF_H__ = @as(c_long, 202311);
pub const offsetof = @compileError("unable to translate macro: undefined identifier `__builtin_offsetof`"); // C:\zig-x86_64-windows-0.16.0\lib\compiler\aro\include\stddef.h:18:9
pub const INT8_MIN = -@as(c_int, 128);
pub const INT16_MIN = -__helpers.promoteIntLiteral(c_int, 32768, .decimal);
pub const INT32_MIN = -__helpers.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
pub const INT64_MIN = -@as(c_longlong, 9223372036854775807) - @as(c_int, 1);
pub const INT8_MAX = @as(c_int, 127);
pub const INT16_MAX = @as(c_int, 32767);
pub const INT32_MAX = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const INT64_MAX = @as(c_longlong, 9223372036854775807);
pub const UINT8_MAX = @as(c_int, 255);
pub const UINT16_MAX = __helpers.promoteIntLiteral(c_int, 65535, .decimal);
pub const UINT32_MAX = __helpers.promoteIntLiteral(c_uint, 0xffffffff, .hex);
pub const UINT64_MAX = @as(c_ulonglong, 0xffffffffffffffff);
pub const INT_LEAST8_MIN = INT8_MIN;
pub const INT_LEAST16_MIN = INT16_MIN;
pub const INT_LEAST32_MIN = INT32_MIN;
pub const INT_LEAST64_MIN = INT64_MIN;
pub const INT_LEAST8_MAX = INT8_MAX;
pub const INT_LEAST16_MAX = INT16_MAX;
pub const INT_LEAST32_MAX = INT32_MAX;
pub const INT_LEAST64_MAX = INT64_MAX;
pub const UINT_LEAST8_MAX = UINT8_MAX;
pub const UINT_LEAST16_MAX = UINT16_MAX;
pub const UINT_LEAST32_MAX = UINT32_MAX;
pub const UINT_LEAST64_MAX = UINT64_MAX;
pub const INT_FAST8_MIN = INT8_MIN;
pub const INT_FAST16_MIN = INT16_MIN;
pub const INT_FAST32_MIN = INT32_MIN;
pub const INT_FAST64_MIN = INT64_MIN;
pub const INT_FAST8_MAX = INT8_MAX;
pub const INT_FAST16_MAX = INT16_MAX;
pub const INT_FAST32_MAX = INT32_MAX;
pub const INT_FAST64_MAX = INT64_MAX;
pub const UINT_FAST8_MAX = UINT8_MAX;
pub const UINT_FAST16_MAX = UINT16_MAX;
pub const UINT_FAST32_MAX = UINT32_MAX;
pub const UINT_FAST64_MAX = UINT64_MAX;
pub const INTPTR_MIN = INT64_MIN;
pub const INTPTR_MAX = INT64_MAX;
pub const UINTPTR_MAX = UINT64_MAX;
pub const INTMAX_MIN = INT64_MIN;
pub const INTMAX_MAX = INT64_MAX;
pub const UINTMAX_MAX = UINT64_MAX;
pub const PTRDIFF_MIN = INT64_MIN;
pub const PTRDIFF_MAX = INT64_MAX;
pub const SIG_ATOMIC_MIN = INT32_MIN;
pub const SIG_ATOMIC_MAX = INT32_MAX;
pub const SIZE_MAX = UINT64_MAX;
pub const WCHAR_MIN = @as(c_uint, 0);
pub const WCHAR_MAX = @as(c_uint, 0xffff);
pub const WINT_MIN = @as(c_uint, 0);
pub const WINT_MAX = @as(c_uint, 0xffff);
pub inline fn INT8_C(val: anytype) @TypeOf((INT_LEAST8_MAX - INT_LEAST8_MAX) + val) {
    _ = &val;
    return (INT_LEAST8_MAX - INT_LEAST8_MAX) + val;
}
pub inline fn INT16_C(val: anytype) @TypeOf((INT_LEAST16_MAX - INT_LEAST16_MAX) + val) {
    _ = &val;
    return (INT_LEAST16_MAX - INT_LEAST16_MAX) + val;
}
pub inline fn INT32_C(val: anytype) @TypeOf((INT_LEAST32_MAX - INT_LEAST32_MAX) + val) {
    _ = &val;
    return (INT_LEAST32_MAX - INT_LEAST32_MAX) + val;
}
pub const INT64_C = __helpers.LL_SUFFIX;
pub inline fn UINT8_C(val: anytype) @TypeOf(val) {
    _ = &val;
    return val;
}
pub inline fn UINT16_C(val: anytype) @TypeOf(val) {
    _ = &val;
    return val;
}
pub const UINT32_C = __helpers.U_SUFFIX;
pub const UINT64_C = __helpers.ULL_SUFFIX;
pub const INTMAX_C = __helpers.LL_SUFFIX;
pub const UINTMAX_C = __helpers.ULL_SUFFIX;
pub const PRId64 = "lld";
pub const PRIi64 = "lli";
pub const PRIo64 = "llo";
pub const PRIu64 = "llu";
pub const PRIx64 = "llx";
pub const PRIX64 = "llX";
pub const PRId8 = "d";
pub const PRId16 = "d";
pub const PRId32 = "d";
pub const PRIdLEAST8 = "d";
pub const PRIdLEAST16 = "d";
pub const PRIdLEAST32 = "d";
pub const PRIdLEAST64 = PRId64;
pub const PRIdFAST8 = "d";
pub const PRIdFAST16 = "d";
pub const PRIdFAST32 = "d";
pub const PRIdFAST64 = PRId64;
pub const PRIdMAX = PRId64;
pub const PRIi8 = "i";
pub const PRIi16 = "i";
pub const PRIi32 = "i";
pub const PRIiLEAST8 = "i";
pub const PRIiLEAST16 = "i";
pub const PRIiLEAST32 = "i";
pub const PRIiLEAST64 = PRIi64;
pub const PRIiFAST8 = "i";
pub const PRIiFAST16 = "i";
pub const PRIiFAST32 = "i";
pub const PRIiFAST64 = PRIi64;
pub const PRIiMAX = PRIi64;
pub const PRIo8 = "o";
pub const PRIo16 = "o";
pub const PRIo32 = "o";
pub const PRIoLEAST8 = "o";
pub const PRIoLEAST16 = "o";
pub const PRIoLEAST32 = "o";
pub const PRIoLEAST64 = PRIo64;
pub const PRIoFAST8 = "o";
pub const PRIoFAST16 = "o";
pub const PRIoFAST32 = "o";
pub const PRIoFAST64 = PRIo64;
pub const PRIoMAX = PRIo64;
pub const PRIu8 = "u";
pub const PRIu16 = "u";
pub const PRIu32 = "u";
pub const PRIuLEAST8 = "u";
pub const PRIuLEAST16 = "u";
pub const PRIuLEAST32 = "u";
pub const PRIuLEAST64 = PRIu64;
pub const PRIuFAST8 = "u";
pub const PRIuFAST16 = "u";
pub const PRIuFAST32 = "u";
pub const PRIuFAST64 = PRIu64;
pub const PRIuMAX = PRIu64;
pub const PRIx8 = "x";
pub const PRIx16 = "x";
pub const PRIx32 = "x";
pub const PRIxLEAST8 = "x";
pub const PRIxLEAST16 = "x";
pub const PRIxLEAST32 = "x";
pub const PRIxLEAST64 = PRIx64;
pub const PRIxFAST8 = "x";
pub const PRIxFAST16 = "x";
pub const PRIxFAST32 = "x";
pub const PRIxFAST64 = PRIx64;
pub const PRIxMAX = PRIx64;
pub const PRIX8 = "X";
pub const PRIX16 = "X";
pub const PRIX32 = "X";
pub const PRIXLEAST8 = "X";
pub const PRIXLEAST16 = "X";
pub const PRIXLEAST32 = "X";
pub const PRIXLEAST64 = PRIX64;
pub const PRIXFAST8 = "X";
pub const PRIXFAST16 = "X";
pub const PRIXFAST32 = "X";
pub const PRIXFAST64 = PRIX64;
pub const PRIXMAX = PRIX64;
pub const SCNd16 = "hd";
pub const SCNd32 = "d";
pub const SCNd64 = PRId64;
pub const SCNdLEAST16 = "hd";
pub const SCNdLEAST32 = "d";
pub const SCNdLEAST64 = PRId64;
pub const SCNdFAST16 = "hd";
pub const SCNdFAST32 = "d";
pub const SCNdFAST64 = PRId64;
pub const SCNdMAX = PRId64;
pub const SCNi16 = "hi";
pub const SCNi32 = "i";
pub const SCNi64 = PRIi64;
pub const SCNiLEAST16 = "hi";
pub const SCNiLEAST32 = "i";
pub const SCNiLEAST64 = PRIi64;
pub const SCNiFAST16 = "hi";
pub const SCNiFAST32 = "i";
pub const SCNiFAST64 = PRIi64;
pub const SCNiMAX = PRIi64;
pub const SCNo16 = "ho";
pub const SCNo32 = "o";
pub const SCNo64 = PRIo64;
pub const SCNoLEAST16 = "ho";
pub const SCNoLEAST32 = "o";
pub const SCNoLEAST64 = PRIo64;
pub const SCNoFAST16 = "ho";
pub const SCNoFAST32 = "o";
pub const SCNoFAST64 = PRIo64;
pub const SCNoMAX = PRIo64;
pub const SCNx16 = "hx";
pub const SCNx32 = "x";
pub const SCNx64 = PRIx64;
pub const SCNxLEAST16 = "hx";
pub const SCNxLEAST32 = "x";
pub const SCNxLEAST64 = PRIx64;
pub const SCNxFAST16 = "hx";
pub const SCNxFAST32 = "x";
pub const SCNxFAST64 = PRIx64;
pub const SCNxMAX = PRIx64;
pub const SCNu16 = "hu";
pub const SCNu32 = "u";
pub const SCNu64 = PRIu64;
pub const SCNuLEAST16 = "hu";
pub const SCNuLEAST32 = "u";
pub const SCNuLEAST64 = PRIu64;
pub const SCNuFAST16 = "hu";
pub const SCNuFAST32 = "u";
pub const SCNuFAST64 = PRIu64;
pub const SCNuMAX = PRIu64;
pub const PRIdPTR = PRId64;
pub const PRIiPTR = PRIi64;
pub const PRIoPTR = PRIo64;
pub const PRIuPTR = PRIu64;
pub const PRIxPTR = PRIx64;
pub const PRIXPTR = PRIX64;
pub const SCNdPTR = PRId64;
pub const SCNiPTR = PRIi64;
pub const SCNoPTR = PRIo64;
pub const SCNxPTR = PRIx64;
pub const SCNuPTR = PRIu64;
pub const SCNd8 = "hhd";
pub const SCNdLEAST8 = "hhd";
pub const SCNdFAST8 = "hhd";
pub const SCNi8 = "hhi";
pub const SCNiLEAST8 = "hhi";
pub const SCNiFAST8 = "hhi";
pub const SCNo8 = "hho";
pub const SCNoLEAST8 = "hho";
pub const SCNoFAST8 = "hho";
pub const SCNx8 = "hhx";
pub const SCNxLEAST8 = "hhx";
pub const SCNxFAST8 = "hhx";
pub const SCNu8 = "hhu";
pub const SCNuLEAST8 = "hhu";
pub const SCNuFAST8 = "hhu";
pub const _GCC_LIMITS_H_ = "";
pub const __CLANG_LIMITS_H = "";
pub const _INC_LIMITS = "";
pub const PATH_MAX = @as(c_int, 260);
pub const MB_LEN_MAX = @as(c_int, 5);
pub const _I8_MIN = -@as(c_int, 127) - @as(c_int, 1);
pub const _I8_MAX = @as(c_int, 127);
pub const _UI8_MAX = @as(c_uint, 0xff);
pub const _I16_MIN = -@as(c_int, 32767) - @as(c_int, 1);
pub const _I16_MAX = @as(c_int, 32767);
pub const _UI16_MAX = @as(c_uint, 0xffff);
pub const _I32_MIN = -__helpers.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
pub const _I32_MAX = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const _UI32_MAX = __helpers.promoteIntLiteral(c_uint, 0xffffffff, .hex);
pub const _I64_MIN = -@as(c_longlong, 9223372036854775807) - @as(c_int, 1);
pub const _I64_MAX = @as(c_longlong, 9223372036854775807);
pub const _UI64_MAX = @as(c_ulonglong, 0xffffffffffffffff);
pub const SSIZE_MAX = _I64_MAX;
pub const LONG_LONG_MAX = __LONG_LONG_MAX__;
pub const LONG_LONG_MIN = -__LONG_LONG_MAX__ - @as(c_longlong, 1);
pub const ULONG_LONG_MAX = (__LONG_LONG_MAX__ * @as(c_ulonglong, 2)) + @as(c_ulonglong, 1);
pub const SCHAR_MAX = __SCHAR_MAX__;
pub const SHRT_MAX = __SHRT_MAX__;
pub const INT_MAX = __INT_MAX__;
pub const LONG_MAX = __LONG_MAX__;
pub const SCHAR_MIN = -__SCHAR_MAX__ - @as(c_int, 1);
pub const SHRT_MIN = -__SHRT_MAX__ - @as(c_int, 1);
pub const INT_MIN = -__INT_MAX__ - @as(c_int, 1);
pub const LONG_MIN = -__LONG_MAX__ - @as(c_long, 1);
pub const UCHAR_MAX = (__SCHAR_MAX__ * @as(c_int, 2)) + @as(c_int, 1);
pub const USHRT_MAX = (__SHRT_MAX__ * @as(c_int, 2)) + @as(c_int, 1);
pub const UINT_MAX = (__INT_MAX__ * @as(c_uint, 2)) + @as(c_uint, 1);
pub const ULONG_MAX = (__LONG_MAX__ * @as(c_ulong, 2)) + @as(c_ulong, 1);
pub const CHAR_BIT = __CHAR_BIT__;
pub const CHAR_MIN = SCHAR_MIN;
pub const CHAR_MAX = __SCHAR_MAX__;
pub const LLONG_MIN = -__LONG_LONG_MAX__ - @as(c_longlong, 1);
pub const LLONG_MAX = __LONG_LONG_MAX__;
pub const ULLONG_MAX = (__LONG_LONG_MAX__ * @as(c_ulonglong, 2)) + @as(c_ulonglong, 1);
pub const _MATH_H_ = "";
pub const _DOMAIN = @as(c_int, 1);
pub const _SING = @as(c_int, 2);
pub const _OVERFLOW = @as(c_int, 3);
pub const _UNDERFLOW = @as(c_int, 4);
pub const _TLOSS = @as(c_int, 5);
pub const _PLOSS = @as(c_int, 6);
pub const DOMAIN = _DOMAIN;
pub const SING = _SING;
pub const OVERFLOW = _OVERFLOW;
pub const UNDERFLOW = _UNDERFLOW;
pub const TLOSS = _TLOSS;
pub const PLOSS = _PLOSS;
pub const M_E = @as(f64, 2.7182818284590452354);
pub const M_LOG2E = @as(f64, 1.4426950408889634074);
pub const M_LOG10E = @as(f64, 0.43429448190325182765);
pub const M_LN2 = @as(f64, 0.69314718055994530942);
pub const M_LN10 = @as(f64, 2.30258509299404568402);
pub const M_PI = @as(f64, 3.14159265358979323846);
pub const M_PI_2 = @as(f64, 1.57079632679489661923);
pub const M_PI_4 = @as(f64, 0.78539816339744830962);
pub const M_1_PI = @as(f64, 0.31830988618379067154);
pub const M_2_PI = @as(f64, 0.63661977236758134308);
pub const M_2_SQRTPI = @as(f64, 1.12837916709551257390);
pub const M_SQRT2 = @as(f64, 1.41421356237309504880);
pub const M_SQRT1_2 = @as(f64, 0.70710678118654752440);
pub const __MINGW_FPCLASS_DEFINED = @as(c_int, 1);
pub const _FPCLASS_SNAN = @as(c_int, 0x0001);
pub const _FPCLASS_QNAN = @as(c_int, 0x0002);
pub const _FPCLASS_NINF = @as(c_int, 0x0004);
pub const _FPCLASS_NN = @as(c_int, 0x0008);
pub const _FPCLASS_ND = @as(c_int, 0x0010);
pub const _FPCLASS_NZ = @as(c_int, 0x0020);
pub const _FPCLASS_PZ = @as(c_int, 0x0040);
pub const _FPCLASS_PD = @as(c_int, 0x0080);
pub const _FPCLASS_PN = @as(c_int, 0x0100);
pub const _FPCLASS_PINF = @as(c_int, 0x0200);
pub const __mingw_types_compatible_p = @compileError("unable to translate macro: undefined identifier `__builtin_types_compatible_p`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\math.h:95:9
pub const __mingw_choose_expr = @compileError("unable to translate macro: undefined identifier `__builtin_choose_expr`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\math.h:103:9
pub const __MINGW_SOFTMATH = "";
pub const _HUGE = __MINGW_IMP_SYMBOL(_HUGE).*;
pub const HUGE_VAL = @compileError("unable to translate macro: undefined identifier `__builtin_huge_val`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\math.h:149:9
pub const _EXCEPTION_DEFINED = "";
pub const _CRT_ABS_DEFINED = "";
pub const _CRT_ATOF_DEFINED = "";
pub const EDOM = @as(c_int, 33);
pub const ERANGE = @as(c_int, 34);
pub const _COMPLEX_DEFINED = "";
pub const _CRT_MATHERR_DEFINED = "";
pub const _SIGN_DEFINED = "";
pub const FP_SNAN = _FPCLASS_SNAN;
pub const FP_QNAN = _FPCLASS_QNAN;
pub const FP_NINF = _FPCLASS_NINF;
pub const FP_PINF = _FPCLASS_PINF;
pub const FP_NDENORM = _FPCLASS_ND;
pub const FP_PDENORM = _FPCLASS_PD;
pub const FP_NZERO = _FPCLASS_NZ;
pub const FP_PZERO = _FPCLASS_PZ;
pub const FP_NNORM = _FPCLASS_NN;
pub const FP_PNORM = _FPCLASS_PN;
pub const HUGE_VALF = __builtin.huge_valf();
pub const HUGE_VALL = @compileError("unable to translate macro: undefined identifier `__builtin_huge_vall`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\math.h:342:9
pub const INFINITY = __builtin.inff();
pub const NAN = __builtin.nanf("");
pub const FP_NAN = @as(c_int, 0x0100);
pub const FP_NORMAL = @as(c_int, 0x0400);
pub const FP_INFINITE = FP_NAN | FP_NORMAL;
pub const FP_ZERO = @as(c_int, 0x4000);
pub const FP_SUBNORMAL = FP_NORMAL | FP_ZERO;
pub inline fn __dfp_expansion(__call: anytype, __fin: anytype, x: anytype) @TypeOf(__fin) {
    _ = &__call;
    _ = &__fin;
    _ = &x;
    return __fin;
}
pub const fpclassify = @compileError("unable to translate macro: undefined identifier `__builtin_trap`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\math.h:484:9
pub inline fn isfinite(x: anytype) @TypeOf((fpclassify(x) & FP_NAN) == @as(c_int, 0)) {
    _ = &x;
    return (fpclassify(x) & FP_NAN) == @as(c_int, 0);
}
pub inline fn isinf(x: anytype) @TypeOf(fpclassify(x) == FP_INFINITE) {
    _ = &x;
    return fpclassify(x) == FP_INFINITE;
}
pub const isnan = @compileError("unable to translate macro: undefined identifier `__builtin_trap`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\math.h:578:9
pub inline fn isnormal(x: anytype) @TypeOf(fpclassify(x) == FP_NORMAL) {
    _ = &x;
    return fpclassify(x) == FP_NORMAL;
}
pub const signbit = @compileError("unable to translate macro: undefined identifier `__builtin_trap`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\math.h:638:9
pub const FP_ILOGB0 = __helpers.cast(c_int, __helpers.promoteIntLiteral(c_int, 0x80000000, .hex));
pub const FP_ILOGBNAN = __helpers.cast(c_int, __helpers.promoteIntLiteral(c_int, 0x7fffffff, .hex));
pub inline fn _nan() @TypeOf(nan("")) {
    return nan("");
}
pub inline fn _nanf() @TypeOf(nanf("")) {
    return nanf("");
}
pub inline fn _nanl() @TypeOf(nanl("")) {
    return nanl("");
}
pub const isgreater = @compileError("unable to translate macro: undefined identifier `__builtin_isgreater`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\math.h:974:9
pub const isgreaterequal = @compileError("unable to translate macro: undefined identifier `__builtin_isgreaterequal`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\math.h:975:9
pub const isless = @compileError("unable to translate macro: undefined identifier `__builtin_isless`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\math.h:976:9
pub const islessequal = @compileError("unable to translate macro: undefined identifier `__builtin_islessequal`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\math.h:977:9
pub const islessgreater = @compileError("unable to translate macro: undefined identifier `__builtin_islessgreater`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\math.h:978:9
pub const isunordered = @compileError("unable to translate macro: undefined identifier `__builtin_isunordered`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\math.h:979:9
pub const _copysignl = copysignl;
pub const _hypotl = hypotl;
pub const matherr = _matherr;
pub const HUGE = _HUGE;
pub const __STDC_VERSION_STDARG_H__ = @as(c_int, 0);
pub const va_start = @compileError("unable to translate macro: undefined identifier `__builtin_va_start`"); // C:\zig-x86_64-windows-0.16.0\lib\compiler\aro\include\stdarg.h:12:9
pub const va_end = @compileError("unable to translate macro: undefined identifier `__builtin_va_end`"); // C:\zig-x86_64-windows-0.16.0\lib\compiler\aro\include\stdarg.h:14:9
pub const va_arg = @compileError("unable to translate macro: undefined identifier `__builtin_va_arg`"); // C:\zig-x86_64-windows-0.16.0\lib\compiler\aro\include\stdarg.h:15:9
pub const __va_copy = @compileError("unable to translate macro: undefined identifier `__builtin_va_copy`"); // C:\zig-x86_64-windows-0.16.0\lib\compiler\aro\include\stdarg.h:18:9
pub const va_copy = @compileError("unable to translate macro: undefined identifier `__builtin_va_copy`"); // C:\zig-x86_64-windows-0.16.0\lib\compiler\aro\include\stdarg.h:22:9
pub const _INC_WCHAR = "";
pub const _INC_CORECRT_WSTDLIB = "";
pub const _INC_CORECRT_WCTYPE = "";
pub const _CRT_CTYPEDATA_DEFINED = "";
pub const __PCTYPE_FUNC = __pctype_func();
pub const _pctype = __pctype_func();
pub const _CRT_WCTYPEDATA_DEFINED = "";
pub const _wctype = __MINGW_IMP_SYMBOL(_wctype).*;
pub const _pwctype = __pwctype_func();
pub const _UPPER = @as(c_int, 0x1);
pub const _LOWER = @as(c_int, 0x2);
pub const _DIGIT = @as(c_int, 0x4);
pub const _SPACE = @as(c_int, 0x8);
pub const _PUNCT = @as(c_int, 0x10);
pub const _CONTROL = @as(c_int, 0x20);
pub const _BLANK = @as(c_int, 0x40);
pub const _HEX = @as(c_int, 0x80);
pub const _LEADBYTE = __helpers.promoteIntLiteral(c_int, 0x8000, .hex);
pub const _ALPHA = (@as(c_int, 0x0100) | _UPPER) | _LOWER;
pub const _WCTYPE_DEFINED = "";
pub const _WCTYPE_INLINE_DEFINED = "";
pub const _WDIRECT_DEFINED = "";
pub const _WLOCALE_DEFINED = "";
pub const _WEXEC_DEFINED = "";
pub const _CRT_WSYSTEM_DEFINED = "";
pub const _INO_T_DEFINED = "";
pub const _DEV_T_DEFINED = "";
pub const __stat64 = _stat64;
pub const _fstat = _fstat64i32;
pub const _fstati64 = _fstat64;
pub const _stat = _stat64i32;
pub const _stati64 = _stat64;
pub const _wstat = _wstat64i32;
pub const _wstati64 = _wstat64;
pub const _STAT_DEFINED = "";
pub const _WSTAT_DEFINED = "";
pub const _WCONIO_DEFINED = "";
pub const _WSTDLIB_DEFINED = "";
pub const _WSTDLIBP_DEFINED = "";
pub const _TM_DEFINED = "";
pub const _WTIME_DEFINED = "";
pub const _INC_WTIME_INL = "";
pub const _INC_WTIME_S_INL = "";
pub const _INC_WCHAR_S = "";
pub const _WIO_S_DEFINED = "";
pub const _WCONIO_S_DEFINED = "";
pub const _WTIME_S_DEFINED = "";
pub const _INC_TYPES = "";
pub const _PID_T_ = "";
pub const _MODE_T_ = "";
pub const _TIMESPEC_DEFINED = "";
pub const _SIGSET_T_ = "";
pub const _INC_ERRNO = "";
pub const _CRT_ERRNO_DEFINED = "";
pub const errno = _errno().*;
pub const EPERM = @as(c_int, 1);
pub const ENOENT = @as(c_int, 2);
pub const ENOFILE = ENOENT;
pub const ESRCH = @as(c_int, 3);
pub const EINTR = @as(c_int, 4);
pub const EIO = @as(c_int, 5);
pub const ENXIO = @as(c_int, 6);
pub const E2BIG = @as(c_int, 7);
pub const ENOEXEC = @as(c_int, 8);
pub const EBADF = @as(c_int, 9);
pub const ECHILD = @as(c_int, 10);
pub const EAGAIN = @as(c_int, 11);
pub const ENOMEM = @as(c_int, 12);
pub const EACCES = @as(c_int, 13);
pub const EFAULT = @as(c_int, 14);
pub const EBUSY = @as(c_int, 16);
pub const EEXIST = @as(c_int, 17);
pub const EXDEV = @as(c_int, 18);
pub const ENODEV = @as(c_int, 19);
pub const ENOTDIR = @as(c_int, 20);
pub const EISDIR = @as(c_int, 21);
pub const ENFILE = @as(c_int, 23);
pub const EMFILE = @as(c_int, 24);
pub const ENOTTY = @as(c_int, 25);
pub const EFBIG = @as(c_int, 27);
pub const ENOSPC = @as(c_int, 28);
pub const ESPIPE = @as(c_int, 29);
pub const EROFS = @as(c_int, 30);
pub const EMLINK = @as(c_int, 31);
pub const EPIPE = @as(c_int, 32);
pub const EDEADLK = @as(c_int, 36);
pub const ENAMETOOLONG = @as(c_int, 38);
pub const ENOLCK = @as(c_int, 39);
pub const ENOSYS = @as(c_int, 40);
pub const ENOTEMPTY = @as(c_int, 41);
pub const _SECURECRT_ERRCODE_VALUES_DEFINED = "";
pub const EINVAL = @as(c_int, 22);
pub const EILSEQ = @as(c_int, 42);
pub const STRUNCATE = @as(c_int, 80);
pub const EDEADLOCK = EDEADLK;
pub const ENOTSUP = @as(c_int, 129);
pub const EAFNOSUPPORT = @as(c_int, 102);
pub const EADDRINUSE = @as(c_int, 100);
pub const EADDRNOTAVAIL = @as(c_int, 101);
pub const EISCONN = @as(c_int, 113);
pub const ENOBUFS = @as(c_int, 119);
pub const ECONNABORTED = @as(c_int, 106);
pub const EALREADY = @as(c_int, 103);
pub const ECONNREFUSED = @as(c_int, 107);
pub const ECONNRESET = @as(c_int, 108);
pub const EDESTADDRREQ = @as(c_int, 109);
pub const EHOSTUNREACH = @as(c_int, 110);
pub const EMSGSIZE = @as(c_int, 115);
pub const ENETDOWN = @as(c_int, 116);
pub const ENETRESET = @as(c_int, 117);
pub const ENETUNREACH = @as(c_int, 118);
pub const ENOPROTOOPT = @as(c_int, 123);
pub const ENOTSOCK = @as(c_int, 128);
pub const ENOTCONN = @as(c_int, 126);
pub const ECANCELED = @as(c_int, 105);
pub const EINPROGRESS = @as(c_int, 112);
pub const EOPNOTSUPP = @as(c_int, 130);
pub const EWOULDBLOCK = @as(c_int, 140);
pub const EOWNERDEAD = @as(c_int, 133);
pub const EPROTO = @as(c_int, 134);
pub const EPROTONOSUPPORT = @as(c_int, 135);
pub const EBADMSG = @as(c_int, 104);
pub const EIDRM = @as(c_int, 111);
pub const ENODATA = @as(c_int, 120);
pub const ENOLINK = @as(c_int, 121);
pub const ENOMSG = @as(c_int, 122);
pub const ENOSR = @as(c_int, 124);
pub const ENOSTR = @as(c_int, 125);
pub const ENOTRECOVERABLE = @as(c_int, 127);
pub const ETIME = @as(c_int, 137);
pub const ETXTBSY = @as(c_int, 139);
pub const ETIMEDOUT = @as(c_int, 138);
pub const ELOOP = @as(c_int, 114);
pub const EPROTOTYPE = @as(c_int, 136);
pub const EOVERFLOW = @as(c_int, 132);
pub const _INC_STDLIB = "";
pub const EXIT_SUCCESS = @as(c_int, 0);
pub const EXIT_FAILURE = @as(c_int, 1);
pub const _ONEXIT_T_DEFINED = "";
pub const onexit_t = _onexit_t;
pub const _DIV_T_DEFINED = "";
pub const _CRT_DOUBLE_DEC = "";
pub inline fn _PTR_LD(x: anytype) [*c]u8 {
    _ = &x;
    return __helpers.cast([*c]u8, &x.*.ld);
}
pub const RAND_MAX = @as(c_int, 0x7fff);
pub const MB_CUR_MAX = ___mb_cur_max_func();
pub const __mb_cur_max = ___mb_cur_max_func();
pub inline fn __max(a: anytype, b: anytype) @TypeOf(if (__helpers.cast(bool, a > b)) a else b) {
    _ = &a;
    _ = &b;
    return if (__helpers.cast(bool, a > b)) a else b;
}
pub inline fn __min(a: anytype, b: anytype) @TypeOf(if (__helpers.cast(bool, a < b)) a else b) {
    _ = &a;
    _ = &b;
    return if (__helpers.cast(bool, a < b)) a else b;
}
pub const _MAX_PATH = @as(c_int, 260);
pub const _MAX_DRIVE = @as(c_int, 3);
pub const _MAX_DIR = @as(c_int, 256);
pub const _MAX_FNAME = @as(c_int, 256);
pub const _MAX_EXT = @as(c_int, 256);
pub const _OUT_TO_DEFAULT = @as(c_int, 0);
pub const _OUT_TO_STDERR = @as(c_int, 1);
pub const _OUT_TO_MSGBOX = @as(c_int, 2);
pub const _REPORT_ERRMODE = @as(c_int, 3);
pub const _WRITE_ABORT_MSG = @as(c_int, 0x1);
pub const _CALL_REPORTFAULT = @as(c_int, 0x2);
pub const _MAX_ENV = @as(c_int, 32767);
pub const _doserrno = __doserrno().*;
pub const _sys_nerr = __sys_nerr().*;
pub const _sys_errlist = __sys_errlist();
pub const _fmode = __p__fmode().*;
pub const __argc = __p___argc().*;
pub const __argv = __p___argv().*;
pub const __wargv = __p___wargv().*;
pub const _pgmptr = __p__pgmptr().*;
pub const _wpgmptr = __p__wpgmptr().*;
pub const _environ = __p__environ().*;
pub const _wenviron = __p__wenviron().*;
pub const _osplatform = __p__osplatform().*;
pub const _osver = __p__osver().*;
pub const _winver = __p__winver().*;
pub const _winmajor = __p__winmajor().*;
pub const _winminor = __p__winminor().*;
pub inline fn _countof(_Array: anytype) @TypeOf(__helpers.div(__helpers.sizeof(_Array), __helpers.sizeof(_Array[@as(usize, @intCast(@as(c_int, 0)))]))) {
    _ = &_Array;
    return __helpers.div(__helpers.sizeof(_Array), __helpers.sizeof(_Array[@as(usize, @intCast(@as(c_int, 0)))]));
}
pub const _CRT_TERMINATE_DEFINED = "";
pub const _CRT_ALGO_DEFINED = "";
pub const _CRT_SYSTEM_DEFINED = "";
pub const _CRT_ALLOCATION_DEFINED = "";
pub const _CVTBUFSIZE = @as(c_int, 309) + @as(c_int, 40);
pub const sys_errlist = _sys_errlist;
pub const sys_nerr = _sys_nerr;
pub const environ = _environ;
pub const _CRT_SWAB_DEFINED = "";
pub const _INC_STDLIB_S = "";
pub const _QSORT_S_DEFINED = "";
pub const _MALLOC_H_ = "";
pub const _HEAP_MAXREQ = __helpers.promoteIntLiteral(c_int, 0xFFFFFFFFFFFFFFE0, .hex);
pub const _STATIC_ASSERT = @compileError("unable to translate C expr: unexpected token '_Static_assert'"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\malloc.h:29:9
pub const _HEAPEMPTY = -@as(c_int, 1);
pub const _HEAPOK = -@as(c_int, 2);
pub const _HEAPBADBEGIN = -@as(c_int, 3);
pub const _HEAPBADNODE = -@as(c_int, 4);
pub const _HEAPEND = -@as(c_int, 5);
pub const _HEAPBADPTR = -@as(c_int, 6);
pub const _FREEENTRY = @as(c_int, 0);
pub const _USEDENTRY = @as(c_int, 1);
pub const _HEAPINFO_DEFINED = "";
pub const _amblksiz = __p__amblksiz().*;
pub const __MM_MALLOC_H = "";
pub const _MAX_WAIT_MALLOC_CRT = __helpers.promoteIntLiteral(c_int, 60000, .decimal);
pub const _alloca = @compileError("unable to translate macro: undefined identifier `__builtin_alloca`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\malloc.h:163:9
pub const _ALLOCA_S_THRESHOLD = @as(c_int, 1024);
pub const _ALLOCA_S_STACK_MARKER = __helpers.promoteIntLiteral(c_int, 0xCCCC, .hex);
pub const _ALLOCA_S_HEAP_MARKER = __helpers.promoteIntLiteral(c_int, 0xDDDD, .hex);
pub const _ALLOCA_S_MARKER_SIZE = @as(c_int, 16);
pub inline fn _malloca(size: anytype) @TypeOf(if (__helpers.cast(bool, (size + _ALLOCA_S_MARKER_SIZE) <= _ALLOCA_S_THRESHOLD)) _MarkAllocaS(_alloca(size + _ALLOCA_S_MARKER_SIZE), _ALLOCA_S_STACK_MARKER) else _MarkAllocaS(malloc(size + _ALLOCA_S_MARKER_SIZE), _ALLOCA_S_HEAP_MARKER)) {
    _ = &size;
    return if (__helpers.cast(bool, (size + _ALLOCA_S_MARKER_SIZE) <= _ALLOCA_S_THRESHOLD)) _MarkAllocaS(_alloca(size + _ALLOCA_S_MARKER_SIZE), _ALLOCA_S_STACK_MARKER) else _MarkAllocaS(malloc(size + _ALLOCA_S_MARKER_SIZE), _ALLOCA_S_HEAP_MARKER);
}
pub const _FREEA_INLINE = "";
pub const alloca = @compileError("unable to translate macro: undefined identifier `__builtin_alloca`"); // C:\zig-x86_64-windows-0.16.0\lib\libc\include\any-windows-any\malloc.h:238:9
pub const _INC_CTYPE = "";
pub const _CTYPE_DEFINED = "";
pub inline fn __chvalidchk(a: anytype, b: anytype) @TypeOf(__PCTYPE_FUNC[@as(usize, @intCast(__helpers.cast(u8, a)))] & b) {
    _ = &a;
    _ = &b;
    return __PCTYPE_FUNC[@as(usize, @intCast(__helpers.cast(u8, a)))] & b;
}
pub inline fn _chvalidchk_l(_Char: anytype, _Flag: anytype, _Locale: anytype) @TypeOf(if (__helpers.cast(bool, !(_Locale != 0))) __chvalidchk(_Char, _Flag) else __helpers.cast(_locale_t, _Locale).*.locinfo.*._locale_pctype[@as(usize, @intCast(__helpers.cast(u8, _Char)))] & _Flag) {
    _ = &_Char;
    _ = &_Flag;
    _ = &_Locale;
    return if (__helpers.cast(bool, !(_Locale != 0))) __chvalidchk(_Char, _Flag) else __helpers.cast(_locale_t, _Locale).*.locinfo.*._locale_pctype[@as(usize, @intCast(__helpers.cast(u8, _Char)))] & _Flag;
}
pub inline fn _ischartype_l(_Char: anytype, _Flag: anytype, _Locale: anytype) @TypeOf(if (__helpers.cast(bool, (_Locale != NULL) and (__helpers.cast(_locale_t, _Locale).*.locinfo.*._locale_mb_cur_max > @as(c_int, 1)))) _isctype_l(_Char, _Flag, _Locale) else _chvalidchk_l(_Char, _Flag, _Locale)) {
    _ = &_Char;
    _ = &_Flag;
    _ = &_Locale;
    return if (__helpers.cast(bool, (_Locale != NULL) and (__helpers.cast(_locale_t, _Locale).*.locinfo.*._locale_mb_cur_max > @as(c_int, 1)))) _isctype_l(_Char, _Flag, _Locale) else _chvalidchk_l(_Char, _Flag, _Locale);
}
pub inline fn _iscsymf_l(_c: anytype, _p: anytype) @TypeOf((_isalpha_l(_c, _p) != 0) or (_c == '_')) {
    _ = &_c;
    _ = &_p;
    return (_isalpha_l(_c, _p) != 0) or (_c == '_');
}
pub inline fn _iscsym_l(_c: anytype, _p: anytype) @TypeOf((_isalnum_l(_c, _p) != 0) or (_c == '_')) {
    _ = &_c;
    _ = &_p;
    return (_isalnum_l(_c, _p) != 0) or (_c == '_');
}
pub const isascii = __isascii;
pub const toascii = __toascii;
pub const iscsymf = __iscsymf;
pub const iscsym = __iscsym;
pub const Py_PYPORT_H = "";
pub const _Py_STATIC_CAST = __helpers.CAST_OR_CALL;
pub const _Py_CAST = __helpers.CAST_OR_CALL;
pub const _Py_NULL = NULL;
pub const HAVE_LONG_LONG = @as(c_int, 1);
pub const PYLONG_BITS_IN_DIGIT = @as(c_int, 30);
pub const PY_SSIZE_T_MAX = INTPTR_MAX;
pub const PY_SSIZE_T_MIN = -PY_SSIZE_T_MAX - @as(c_int, 1);
pub const SIZEOF_PY_HASH_T = SIZEOF_SIZE_T;
pub const SIZEOF_PY_UHASH_T = SIZEOF_SIZE_T;
pub const PY_SIZE_MAX = SIZE_MAX;
pub const PY_FORMAT_SIZE_T = "z";
pub const Py_LOCAL = @compileError("unable to translate C expr: unexpected token 'static'"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\pyport.h:179:11
pub const Py_LOCAL_INLINE = @compileError("unable to translate C expr: unexpected token 'static'"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\pyport.h:180:11
pub const Py_MEMCPY = memcpy;
pub inline fn Py_ARITHMETIC_RIGHT_SHIFT(TYPE: anytype, I: anytype, J: anytype) @TypeOf(I >> J) {
    _ = &TYPE;
    _ = &I;
    _ = &J;
    return I >> J;
}
pub inline fn Py_FORCE_EXPANSION(X: anytype) @TypeOf(X) {
    _ = &X;
    return X;
}
pub inline fn Py_SAFE_DOWNCAST(VALUE: anytype, WIDE: anytype, NARROW: anytype) @TypeOf(_Py_STATIC_CAST(NARROW, VALUE)) {
    _ = &VALUE;
    _ = &WIDE;
    _ = &NARROW;
    return _Py_STATIC_CAST(NARROW, VALUE);
}
pub const Py_DEPRECATED = @compileError("unable to translate macro: undefined identifier `__deprecated__`"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\pyport.h:251:9
pub inline fn _Py_DEPRECATED_EXTERNALLY(version: anytype) @TypeOf(Py_DEPRECATED(version)) {
    _ = &version;
    return Py_DEPRECATED(version);
}
pub const _Py_COMP_DIAG_PUSH = @compileError("unable to translate macro: undefined identifier `_Pragma`"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\pyport.h:275:9
pub const _Py_COMP_DIAG_IGNORE_DEPR_DECLS = @compileError("unable to translate macro: undefined identifier `_Pragma`"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\pyport.h:276:9
pub const _Py_COMP_DIAG_POP = @compileError("unable to translate macro: undefined identifier `_Pragma`"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\pyport.h:278:9
pub const _Py_HOT_FUNCTION = @compileError("unable to translate macro: undefined identifier `hot`"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\pyport.h:306:9
pub const Py_ALWAYS_INLINE = @compileError("unable to translate macro: undefined identifier `always_inline`"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\pyport.h:335:11
pub const Py_NO_INLINE = @compileError("unable to translate macro: undefined identifier `noinline`"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\pyport.h:351:11
pub const Py_EXPORTS_H = "";
pub const Py_IMPORTED_SYMBOL = @compileError("unable to translate macro: undefined identifier `dllimport`"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\exports.h:29:17
pub const Py_EXPORTED_SYMBOL = @compileError("unable to translate macro: undefined identifier `dllexport`"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\exports.h:30:17
pub const Py_LOCAL_SYMBOL = "";
pub inline fn PyAPI_FUNC(RTYPE: anytype) @TypeOf(Py_IMPORTED_SYMBOL ++ RTYPE) {
    _ = &RTYPE;
    return Py_IMPORTED_SYMBOL ++ RTYPE;
}
pub const PyAPI_DATA = @compileError("unable to translate C expr: unexpected token 'extern'"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\exports.h:81:32
pub const PyMODINIT_FUNC = [*c](Py_EXPORTED_SYMBOL ++ PyObject);
pub const Py_GCC_ATTRIBUTE = @compileError("unable to translate C expr: unexpected token '__attribute__'"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\pyport.h:413:9
pub const Py_ALIGNED = @compileError("unable to translate macro: undefined identifier `aligned`"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\pyport.h:420:9
pub const Py_LL = __helpers.LL_SUFFIX;
pub const Py_ULL = @compileError("unable to translate macro: undefined identifier `U`"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\pyport.h:437:9
pub const Py_VA_COPY = va_copy;
pub const PY_BIG_ENDIAN = @as(c_int, 0);
pub const PY_LITTLE_ENDIAN = @as(c_int, 1);
pub const PY_DWORD_MAX = __helpers.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const Py_CAN_START_THREADS = @as(c_int, 1);
pub const _Py_NO_RETURN = @compileError("unable to translate macro: undefined identifier `__noreturn__`"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\pyport.h:525:11
pub inline fn _Py__has_builtin(x: anytype) @TypeOf(__builtin.has_builtin(x)) {
    _ = &x;
    return __builtin.has_builtin(x);
}
pub const _Py_TYPEOF = @compileError("unable to translate C expr: unexpected token '__typeof__'"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\pyport.h:550:11
pub const PY_CXX_CONST = "";
pub const Py_PYMACRO_H = "";
pub inline fn Py_MIN(x: anytype, y: anytype) @TypeOf(if (__helpers.cast(bool, x > y)) y else x) {
    _ = &x;
    _ = &y;
    return if (__helpers.cast(bool, x > y)) y else x;
}
pub inline fn Py_MAX(x: anytype, y: anytype) @TypeOf(if (__helpers.cast(bool, x > y)) x else y) {
    _ = &x;
    _ = &y;
    return if (__helpers.cast(bool, x > y)) x else y;
}
pub inline fn Py_ABS(x: anytype) @TypeOf(if (__helpers.cast(bool, x < @as(c_int, 0))) -x else x) {
    _ = &x;
    return if (__helpers.cast(bool, x < @as(c_int, 0))) -x else x;
}
pub const _Py_XSTRINGIFY = @compileError("unable to translate C expr: unexpected token ''"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\pymacro.h:35:9
pub inline fn Py_STRINGIFY(x: anytype) @TypeOf(_Py_XSTRINGIFY(x)) {
    _ = &x;
    return _Py_XSTRINGIFY(x);
}
pub const Py_MEMBER_SIZE = @compileError("unable to translate C expr: expected ')' instead got 'a number'"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\pymacro.h:44:9
pub inline fn Py_CHARMASK(c: anytype) u8 {
    _ = &c;
    return __helpers.cast(u8, c & @as(c_int, 0xff));
}
pub const Py_BUILD_ASSERT_EXPR = @compileError("unable to translate macro: undefined identifier `dummy`"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\pymacro.h:51:11
pub const Py_BUILD_ASSERT = @compileError("unable to translate C expr: unexpected token 'do'"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\pymacro.h:75:11
pub const Py_ARRAY_LENGTH = @compileError("unable to translate macro: undefined identifier `__builtin_types_compatible_p`"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\pymacro.h:99:9
pub const PyDoc_VAR = @compileError("unable to translate C expr: unexpected token 'static'"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\pymacro.h:110:9
pub const PyDoc_STRVAR = @compileError("unable to translate C expr: unexpected token '='"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\pymacro.h:111:9
pub inline fn PyDoc_STR(str: anytype) @TypeOf(str) {
    _ = &str;
    return str;
}
pub inline fn _Py_SIZE_ROUND_DOWN(n: anytype, a: anytype) @TypeOf(__helpers.cast(usize, n) & ~__helpers.cast(usize, a - @as(c_int, 1))) {
    _ = &n;
    _ = &a;
    return __helpers.cast(usize, n) & ~__helpers.cast(usize, a - @as(c_int, 1));
}
pub inline fn _Py_SIZE_ROUND_UP(n: anytype, a: anytype) @TypeOf((__helpers.cast(usize, n) + __helpers.cast(usize, a - @as(c_int, 1))) & ~__helpers.cast(usize, a - @as(c_int, 1))) {
    _ = &n;
    _ = &a;
    return (__helpers.cast(usize, n) + __helpers.cast(usize, a - @as(c_int, 1))) & ~__helpers.cast(usize, a - @as(c_int, 1));
}
pub inline fn _Py_ALIGN_DOWN(p: anytype, a: anytype) ?*anyopaque {
    _ = &p;
    _ = &a;
    return __helpers.cast(?*anyopaque, __helpers.cast(usize, p) & ~__helpers.cast(usize, a - @as(c_int, 1)));
}
pub inline fn _Py_ALIGN_UP(p: anytype, a: anytype) ?*anyopaque {
    _ = &p;
    _ = &a;
    return __helpers.cast(?*anyopaque, (__helpers.cast(usize, p) + __helpers.cast(usize, a - @as(c_int, 1))) & ~__helpers.cast(usize, a - @as(c_int, 1)));
}
pub inline fn _Py_IS_ALIGNED(p: anytype, a: anytype) @TypeOf(!((__helpers.cast(usize, p) & __helpers.cast(usize, a - @as(c_int, 1))) != 0)) {
    _ = &p;
    _ = &a;
    return !((__helpers.cast(usize, p) & __helpers.cast(usize, a - @as(c_int, 1))) != 0);
}
pub const Py_UNUSED = @compileError("unable to translate macro: undefined identifier `_unused_`"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\pymacro.h:138:11
pub inline fn Py_UNREACHABLE() @TypeOf(__builtin.@"unreachable"()) {
    return __builtin.@"unreachable"();
}
pub inline fn _Py_CONTAINER_OF(ptr: anytype, @"type": anytype, member: anytype) @TypeOf([*c]@"type"(__helpers.cast([*c]u8, ptr) - offsetof(@"type", member))) {
    _ = &ptr;
    _ = &@"type";
    _ = &member;
    return [*c]@"type"(__helpers.cast([*c]u8, ptr) - offsetof(@"type", member));
}
pub inline fn _Py_RVALUE(EXPR: anytype) @TypeOf(EXPR) {
    _ = &EXPR;
    return blk_1: {
        _ = __helpers.cast(anyopaque, @as(c_int, 0));
        break :blk_1 EXPR;
    };
}
pub inline fn _Py_IS_TYPE_SIGNED(@"type": anytype) @TypeOf(@"type"(-@as(c_int, 1)) <= @as(c_int, 0)) {
    _ = &@"type";
    return @"type"(-@as(c_int, 1)) <= @as(c_int, 0);
}
pub const Py_PYMATH_H = "";
pub const Py_MATH_PIl = @as(c_longdouble, 3.1415926535897932384626433832795029);
pub const Py_MATH_PI = @as(f64, 3.14159265358979323846);
pub const Py_MATH_El = @as(c_longdouble, 2.7182818284590452353602874713526625);
pub const Py_MATH_E = @as(f64, 2.7182818284590452354);
pub const Py_MATH_TAU = @as(c_longdouble, 6.2831853071795864769252867665590057683943);
pub inline fn Py_IS_NAN(X: anytype) @TypeOf(isnan(X)) {
    _ = &X;
    return isnan(X);
}
pub inline fn Py_IS_INFINITY(X: anytype) @TypeOf(isinf(X)) {
    _ = &X;
    return isinf(X);
}
pub inline fn Py_IS_FINITE(X: anytype) @TypeOf(isfinite(X)) {
    _ = &X;
    return isfinite(X);
}
pub const Py_INFINITY = __helpers.cast(f64, INFINITY);
pub const Py_HUGE_VAL = HUGE_VAL;
pub const Py_NAN = __helpers.cast(f64, NAN);
pub const Py_PYMEM_H = "";
pub inline fn PyMem_New(@"type": anytype, n: anytype) @TypeOf(if (__helpers.cast(bool, __helpers.cast(usize, n) > __helpers.div(PY_SSIZE_T_MAX, __helpers.sizeof(@"type")))) NULL else [*c]@"type" ++ PyMem_Malloc(n * __helpers.sizeof(@"type"))) {
    _ = &@"type";
    _ = &n;
    return if (__helpers.cast(bool, __helpers.cast(usize, n) > __helpers.div(PY_SSIZE_T_MAX, __helpers.sizeof(@"type")))) NULL else [*c]@"type" ++ PyMem_Malloc(n * __helpers.sizeof(@"type"));
}
pub const PyMem_Resize = @compileError("unable to translate C expr: expected ')' instead got '='"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\pymem.h:73:9
pub inline fn PyMem_MALLOC(n: anytype) @TypeOf(PyMem_Malloc(n)) {
    _ = &n;
    return PyMem_Malloc(n);
}
pub inline fn PyMem_NEW(@"type": anytype, n: anytype) @TypeOf(PyMem_New(@"type", n)) {
    _ = &@"type";
    _ = &n;
    return PyMem_New(@"type", n);
}
pub inline fn PyMem_REALLOC(p: anytype, n: anytype) @TypeOf(PyMem_Realloc(p, n)) {
    _ = &p;
    _ = &n;
    return PyMem_Realloc(p, n);
}
pub inline fn PyMem_RESIZE(p: anytype, @"type": anytype, n: anytype) @TypeOf(PyMem_Resize(p, @"type", n)) {
    _ = &p;
    _ = &@"type";
    _ = &n;
    return PyMem_Resize(p, @"type", n);
}
pub inline fn PyMem_FREE(p: anytype) @TypeOf(PyMem_Free(p)) {
    _ = &p;
    return PyMem_Free(p);
}
pub inline fn PyMem_Del(p: anytype) @TypeOf(PyMem_Free(p)) {
    _ = &p;
    return PyMem_Free(p);
}
pub inline fn PyMem_DEL(p: anytype) @TypeOf(PyMem_Free(p)) {
    _ = &p;
    return PyMem_Free(p);
}
pub const Py_PYTYPEDEFS_H = "";
pub const Py_BUFFER_H = "";
pub const PyBUF_MAX_NDIM = @as(c_int, 64);
pub const PyBUF_SIMPLE = @as(c_int, 0);
pub const PyBUF_WRITABLE = @as(c_int, 0x0001);
pub const PyBUF_WRITEABLE = PyBUF_WRITABLE;
pub const PyBUF_FORMAT = @as(c_int, 0x0004);
pub const PyBUF_ND = @as(c_int, 0x0008);
pub const PyBUF_STRIDES = @as(c_int, 0x0010) | PyBUF_ND;
pub const PyBUF_C_CONTIGUOUS = @as(c_int, 0x0020) | PyBUF_STRIDES;
pub const PyBUF_F_CONTIGUOUS = @as(c_int, 0x0040) | PyBUF_STRIDES;
pub const PyBUF_ANY_CONTIGUOUS = @as(c_int, 0x0080) | PyBUF_STRIDES;
pub const PyBUF_INDIRECT = @as(c_int, 0x0100) | PyBUF_STRIDES;
pub const PyBUF_CONTIG = PyBUF_ND | PyBUF_WRITABLE;
pub const PyBUF_CONTIG_RO = PyBUF_ND;
pub const PyBUF_STRIDED = PyBUF_STRIDES | PyBUF_WRITABLE;
pub const PyBUF_STRIDED_RO = PyBUF_STRIDES;
pub const PyBUF_RECORDS = (PyBUF_STRIDES | PyBUF_WRITABLE) | PyBUF_FORMAT;
pub const PyBUF_RECORDS_RO = PyBUF_STRIDES | PyBUF_FORMAT;
pub const PyBUF_FULL = (PyBUF_INDIRECT | PyBUF_WRITABLE) | PyBUF_FORMAT;
pub const PyBUF_FULL_RO = PyBUF_INDIRECT | PyBUF_FORMAT;
pub const PyBUF_READ = @as(c_int, 0x100);
pub const PyBUF_WRITE = @as(c_int, 0x200);
pub const Py_PYSTATS_H = "";
pub inline fn _Py_INCREF_STAT_INC() anyopaque {
    return __helpers.cast(anyopaque, @as(c_int, 0));
}
pub inline fn _Py_DECREF_STAT_INC() anyopaque {
    return __helpers.cast(anyopaque, @as(c_int, 0));
}
pub const Py_ATOMIC_H = "";
pub const _Py_USE_GCC_BUILTIN_ATOMICS = @as(c_int, 1);
pub inline fn _Py_atomic_load_ulong(p: anytype) @TypeOf(_Py_atomic_load_uint32(__helpers.cast([*c]u32, p))) {
    _ = &p;
    return _Py_atomic_load_uint32(__helpers.cast([*c]u32, p));
}
pub inline fn _Py_atomic_load_ulong_relaxed(p: anytype) @TypeOf(_Py_atomic_load_uint32_relaxed(__helpers.cast([*c]u32, p))) {
    _ = &p;
    return _Py_atomic_load_uint32_relaxed(__helpers.cast([*c]u32, p));
}
pub inline fn _Py_atomic_store_ulong(p: anytype, v: anytype) @TypeOf(_Py_atomic_store_uint32(__helpers.cast([*c]u32, p), v)) {
    _ = &p;
    _ = &v;
    return _Py_atomic_store_uint32(__helpers.cast([*c]u32, p), v);
}
pub inline fn _Py_atomic_store_ulong_relaxed(p: anytype, v: anytype) @TypeOf(_Py_atomic_store_uint32_relaxed(__helpers.cast([*c]u32, p), v)) {
    _ = &p;
    _ = &v;
    return _Py_atomic_store_uint32_relaxed(__helpers.cast([*c]u32, p), v);
}
pub const Py_LOCK_H = "";
pub const _Py_UNLOCKED = @as(c_int, 0);
pub const _Py_LOCKED = @as(c_int, 1);
pub const Py_OBJECT_H = "";
pub const PyObject_HEAD = @compileError("unable to translate macro: undefined identifier `ob_base`"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\object.h:60:9
pub const _Py_IMMORTAL_REFCNT = _Py_CAST(Py_ssize_t, UINT_MAX);
pub const _PyObject_EXTRA_INIT = "";
pub const PyObject_HEAD_INIT = @compileError("unable to translate C expr: unexpected token '{'"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\object.h:135:9
pub const PyVarObject_HEAD_INIT = @compileError("unable to translate C expr: unexpected token '{'"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\object.h:142:9
pub const PyObject_VAR_HEAD = @compileError("unable to translate macro: undefined identifier `ob_base`"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\object.h:154:9
pub const Py_INVALID_SIZE = __helpers.cast(Py_ssize_t, -@as(c_int, 1));
pub inline fn _PyObject_CAST(op: anytype) @TypeOf(_Py_CAST([*c]PyObject, op)) {
    _ = &op;
    return _Py_CAST([*c]PyObject, op);
}
pub inline fn _PyVarObject_CAST(op: anytype) @TypeOf(_Py_CAST([*c]PyVarObject, op)) {
    _ = &op;
    return _Py_CAST([*c]PyVarObject, op);
}
pub const Py_PRINT_RAW = @as(c_int, 1);
pub const _Py_TPFLAGS_STATIC_BUILTIN = @as(c_int, 1) << @as(c_int, 1);
pub const Py_TPFLAGS_INLINE_VALUES = @as(c_int, 1) << @as(c_int, 2);
pub const Py_TPFLAGS_MANAGED_WEAKREF = @as(c_int, 1) << @as(c_int, 3);
pub const Py_TPFLAGS_MANAGED_DICT = @as(c_int, 1) << @as(c_int, 4);
pub const Py_TPFLAGS_PREHEADER = Py_TPFLAGS_MANAGED_WEAKREF | Py_TPFLAGS_MANAGED_DICT;
pub const Py_TPFLAGS_SEQUENCE = @as(c_int, 1) << @as(c_int, 5);
pub const Py_TPFLAGS_MAPPING = @as(c_int, 1) << @as(c_int, 6);
pub const Py_TPFLAGS_DISALLOW_INSTANTIATION = @as(c_ulong, 1) << @as(c_int, 7);
pub const Py_TPFLAGS_IMMUTABLETYPE = @as(c_ulong, 1) << @as(c_int, 8);
pub const Py_TPFLAGS_HEAPTYPE = @as(c_ulong, 1) << @as(c_int, 9);
pub const Py_TPFLAGS_BASETYPE = @as(c_ulong, 1) << @as(c_int, 10);
pub const Py_TPFLAGS_HAVE_VECTORCALL = @as(c_ulong, 1) << @as(c_int, 11);
pub const _Py_TPFLAGS_HAVE_VECTORCALL = Py_TPFLAGS_HAVE_VECTORCALL;
pub const Py_TPFLAGS_READY = @as(c_ulong, 1) << @as(c_int, 12);
pub const Py_TPFLAGS_READYING = @as(c_ulong, 1) << @as(c_int, 13);
pub const Py_TPFLAGS_HAVE_GC = @as(c_ulong, 1) << @as(c_int, 14);
pub const Py_TPFLAGS_HAVE_STACKLESS_EXTENSION = @as(c_int, 0);
pub const Py_TPFLAGS_METHOD_DESCRIPTOR = @as(c_ulong, 1) << @as(c_int, 17);
pub const Py_TPFLAGS_VALID_VERSION_TAG = @as(c_ulong, 1) << @as(c_int, 19);
pub const Py_TPFLAGS_IS_ABSTRACT = @as(c_ulong, 1) << @as(c_int, 20);
pub const _Py_TPFLAGS_MATCH_SELF = @as(c_ulong, 1) << @as(c_int, 22);
pub const Py_TPFLAGS_ITEMS_AT_END = @as(c_ulong, 1) << @as(c_int, 23);
pub const Py_TPFLAGS_LONG_SUBCLASS = @as(c_ulong, 1) << @as(c_int, 24);
pub const Py_TPFLAGS_LIST_SUBCLASS = @as(c_ulong, 1) << @as(c_int, 25);
pub const Py_TPFLAGS_TUPLE_SUBCLASS = @as(c_ulong, 1) << @as(c_int, 26);
pub const Py_TPFLAGS_BYTES_SUBCLASS = @as(c_ulong, 1) << @as(c_int, 27);
pub const Py_TPFLAGS_UNICODE_SUBCLASS = @as(c_ulong, 1) << @as(c_int, 28);
pub const Py_TPFLAGS_DICT_SUBCLASS = @as(c_ulong, 1) << @as(c_int, 29);
pub const Py_TPFLAGS_BASE_EXC_SUBCLASS = @as(c_ulong, 1) << @as(c_int, 30);
pub const Py_TPFLAGS_TYPE_SUBCLASS = @as(c_ulong, 1) << @as(c_int, 31);
pub const Py_TPFLAGS_DEFAULT = Py_TPFLAGS_HAVE_STACKLESS_EXTENSION | @as(c_int, 0);
pub const Py_TPFLAGS_HAVE_FINALIZE = @as(c_ulong, 1) << @as(c_int, 0);
pub const Py_TPFLAGS_HAVE_VERSION_TAG = @as(c_ulong, 1) << @as(c_int, 18);
pub const Py_CLEAR = @compileError("unable to translate macro: undefined identifier `_tmp_op_ptr`"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\object.h:1005:9
pub const Py_CONSTANT_NONE = @as(c_int, 0);
pub const Py_CONSTANT_FALSE = @as(c_int, 1);
pub const Py_CONSTANT_TRUE = @as(c_int, 2);
pub const Py_CONSTANT_ELLIPSIS = @as(c_int, 3);
pub const Py_CONSTANT_NOT_IMPLEMENTED = @as(c_int, 4);
pub const Py_CONSTANT_ZERO = @as(c_int, 5);
pub const Py_CONSTANT_ONE = @as(c_int, 6);
pub const Py_CONSTANT_EMPTY_STR = @as(c_int, 7);
pub const Py_CONSTANT_EMPTY_BYTES = @as(c_int, 8);
pub const Py_CONSTANT_EMPTY_TUPLE = @as(c_int, 9);
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\object.h:1106:11: warning: macro 'Py_None' contains a runtime value, translated to function
pub inline fn Py_None() @TypeOf(&_Py_NoneStruct) {
    return &_Py_NoneStruct;
}
pub const Py_RETURN_NONE = @compileError("unable to translate C expr: unexpected token 'return'"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\object.h:1114:9

// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\object.h:1125:11: warning: macro 'Py_NotImplemented' contains a runtime value, translated to function
pub inline fn Py_NotImplemented() @TypeOf(&_Py_NotImplementedStruct) {
    return &_Py_NotImplementedStruct;
}
pub const Py_RETURN_NOTIMPLEMENTED = @compileError("unable to translate C expr: unexpected token 'return'"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\object.h:1129:9
pub const Py_LT = @as(c_int, 0);
pub const Py_LE = @as(c_int, 1);
pub const Py_EQ = @as(c_int, 2);
pub const Py_NE = @as(c_int, 3);
pub const Py_GT = @as(c_int, 4);
pub const Py_GE = @as(c_int, 5);
pub const Py_RETURN_RICHCOMPARE = @compileError("unable to translate C expr: unexpected token 'do'"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\object.h:1153:9
pub const _Py_static_string_init = @compileError("unable to translate C expr: unexpected token '{'"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/object.h:53:9
pub const _Py_static_string = @compileError("unable to translate C expr: unexpected token 'static'"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/object.h:54:9
pub const _Py_IDENTIFIER = @compileError("unable to translate macro: undefined identifier `PyId_`"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/object.h:55:9
pub const Py_SETREF = @compileError("unable to translate macro: undefined identifier `_tmp_dst_ptr`"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/object.h:327:9
pub const Py_XSETREF = @compileError("unable to translate macro: undefined identifier `_tmp_dst_ptr`"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/object.h:349:9
pub inline fn _PyObject_ASSERT_FROM(obj: anytype, expr: anytype, msg: anytype, filename: anytype, lineno: anytype, func: anytype) @TypeOf(if (__helpers.cast(bool, expr)) __helpers.cast(anyopaque, @as(c_int, 0)) else _PyObject_AssertFailed(obj, Py_STRINGIFY(expr), msg, filename, lineno, func)) {
    _ = &obj;
    _ = &expr;
    _ = &msg;
    _ = &filename;
    _ = &lineno;
    _ = &func;
    return if (__helpers.cast(bool, expr)) __helpers.cast(anyopaque, @as(c_int, 0)) else _PyObject_AssertFailed(obj, Py_STRINGIFY(expr), msg, filename, lineno, func);
}
pub const _PyObject_ASSERT_WITH_MSG = @compileError("unable to translate macro: undefined identifier `__FILE__`"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/object.h:395:9
pub inline fn _PyObject_ASSERT(obj: anytype, expr: anytype) @TypeOf(_PyObject_ASSERT_WITH_MSG(obj, expr, NULL)) {
    _ = &obj;
    _ = &expr;
    return _PyObject_ASSERT_WITH_MSG(obj, expr, NULL);
}
pub const _PyObject_ASSERT_FAILED_MSG = @compileError("unable to translate macro: undefined identifier `__FILE__`"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/object.h:400:9
pub const Py_TRASHCAN_HEADROOM = @as(c_int, 50);
pub const Py_TRASHCAN_BEGIN = @compileError("unable to translate macro: undefined identifier `tstate`"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/object.h:479:9
pub const Py_TRASHCAN_END = @compileError("unable to translate macro: undefined identifier `tstate`"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/object.h:488:9
pub const TYPE_MAX_WATCHERS = @as(c_int, 8);
pub inline fn PyType_FastSubclass(@"type": anytype, flag: anytype) @TypeOf(PyType_HasFeature(@"type", flag)) {
    _ = &@"type";
    _ = &flag;
    return PyType_HasFeature(@"type", flag);
}
pub inline fn _PyType_CAST(op: anytype) @TypeOf(_Py_CAST([*c]PyTypeObject, op)) {
    _ = &op;
    return blk_1: {
        _ = assert(PyType_Check(op));
        break :blk_1 _Py_CAST([*c]PyTypeObject, op);
    };
}
pub const Py_OBJIMPL_H = "";
pub const PyObject_MALLOC = PyObject_Malloc;
pub const PyObject_REALLOC = PyObject_Realloc;
pub const PyObject_FREE = PyObject_Free;
pub const PyObject_Del = PyObject_Free;
pub const PyObject_DEL = PyObject_Free;
pub inline fn PyObject_INIT(op: anytype, typeobj: anytype) @TypeOf(PyObject_Init(_PyObject_CAST(op), typeobj)) {
    _ = &op;
    _ = &typeobj;
    return PyObject_Init(_PyObject_CAST(op), typeobj);
}
pub inline fn PyObject_INIT_VAR(op: anytype, typeobj: anytype, size: anytype) @TypeOf(PyObject_InitVar(_PyVarObject_CAST(op), typeobj, size)) {
    _ = &op;
    _ = &typeobj;
    _ = &size;
    return PyObject_InitVar(_PyVarObject_CAST(op), typeobj, size);
}
pub inline fn PyObject_New(@"type": anytype, typeobj: anytype) @TypeOf([*c]@"type" ++ _PyObject_New(typeobj)) {
    _ = &@"type";
    _ = &typeobj;
    return [*c]@"type" ++ _PyObject_New(typeobj);
}
pub inline fn PyObject_NEW(@"type": anytype, typeobj: anytype) @TypeOf(PyObject_New(@"type", typeobj)) {
    _ = &@"type";
    _ = &typeobj;
    return PyObject_New(@"type", typeobj);
}
pub inline fn PyObject_NewVar(@"type": anytype, typeobj: anytype, n: anytype) @TypeOf([*c]@"type" ++ _PyObject_NewVar(typeobj, n)) {
    _ = &@"type";
    _ = &typeobj;
    _ = &n;
    return [*c]@"type" ++ _PyObject_NewVar(typeobj, n);
}
pub inline fn PyObject_NEW_VAR(@"type": anytype, typeobj: anytype, n: anytype) @TypeOf(PyObject_NewVar(@"type", typeobj, n)) {
    _ = &@"type";
    _ = &typeobj;
    _ = &n;
    return PyObject_NewVar(@"type", typeobj, n);
}
pub inline fn PyType_IS_GC(t: anytype) @TypeOf(PyType_HasFeature(t, Py_TPFLAGS_HAVE_GC)) {
    _ = &t;
    return PyType_HasFeature(t, Py_TPFLAGS_HAVE_GC);
}
pub inline fn PyObject_GC_Resize(@"type": anytype, op: anytype, n: anytype) @TypeOf([*c]@"type" ++ _PyObject_GC_Resize(_PyVarObject_CAST(op), n)) {
    _ = &@"type";
    _ = &op;
    _ = &n;
    return [*c]@"type" ++ _PyObject_GC_Resize(_PyVarObject_CAST(op), n);
}
pub inline fn PyObject_GC_New(@"type": anytype, typeobj: anytype) @TypeOf(_Py_CAST([*c]@"type", _PyObject_GC_New(typeobj))) {
    _ = &@"type";
    _ = &typeobj;
    return _Py_CAST([*c]@"type", _PyObject_GC_New(typeobj));
}
pub inline fn PyObject_GC_NewVar(@"type": anytype, typeobj: anytype, n: anytype) @TypeOf(_Py_CAST([*c]@"type", _PyObject_GC_NewVar(typeobj, n))) {
    _ = &@"type";
    _ = &typeobj;
    _ = &n;
    return _Py_CAST([*c]@"type", _PyObject_GC_NewVar(typeobj, n));
}
pub const Py_VISIT = @compileError("unable to translate macro: undefined identifier `vret`"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\objimpl.h:193:9
pub const Py_bf_getbuffer = @as(c_int, 1);
pub const Py_bf_releasebuffer = @as(c_int, 2);
pub const Py_mp_ass_subscript = @as(c_int, 3);
pub const Py_mp_length = @as(c_int, 4);
pub const Py_mp_subscript = @as(c_int, 5);
pub const Py_nb_absolute = @as(c_int, 6);
pub const Py_nb_add = @as(c_int, 7);
pub const Py_nb_and = @as(c_int, 8);
pub const Py_nb_bool = @as(c_int, 9);
pub const Py_nb_divmod = @as(c_int, 10);
pub const Py_nb_float = @as(c_int, 11);
pub const Py_nb_floor_divide = @as(c_int, 12);
pub const Py_nb_index = @as(c_int, 13);
pub const Py_nb_inplace_add = @as(c_int, 14);
pub const Py_nb_inplace_and = @as(c_int, 15);
pub const Py_nb_inplace_floor_divide = @as(c_int, 16);
pub const Py_nb_inplace_lshift = @as(c_int, 17);
pub const Py_nb_inplace_multiply = @as(c_int, 18);
pub const Py_nb_inplace_or = @as(c_int, 19);
pub const Py_nb_inplace_power = @as(c_int, 20);
pub const Py_nb_inplace_remainder = @as(c_int, 21);
pub const Py_nb_inplace_rshift = @as(c_int, 22);
pub const Py_nb_inplace_subtract = @as(c_int, 23);
pub const Py_nb_inplace_true_divide = @as(c_int, 24);
pub const Py_nb_inplace_xor = @as(c_int, 25);
pub const Py_nb_int = @as(c_int, 26);
pub const Py_nb_invert = @as(c_int, 27);
pub const Py_nb_lshift = @as(c_int, 28);
pub const Py_nb_multiply = @as(c_int, 29);
pub const Py_nb_negative = @as(c_int, 30);
pub const Py_nb_or = @as(c_int, 31);
pub const Py_nb_positive = @as(c_int, 32);
pub const Py_nb_power = @as(c_int, 33);
pub const Py_nb_remainder = @as(c_int, 34);
pub const Py_nb_rshift = @as(c_int, 35);
pub const Py_nb_subtract = @as(c_int, 36);
pub const Py_nb_true_divide = @as(c_int, 37);
pub const Py_nb_xor = @as(c_int, 38);
pub const Py_sq_ass_item = @as(c_int, 39);
pub const Py_sq_concat = @as(c_int, 40);
pub const Py_sq_contains = @as(c_int, 41);
pub const Py_sq_inplace_concat = @as(c_int, 42);
pub const Py_sq_inplace_repeat = @as(c_int, 43);
pub const Py_sq_item = @as(c_int, 44);
pub const Py_sq_length = @as(c_int, 45);
pub const Py_sq_repeat = @as(c_int, 46);
pub const Py_tp_alloc = @as(c_int, 47);
pub const Py_tp_base = @as(c_int, 48);
pub const Py_tp_bases = @as(c_int, 49);
pub const Py_tp_call = @as(c_int, 50);
pub const Py_tp_clear = @as(c_int, 51);
pub const Py_tp_dealloc = @as(c_int, 52);
pub const Py_tp_del = @as(c_int, 53);
pub const Py_tp_descr_get = @as(c_int, 54);
pub const Py_tp_descr_set = @as(c_int, 55);
pub const Py_tp_doc = @as(c_int, 56);
pub const Py_tp_getattr = @as(c_int, 57);
pub const Py_tp_getattro = @as(c_int, 58);
pub const Py_tp_hash = @as(c_int, 59);
pub const Py_tp_init = @as(c_int, 60);
pub const Py_tp_is_gc = @as(c_int, 61);
pub const Py_tp_iter = @as(c_int, 62);
pub const Py_tp_iternext = @as(c_int, 63);
pub const Py_tp_methods = @as(c_int, 64);
pub const Py_tp_new = @as(c_int, 65);
pub const Py_tp_repr = @as(c_int, 66);
pub const Py_tp_richcompare = @as(c_int, 67);
pub const Py_tp_setattr = @as(c_int, 68);
pub const Py_tp_setattro = @as(c_int, 69);
pub const Py_tp_str = @as(c_int, 70);
pub const Py_tp_traverse = @as(c_int, 71);
pub const Py_tp_members = @as(c_int, 72);
pub const Py_tp_getset = @as(c_int, 73);
pub const Py_tp_free = @as(c_int, 74);
pub const Py_nb_matrix_multiply = @as(c_int, 75);
pub const Py_nb_inplace_matrix_multiply = @as(c_int, 76);
pub const Py_am_await = @as(c_int, 77);
pub const Py_am_aiter = @as(c_int, 78);
pub const Py_am_anext = @as(c_int, 79);
pub const Py_tp_finalize = @as(c_int, 80);
pub const Py_am_send = @as(c_int, 81);
pub const Py_HASH_H = "";
pub const Py_HASH_CUTOFF = @as(c_int, 0);
pub const Py_HASH_EXTERNAL = @as(c_int, 0);
pub const Py_HASH_SIPHASH24 = @as(c_int, 1);
pub const Py_HASH_FNV = @as(c_int, 2);
pub const Py_HASH_SIPHASH13 = @as(c_int, 3);
pub const Py_HASH_ALGORITHM = Py_HASH_SIPHASH13;
pub const PyHASH_MULTIPLIER = @as(c_ulong, 1000003);
pub const PyHASH_BITS = @as(c_int, 61);
pub const PyHASH_MODULUS = (__helpers.cast(usize, @as(c_int, 1)) << _PyHASH_BITS) - @as(c_int, 1);
pub const PyHASH_INF = __helpers.promoteIntLiteral(c_int, 314159, .decimal);
pub const PyHASH_IMAG = PyHASH_MULTIPLIER;
pub const _PyHASH_MULTIPLIER = PyHASH_MULTIPLIER;
pub const _PyHASH_BITS = PyHASH_BITS;
pub const _PyHASH_MODULUS = PyHASH_MODULUS;
pub const _PyHASH_INF = PyHASH_INF;
pub const _PyHASH_IMAG = PyHASH_IMAG;
pub const _Py_HashPointer = Py_HashPointer;
pub const Py_PYDEBUG_H = "";
pub const Py_BYTEARRAYOBJECT_H = "";
pub inline fn PyByteArray_Check(self: anytype) @TypeOf(PyObject_TypeCheck(self, &PyByteArray_Type)) {
    _ = &self;
    return PyObject_TypeCheck(self, &PyByteArray_Type);
}
pub inline fn PyByteArray_CheckExact(self: anytype) @TypeOf(Py_IS_TYPE(self, &PyByteArray_Type)) {
    _ = &self;
    return Py_IS_TYPE(self, &PyByteArray_Type);
}
pub inline fn _PyByteArray_CAST(op: anytype) @TypeOf(_Py_CAST([*c]PyByteArrayObject, op)) {
    _ = &op;
    return blk_1: {
        _ = assert(PyByteArray_Check(op));
        break :blk_1 _Py_CAST([*c]PyByteArrayObject, op);
    };
}
pub const Py_BYTESOBJECT_H = "";
pub inline fn PyBytes_Check(op: anytype) @TypeOf(PyType_FastSubclass(Py_TYPE(op), Py_TPFLAGS_BYTES_SUBCLASS)) {
    _ = &op;
    return PyType_FastSubclass(Py_TYPE(op), Py_TPFLAGS_BYTES_SUBCLASS);
}
pub inline fn PyBytes_CheckExact(op: anytype) @TypeOf(Py_IS_TYPE(op, &PyBytes_Type)) {
    _ = &op;
    return Py_IS_TYPE(op, &PyBytes_Type);
}
pub inline fn _PyBytes_CAST(op: anytype) @TypeOf(_Py_CAST([*c]PyBytesObject, op)) {
    _ = &op;
    return blk_1: {
        _ = assert(PyBytes_Check(op));
        break :blk_1 _Py_CAST([*c]PyBytesObject, op);
    };
}
pub const Py_UNICODEOBJECT_H = "";
pub const Py_USING_UNICODE = "";
pub const Py_UNICODE_SIZE = SIZEOF_WCHAR_T;
pub inline fn PyUnicode_Check(op: anytype) @TypeOf(PyType_FastSubclass(Py_TYPE(op), Py_TPFLAGS_UNICODE_SUBCLASS)) {
    _ = &op;
    return PyType_FastSubclass(Py_TYPE(op), Py_TPFLAGS_UNICODE_SUBCLASS);
}
pub inline fn PyUnicode_CheckExact(op: anytype) @TypeOf(Py_IS_TYPE(op, &PyUnicode_Type)) {
    _ = &op;
    return Py_IS_TYPE(op, &PyUnicode_Type);
}
pub const Py_UNICODE_REPLACEMENT_CHARACTER = __helpers.cast(Py_UCS4, __helpers.promoteIntLiteral(c_int, 0xFFFD, .hex));
pub inline fn _PyASCIIObject_CAST(op: anytype) @TypeOf(_Py_CAST([*c]PyASCIIObject, op)) {
    _ = &op;
    return blk_1: {
        _ = assert(PyUnicode_Check(op));
        break :blk_1 _Py_CAST([*c]PyASCIIObject, op);
    };
}
pub inline fn _PyCompactUnicodeObject_CAST(op: anytype) @TypeOf(_Py_CAST([*c]PyCompactUnicodeObject, op)) {
    _ = &op;
    return blk_1: {
        _ = assert(PyUnicode_Check(op));
        break :blk_1 _Py_CAST([*c]PyCompactUnicodeObject, op);
    };
}
pub inline fn _PyUnicodeObject_CAST(op: anytype) @TypeOf(_Py_CAST([*c]PyUnicodeObject, op)) {
    _ = &op;
    return blk_1: {
        _ = assert(PyUnicode_Check(op));
        break :blk_1 _Py_CAST([*c]PyUnicodeObject, op);
    };
}
pub const SSTATE_NOT_INTERNED = @as(c_int, 0);
pub const SSTATE_INTERNED_MORTAL = @as(c_int, 1);
pub const SSTATE_INTERNED_IMMORTAL = @as(c_int, 2);
pub const SSTATE_INTERNED_IMMORTAL_STATIC = @as(c_int, 3);
pub inline fn PyUnicode_KIND(op: anytype) @TypeOf(_Py_RVALUE(_PyASCIIObject_CAST(op).*.state.kind)) {
    _ = &op;
    return _Py_RVALUE(_PyASCIIObject_CAST(op).*.state.kind);
}
pub inline fn PyUnicode_1BYTE_DATA(op: anytype) @TypeOf(_Py_STATIC_CAST([*c]Py_UCS1, PyUnicode_DATA(op))) {
    _ = &op;
    return _Py_STATIC_CAST([*c]Py_UCS1, PyUnicode_DATA(op));
}
pub inline fn PyUnicode_2BYTE_DATA(op: anytype) @TypeOf(_Py_STATIC_CAST([*c]Py_UCS2, PyUnicode_DATA(op))) {
    _ = &op;
    return _Py_STATIC_CAST([*c]Py_UCS2, PyUnicode_DATA(op));
}
pub inline fn PyUnicode_4BYTE_DATA(op: anytype) @TypeOf(_Py_STATIC_CAST([*c]Py_UCS4, PyUnicode_DATA(op))) {
    _ = &op;
    return _Py_STATIC_CAST([*c]Py_UCS4, PyUnicode_DATA(op));
}
pub inline fn _PyUnicodeWriter_Prepare(WRITER: anytype, LENGTH: anytype, MAXCHAR: anytype) @TypeOf(if (__helpers.cast(bool, (MAXCHAR <= WRITER.*.maxchar) and (LENGTH <= (WRITER.*.size - WRITER.*.pos)))) @as(c_int, 0) else if (__helpers.cast(bool, LENGTH == @as(c_int, 0))) @as(c_int, 0) else _PyUnicodeWriter_PrepareInternal(WRITER, LENGTH, MAXCHAR)) {
    _ = &WRITER;
    _ = &LENGTH;
    _ = &MAXCHAR;
    return if (__helpers.cast(bool, (MAXCHAR <= WRITER.*.maxchar) and (LENGTH <= (WRITER.*.size - WRITER.*.pos)))) @as(c_int, 0) else if (__helpers.cast(bool, LENGTH == @as(c_int, 0))) @as(c_int, 0) else _PyUnicodeWriter_PrepareInternal(WRITER, LENGTH, MAXCHAR);
}
pub inline fn _PyUnicodeWriter_PrepareKind(WRITER: anytype, KIND: anytype) @TypeOf(if (__helpers.cast(bool, KIND <= WRITER.*.kind)) @as(c_int, 0) else _PyUnicodeWriter_PrepareKindInternal(WRITER, KIND)) {
    _ = &WRITER;
    _ = &KIND;
    return if (__helpers.cast(bool, KIND <= WRITER.*.kind)) @as(c_int, 0) else _PyUnicodeWriter_PrepareKindInternal(WRITER, KIND);
}
pub const _PyUnicode_AsString = PyUnicode_AsUTF8;
pub inline fn Py_UNICODE_ISLOWER(ch: anytype) @TypeOf(_PyUnicode_IsLowercase(ch)) {
    _ = &ch;
    return _PyUnicode_IsLowercase(ch);
}
pub inline fn Py_UNICODE_ISUPPER(ch: anytype) @TypeOf(_PyUnicode_IsUppercase(ch)) {
    _ = &ch;
    return _PyUnicode_IsUppercase(ch);
}
pub inline fn Py_UNICODE_ISTITLE(ch: anytype) @TypeOf(_PyUnicode_IsTitlecase(ch)) {
    _ = &ch;
    return _PyUnicode_IsTitlecase(ch);
}
pub inline fn Py_UNICODE_ISLINEBREAK(ch: anytype) @TypeOf(_PyUnicode_IsLinebreak(ch)) {
    _ = &ch;
    return _PyUnicode_IsLinebreak(ch);
}
pub inline fn Py_UNICODE_TOLOWER(ch: anytype) @TypeOf(_PyUnicode_ToLowercase(ch)) {
    _ = &ch;
    return _PyUnicode_ToLowercase(ch);
}
pub inline fn Py_UNICODE_TOUPPER(ch: anytype) @TypeOf(_PyUnicode_ToUppercase(ch)) {
    _ = &ch;
    return _PyUnicode_ToUppercase(ch);
}
pub inline fn Py_UNICODE_TOTITLE(ch: anytype) @TypeOf(_PyUnicode_ToTitlecase(ch)) {
    _ = &ch;
    return _PyUnicode_ToTitlecase(ch);
}
pub inline fn Py_UNICODE_ISDECIMAL(ch: anytype) @TypeOf(_PyUnicode_IsDecimalDigit(ch)) {
    _ = &ch;
    return _PyUnicode_IsDecimalDigit(ch);
}
pub inline fn Py_UNICODE_ISDIGIT(ch: anytype) @TypeOf(_PyUnicode_IsDigit(ch)) {
    _ = &ch;
    return _PyUnicode_IsDigit(ch);
}
pub inline fn Py_UNICODE_ISNUMERIC(ch: anytype) @TypeOf(_PyUnicode_IsNumeric(ch)) {
    _ = &ch;
    return _PyUnicode_IsNumeric(ch);
}
pub inline fn Py_UNICODE_ISPRINTABLE(ch: anytype) @TypeOf(_PyUnicode_IsPrintable(ch)) {
    _ = &ch;
    return _PyUnicode_IsPrintable(ch);
}
pub inline fn Py_UNICODE_TODECIMAL(ch: anytype) @TypeOf(_PyUnicode_ToDecimalDigit(ch)) {
    _ = &ch;
    return _PyUnicode_ToDecimalDigit(ch);
}
pub inline fn Py_UNICODE_TODIGIT(ch: anytype) @TypeOf(_PyUnicode_ToDigit(ch)) {
    _ = &ch;
    return _PyUnicode_ToDigit(ch);
}
pub inline fn Py_UNICODE_TONUMERIC(ch: anytype) @TypeOf(_PyUnicode_ToNumeric(ch)) {
    _ = &ch;
    return _PyUnicode_ToNumeric(ch);
}
pub inline fn Py_UNICODE_ISALPHA(ch: anytype) @TypeOf(_PyUnicode_IsAlpha(ch)) {
    _ = &ch;
    return _PyUnicode_IsAlpha(ch);
}
pub const Py_ERRORS_H = "";
pub inline fn PyExceptionClass_Check(x: anytype) @TypeOf((PyType_Check(x) != 0) and (PyType_FastSubclass(__helpers.cast([*c]PyTypeObject, x), Py_TPFLAGS_BASE_EXC_SUBCLASS) != 0)) {
    _ = &x;
    return (PyType_Check(x) != 0) and (PyType_FastSubclass(__helpers.cast([*c]PyTypeObject, x), Py_TPFLAGS_BASE_EXC_SUBCLASS) != 0);
}
pub inline fn PyExceptionInstance_Check(x: anytype) @TypeOf(PyType_FastSubclass(Py_TYPE(x), Py_TPFLAGS_BASE_EXC_SUBCLASS)) {
    _ = &x;
    return PyType_FastSubclass(Py_TYPE(x), Py_TPFLAGS_BASE_EXC_SUBCLASS);
}
pub inline fn PyExceptionInstance_Class(x: anytype) @TypeOf(_PyObject_CAST(Py_TYPE(x))) {
    _ = &x;
    return _PyObject_CAST(Py_TYPE(x));
}
pub inline fn _PyBaseExceptionGroup_Check(x: anytype) @TypeOf(PyObject_TypeCheck(x, __helpers.cast([*c]PyTypeObject, PyExc_BaseExceptionGroup))) {
    _ = &x;
    return PyObject_TypeCheck(x, __helpers.cast([*c]PyTypeObject, PyExc_BaseExceptionGroup));
}
pub const PyException_HEAD = @compileError("unable to translate macro: undefined identifier `dict`"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pyerrors.h:8:9
pub const Py_LONGOBJECT_H = "";
pub inline fn PyLong_Check(op: anytype) @TypeOf(PyType_FastSubclass(Py_TYPE(op), Py_TPFLAGS_LONG_SUBCLASS)) {
    _ = &op;
    return PyType_FastSubclass(Py_TYPE(op), Py_TPFLAGS_LONG_SUBCLASS);
}
pub inline fn PyLong_CheckExact(op: anytype) @TypeOf(Py_IS_TYPE(op, &PyLong_Type)) {
    _ = &op;
    return Py_IS_TYPE(op, &PyLong_Type);
}
pub inline fn PyLong_AS_LONG(op: anytype) @TypeOf(PyLong_AsLong(op)) {
    _ = &op;
    return PyLong_AsLong(op);
}
pub const _Py_PARSE_PID = "i";
pub const PyLong_FromPid = PyLong_FromLong;
pub const PyLong_AsPid = PyLong_AsInt;
pub const _Py_PARSE_INTPTR = "L";
pub const _Py_PARSE_UINTPTR = "K";
pub const Py_ASNATIVEBYTES_DEFAULTS = -@as(c_int, 1);
pub const Py_ASNATIVEBYTES_BIG_ENDIAN = @as(c_int, 0);
pub const Py_ASNATIVEBYTES_LITTLE_ENDIAN = @as(c_int, 1);
pub const Py_ASNATIVEBYTES_NATIVE_ENDIAN = @as(c_int, 3);
pub const Py_ASNATIVEBYTES_UNSIGNED_BUFFER = @as(c_int, 4);
pub const Py_ASNATIVEBYTES_REJECT_NEGATIVE = @as(c_int, 8);
pub const Py_ASNATIVEBYTES_ALLOW_INDEX = @as(c_int, 16);
pub const Py_LONGINTREPR_H = "";
pub const PyLong_SHIFT = @as(c_int, 30);
pub const _PyLong_DECIMAL_SHIFT = @as(c_int, 9);
pub const _PyLong_DECIMAL_BASE = __helpers.cast(digit, __helpers.promoteIntLiteral(c_int, 1000000000, .decimal));
pub const PyLong_BASE = __helpers.cast(digit, @as(c_int, 1)) << PyLong_SHIFT;
pub const PyLong_MASK = __helpers.cast(digit, PyLong_BASE - @as(c_int, 1));
pub const _PyLong_SIGN_MASK = @as(c_int, 3);
pub const _PyLong_NON_SIZE_BITS = @as(c_int, 3);
pub const Py_BOOLOBJECT_H = "";
pub inline fn PyBool_Check(x: anytype) @TypeOf(Py_IS_TYPE(x, &PyBool_Type)) {
    _ = &x;
    return Py_IS_TYPE(x, &PyBool_Type);
}
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\boolobject.h:25:11: warning: macro 'Py_False' contains a runtime value, translated to function
pub inline fn Py_False() @TypeOf(_PyObject_CAST(&_Py_FalseStruct)) {
    return _PyObject_CAST(&_Py_FalseStruct);
}
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\boolobject.h:26:11: warning: macro 'Py_True' contains a runtime value, translated to function
pub inline fn Py_True() @TypeOf(_PyObject_CAST(&_Py_TrueStruct)) {
    return _PyObject_CAST(&_Py_TrueStruct);
}
pub const Py_RETURN_TRUE = @compileError("unable to translate C expr: unexpected token 'return'"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\boolobject.h:38:9
pub const Py_RETURN_FALSE = @compileError("unable to translate C expr: unexpected token 'return'"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\boolobject.h:39:9
pub const Py_FLOATOBJECT_H = "";
pub inline fn PyFloat_Check(op: anytype) @TypeOf(PyObject_TypeCheck(op, &PyFloat_Type)) {
    _ = &op;
    return PyObject_TypeCheck(op, &PyFloat_Type);
}
pub inline fn PyFloat_CheckExact(op: anytype) @TypeOf(Py_IS_TYPE(op, &PyFloat_Type)) {
    _ = &op;
    return Py_IS_TYPE(op, &PyFloat_Type);
}
pub const Py_RETURN_NAN = @compileError("unable to translate C expr: unexpected token 'return'"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\floatobject.h:19:9
pub const Py_RETURN_INF = @compileError("unable to translate C expr: unexpected token 'do'"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\floatobject.h:21:9
pub inline fn _PyFloat_CAST(op: anytype) @TypeOf(_Py_CAST([*c]PyFloatObject, op)) {
    _ = &op;
    return blk_1: {
        _ = assert(PyFloat_Check(op));
        break :blk_1 _Py_CAST([*c]PyFloatObject, op);
    };
}
pub const Py_COMPLEXOBJECT_H = "";
pub inline fn PyComplex_Check(op: anytype) @TypeOf(PyObject_TypeCheck(op, &PyComplex_Type)) {
    _ = &op;
    return PyObject_TypeCheck(op, &PyComplex_Type);
}
pub inline fn PyComplex_CheckExact(op: anytype) @TypeOf(Py_IS_TYPE(op, &PyComplex_Type)) {
    _ = &op;
    return Py_IS_TYPE(op, &PyComplex_Type);
}
pub const Py_RANGEOBJECT_H = "";
pub inline fn PyRange_Check(op: anytype) @TypeOf(Py_IS_TYPE(op, &PyRange_Type)) {
    _ = &op;
    return Py_IS_TYPE(op, &PyRange_Type);
}
pub const Py_MEMORYOBJECT_H = "";
pub inline fn PyMemoryView_Check(op: anytype) @TypeOf(Py_IS_TYPE(op, &PyMemoryView_Type)) {
    _ = &op;
    return Py_IS_TYPE(op, &PyMemoryView_Type);
}
pub const _Py_MANAGED_BUFFER_RELEASED = @as(c_int, 0x001);
pub const _Py_MANAGED_BUFFER_FREE_FORMAT = @as(c_int, 0x002);
pub const _Py_MEMORYVIEW_RELEASED = @as(c_int, 0x001);
pub const _Py_MEMORYVIEW_C = @as(c_int, 0x002);
pub const _Py_MEMORYVIEW_FORTRAN = @as(c_int, 0x004);
pub const _Py_MEMORYVIEW_SCALAR = @as(c_int, 0x008);
pub const _Py_MEMORYVIEW_PIL = @as(c_int, 0x010);
pub const _Py_MEMORYVIEW_RESTRICTED = @as(c_int, 0x020);
pub inline fn _PyMemoryView_CAST(op: anytype) @TypeOf(_Py_CAST([*c]PyMemoryViewObject, op)) {
    _ = &op;
    return _Py_CAST([*c]PyMemoryViewObject, op);
}
pub const Py_TUPLEOBJECT_H = "";
pub inline fn PyTuple_Check(op: anytype) @TypeOf(PyType_FastSubclass(Py_TYPE(op), Py_TPFLAGS_TUPLE_SUBCLASS)) {
    _ = &op;
    return PyType_FastSubclass(Py_TYPE(op), Py_TPFLAGS_TUPLE_SUBCLASS);
}
pub inline fn PyTuple_CheckExact(op: anytype) @TypeOf(Py_IS_TYPE(op, &PyTuple_Type)) {
    _ = &op;
    return Py_IS_TYPE(op, &PyTuple_Type);
}
pub inline fn _PyTuple_CAST(op: anytype) @TypeOf(_Py_CAST([*c]PyTupleObject, op)) {
    _ = &op;
    return blk_1: {
        _ = assert(PyTuple_Check(op));
        break :blk_1 _Py_CAST([*c]PyTupleObject, op);
    };
}
pub inline fn PyTuple_GET_ITEM(op: anytype, index: anytype) @TypeOf(_PyTuple_CAST(op).*.ob_item[@as(usize, @intCast(index))]) {
    _ = &op;
    _ = &index;
    return _PyTuple_CAST(op).*.ob_item[@as(usize, @intCast(index))];
}
pub const Py_LISTOBJECT_H = "";
pub inline fn PyList_Check(op: anytype) @TypeOf(PyType_FastSubclass(Py_TYPE(op), Py_TPFLAGS_LIST_SUBCLASS)) {
    _ = &op;
    return PyType_FastSubclass(Py_TYPE(op), Py_TPFLAGS_LIST_SUBCLASS);
}
pub inline fn PyList_CheckExact(op: anytype) @TypeOf(Py_IS_TYPE(op, &PyList_Type)) {
    _ = &op;
    return Py_IS_TYPE(op, &PyList_Type);
}
pub inline fn _PyList_CAST(op: anytype) @TypeOf(_Py_CAST([*c]PyListObject, op)) {
    _ = &op;
    return blk_1: {
        _ = assert(PyList_Check(op));
        break :blk_1 _Py_CAST([*c]PyListObject, op);
    };
}
pub inline fn PyList_GET_ITEM(op: anytype, index: anytype) @TypeOf(_PyList_CAST(op).*.ob_item[@as(usize, @intCast(index))]) {
    _ = &op;
    _ = &index;
    return _PyList_CAST(op).*.ob_item[@as(usize, @intCast(index))];
}
pub const Py_DICTOBJECT_H = "";
pub inline fn PyDict_Check(op: anytype) @TypeOf(PyType_FastSubclass(Py_TYPE(op), Py_TPFLAGS_DICT_SUBCLASS)) {
    _ = &op;
    return PyType_FastSubclass(Py_TYPE(op), Py_TPFLAGS_DICT_SUBCLASS);
}
pub inline fn PyDict_CheckExact(op: anytype) @TypeOf(Py_IS_TYPE(op, &PyDict_Type)) {
    _ = &op;
    return Py_IS_TYPE(op, &PyDict_Type);
}
pub inline fn PyDictKeys_Check(op: anytype) @TypeOf(PyObject_TypeCheck(op, &PyDictKeys_Type)) {
    _ = &op;
    return PyObject_TypeCheck(op, &PyDictKeys_Type);
}
pub inline fn PyDictValues_Check(op: anytype) @TypeOf(PyObject_TypeCheck(op, &PyDictValues_Type)) {
    _ = &op;
    return PyObject_TypeCheck(op, &PyDictValues_Type);
}
pub inline fn PyDictItems_Check(op: anytype) @TypeOf(PyObject_TypeCheck(op, &PyDictItems_Type)) {
    _ = &op;
    return PyObject_TypeCheck(op, &PyDictItems_Type);
}
pub inline fn PyDictViewSet_Check(op: anytype) @TypeOf((PyDictKeys_Check(op) != 0) or (PyDictItems_Check(op) != 0)) {
    _ = &op;
    return (PyDictKeys_Check(op) != 0) or (PyDictItems_Check(op) != 0);
}
pub const PY_FOREACH_DICT_EVENT = @compileError("unable to translate macro: undefined identifier `ADDED`"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/dictobject.h:77:9
pub const Py_ODICTOBJECT_H = "";
pub inline fn PyODict_Check(op: anytype) @TypeOf(PyObject_TypeCheck(op, &PyODict_Type)) {
    _ = &op;
    return PyObject_TypeCheck(op, &PyODict_Type);
}
pub inline fn PyODict_CheckExact(op: anytype) @TypeOf(Py_IS_TYPE(op, &PyODict_Type)) {
    _ = &op;
    return Py_IS_TYPE(op, &PyODict_Type);
}
pub inline fn PyODict_SIZE(op: anytype) @TypeOf(PyDict_GET_SIZE(op)) {
    _ = &op;
    return PyDict_GET_SIZE(op);
}
pub inline fn PyODict_GetItem(od: anytype, key: anytype) @TypeOf(PyDict_GetItem(_PyObject_CAST(od), key)) {
    _ = &od;
    _ = &key;
    return PyDict_GetItem(_PyObject_CAST(od), key);
}
pub inline fn PyODict_GetItemWithError(od: anytype, key: anytype) @TypeOf(PyDict_GetItemWithError(_PyObject_CAST(od), key)) {
    _ = &od;
    _ = &key;
    return PyDict_GetItemWithError(_PyObject_CAST(od), key);
}
pub inline fn PyODict_Contains(od: anytype, key: anytype) @TypeOf(PyDict_Contains(_PyObject_CAST(od), key)) {
    _ = &od;
    _ = &key;
    return PyDict_Contains(_PyObject_CAST(od), key);
}
pub inline fn PyODict_Size(od: anytype) @TypeOf(PyDict_Size(_PyObject_CAST(od))) {
    _ = &od;
    return PyDict_Size(_PyObject_CAST(od));
}
pub inline fn PyODict_GetItemString(od: anytype, key: anytype) @TypeOf(PyDict_GetItemString(_PyObject_CAST(od), key)) {
    _ = &od;
    _ = &key;
    return PyDict_GetItemString(_PyObject_CAST(od), key);
}
pub const Py_ENUMOBJECT_H = "";
pub const Py_SETOBJECT_H = "";
pub inline fn PyFrozenSet_CheckExact(ob: anytype) @TypeOf(Py_IS_TYPE(ob, &PyFrozenSet_Type)) {
    _ = &ob;
    return Py_IS_TYPE(ob, &PyFrozenSet_Type);
}
pub inline fn PyFrozenSet_Check(ob: anytype) @TypeOf((Py_IS_TYPE(ob, &PyFrozenSet_Type) != 0) or (PyType_IsSubtype(Py_TYPE(ob), &PyFrozenSet_Type) != 0)) {
    _ = &ob;
    return (Py_IS_TYPE(ob, &PyFrozenSet_Type) != 0) or (PyType_IsSubtype(Py_TYPE(ob), &PyFrozenSet_Type) != 0);
}
pub inline fn PyAnySet_CheckExact(ob: anytype) @TypeOf((Py_IS_TYPE(ob, &PySet_Type) != 0) or (Py_IS_TYPE(ob, &PyFrozenSet_Type) != 0)) {
    _ = &ob;
    return (Py_IS_TYPE(ob, &PySet_Type) != 0) or (Py_IS_TYPE(ob, &PyFrozenSet_Type) != 0);
}
pub inline fn PyAnySet_Check(ob: anytype) @TypeOf((((Py_IS_TYPE(ob, &PySet_Type) != 0) or (Py_IS_TYPE(ob, &PyFrozenSet_Type) != 0)) or (PyType_IsSubtype(Py_TYPE(ob), &PySet_Type) != 0)) or (PyType_IsSubtype(Py_TYPE(ob), &PyFrozenSet_Type) != 0)) {
    _ = &ob;
    return (((Py_IS_TYPE(ob, &PySet_Type) != 0) or (Py_IS_TYPE(ob, &PyFrozenSet_Type) != 0)) or (PyType_IsSubtype(Py_TYPE(ob), &PySet_Type) != 0)) or (PyType_IsSubtype(Py_TYPE(ob), &PyFrozenSet_Type) != 0);
}
pub inline fn PySet_CheckExact(op: anytype) @TypeOf(Py_IS_TYPE(op, &PySet_Type)) {
    _ = &op;
    return Py_IS_TYPE(op, &PySet_Type);
}
pub inline fn PySet_Check(ob: anytype) @TypeOf((Py_IS_TYPE(ob, &PySet_Type) != 0) or (PyType_IsSubtype(Py_TYPE(ob), &PySet_Type) != 0)) {
    _ = &ob;
    return (Py_IS_TYPE(ob, &PySet_Type) != 0) or (PyType_IsSubtype(Py_TYPE(ob), &PySet_Type) != 0);
}
pub const PySet_MINSIZE = @as(c_int, 8);
pub inline fn _PySet_CAST(so: anytype) @TypeOf(_Py_CAST([*c]PySetObject, so)) {
    _ = &so;
    return blk_1: {
        _ = assert(PyAnySet_Check(so));
        break :blk_1 _Py_CAST([*c]PySetObject, so);
    };
}
pub const Py_METHODOBJECT_H = "";
pub inline fn PyCFunction_CheckExact(op: anytype) @TypeOf(Py_IS_TYPE(op, &PyCFunction_Type)) {
    _ = &op;
    return Py_IS_TYPE(op, &PyCFunction_Type);
}
pub inline fn PyCFunction_Check(op: anytype) @TypeOf(PyObject_TypeCheck(op, &PyCFunction_Type)) {
    _ = &op;
    return PyObject_TypeCheck(op, &PyCFunction_Type);
}
pub const _PyCFunction_CAST = @compileError("unable to translate C expr: unexpected token ')'"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\methodobject.h:52:9
pub const METH_VARARGS = @as(c_int, 0x0001);
pub const METH_KEYWORDS = @as(c_int, 0x0002);
pub const METH_NOARGS = @as(c_int, 0x0004);
pub const METH_O = @as(c_int, 0x0008);
pub const METH_CLASS = @as(c_int, 0x0010);
pub const METH_STATIC = @as(c_int, 0x0020);
pub const METH_COEXIST = @as(c_int, 0x0040);
pub const METH_FASTCALL = @as(c_int, 0x0080);
pub const METH_STACKLESS = @as(c_int, 0x0000);
pub const METH_METHOD = @as(c_int, 0x0200);
pub inline fn _PyCFunctionObject_CAST(func: anytype) @TypeOf(_Py_CAST([*c]PyCFunctionObject, func)) {
    _ = &func;
    return blk_1: {
        _ = assert(PyCFunction_Check(func));
        break :blk_1 _Py_CAST([*c]PyCFunctionObject, func);
    };
}
pub inline fn _PyCMethodObject_CAST(func: anytype) @TypeOf(_Py_CAST([*c]PyCMethodObject, func)) {
    _ = &func;
    return blk_1: {
        _ = assert(PyCMethod_Check(func));
        break :blk_1 _Py_CAST([*c]PyCMethodObject, func);
    };
}
pub inline fn PyCMethod_CheckExact(op: anytype) @TypeOf(Py_IS_TYPE(op, &PyCMethod_Type)) {
    _ = &op;
    return Py_IS_TYPE(op, &PyCMethod_Type);
}
pub inline fn PyCMethod_Check(op: anytype) @TypeOf(PyObject_TypeCheck(op, &PyCMethod_Type)) {
    _ = &op;
    return PyObject_TypeCheck(op, &PyCMethod_Type);
}
pub const Py_MODULEOBJECT_H = "";
pub inline fn PyModule_Check(op: anytype) @TypeOf(PyObject_TypeCheck(op, &PyModule_Type)) {
    _ = &op;
    return PyObject_TypeCheck(op, &PyModule_Type);
}
pub inline fn PyModule_CheckExact(op: anytype) @TypeOf(Py_IS_TYPE(op, &PyModule_Type)) {
    _ = &op;
    return Py_IS_TYPE(op, &PyModule_Type);
}
pub const PyModuleDef_HEAD_INIT = @compileError("unable to translate C expr: unexpected token '{'"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\moduleobject.h:60:9
pub const Py_mod_create = @as(c_int, 1);
pub const Py_mod_exec = @as(c_int, 2);
pub const Py_mod_multiple_interpreters = @as(c_int, 3);
pub const Py_mod_gil = @as(c_int, 4);
pub const _Py_mod_LAST_SLOT = @as(c_int, 4);
pub const Py_MOD_MULTIPLE_INTERPRETERS_NOT_SUPPORTED = __helpers.cast(?*anyopaque, @as(c_int, 0));
pub const Py_MOD_MULTIPLE_INTERPRETERS_SUPPORTED = __helpers.cast(?*anyopaque, @as(c_int, 1));
pub const Py_MOD_PER_INTERPRETER_GIL_SUPPORTED = __helpers.cast(?*anyopaque, @as(c_int, 2));
pub const Py_MOD_GIL_USED = __helpers.cast(?*anyopaque, @as(c_int, 0));
pub const Py_MOD_GIL_NOT_USED = __helpers.cast(?*anyopaque, @as(c_int, 1));
pub const Py_MONITORING_H = "";
pub const PY_MONITORING_EVENT_PY_START = @as(c_int, 0);
pub const PY_MONITORING_EVENT_PY_RESUME = @as(c_int, 1);
pub const PY_MONITORING_EVENT_PY_RETURN = @as(c_int, 2);
pub const PY_MONITORING_EVENT_PY_YIELD = @as(c_int, 3);
pub const PY_MONITORING_EVENT_CALL = @as(c_int, 4);
pub const PY_MONITORING_EVENT_LINE = @as(c_int, 5);
pub const PY_MONITORING_EVENT_INSTRUCTION = @as(c_int, 6);
pub const PY_MONITORING_EVENT_JUMP = @as(c_int, 7);
pub const PY_MONITORING_EVENT_BRANCH = @as(c_int, 8);
pub const PY_MONITORING_EVENT_STOP_ITERATION = @as(c_int, 9);
pub inline fn PY_MONITORING_IS_INSTRUMENTED_EVENT(ev: anytype) @TypeOf(ev < _PY_MONITORING_LOCAL_EVENTS) {
    _ = &ev;
    return ev < _PY_MONITORING_LOCAL_EVENTS;
}
pub const PY_MONITORING_EVENT_RAISE = @as(c_int, 10);
pub const PY_MONITORING_EVENT_EXCEPTION_HANDLED = @as(c_int, 11);
pub const PY_MONITORING_EVENT_PY_UNWIND = @as(c_int, 12);
pub const PY_MONITORING_EVENT_PY_THROW = @as(c_int, 13);
pub const PY_MONITORING_EVENT_RERAISE = @as(c_int, 14);
pub const PY_MONITORING_EVENT_C_RETURN = @as(c_int, 15);
pub const PY_MONITORING_EVENT_C_RAISE = @as(c_int, 16);
pub const Py_FUNCOBJECT_H = "";
pub inline fn PyFunction_Check(op: anytype) @TypeOf(Py_IS_TYPE(op, &PyFunction_Type)) {
    _ = &op;
    return Py_IS_TYPE(op, &PyFunction_Type);
}
pub inline fn _PyFunction_CAST(func: anytype) @TypeOf(_Py_CAST([*c]PyFunctionObject, func)) {
    _ = &func;
    return blk_1: {
        _ = assert(PyFunction_Check(func));
        break :blk_1 _Py_CAST([*c]PyFunctionObject, func);
    };
}
pub const PY_FOREACH_FUNC_EVENT = @compileError("unable to translate macro: undefined identifier `CREATE`"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/funcobject.h:131:9
pub const Py_CLASSOBJECT_H = "";
pub inline fn PyMethod_Check(op: anytype) @TypeOf(Py_IS_TYPE(op, &PyMethod_Type)) {
    _ = &op;
    return Py_IS_TYPE(op, &PyMethod_Type);
}
pub inline fn _PyMethod_CAST(meth: anytype) @TypeOf(_Py_CAST([*c]PyMethodObject, meth)) {
    _ = &meth;
    return blk_1: {
        _ = assert(PyMethod_Check(meth));
        break :blk_1 _Py_CAST([*c]PyMethodObject, meth);
    };
}
pub inline fn PyInstanceMethod_Check(op: anytype) @TypeOf(Py_IS_TYPE(op, &PyInstanceMethod_Type)) {
    _ = &op;
    return Py_IS_TYPE(op, &PyInstanceMethod_Type);
}
pub inline fn _PyInstanceMethod_CAST(meth: anytype) @TypeOf(_Py_CAST([*c]PyInstanceMethodObject, meth)) {
    _ = &meth;
    return blk_1: {
        _ = assert(PyInstanceMethod_Check(meth));
        break :blk_1 _Py_CAST([*c]PyInstanceMethodObject, meth);
    };
}
pub const Py_FILEOBJECT_H = "";
pub const PY_STDIOTEXTMODE = "b";
pub const Py_CAPSULE_H = "";
pub inline fn PyCapsule_CheckExact(op: anytype) @TypeOf(Py_IS_TYPE(op, &PyCapsule_Type)) {
    _ = &op;
    return Py_IS_TYPE(op, &PyCapsule_Type);
}
pub const Py_CODE_H = "";
pub const _PY_MONITORING_LOCAL_EVENTS = @as(c_int, 10);
pub const _PY_MONITORING_UNGROUPED_EVENTS = @as(c_int, 15);
pub const _PY_MONITORING_EVENTS = @as(c_int, 17);
pub const _PyCode_DEF = @compileError("unable to translate macro: undefined identifier `co_consts`"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/code.h:73:9
pub const CO_OPTIMIZED = @as(c_int, 0x0001);
pub const CO_NEWLOCALS = @as(c_int, 0x0002);
pub const CO_VARARGS = @as(c_int, 0x0004);
pub const CO_VARKEYWORDS = @as(c_int, 0x0008);
pub const CO_NESTED = @as(c_int, 0x0010);
pub const CO_GENERATOR = @as(c_int, 0x0020);
pub const CO_COROUTINE = @as(c_int, 0x0080);
pub const CO_ITERABLE_COROUTINE = @as(c_int, 0x0100);
pub const CO_ASYNC_GENERATOR = @as(c_int, 0x0200);
pub const CO_FUTURE_DIVISION = __helpers.promoteIntLiteral(c_int, 0x20000, .hex);
pub const CO_FUTURE_ABSOLUTE_IMPORT = __helpers.promoteIntLiteral(c_int, 0x40000, .hex);
pub const CO_FUTURE_WITH_STATEMENT = __helpers.promoteIntLiteral(c_int, 0x80000, .hex);
pub const CO_FUTURE_PRINT_FUNCTION = __helpers.promoteIntLiteral(c_int, 0x100000, .hex);
pub const CO_FUTURE_UNICODE_LITERALS = __helpers.promoteIntLiteral(c_int, 0x200000, .hex);
pub const CO_FUTURE_BARRY_AS_BDFL = __helpers.promoteIntLiteral(c_int, 0x400000, .hex);
pub const CO_FUTURE_GENERATOR_STOP = __helpers.promoteIntLiteral(c_int, 0x800000, .hex);
pub const CO_FUTURE_ANNOTATIONS = __helpers.promoteIntLiteral(c_int, 0x1000000, .hex);
pub const CO_NO_MONITORING_EVENTS = __helpers.promoteIntLiteral(c_int, 0x2000000, .hex);
pub const PY_PARSER_REQUIRES_FUTURE_KEYWORD = "";
pub const CO_MAXBLOCKS = @as(c_int, 21);
pub inline fn PyCode_Check(op: anytype) @TypeOf(Py_IS_TYPE(op, &PyCode_Type)) {
    _ = &op;
    return Py_IS_TYPE(op, &PyCode_Type);
}
pub const PY_FOREACH_CODE_EVENT = @compileError("unable to translate macro: undefined identifier `CREATE`"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/code.h:243:9
pub const Py_PYFRAME_H = "";
pub inline fn PyFrame_Check(op: anytype) @TypeOf(Py_IS_TYPE(op, &PyFrame_Type)) {
    _ = &op;
    return Py_IS_TYPE(op, &PyFrame_Type);
}
pub inline fn PyFrameLocalsProxy_Check(op: anytype) @TypeOf(Py_IS_TYPE(op, &PyFrameLocalsProxy_Type)) {
    _ = &op;
    return Py_IS_TYPE(op, &PyFrameLocalsProxy_Type);
}
pub const PyUnstable_EXECUTABLE_KIND_SKIP = @as(c_int, 0);
pub const PyUnstable_EXECUTABLE_KIND_PY_FUNCTION = @as(c_int, 1);
pub const PyUnstable_EXECUTABLE_KIND_BUILTIN_FUNCTION = @as(c_int, 3);
pub const PyUnstable_EXECUTABLE_KIND_METHOD_DESCRIPTOR = @as(c_int, 4);
pub const PyUnstable_EXECUTABLE_KINDS = @as(c_int, 5);
pub const Py_TRACEBACK_H = "";
pub inline fn PyTraceBack_Check(v: anytype) @TypeOf(Py_IS_TYPE(v, &PyTraceBack_Type)) {
    _ = &v;
    return Py_IS_TYPE(v, &PyTraceBack_Type);
}
pub const Py_SLICEOBJECT_H = "";
// C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\sliceobject.h:14:11: warning: macro 'Py_Ellipsis' contains a runtime value, translated to function
pub inline fn Py_Ellipsis() @TypeOf(&_Py_EllipsisObject) {
    return &_Py_EllipsisObject;
}
pub inline fn PySlice_Check(op: anytype) @TypeOf(Py_IS_TYPE(op, &PySlice_Type)) {
    _ = &op;
    return Py_IS_TYPE(op, &PySlice_Type);
}
pub const Py_CELLOBJECT_H = "";
pub inline fn PyCell_Check(op: anytype) @TypeOf(Py_IS_TYPE(op, &PyCell_Type)) {
    _ = &op;
    return Py_IS_TYPE(op, &PyCell_Type);
}
pub const Py_ITEROBJECT_H = "";
pub inline fn PySeqIter_Check(op: anytype) @TypeOf(Py_IS_TYPE(op, &PySeqIter_Type)) {
    _ = &op;
    return Py_IS_TYPE(op, &PySeqIter_Type);
}
pub inline fn PyCallIter_Check(op: anytype) @TypeOf(Py_IS_TYPE(op, &PyCallIter_Type)) {
    _ = &op;
    return Py_IS_TYPE(op, &PyCallIter_Type);
}
pub const Py_PYCORECONFIG_H = "";
pub const Py_PYSTATE_H = "";
pub const MAX_CO_EXTRA_USERS = @as(c_int, 255);
pub inline fn PyThreadState_GET() @TypeOf(PyThreadState_Get()) {
    return PyThreadState_Get();
}
pub const PyTrace_CALL = @as(c_int, 0);
pub const PyTrace_EXCEPTION = @as(c_int, 1);
pub const PyTrace_LINE = @as(c_int, 2);
pub const PyTrace_RETURN = @as(c_int, 3);
pub const PyTrace_C_CALL = @as(c_int, 4);
pub const PyTrace_C_EXCEPTION = @as(c_int, 5);
pub const PyTrace_C_RETURN = @as(c_int, 6);
pub const PyTrace_OPCODE = @as(c_int, 7);
pub const Py_C_RECURSION_LIMIT = @as(c_int, 3000);
pub const _PyThreadState_UncheckedGet = PyThreadState_GetUnchecked;
pub const Py_GENOBJECT_H = "";
pub inline fn PyGen_Check(op: anytype) @TypeOf(PyObject_TypeCheck(op, &PyGen_Type)) {
    _ = &op;
    return PyObject_TypeCheck(op, &PyGen_Type);
}
pub inline fn PyGen_CheckExact(op: anytype) @TypeOf(Py_IS_TYPE(op, &PyGen_Type)) {
    _ = &op;
    return Py_IS_TYPE(op, &PyGen_Type);
}
pub inline fn PyCoro_CheckExact(op: anytype) @TypeOf(Py_IS_TYPE(op, &PyCoro_Type)) {
    _ = &op;
    return Py_IS_TYPE(op, &PyCoro_Type);
}
pub inline fn PyAsyncGen_CheckExact(op: anytype) @TypeOf(Py_IS_TYPE(op, &PyAsyncGen_Type)) {
    _ = &op;
    return Py_IS_TYPE(op, &PyAsyncGen_Type);
}
pub inline fn PyAsyncGenASend_CheckExact(op: anytype) @TypeOf(Py_IS_TYPE(op, &_PyAsyncGenASend_Type)) {
    _ = &op;
    return Py_IS_TYPE(op, &_PyAsyncGenASend_Type);
}
pub const Py_DESCROBJECT_H = "";
pub const Py_T_SHORT = @as(c_int, 0);
pub const Py_T_INT = @as(c_int, 1);
pub const Py_T_LONG = @as(c_int, 2);
pub const Py_T_FLOAT = @as(c_int, 3);
pub const Py_T_DOUBLE = @as(c_int, 4);
pub const Py_T_STRING = @as(c_int, 5);
pub const _Py_T_OBJECT = @as(c_int, 6);
pub const Py_T_CHAR = @as(c_int, 7);
pub const Py_T_BYTE = @as(c_int, 8);
pub const Py_T_UBYTE = @as(c_int, 9);
pub const Py_T_USHORT = @as(c_int, 10);
pub const Py_T_UINT = @as(c_int, 11);
pub const Py_T_ULONG = @as(c_int, 12);
pub const Py_T_STRING_INPLACE = @as(c_int, 13);
pub const Py_T_BOOL = @as(c_int, 14);
pub const Py_T_OBJECT_EX = @as(c_int, 16);
pub const Py_T_LONGLONG = @as(c_int, 17);
pub const Py_T_ULONGLONG = @as(c_int, 18);
pub const Py_T_PYSSIZET = @as(c_int, 19);
pub const _Py_T_NONE = @as(c_int, 20);
pub const Py_READONLY = @as(c_int, 1);
pub const Py_AUDIT_READ = @as(c_int, 2);
pub const _Py_WRITE_RESTRICTED = @as(c_int, 4);
pub const Py_RELATIVE_OFFSET = @as(c_int, 8);
pub const PyWrapperFlag_KEYWORDS = @as(c_int, 1);
pub const PyDescr_COMMON = @compileError("unable to translate macro: undefined identifier `d_common`"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/descrobject.h:33:9
pub inline fn PyDescr_TYPE(x: anytype) @TypeOf(__helpers.cast([*c]PyDescrObject, x).*.d_type) {
    _ = &x;
    return __helpers.cast([*c]PyDescrObject, x).*.d_type;
}
pub inline fn PyDescr_NAME(x: anytype) @TypeOf(__helpers.cast([*c]PyDescrObject, x).*.d_name) {
    _ = &x;
    return __helpers.cast([*c]PyDescrObject, x).*.d_name;
}
pub const Py_GENERICALIASOBJECT_H = "";
pub const Py_WARNINGS_H = "";
pub inline fn PyErr_Warn(category: anytype, msg: anytype) @TypeOf(PyErr_WarnEx(category, msg, @as(c_int, 1))) {
    _ = &category;
    _ = &msg;
    return PyErr_WarnEx(category, msg, @as(c_int, 1));
}
pub const Py_WEAKREFOBJECT_H = "";
pub inline fn PyWeakref_CheckRef(op: anytype) @TypeOf(PyObject_TypeCheck(op, &_PyWeakref_RefType)) {
    _ = &op;
    return PyObject_TypeCheck(op, &_PyWeakref_RefType);
}
pub inline fn PyWeakref_CheckRefExact(op: anytype) @TypeOf(Py_IS_TYPE(op, &_PyWeakref_RefType)) {
    _ = &op;
    return Py_IS_TYPE(op, &_PyWeakref_RefType);
}
pub inline fn PyWeakref_CheckProxy(op: anytype) @TypeOf((Py_IS_TYPE(op, &_PyWeakref_ProxyType) != 0) or (Py_IS_TYPE(op, &_PyWeakref_CallableProxyType) != 0)) {
    _ = &op;
    return (Py_IS_TYPE(op, &_PyWeakref_ProxyType) != 0) or (Py_IS_TYPE(op, &_PyWeakref_CallableProxyType) != 0);
}
pub inline fn PyWeakref_Check(op: anytype) @TypeOf((PyWeakref_CheckRef(op) != 0) or (PyWeakref_CheckProxy(op) != 0)) {
    _ = &op;
    return (PyWeakref_CheckRef(op) != 0) or (PyWeakref_CheckProxy(op) != 0);
}
pub const Py_STRUCTSEQ_H = "";
pub const PyStructSequence_SET_ITEM = PyStructSequence_SetItem;
pub const PyStructSequence_GET_ITEM = PyStructSequence_GetItem;
pub const Py_PICKLEBUFOBJECT_H = "";
pub inline fn PyPickleBuffer_Check(op: anytype) @TypeOf(Py_IS_TYPE(op, &PyPickleBuffer_Type)) {
    _ = &op;
    return Py_IS_TYPE(op, &PyPickleBuffer_Type);
}
pub const Py_PYTIME_H = "";
pub const PyTime_MIN = INT64_MIN;
pub const PyTime_MAX = INT64_MAX;
pub const Py_CODECREGISTRY_H = "";
pub const Py_PYTHREAD_H = "";
pub const PY_HAVE_THREAD_NATIVE_ID = "";
pub const WAIT_LOCK = @as(c_int, 1);
pub const NOWAIT_LOCK = @as(c_int, 0);
pub const PY_TIMEOUT_T = c_longlong;
pub const PYTHREAD_INVALID_THREAD_ID = __helpers.cast(c_ulong, -@as(c_int, 1));
pub const Py_tss_NEEDS_INIT = @compileError("unable to translate C expr: unexpected token '{'"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pythread.h:43:9
pub const Py_CONTEXT_H = "";
pub inline fn PyContext_CheckExact(o: anytype) @TypeOf(Py_IS_TYPE(o, &PyContext_Type)) {
    _ = &o;
    return Py_IS_TYPE(o, &PyContext_Type);
}
pub inline fn PyContextVar_CheckExact(o: anytype) @TypeOf(Py_IS_TYPE(o, &PyContextVar_Type)) {
    _ = &o;
    return Py_IS_TYPE(o, &PyContextVar_Type);
}
pub inline fn PyContextToken_CheckExact(o: anytype) @TypeOf(Py_IS_TYPE(o, &PyContextToken_Type)) {
    _ = &o;
    return Py_IS_TYPE(o, &PyContextToken_Type);
}
pub const Py_MODSUPPORT_H = "";
pub const PyModule_AddIntMacro = @compileError("unable to translate C expr: unexpected token ''"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\modsupport.h:47:9
pub const PyModule_AddStringMacro = @compileError("unable to translate C expr: unexpected token ''"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\modsupport.h:48:9
pub const Py_CLEANUP_SUPPORTED = __helpers.promoteIntLiteral(c_int, 0x20000, .hex);
pub const PYTHON_API_VERSION = @as(c_int, 1013);
pub const PYTHON_API_STRING = "1013";
pub const PYTHON_ABI_VERSION = @as(c_int, 3);
pub const PYTHON_ABI_STRING = "3";
pub inline fn PyModule_Create(module: anytype) @TypeOf(PyModule_Create2(module, PYTHON_API_VERSION)) {
    _ = &module;
    return PyModule_Create2(module, PYTHON_API_VERSION);
}
pub inline fn PyModule_FromDefAndSpec(module: anytype, spec: anytype) @TypeOf(PyModule_FromDefAndSpec2(module, spec, PYTHON_API_VERSION)) {
    _ = &module;
    _ = &spec;
    return PyModule_FromDefAndSpec2(module, spec, PYTHON_API_VERSION);
}
pub const Py_COMPILE_H = "";
pub const Py_single_input = @as(c_int, 256);
pub const Py_file_input = @as(c_int, 257);
pub const Py_eval_input = @as(c_int, 258);
pub const Py_func_type_input = @as(c_int, 345);
pub const PyCF_MASK = ((((((CO_FUTURE_DIVISION | CO_FUTURE_ABSOLUTE_IMPORT) | CO_FUTURE_WITH_STATEMENT) | CO_FUTURE_PRINT_FUNCTION) | CO_FUTURE_UNICODE_LITERALS) | CO_FUTURE_BARRY_AS_BDFL) | CO_FUTURE_GENERATOR_STOP) | CO_FUTURE_ANNOTATIONS;
pub const PyCF_MASK_OBSOLETE = CO_NESTED;
pub const PyCF_SOURCE_IS_UTF8 = @as(c_int, 0x0100);
pub const PyCF_DONT_IMPLY_DEDENT = @as(c_int, 0x0200);
pub const PyCF_ONLY_AST = @as(c_int, 0x0400);
pub const PyCF_IGNORE_COOKIE = @as(c_int, 0x0800);
pub const PyCF_TYPE_COMMENTS = @as(c_int, 0x1000);
pub const PyCF_ALLOW_TOP_LEVEL_AWAIT = @as(c_int, 0x2000);
pub const PyCF_ALLOW_INCOMPLETE_INPUT = @as(c_int, 0x4000);
pub const PyCF_OPTIMIZED_AST = __helpers.promoteIntLiteral(c_int, 0x8000, .hex) | PyCF_ONLY_AST;
pub const PyCF_COMPILE_MASK = ((((PyCF_ONLY_AST | PyCF_ALLOW_TOP_LEVEL_AWAIT) | PyCF_TYPE_COMMENTS) | PyCF_DONT_IMPLY_DEDENT) | PyCF_ALLOW_INCOMPLETE_INPUT) | PyCF_OPTIMIZED_AST;
pub const _PyCompilerFlags_INIT = @import("std").mem.zeroInit(PyCompilerFlags, .{
    .cf_flags = @as(c_int, 0),
    .cf_feature_version = PY_MINOR_VERSION,
});
pub const FUTURE_NESTED_SCOPES = "nested_scopes";
pub const FUTURE_GENERATORS = "generators";
pub const FUTURE_DIVISION = "division";
pub const FUTURE_ABSOLUTE_IMPORT = "absolute_import";
pub const FUTURE_WITH_STATEMENT = "with_statement";
pub const FUTURE_PRINT_FUNCTION = "print_function";
pub const FUTURE_UNICODE_LITERALS = "unicode_literals";
pub const FUTURE_BARRY_AS_BDFL = "barry_as_FLUFL";
pub const FUTURE_GENERATOR_STOP = "generator_stop";
pub const FUTURE_ANNOTATIONS = "annotations";
pub const PY_INVALID_STACK_EFFECT = INT_MAX;
pub const Py_PYTHONRUN_H = "";
pub const PYOS_STACK_MARGIN = @as(c_int, 2048);
pub inline fn Py_CompileStringFlags(str: anytype, p: anytype, s: anytype, f: anytype) @TypeOf(Py_CompileStringExFlags(str, p, s, f, -@as(c_int, 1))) {
    _ = &str;
    _ = &p;
    _ = &s;
    _ = &f;
    return Py_CompileStringExFlags(str, p, s, f, -@as(c_int, 1));
}
pub const Py_PYLIFECYCLE_H = "";
pub const PyInterpreterConfig_DEFAULT_GIL = @as(c_int, 0);
pub const PyInterpreterConfig_SHARED_GIL = @as(c_int, 1);
pub const PyInterpreterConfig_OWN_GIL = @as(c_int, 2);
pub const _PyInterpreterConfig_INIT = @compileError("unable to translate C expr: unexpected token '{'"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pylifecycle.h:55:9
pub const _PyInterpreterConfig_LEGACY_CHECK_MULTI_INTERP_EXTENSIONS = @as(c_int, 0);
pub const _PyInterpreterConfig_LEGACY_INIT = @compileError("unable to translate C expr: unexpected token '{'"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/pylifecycle.h:75:9
pub const Py_CEVAL_H = "";
pub const Py_BEGIN_ALLOW_THREADS = @compileError("unable to translate macro: undefined identifier `_save`"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\ceval.h:119:9
pub const Py_BLOCK_THREADS = @compileError("unable to translate macro: undefined identifier `_save`"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\ceval.h:122:9
pub const Py_UNBLOCK_THREADS = @compileError("unable to translate macro: undefined identifier `_save`"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\ceval.h:123:9
pub const Py_END_ALLOW_THREADS = @compileError("unable to translate macro: undefined identifier `_save`"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\ceval.h:124:9
pub const FVC_MASK = @as(c_int, 0x3);
pub const FVC_NONE = @as(c_int, 0x0);
pub const FVC_STR = @as(c_int, 0x1);
pub const FVC_REPR = @as(c_int, 0x2);
pub const FVC_ASCII = @as(c_int, 0x3);
pub const FVS_MASK = @as(c_int, 0x4);
pub const FVS_HAVE_SPEC = @as(c_int, 0x4);
pub const Py_SYSMODULE_H = "";
pub const Py_OSMODULE_H = "";
pub const Py_INTRCHECK_H = "";
pub const Py_IMPORT_H = "";
pub inline fn PyImport_ImportModuleEx(n: anytype, g: anytype, l: anytype, f: anytype) @TypeOf(PyImport_ImportModuleLevel(n, g, l, f, @as(c_int, 0))) {
    _ = &n;
    _ = &g;
    _ = &l;
    _ = &f;
    return PyImport_ImportModuleLevel(n, g, l, f, @as(c_int, 0));
}
pub const Py_ABSTRACTOBJECT_H = "";
pub const PY_VECTORCALL_ARGUMENTS_OFFSET = _Py_STATIC_CAST(usize, @as(c_int, 1)) << ((@as(c_int, 8) * __helpers.sizeof(usize)) - @as(c_int, 1));
pub inline fn PySequence_Fast_GET_SIZE(o: anytype) @TypeOf(if (__helpers.cast(bool, PyList_Check(o))) PyList_GET_SIZE(o) else PyTuple_GET_SIZE(o)) {
    _ = &o;
    return if (__helpers.cast(bool, PyList_Check(o))) PyList_GET_SIZE(o) else PyTuple_GET_SIZE(o);
}
pub inline fn PySequence_Fast_GET_ITEM(o: anytype, i: anytype) @TypeOf(if (__helpers.cast(bool, PyList_Check(o))) PyList_GET_ITEM(o, i) else PyTuple_GET_ITEM(o, i)) {
    _ = &o;
    _ = &i;
    return if (__helpers.cast(bool, PyList_Check(o))) PyList_GET_ITEM(o, i) else PyTuple_GET_ITEM(o, i);
}
pub inline fn PySequence_Fast_ITEMS(sf: anytype) @TypeOf(if (__helpers.cast(bool, PyList_Check(sf))) __helpers.cast([*c]PyListObject, sf).*.ob_item else __helpers.cast([*c]PyTupleObject, sf).*.ob_item) {
    _ = &sf;
    return if (__helpers.cast(bool, PyList_Check(sf))) __helpers.cast([*c]PyListObject, sf).*.ob_item else __helpers.cast([*c]PyTupleObject, sf).*.ob_item;
}
pub inline fn PyMapping_DelItemString(O: anytype, K: anytype) @TypeOf(PyObject_DelItemString(O, K)) {
    _ = &O;
    _ = &K;
    return PyObject_DelItemString(O, K);
}
pub inline fn PyMapping_DelItem(O: anytype, K: anytype) @TypeOf(PyObject_DelItem(O, K)) {
    _ = &O;
    _ = &K;
    return PyObject_DelItem(O, K);
}
pub const _PyObject_Vectorcall = PyObject_Vectorcall;
pub const _PyObject_VectorcallMethod = PyObject_VectorcallMethod;
pub const _PyObject_FastCallDict = PyObject_VectorcallDict;
pub const _PyVectorcall_Function = PyVectorcall_Function;
pub const _PyObject_CallOneArg = PyObject_CallOneArg;
pub const _PyObject_CallMethodNoArgs = PyObject_CallMethodNoArgs;
pub const _PyObject_CallMethodOneArg = PyObject_CallMethodOneArg;
pub inline fn PySequence_ITEM(o: anytype, i: anytype) @TypeOf(Py_TYPE(o).*.tp_as_sequence.*.sq_item(o, i)) {
    _ = &o;
    _ = &i;
    return Py_TYPE(o).*.tp_as_sequence.*.sq_item(o, i);
}
pub const Py_BLTINMODULE_H = "";
pub const Py_CRITICAL_SECTION_H = "";
pub const Py_BEGIN_CRITICAL_SECTION = @compileError("unable to translate C expr: unexpected token '{'"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/critical_section.h:86:10
pub const Py_END_CRITICAL_SECTION = @compileError("unable to translate C expr: unexpected token '}'"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/critical_section.h:88:10
pub const Py_BEGIN_CRITICAL_SECTION2 = @compileError("unable to translate C expr: unexpected token '{'"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/critical_section.h:90:10
pub const Py_END_CRITICAL_SECTION2 = @compileError("unable to translate C expr: unexpected token '}'"); // C:\Users\jango\Desktop\b_x_utils\py_modules\zig_modules\src\include\cpython/critical_section.h:92:10
pub const PYCTYPE_H = "";
pub const PY_CTF_LOWER = @as(c_int, 0x01);
pub const PY_CTF_UPPER = @as(c_int, 0x02);
pub const PY_CTF_ALPHA = PY_CTF_LOWER | PY_CTF_UPPER;
pub const PY_CTF_DIGIT = @as(c_int, 0x04);
pub const PY_CTF_ALNUM = PY_CTF_ALPHA | PY_CTF_DIGIT;
pub const PY_CTF_SPACE = @as(c_int, 0x08);
pub const PY_CTF_XDIGIT = @as(c_int, 0x10);
pub inline fn Py_ISLOWER(c: anytype) @TypeOf(_Py_ctype_table[@as(usize, @intCast(Py_CHARMASK(c)))] & PY_CTF_LOWER) {
    _ = &c;
    return _Py_ctype_table[@as(usize, @intCast(Py_CHARMASK(c)))] & PY_CTF_LOWER;
}
pub inline fn Py_ISUPPER(c: anytype) @TypeOf(_Py_ctype_table[@as(usize, @intCast(Py_CHARMASK(c)))] & PY_CTF_UPPER) {
    _ = &c;
    return _Py_ctype_table[@as(usize, @intCast(Py_CHARMASK(c)))] & PY_CTF_UPPER;
}
pub inline fn Py_ISALPHA(c: anytype) @TypeOf(_Py_ctype_table[@as(usize, @intCast(Py_CHARMASK(c)))] & PY_CTF_ALPHA) {
    _ = &c;
    return _Py_ctype_table[@as(usize, @intCast(Py_CHARMASK(c)))] & PY_CTF_ALPHA;
}
pub inline fn Py_ISDIGIT(c: anytype) @TypeOf(_Py_ctype_table[@as(usize, @intCast(Py_CHARMASK(c)))] & PY_CTF_DIGIT) {
    _ = &c;
    return _Py_ctype_table[@as(usize, @intCast(Py_CHARMASK(c)))] & PY_CTF_DIGIT;
}
pub inline fn Py_ISXDIGIT(c: anytype) @TypeOf(_Py_ctype_table[@as(usize, @intCast(Py_CHARMASK(c)))] & PY_CTF_XDIGIT) {
    _ = &c;
    return _Py_ctype_table[@as(usize, @intCast(Py_CHARMASK(c)))] & PY_CTF_XDIGIT;
}
pub inline fn Py_ISALNUM(c: anytype) @TypeOf(_Py_ctype_table[@as(usize, @intCast(Py_CHARMASK(c)))] & PY_CTF_ALNUM) {
    _ = &c;
    return _Py_ctype_table[@as(usize, @intCast(Py_CHARMASK(c)))] & PY_CTF_ALNUM;
}
pub inline fn Py_ISSPACE(c: anytype) @TypeOf(_Py_ctype_table[@as(usize, @intCast(Py_CHARMASK(c)))] & PY_CTF_SPACE) {
    _ = &c;
    return _Py_ctype_table[@as(usize, @intCast(Py_CHARMASK(c)))] & PY_CTF_SPACE;
}
pub inline fn Py_TOLOWER(c: anytype) @TypeOf(_Py_ctype_tolower[@as(usize, @intCast(Py_CHARMASK(c)))]) {
    _ = &c;
    return _Py_ctype_tolower[@as(usize, @intCast(Py_CHARMASK(c)))];
}
pub inline fn Py_TOUPPER(c: anytype) @TypeOf(_Py_ctype_toupper[@as(usize, @intCast(Py_CHARMASK(c)))]) {
    _ = &c;
    return _Py_ctype_toupper[@as(usize, @intCast(Py_CHARMASK(c)))];
}
pub const Py_STRTOD_H = "";
pub const Py_DTSF_SIGN = @as(c_int, 0x01);
pub const Py_DTSF_ADD_DOT_0 = @as(c_int, 0x02);
pub const Py_DTSF_ALT = @as(c_int, 0x04);
pub const Py_DTSF_NO_NEG_0 = @as(c_int, 0x08);
pub const Py_DTST_FINITE = @as(c_int, 0);
pub const Py_DTST_INFINITE = @as(c_int, 1);
pub const Py_DTST_NAN = @as(c_int, 2);
pub const Py_STRCMP_H = "";
pub const PyOS_strnicmp = strnicmp;
pub const PyOS_stricmp = stricmp;
pub const Py_FILEUTILS_H = "";
pub const _INC_STAT = "";
pub const _S_IFMT = __helpers.promoteIntLiteral(c_int, 0xF000, .hex);
pub const _S_IFDIR = @as(c_int, 0x4000);
pub const _S_IFCHR = @as(c_int, 0x2000);
pub const _S_IFIFO = @as(c_int, 0x1000);
pub const _S_IFREG = __helpers.promoteIntLiteral(c_int, 0x8000, .hex);
pub const _S_IREAD = @as(c_int, 0x0100);
pub const _S_IWRITE = @as(c_int, 0x0080);
pub const _S_IEXEC = @as(c_int, 0x0040);
pub const _S_IFBLK = @as(c_int, 0x6000);
pub const S_IFMT = _S_IFMT;
pub const S_IFDIR = _S_IFDIR;
pub const S_IFCHR = _S_IFCHR;
pub const S_IFREG = _S_IFREG;
pub const S_IREAD = _S_IREAD;
pub const S_IWRITE = _S_IWRITE;
pub const S_IEXEC = _S_IEXEC;
pub const S_IFIFO = _S_IFIFO;
pub const S_IFBLK = _S_IFBLK;
pub const _S_IRWXU = (_S_IREAD | _S_IWRITE) | _S_IEXEC;
pub const _S_IXUSR = _S_IEXEC;
pub const _S_IWUSR = _S_IWRITE;
pub const S_IRWXU = _S_IRWXU;
pub const S_IXUSR = _S_IXUSR;
pub const S_IWUSR = _S_IWUSR;
pub const S_IRUSR = _S_IRUSR;
pub const _S_IRUSR = _S_IREAD;
pub const S_IRGRP = S_IRUSR >> @as(c_int, 3);
pub const S_IWGRP = S_IWUSR >> @as(c_int, 3);
pub const S_IXGRP = S_IXUSR >> @as(c_int, 3);
pub const S_IRWXG = S_IRWXU >> @as(c_int, 3);
pub const S_IROTH = S_IRGRP >> @as(c_int, 3);
pub const S_IWOTH = S_IWGRP >> @as(c_int, 3);
pub const S_IXOTH = S_IXGRP >> @as(c_int, 3);
pub const S_IRWXO = S_IRWXG >> @as(c_int, 3);
pub inline fn S_ISDIR(m: anytype) @TypeOf((m & S_IFMT) == S_IFDIR) {
    _ = &m;
    return (m & S_IFMT) == S_IFDIR;
}
pub inline fn S_ISFIFO(m: anytype) @TypeOf((m & S_IFMT) == S_IFIFO) {
    _ = &m;
    return (m & S_IFMT) == S_IFIFO;
}
pub inline fn S_ISCHR(m: anytype) @TypeOf((m & S_IFMT) == S_IFCHR) {
    _ = &m;
    return (m & S_IFMT) == S_IFCHR;
}
pub inline fn S_ISBLK(m: anytype) @TypeOf((m & S_IFMT) == S_IFBLK) {
    _ = &m;
    return (m & S_IFMT) == S_IFBLK;
}
pub inline fn S_ISREG(m: anytype) @TypeOf((m & S_IFMT) == S_IFREG) {
    _ = &m;
    return (m & S_IFMT) == S_IFREG;
}
pub const S_IFLNK = __helpers.promoteIntLiteral(c_int, 0o120000, .octal);
pub inline fn S_ISLNK(x: anytype) @TypeOf((x & S_IFMT) == S_IFLNK) {
    _ = &x;
    return (x & S_IFMT) == S_IFLNK;
}
pub const Py_PYFPE_H = "";
pub inline fn PyFPE_START_PROTECT(err_string: anytype, leave_stmt: anytype) void {
    _ = &err_string;
    _ = &leave_stmt;
    return;
}
pub inline fn PyFPE_END_PROTECT(v: anytype) void {
    _ = &v;
    return;
}
pub const Py_TRACEMALLOC_H = "";
pub const threadlocaleinfostruct = struct_threadlocaleinfostruct;
pub const threadmbcinfostruct = struct_threadmbcinfostruct;
pub const __lc_time_data = struct___lc_time_data;
pub const localeinfo_struct = struct_localeinfo_struct;
pub const tagLC_ID = struct_tagLC_ID;
pub const _finddata32_t = struct__finddata32_t;
pub const _finddata32i64_t = struct__finddata32i64_t;
pub const _finddata64i32_t = struct__finddata64i32_t;
pub const __finddata64_t = struct___finddata64_t;
pub const _wfinddata32_t = struct__wfinddata32_t;
pub const _wfinddata32i64_t = struct__wfinddata32i64_t;
pub const _wfinddata64i32_t = struct__wfinddata64i32_t;
pub const _wfinddata64_t = struct__wfinddata64_t;
pub const _iobuf = struct__iobuf;
pub const _exception = struct__exception;
pub const _complex = struct__complex;
pub const tm = struct_tm;
pub const timespec = struct_timespec;
pub const itimerspec = struct_itimerspec;
pub const _div_t = struct__div_t;
pub const _ldiv_t = struct__ldiv_t;
pub const _heapinfo = struct__heapinfo;
pub const _typeobject = struct__typeobject;
pub const _object = struct__object;
pub const _longobject = struct__longobject;
pub const _frame = struct__frame;
pub const _is = struct__is;
pub const _ts = struct__ts;
pub const _specialization_cache = struct__specialization_cache;
pub const _heaptypeobject = struct__heaptypeobject;
pub const PyUnicode_Kind = enum_PyUnicode_Kind;
pub const _dictvalues = struct__dictvalues;
pub const _odictobject = struct__odictobject;
pub const _PyMonitoringState = struct__PyMonitoringState;
pub const _opaque = struct__opaque;
pub const _line_offsets = struct__line_offsets;
pub const _PyInterpreterFrame = struct__PyInterpreterFrame;
pub const _traceback = struct__traceback;
pub const _err_stackitem = struct__err_stackitem;
pub const _stack_chunk = struct__stack_chunk;
pub const wrapperbase = struct_wrapperbase;
pub const _PyWeakReference = struct__PyWeakReference;
pub const _Py_tss_t = struct__Py_tss_t;
pub const _pycontextobject = struct__pycontextobject;
pub const _pycontextvarobject = struct__pycontextvarobject;
pub const _pycontexttokenobject = struct__pycontexttokenobject;
pub const _inittab = struct__inittab;
pub const _frozen = struct__frozen;
