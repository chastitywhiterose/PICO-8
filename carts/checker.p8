pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
function _draw()
-- cls(5)
 chaste_checker();
end

width=128
height=128

rect_size=16;
 
function chaste_checker()

 colors={};

 colors[0]=0;
 colors[1]=7;

 index=0;
 
 y=0;
 while(y<height)
 do
  index1=index;
  x=0;
  while(x<width)
  do
   rectfill(x,y,x+rect_size-1,y+rect_size-1,colors[index]);
   index=1-index; 
   x+=rect_size;
  end
  index=1-index1;
   
  y+=rect_size;
 end
end



