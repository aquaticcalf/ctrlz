const std = @import("std");

test "basic test" {
    try std.testing.expectEqual(1 + 1, 2);
}
