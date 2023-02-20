pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
width = 128;
height = 128;

x=64;y=64;r=8;c=7;

function _init()
init_polygon();
end

function _update()
 if (btn(0)) then x=x-1; end
 if (btn(1)) then x=x+1; end
 if (btn(2)) then y=y-1; end
 if (btn(3)) then y=y+1; end
 if (btn(4)) then r=r-1; end
 if (btn(5)) then r=r+1; end
 
 if (btn(0,1)) then x=x-1; end
 if (btn(1,1)) then x=x+1; end
 if (btn(2,1)) then y=y-1; end
 if (btn(3,1)) then y=y+1; end
 if (btnp(4,1)) then c=c-1; end
 if (btnp(5,1)) then c=c+1; end
 
 
end
 
function _draw();
 cls(0);
-- circfill(x,y,r,c);
print(pi);

chaste_polygon_draw();


--print(main_polygon.color);
end


main_polygon={};

function init_polygon()
 main_polygon.cx=width/2;
 main_polygon.cy=height/2;
 main_polygon.sides=3;
 main_polygon.radius=height/2;
 main_polygon.radians=0;
 main_polygon.color=7;
 main_polygon.step=2;
end

polygon_xpoints={};
polygon_ypoints={};

pi=0.5;

--function to get the points of a regular polygon and load them into the above arrays of x and y points

function chaste_polygon_points()
 --double angle,x,y;
 i=0;
 while(i<main_polygon.sides)
 do
  angle=2*pi*i/main_polygon.sides+main_polygon.radians;
  x=main_polygon.cx+sin(angle)*main_polygon.radius;
  y=main_polygon.cy-cos(angle)*main_polygon.radius;
  polygon_xpoints[i]=x;
  polygon_ypoints[i]=y;
//  printf("angle==%f\n",angle);
//  printf("x==%f x==%f\n",x,y);
 // printf("xpoint[%d]==%d ypoint[%d]==%d\n",i,polygon_xpoints[i],i,polygon_ypoints[i]);
  i=i+1;
 end
end


--draw a regular polygon
function chaste_polygon_draw()

 --int i,i1;
 chaste_polygon_points();
 
 i=0;
 while(i<main_polygon.sides)
 do
  i1=(i+1)%main_polygon.sides;
  
  line(polygon_xpoints[i],polygon_ypoints[i], polygon_xpoints[i1],polygon_ypoints[i1] , c)
  
  i=i+1;
 end
 
end
