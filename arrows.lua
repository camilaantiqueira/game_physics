screenWidth =  love.graphics.getWidth()
screenHeight = love.graphics.getHeight()
Arrows = Object:extend()

function Arrows:new(image,x,y,speedX,speedY)

    self.image = love.graphics.newImage(image)
    self.x = x 
    self.y = y 
    self.speedX = speedX 
    self.speedY =  speedY 

end 

function Arrows:update(dt)
end

function Arrows:draw()
end 


