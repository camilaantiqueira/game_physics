screenWidth = love.graphics.getWidth()
screenHeight = love.graphics.getHeight()
Physics = Object:extend()

function Physics:new(image,x,y,speedX,speedY,width,height)
    self.image = love.graphics.newImage(image)
    self.x = x
    self.y = y
    self.speedX = speedX
    self.speedY = speedY
    self.g = 700 -- teve que ser esse valor pois está sempre multiplicando por dt, o que  o torna muito pequeno 
    self.speedInitialY = speedY
    self.angle = 0 -- angulo dos tiros
    self.height = height
    self.width = width 
   
    -- g = 9,8m/s² --
end

function Physics:update(dt)
    --Fisica:movimentoVertical(dt)
    --Fisica:movimentoRetilineo(dt)
    --shoot(character,arrow,dt)
end 


function Physics:movimentoRetilineo(dt,acceleration)
    -- Caso a aceleração seja 1, o character estará andando --
    -- Caso a aceleração seja -1, muda o sentido --
    -- Para correr é necessário aumentar o accelaration ( pode-se definir essas condições em cada personagem)
    if self.x >= 0 then
        self.x = self.x + self.speedX * acceleration * dt
    end 
    print("dt:",dt) 
end

function Physics:movimentoVertical(dt)
    -- pular,flutuar --

    if self.speedY ~= 0 then
        if self.speedY >= self.speedInitialY and self.y > screenHeight - self.height  then 
            self.speedY = 0
        end 
        self.y = self.y + self.speedY * dt
        self.speedY = self.speedY + self.g * dt
        print("speedY sem mudar sinal:",self.speedY)
        if self.speedY == 0 and self.y <= screenHeight - self.height  then
            self.speedy = 0 
            self.g = -self.g
            self.speedY = self.speedY + self.g * dt 
            print("speedY mudou sinal:",self.speedY)
        end     
    end 
end


function Physics:checkCollision(a,b)
    local a_right = a.x + a.width 
    local a_left = a.x
    local a_bottom = a.y + a.height 
    local a_top = a.y

    local b_right = b.x + b.width
    local b_left = b.x
    local b_top = b.y
    local b_bottom = b.y + b.height

    if a_right >= b_left and a_left <= b_right and a_top <= b_bottom  and a_bottom >= b_top then
        return true
    else
        return false 
    end
end 

function Physics:shoot(dt,ind)
     --Para utilizar essa função poderia ser criada uma table de arrows em que cada posição chamava a função shoot. Ou bastaria mudar o parâmetro desta para uma listaOfArrows. -- 
    
     print("DELTA T:",dt)

    if ind == 1 then 

        mouse_x, mouse_y = love.mouse.getPosition()
        print("MOUSE",mouse_x,mouse_y)
        self.angle = math.atan2(mouse_y - self.y, mouse_x - self.x)
        print("SELF.ANGLE:",self.angle)
        cos = math.cos(self.angle)
        sin = math.sin(self.angle)
    end 

    if ind == 2 then

            self.x = self.x + self.speedX * cos * dt
            self.y = self.y + self.speedY * sin * dt
            self.speedY = self.speedY  - self.g*dt  
            print("SELFS",self.x,self.y)

            if self.speedy == 0 then
                self.g = - selg.g 
            end  
            
            if self.y >= screenHeight - 100 then 
                -- Condição apenas para parar a flecha , pode mudar conforme o background -- 
                ind = 0
                sin = 0
                cos = 0 
            end 
            
    end 

end 


function Physics:draw()
end
