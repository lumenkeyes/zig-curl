const std = @import("std");
const Build = std.Build;
const Step = Build.Step;
const Module = Build.Module;

const MODULE_NAME = "curl";

pub fn build(b: *Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const module = b.addModule(MODULE_NAME, .{
        .root_source_file = b.path("src/root.zig"),
        .link_libc = true,
        .target = target,
        .optimize = optimize,
    });

    module.addObjectFile(b.path("prebuilt/libcurl.a"));
    module.addObjectFile(b.path("prebuilt/libssl.a"));
    module.addObjectFile(b.path("prebuilt/libcrypto.a"));
    module.addObjectFile(b.path("prebuilt/libz.a"));
    module.addIncludePath(b.path("prebuilt/"));
}
