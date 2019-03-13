screenWidth =  love.graphics.getWidth()
screenHeight = love.graphics.getHeight()

function love.load()
    Object = require("classic")
    require("physics")
    require("arrows")

    player = Physics("astro.png",screenWidth/2,screenHeight/2,500,500,50,100)

    listOfArrows = {}

    index = 0 

end

function love.update(dt)

        player:movimentoVertical(dt)
    if love.keyboard.isDown("right") then 
        player:movimentoRetilineo(dt,1)
    elseif love.keyboard.isDown("left")then
        player:movimentoRetilineo(dt,-1) 
    elseif love.keyboard.isDown("space")then
        player:movimentoRetilineo(dt,5)
    end 

    for i, a in ipairs (listOfArrows)do
         a : shoot(dt,index)
    end 

end
function create_Arrows()

    arrow = Arrows("beijo.png",player.width/2,player.height/2,700,700)
    table.insert(listOfArrows,arrow)

end 
function love.keypressed(key,dt)
    --print("DELTA T KEYPRESSED:",dt)
    
    if key == "up" then 
        player.speedY = -300
    end
end

function love.mousepressed(x,y,button,istouch)

    if button == 1 then 
        create_Arrows()
        index = 1
    end
end

function love.mousereleased(x,y,button,istouch)

    if button == 1 then 
        index = 2
    end 
end 

function love.draw()
    for i , a in ipairs(listOfArrows) do 
        love.graphics.draw(arrow.image,arrow.x,arrow.y)
    end

    love.graphics.draw(player.image,player.x,player.y)

end 
