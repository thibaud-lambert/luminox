player = {}
player._x = 0
player._y = 0

player.size = 16

player._speedx = 0
player._speedy = 0

player._transx = 0
player._transy = 0
player._directionx = 0
player._directiony = 0

player._color = {255,255,255}
player._laserColor = {255,0,0}

minSpeed = 10
maxSpeed = 1000
descFactor = 5
accFactor = 100

function player.spawn(x,y)
	player._x = x
	player._y = y
end

function player.draw()
	love.graphics.setColor(player._color)
	love.graphics.rectangle("fill",player._x,player._y,player.size,player.size)
	love.graphics.setColor(player._laserColor)
	love.graphics.line(player._x, player._y, player._x + player._directionx, player._y + player._directiony)
end

function player.translate(x, y)
	player._transx = player._transx + x
	player._transy = player._transy + y 
end

function player.isExit(x,y,map)
	if map.testExit(x, y) or map.testExit(x + player.size, y) or map.testExit(x, y + player.size) or map.testExit(x + player.size, y + player.size) then
		return true
	end
	return false
end

function player.noCollision(x,y,map)
	if map.testCollision(x, y) or map.testCollision(x + player.size, y) or map.testCollision(x, y + player.size) or map.testCollision(x + player.size, y + player.size) then
		return false
	end
	return true
end

function player.updateDirection(dirx, diry)
	player._directionx = dirx
	player._directiony = diry
end

function player.updatePosition(dt)

	normTrans = math.sqrt(player._transx*player._transx + player._transy*player._transy)
	if normTrans ~= 0 then
		player._transx = accFactor * player._transx / normTrans
		player._transy = accFactor * player._transy / normTrans
	end
	
	player._speedx = player._speedx + player._transx - player._speedx / descFactor
	player._speedy = player._speedy + player._transy - player._speedy / descFactor
	
	normSpeed = math.sqrt(player._speedx*player._speedx + player._speedy*player._speedy)
	
	if normspeed ~= 0 then
		if normSpeed < minSpeed then 
			player._speedx = 0
			player._speedy = 0
		elseif normSpeed > maxSpeed then
			player._speedx = maxSpeed * player._speedx / normSpeed
			player._speedy = maxSpeed * player._speedy / normSpeed
		end
	end
	
	x_tmp = player._x + player._speedx * dt
	y_tmp = player._y + player._speedy * dt
	
	if player.noCollision(x_tmp, y_tmp, map) then
		player._x = x_tmp
		player._y = y_tmp
	else
		if player.noCollision(x_tmp, player._y, map) == false then
			player._speedx = 0
		end
		if player.noCollision(player._x, y_tmp, map) == false then
			player._speedy = 0
		end
		if player.noCollision(player._x, y_tmp, map) and player.noCollision(x_tmp, player._y, map) then
			player._speedx = 0
			player._speedy = 0
		end
		player._x = player._x + player._speedx * dt
		player._y = player._y + player._speedy * dt
	end
	
	player._transx = 0
	player._transy = 0
end