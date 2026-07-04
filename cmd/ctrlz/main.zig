const std = @import("std");
const ctrlz = @import("ctrlz");

pub fn main() !void {
    std.debug.print("{s}\n", .{ctrlz.greeting()});
}

test "basic test" {
    try std.testing.expectEqual(1 + 1, 2);
}
