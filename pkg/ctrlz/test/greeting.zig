const ctrlz = @import("ctrlz");
const std = @import("std");

test "greeting" {
    try std.testing.expectEqualSlices(u8, "hello from ctrlz!", ctrlz.greeting());
}
