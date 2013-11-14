camera = {}

function camera.draw(player)
	love.graphics.translate(love.graphics.getWidth()/2 -player._x, love.graphics.getWidth()/2 -player._y)
end