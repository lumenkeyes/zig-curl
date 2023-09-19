const c = @import("c.zig").c;
const checkCode = @import("errors.zig").checkCode;

pub const Easy = @import("easy.zig");
pub usingnamespace Easy;

pub const print_libcurl_version = @import("c.zig").print_libcurl_version;
pub const has_parse_header_support = @import("c.zig").has_parse_header_support;

/// This function sets up the program environment that libcurl needs.
/// Since this function is not thread safe before libcurl 7.84.0, this function
/// must be called before the program calls any other function in libcurl.
/// A common place is in the beginning of the program. More see:
/// https://curl.se/libcurl/c/curl_global_init.html
pub fn global_init() !void {
    checkCode(c.curl_global_init(c.CURL_GLOBAL_ALL));
}

/// This function releases resources acquired by curl_global_init.
pub fn global_deinit() void {
    c.curl_global_cleanup();
}
