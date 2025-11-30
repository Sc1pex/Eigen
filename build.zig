const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const upstream = b.dependency("eigen", .{});

    const eigen = b.addLibrary(.{
        .name = "eigen",
        .root_module = b.createModule(
            .{
                .target = target,
                .optimize = optimize,
                .link_libcpp = true,
            },
        ),
    });
    eigen.installHeadersDirectory(upstream.path("Eigen"), "Eigen", .{
        .include_extensions = &.{""},
    });
    eigen.addCSourceFile(.{
        .file = b.path("empty.cpp"),
        .flags = &CXX_FLAGS,
    });

    b.installArtifact(eigen);
}

const CXX_FLAGS = .{
    "-std=c++23",
    "-Wall",
    "-Wextra",
};
