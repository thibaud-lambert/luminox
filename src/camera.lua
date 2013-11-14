camera = {}

function camera.draw(x,y)
	love.graphics.translate(love.graphics.getWidth()/2 - x, love.graphics.getHeight()/2 - y)
end