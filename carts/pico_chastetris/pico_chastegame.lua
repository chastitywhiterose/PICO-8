function game_title()

love.graphics.print("Chaste Tris Love2D", font_size*13, font_size*0)

love.graphics.print("Welcome to the Lua port of Chaste Tris. This game has been\nmodified from the C and Raylib version to fit within the Love2D\nframework. It is not a replacement for the original but is\ndesigned to bring the game to Lua users who enjoy Tetris.", font_size*1, font_size*2)

love.graphics.print("Chastity White Rose is the programmer of all code.\nFor questions email her at:\nchastitywhiterose@gmail.com", font_size*1, font_size*8)

love.graphics.print("Press Enter to begin the game.\n\nand may the horse be with you!", font_size*1, font_size*12)


end


--used to start and restart the game
function game_loop_init()
 --setup the game
 tetris_clear_screen();
 --tetris_grid_print();

 score=0; 
 lines_cleared_total=0;
 back_to_back=0;
 moves=0;
 
 move_id='none';
 
 --optionally delete movelog on game restart
 --move_log={};
 
 block_type=0;
 hold_used=0;
 hold_block.id='none';
 spawn_block();
 
end

function game_loop()

fs=6;
--love.graphics.setColor(1, 1, 1);
 color(7);
 print("chaste\ntris\npico-8", 0, 0);
 
  print("score\n"..score, 0, fs*5);
  print("lines\n"..lines_cleared_total, 0, fs*8);
  
  print("hold\n"..hold_block.id, 0, fs*11);
 
-- love.graphics.print("BTB="..back_to_back, font_size*1, font_size*5);
-- love.graphics.print("Moves="..moves, font_size*1, font_size*6);

-- love.graphics.print("move id="..move_id, font_size*1, font_size*20);
-- love.graphics.print("Key="..last_key, font_size*1, font_size*21);


 
 --create an empty temp grid which is copy of main grid
 y=0;
 while(y<grid_height)
 do
  x=0;
  while(x<grid_width)
  do
   temp_grid.array[x+y*grid_width]=main_grid.array[x+y*grid_width];
   --print(temp_grid.array[x+y*grid_width]);
   x=x+1;
  end
  y=y+1;
 end
 
   --draw block onto temp grid at it's current location
  y=0;
  while(y<max_block_width)
  do
   x=0;
   while(x<max_block_width)
   do
    if(main_block.array[x+y*max_block_width]~=0) then
     if( temp_grid.array[main_block.x+x+(main_block.y+y)*grid_width]~=0 )then
      print("Error. Something already here");
     else
      temp_grid.array[main_block.x+x+(main_block.y+y)*grid_width]=main_block.id;
      --print(temp_grid.array[main_block.x+x+(main_block.y+y)*grid_width].."theid");
     end
    end
    x=x+1;
   end
   y=y+1;
   end
 
  --display the tetris grid
 y=0;
 while(y<grid_height)
 do
  x=0;
  while(x<grid_width)
  do
   p=temp_grid.array[x+y*grid_width];
   --print("x="..x.." y="..y.." p="..tostring(p));
   if(p==nil)then
    color(5); --love.graphics.setColor(0.5,0.5,0.5)
    print("nil pixel error");
    print(temp_grid.array[x+y*grid_width]);
    elseif(p=='i') then
    color(12);--love.graphics.setColor(0, 1, 1);
    elseif(p=='t') then
    color(13); --love.graphics.setColor(1, 0, 1);
    elseif(p=='z') then
    color(8); --love.graphics.setColor(1, 0, 0);
    elseif(p=='j') then
    color(14); --love.graphics.setColor(0, 0, 1);
    elseif(p=='o') then
    color(10); --love.graphics.setColor(1, 1, 0);
    elseif(p=='l') then
    color(9); --love.graphics.setColor(1, 0.5, 0);
    elseif(p=='s') then
    color(11); --love.graphics.setColor(0, 1, 0);

    else
    color(0); --love.graphics.setColor(0, 0, 0); --this may be fixed later
   end
   
  --love.graphics.rectangle("fill",grid_offset_x+x*block_size,y*block_size,block_size,block_size);
  rectfill(grid_offset_x+x*block_size,y*block_size,grid_offset_x+x*block_size+block_size-1,y*block_size+block_size-1);
  
  --print("grid_offset_x+x="..grid_offset_x+x);
  --print("y*block_size="..y*block_size);
  --print("block_size="..block_size);

   x=x+1;
     --print("x="..x);
  end
  y=y+1;
    --print("y="..y);

 end
 
 color(5); --love.graphics.setColor(0.5, 0.5, 0.5);
 --love.graphics.rectangle("fill",grid_offset_x-border_size,0*block_size,border_size,height); --left border
 --love.graphics.rectangle("fill",grid_offset_x+grid_width*block_size,0*block_size,border_size,height); --right border
 
 rectfill(grid_offset_x-border_size,0,grid_offset_x,height-2); --left border
 rectfill(grid_offset_x+grid_width*block_size,0,grid_offset_x+grid_width*block_size+border_size,height-2); --right border

 rectfill(grid_offset_x-border_size,grid_height*block_size,grid_offset_x+grid_width*block_size+border_size,height); --bottom border

end

