const std = @import("std");

pub fn greeting() []const u8 {
    return "hello from ctrlz!";
}

test "greeting" {
    try std.testing.expectEqualSlices(u8, "hello from ctrlz!", greeting());
}
