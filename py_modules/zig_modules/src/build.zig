const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addLibrary(.{
        .name = "x_mesh_zig",
        .linkage = .dynamic,
        .version = .{ .major = 0, .minor = 0, .patch = 0 },
        .root_module = b.createModule(.{
            .root_source_file = b.path("py_wrapper.zig"),
            .target = target,
            .optimize = optimize,
            .link_libc = true, // Otherwise it complains about not being able to find io.h and other standard c libraries.
        }),
    });

    lib.root_module.addLibraryPath(b.path("libs"));
    lib.root_module.linkSystemLibrary("python313", .{}); // Gotta link to this otherwise it complains about missing "__declspec(dllimport) PyModule_Create2"
    lib.root_module.addIncludePath(b.path("include"));
    // lib.root_module.addCSourceFile(.{ .file = b.path("py_module.c") });

    b.installArtifact(lib);
}
