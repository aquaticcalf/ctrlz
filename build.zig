const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib_mod = b.addModule("ctrlz", .{
        .root_source_file = b.path("pkg/ctrlz/main.zig"),
        .target = target,
    });

    const exe_mod = b.createModule(.{
        .root_source_file = b.path("cmd/ctrlz/main.zig"),
        .target = target,
        .optimize = optimize,
        .imports = &.{
            .{ .name = "ctrlz", .module = lib_mod },
        },
    });

    const exe = b.addExecutable(.{
        .name = "ctrlz",
        .root_module = exe_mod,
    });

    b.installArtifact(exe);

    const run_cmd = b.step("run", "run the app");
    const run_artifact = b.addRunArtifact(exe);
    run_cmd.dependOn(&run_artifact.step);
    run_artifact.step.dependOn(b.getInstallStep());
    run_artifact.addPassthruArgs();

    const lib_tests = b.addTest(.{
        .root_module = lib_mod,
    });

    const exe_tests = b.addTest(.{
        .root_module = exe_mod,
    });

    const test_step = b.step("test", "run tests");
    test_step.dependOn(&b.addRunArtifact(lib_tests).step);
    test_step.dependOn(&b.addRunArtifact(exe_tests).step);
}
