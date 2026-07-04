const std = @import("std");
const ctrlz = @import("ctrlz");

pub fn main() !void {
    std.debug.print("{s}\n", .{ctrlz.greeting()});
}
