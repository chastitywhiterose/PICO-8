pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
x=64;y=64;r=8;

function _update()
 if (btn(0)) then x=x-1; end
 if (btn(1)) then x=x+1; end
 if (btn(2)) then y=y-1; end
 if (btn(3)) then y=y+1; end
 if (btn(4)) then r=r-1; end
 if (btn(5)) then r=r+1; end
end
 
function _draw();
 cls(0);
 circfill(x,y,r,7);
end

