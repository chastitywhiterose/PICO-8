pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
#include pico_chastetris.lua
#include pico_chastegame.lua

width = 128;
height = 128;

block_size=flr(height/grid_height);
grid_offset_x=flr( (width-(20/2*block_size)) / 2 );
border_size=1;

x=64;y=64;r=8;

function _init()
 game_loop_init();
 gamefunc=game_loop;
end


function _update()
 if (btnp(0)) then
  tetris_move_left();
 end
 if (btnp(1)) then
  tetris_move_right();
 end
 if (btnp(2)) then
  --tetris_move_up();
  block_hold();
 end
 if (btnp(3)) then
  tetris_move_down();
 end
 if (btnp(4)) then
  block_rotate_left_basic();
 end
 if (btnp(5)) then
  block_rotate_right_basic();
 end
end
 
function _draw();
 cls(0); 
 gamefunc(); 
end

