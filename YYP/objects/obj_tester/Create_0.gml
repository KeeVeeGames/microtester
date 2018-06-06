tests = ds_list_create();
test_add(test_blank);
setup_tests_here();
room_height = ds_list_size(tests) * 32 + 80;
window_set_size(room_width, room_height);
surface_resize(application_surface, room_width, room_height);
swaps = ds_list_create();
ds_list_copy(swaps, tests);
ntime = 0;
ndone = 0;
if (os_browser == browser_not_a_browser) {
    switch (os_type) {
        case os_windows: platform = "Windows"; break;
        case os_macosx: platform = "Mac OSX"; break;
        case os_linux: platform = "Linux"; break;
        case os_android: platform = "Android"; break;
        case os_ios: platform = "iOS"; break;
        default: platform = "???"; break;
    }
    if (code_is_compiled()) {
        platform += " YYC";
    } else platform += " VM";
} else platform = "HTML5";
platform += " " + GM_runtime_version;

