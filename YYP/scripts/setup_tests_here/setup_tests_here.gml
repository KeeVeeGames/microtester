tests_per_frame = 100; // how many times to shuffle & run tests per frame
calls_per_test = 100; // prefer to keep at 1 outside of overly small operations
frames_between_tests = 1; // delay between running tests, in case it's needed
include_call_time = 0; // whether to include script call time in calculations
//
some = 1;
test_add("direct read", n_get);
test_add("direct write", n_set);
test_add("variable_instance_get", vi_get);
test_add("variable_instance_set", vi_set);
test_add("variable_instance_exists", vi_exists);

