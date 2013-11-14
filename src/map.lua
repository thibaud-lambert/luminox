map = {}
map.width = 0
map.height = 0

map._cubeColor = {255,255,255}

function map.generate(width, height, seed)
	math.randomseed(seed)
	map.width = width
	map.height = height
	for y=0, width do
		map[y] = {}
		for x=0, height do
			map[y][x] = math.random(10)
			if map[y][x] ~= 1 then
				map[y][x] = 0
			end
		end
	end
end


function map.draw()
	for y=0, map.width do
		for x=0, map.height do
			if map[y][x] == 1 then
				love.graphics.setColor(map._cubeColor)
				love.graphics.rectangle("line", x * 32, y * 32, 32, 32)
			end
		end
	end
end

function map.testCollision(x, y)
	x_grid = math.floor(x/32)
	y_grid = math.floor(y/32)
	if x_grid < 0 or y_grid < 0 or x_grid > map.height or y_grid > map.width or map[y_grid][x_grid] == 1 then
        return true
    end
    return false
end