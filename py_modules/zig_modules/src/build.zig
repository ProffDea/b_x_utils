const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addLibrary(.{
        .name = "x_mesh_zig",
        .linkage = .dynamic,
        .root_module = b.createModule(.{
            .root_source_file = b.path("py_wrapper.zig"),
            .target = target,
            .optimize = optimize,
            .link_libc = true, // Otherwise it complains about not being able to find io.h and other standard c libraries.
        }),
    });

    lib.root_module.addLibraryPath(b.path("libs"));
    lib.root_module.linkSystemLibrary("python313", .{}); // Gotta link to this otherwise it complains about missing "__declspec(dllimport) PyModule_Create2"

    var pyconfig_exists = true; // check if pyconfig.h was already made from a previous build
    std.Io.Dir.cwd().access(b.graph.io, "cpython/pyconfig.h", .{}) catch |e| switch (e) {
        error.FileNotFound => pyconfig_exists = false,
        else => {},
    };
    if (!pyconfig_exists) {
        if (target.result.os.tag == .windows) {
            // cpython maintains a manual configuration of pyconfig.h for windows so we simply copy the file to let the linker find it
            const cwd = std.Io.Dir.cwd();
            cwd.copyFile("cpython/PC/pyconfig.h.in", cwd, "cpython/pyconfig.h", b.graph.io, .{}) catch |e| {
                lib.step.dependOn(&b.addFail(@errorName(e)).step);
            };
        } else {
            // any other os will need to auto-generate the pyconfig.h file, so run cpython's configure script to create it
            const pyconfig = b.addSystemCommand(&.{
                "./configure",
                "--enable-optimizations",
                "--without-ensurepip",
            });
            pyconfig.setCwd(b.path("cpython"));
            lib.step.dependOn(&pyconfig.step);
        }
    }

    lib.root_module.addIncludePath(b.path("cpython")); // look for pyconfig.h in here
    lib.root_module.addIncludePath(b.path("cpython/Include"));
    // lib.root_module.addCSourceFile(.{ .file = b.path("py_module.c") });

    var dest_sub_path: []const u8 = "x_mesh_zig.so"; // rename lib file so python can find it
    if (target.result.os.tag == .windows) {
        dest_sub_path = "x_mesh_zig.pyd"; // rename lib file so python on windows can find it
    }
    const target_output = b.addInstallArtifact(lib, .{
        .dest_sub_path = dest_sub_path,
    });
    b.getInstallStep().dependOn(&target_output.step);
}
