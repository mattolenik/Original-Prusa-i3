include <BOSL2/std.scad>
include <scadlib/std.scad>
include <scadlib/fdm.scad>

$draft = false;

plate_t = 4.064;
plate_w = 205;
plate_h = 50;
hole_dia = 5;
base_thickness=3;

assembly();

module assembly() {
    //front_plate("normal", plate_t);
    l=39;
    w=28;
    w_top=8;
    w_bot=18;
    h=38.5+base_thickness;
    margin=4;
    difference() {
        down(plate_h/2+base_thickness) left(plate_w/2+margin)
            foot(l, w, w_top, w_bot, h, anchor=BOTTOM+LEFT+FWD);

        front_plate("holes", 50);

        yshift(w_top-1) front_plate("holes-large", 30);

        scale(1.001) front_plate("cutout", plate_t);

        let(d=5)
        yshift(w_top+11) xshift(-plate_w/2+l/2-d/2) {
            down(20) cyl(d=d, h=30);
            xshift(0.5) yshift(-19) up(10) cuboid([18, 4, 10], anchor=FRONT+BOTTOM, chamfer=1);
        }
    }
}

module foot(l, w, w_top, w_bot, h, anchor, spin, orient) {
    fh = 10;
    w1=w_bot+3;
    w2=w_bot-2;
    fwd(plate_t/2) prismoid(size1=[l, w], size2=[l, w_top], shift=[0, -(w-w_top)/2], h=h, anchor=FRONT+BOTTOM+LEFT);
    cuboid([l+13, plate_t*3, fh], anchor=CENTER+BOTTOM+LEFT, chamfer=4.1, edges=[FRONT+TOP]);
    back(w_top) prismoid(size1=[l, w1], size2=[l, w2], shift=[0, -(w1-w2)/2], h=fh, anchor=FRONT+BOTTOM+LEFT);
}

module front_plate(type="normal", ext, anchor, spin, orient) {
    file = type == "normal" ? "../../Frame/MK3-front-plate.dxf" :
           type == "solid" ? "../../Frame/MK3-front-plate-no-holes.dxf" :
           type == "cutout" ? "../../Frame/MK3-front-plate-no-holes-square-corners.dxf" :
           type == "holes" ? "../../Frame/MK3-front-plate-holes-only.dxf" :
           type == "holes-large" ? "../../Frame/MK3-front-plate-holes-only-large.dxf" : "unsupported";
    attachable(anchor, spin, orient, size=[plate_w, plate_t, ext]) {
        zshift(-plate_h/2) yshift(-plate_t/2) xrot(-90) linear_extrude(ext) import(file = file);
        children();
    }
}

