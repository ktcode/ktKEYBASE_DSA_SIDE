//
// ktKEYBASE_DSA_SIDE
//

gap1 = 0.001;
gap2 = 0.002;
th = 2;

key_margin = 0.4;
DSA_W = 18.2+key_margin;
DSA_D = 18.2+key_margin;
DSA_H = 7.5+key_margin;
DSA_W2 = 13+key_margin;
DSA_D2 = 9+key_margin;
margin = 0.3;
UNIT_W = 40.6+margin;
UNIT_D = 40.6+margin;
UNIT_H = 122.5;

//mini();
main();

module mini()
{
difference()
{
    translate([0, -40, -19]) cube([160, 40, 19]);
    translate([5, - 35, -5]) cube([150,  30, 19]);

    LAYOUT_mini();
    LAYOUT_SUB_mini();

    for(i = [0:20:120])
    {
        translate([20+i, -5-30/2, -DSA_H/2+gap1]) cube([10, 30, DSA_H*1.5], center=true);
    }
}
}

module main()
{
difference()
{
    translate([0, -160, -19]) cube([160, 160, 19]);
    translate([0, -160, -5]) cube([160, 160, 19]);

    LAYOUT();
    LAYOUT_SUB();

    for(i = [0:20:120])
    {
        translate([20+i, -5-150/2, -DSA_H/2+gap1]) cube([10, 150, DSA_H*1.5], center=true);
    }
}
}


module LAYOUT()
{
    translate([20, -20, -DSA_H+gap1])
    {
        for(i = [0:20:120])
        {
            for(j = [0:-20:-120])
            {
                translate([i, j, 0]) DSA();
            }
        }
    }
}

module LAYOUT_SUB()
{
    translate([20, -20, -DSA_H*2+gap2])
    {
        for(i = [0:20:120])
        {
            for(j = [0:-20:-120])
            {
                translate([i, j, 0]) DSA_SUB();
            }
        }
    }
}


module LAYOUT_mini()
{
    translate([20, -20, -DSA_H+gap1])
    {
        for(i = [0:20:120])
        {
            //for(j = [0:-20:-120])
            j = 0;
            {
                translate([i, j, 0]) DSA();
            }
        }
    }
}

module LAYOUT_SUB_mini()
{
    translate([20, -20, -DSA_H*2+gap2])
    {
        for(i = [0:20:120])
        {
            //for(j = [0:-20:-120])
            j = 0;
            {
                translate([i, j, 0]) DSA_SUB();
            }
        }
    }
}

module DSA()
{
    translate([0, 0, DSA_H/2])
    {
        cube([DSA_W, DSA_D, DSA_H], center=true);
    }
    translate([0, -4.5, -2.2-1.5])
    rotate([-65, 0, 0]) translate([0, 0, DSA_H/2])
    {
        hull()
        {
            translate([0, 0, DSA_H])
            cube([DSA_W2, DSA_D2, gap1], center=true);
            cube([DSA_W+1, DSA_D, gap1], center=true);
        }
    }
}

module DSA_SUB()
{
    translate([0, 0, DSA_H/2])
    {
        cube([DSA_W-5, DSA_D-5, DSA_H*2], center=true);
    }
}

