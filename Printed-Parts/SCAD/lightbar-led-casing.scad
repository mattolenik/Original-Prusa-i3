include <scadlib/fdm.scad>

$draft = false;

l = 12.5 * INCH;
l_gap = l - 1/2 * INCH;
w = 2/3 * INCH - 0.3;
h = 1/3 * INCH - 0.3;

wall = 2;
lip = 0.2;

led_w = 0.4 * INCH;

module light_shaft(anchor, spin, orient) {
    attachable(anchor, spin, orient, size=[l, w, h]) {
        difference() {
            cuboid([l, w, h]);
            up(3) cuboid([l, w-wall*2, h]);

            up(h/2) cutout();

            down(1) cuboid([l, led_w, 2], anchor=TOP);
        }
        children();
    }
}

module cutout() {
    let(s=1.5)
    cuboid([l_gap, w-wall, s], anchor=TOP, chamfer=s/2, edges=[FRONT+TOP, FRONT+BOTTOM, BACK+TOP, BACK+BOTTOM]);
}

module assembly() {
    diff()
    light_shaft()
        edge_mask([FRONT+RIGHT, BACK+RIGHT, FRONT+LEFT, BACK+LEFT])
            rounding_edge_mask(l=h*1.1, r=w/2.2);
}

//right_half(500, 140) assembly();
//assembly();

right_half(500, 100) scale(0.99) cutout();
