draw_set_font(fnt_test);
var c = $806050;
draw_set_color(c);
var qx = 100;
var qy = 4;
var qw = 400;
var qh = 20; // bar width
var qs = 32; // spacing
var n = ds_list_size(tests);
if (n <= 1) exit;

// test #0 is blank and used as reference point so that we don't
// count up time that it takes to just do a script call alone
var q, qt, qr, rt, i;
q = tests[|0];
rt = q[test_t.avg];
if (include_call_time) rt = 0;

// draw header:
draw_set_halign(fa_right);
draw_text(qx - 4, qy, string_hash_to_newline("Avg (μs)"));
draw_set_halign(fa_center);
draw_text(qx + qw div 2, qy, string_hash_to_newline("Relative performance"));
draw_set_halign(fa_left);
draw_text(qx + qw + 4, qy, string_hash_to_newline("Name"));
qy += 24;

// compute minimum/maximum times:
q = tests[|1];
qt = q[test_t.avg] - rt;
var tmin = qt, tmax = qt;
for (i = 2; i < n; i++) {
    q = tests[|i];
    qt = q[test_t.avg] - rt;
    tmin = min(tmin, qt);
    tmax = max(tmax, qt);
}
tmin = max(tmin, 0);

// draw rows:
for (i = 1; i < n; i++) {
    q = tests[|i];
    qt = q[test_t.avg] - rt;
    draw_set_halign(fa_right);
    draw_text(qx - 4, qy, string_hash_to_newline(string_format(qt, 0, 3)));
    draw_set_halign(fa_left);
    //
    if (i > 0) {
        qr = max(0, tmin / qt);
    } else qr = 1;
    draw_sprite_ext(spr_white32, 0, qx, qy, qw / 32, qh / 32, 0, c, 0.1);
    draw_sprite_ext(spr_white32, 0, qx, qy, qr * qw / 32, qh / 32, 0, c, 1);
    //
    draw_text(qx + 5, qy + 1, string_hash_to_newline(string_format(qr * 100, 0, 1) + "%"));
    draw_set_color(c_white);
    draw_text(qx + 4, qy, string_hash_to_newline(string_format(qr * 100, 0, 1) + "%"));
    draw_set_color(c);
    //
    draw_set_valign(fa_middle);
    draw_text(qx + qw + 4, qy + qh div 2, string_hash_to_newline(q[test_t.name]));
    draw_set_valign(fa_top);
    qy += qs;
}

// draw footer:
draw_set_halign(fa_right);
draw_text(qx - 4, qy, string_hash_to_newline(string_format_exp(ndone)
    + "#" + string_format_exp(ndone * tests_per_frame * calls_per_test)));
draw_set_halign(fa_left);
draw_text(qx, qy, string_hash_to_newline("Tests#Iterations#" + platform));

