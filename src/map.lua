map = {}
map.grid = {}
map.width = 0
map.height = 0
map.spawn_x = 0
map.spawn_y = 0


function map.generate(width, height, seed)
	math.randomseed(seed)
	map.width = width
	map.height = height
	for y=0, width do
		map.grid[y] = {}
		for x=0, height do
			if y == 0 or x ==0 or x == map.height or y == map.width then 
				map.grid[y][x] = 1
			else
				map.grid[y][x] = math.random(10)
				if map.grid[y][x] ~= 1 then
					map.grid[y][x] = 0
				end
			end
		end
	end
	map.spawn_x = math.random(map.height-1)
	map.spawn_y = math.random(map.width-1)
	map.grid[map.spawn_y][map.spawn_x] = 0
end


function map.draw()
	for y=0, map.width do
		for x=0, map.height do
			if map.grid[y][x] == 1 then
				love.graphics.rectangle("line", x * 32, y * 32, 32, 32)
			end
		end
	end
end

function map.testCollision(x, y)
	x_grid = math.floor(x/32)
	y_grid = math.floor(y/32)
	if x_grid < 0 or y_grid < 0 or x_grid > map.height or y_grid > map.width or map.grid[y_grid][x_grid] == 1 then
        return true
    end
    return false
end