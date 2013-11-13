player = {}
player._x = 0
player._y = 0
player._speedx = 0
player._speedy = 0

player._transx = 0
player._transy = 0

function player.draw()
	love.graphics.rectangle("fill",player._x,player._y,16,16)
end

function player.translate(x, y)
	player._transx = player._transx + x
	player._transy = player._transy + y
	
	--  	    if (player._accx > -maxSpeed) then 
	--        player._accx = player._accx - 10
	--    end 
end

function player.updatePosition()

	player._x = player._x + player._transx
	player._y = player._y + player._transy
	
	player._transx = 0
	player._transy = 0
end


function player.isOnFloor()
	 return (player._y >= love.graphics.getHeight())
end

--	 if (keys._space == 1) then
--	    if (player.isOnFloor()) then
--	       player._accy = player._accy - 50
--	    end
--	    keys._space = 0
--	 end

   -- 	 if (not player.isOnFloor()) then
--	    player._accy = player._accy + g
 --        end
 
--	 player._x = player._x + player._accx
--	 if (player.isOnFloor() and player._accy > 0) then
--	    player._y = love.graphics.getHeight()
--	    player._accy = 0
--	 else
--	    player._y =  player._y + player._accy 
--	 end
	 
--	 if (player._accx > 0 and player._accx < ts) then
--	      player._accx = 0
--	 elseif (player._accx < 0 and player._accx > ts) then
--	      player._accx = 0
--	 elseif (player._accx > 0) then
--	      player._accx = player._accx - desc 
--	 elseif (player._accx < 0) then
--	      player._accx = player._accx + desc
--	 end
--	 if (player._accy > 0 and player._accy < ts) then
--	      player._accy = 0 
--	 elseif (player._accy < 0 and player._accy > ts) then
--	      player._accy = 0
--	 elseif (player._accy > 0) then
--	      player._accy = player._accy - desc
--	 elseif (player._accy < 0) then
--	      player._accy = player._accy + desc
--	 end