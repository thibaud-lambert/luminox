pointTable = {}

require "player"
require "map"
require "camera"

keys = {}
keys._q = 0
keys._d = 0
keys._s = 0
keys._z = 0
keys._space = 0


function love.load()
	 love.graphics.setBackgroundColor(0,0,0)
	 love.graphics.setColor(255,255,255)
	 map.generate(20,20,1234)
end

function love.update(dt)
	 if(keys._q == 1) then
		player.translate(-1,0)
	 end
	 if (keys._d == 1) then
	 	player.translate(1,0)
	 end
	 if (keys._s == 1) then
	 	player.translate(0,1)
	 end
	 if (keys._z == 1) then
	 	player.translate(0,-1)
	 end
	 
	 player.updatePosition(dt)
end

function love.draw()	 
	 -- love.graphics.print('Hello World!', 400, 300)
	 --if(table.getn(pointTable) > 3 ) then
	 --     love.graphics.line(pointTable)
     --    end
	camera.draw(player._x, player._y)	
	map.draw()
	player.draw()
	
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
	 elseif (key == 'w') then
	    keys._z = 1
	 elseif (key == 's') then
	    keys._s = 1
	 elseif (key == ' ') then
	    keys._space = 1
	 end
end

function love.keyreleased(key, unicode)
	 if (key == 'a') then
	    keys._q = 0
	 elseif (key == 'd') then
	    keys._d = 0
	 elseif (key == 'w') then
	    keys._z = 0
	 elseif (key == 's') then
	    keys._s = 0
	 elseif (key == ' ') then
	    keys._space = 0
	 end
end