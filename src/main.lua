pointTable = {}
g = 8
ts = 0.1
desc = 5

maxSpeed = 20



player = {}
player._x = 0
player._y = 0
player._accx = 0
player._accy = 0

keys = {}
keys._q = 0
keys._d = 0
keys._space = 0

function player.isOnFloor()
	 return (player._y >= love.graphics.getHeight())
end

function love.load()
	 love.graphics.setBackgroundColor(0,0,0)
	 love.graphics.setColor(255,255,255)
end

function love.update()
	 if(keys._q == 1) then	
  	    if (player._accx > -maxSpeed) then 
	        player._accx = player._accx - 10
	    end 
	 end
	 if (keys._d == 1) then
	    if (player._accx < maxSpeed) then 
	       player._accx = player._accx + 10
	    end
	 end
	 if (keys._space == 1) then
	    if (player.isOnFloor()) then
	       player._accy = player._accy - 50
	    end
	    keys._space = 0
	 end

    	 if (not player.isOnFloor()) then
	    player._accy = player._accy + g
         end
	 player._x = player._x + player._accx
	 if (player.isOnFloor() and player._accy > 0) then
	    player._y = love.graphics.getHeight()
	    player._accy = 0
	 else
	    player._y =  player._y + player._accy 
	 end
	 
	 if (player._accx > 0 and player._accx < ts) then
	      player._accx = 0
	 elseif (player._accx < 0 and player._accx > ts) then
	      player._accx = 0
	 elseif (player._accx > 0) then
	      player._accx = player._accx - desc 
	 elseif (player._accx < 0) then
	      player._accx = player._accx + desc
	 end
	 if (player._accy > 0 and player._accy < ts) then
	      player._accy = 0 
	 elseif (player._accy < 0 and player._accy > ts) then
	      player._accy = 0
	 elseif (player._accy > 0) then
	      player._accy = player._accy - desc
	 elseif (player._accy < 0) then
	      player._accy = player._accy + desc
	 end
end

function love.draw()	 
	 -- love.graphics.print('Hello World!', 400, 300)
	 --if(table.getn(pointTable) > 3 ) then
	 --     love.graphics.line(pointTable)
     --    end
	 love.graphics.rectangle("fill",player._x,player._y-50,50,50)
end

function love.mousepressed()
--	 mx, my = love.mouse.getPosition()
--	 table.insert(pointTable,mx)
--	 table.insert(pointTable,my)
end

function love.keypressed(key, unicode)
	 if (key == 'escape') then
	    love.event.quit()
	 elseif (key == 'a') then
	    keys._q = 1
	 elseif (key == 'd') then
	    keys._d = 1
	 elseif (key == ' ') then
	    keys._space = 1
	 end
end

function love.keyreleased(key, unicode)
	 if (key == 'a') then
	    keys._q = 0
	 elseif (key == 'd') then
	    keys._d = 0
	 elseif (key == ' ') then
	    keys._space = 0
	 end
end