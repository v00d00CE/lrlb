ROT= require 'libs.rotLove.src.rot'

str = require 'libs.STARFIELD'

R = require 'libs.TERMINAL'

    --local gamera = require 'libs.gamera'

    --local cam = gamera.new(0,0,800,600)
        
lg = love.graphics
    
    -- TODO ( maybe impl ECS? or use OOP)

    -- TODO ( make TERMINAL a rect equally /MiddleScreen overmake STARFIELD BG /)
    -- player move / inventory in & out dung
    
    -- z draw order sys
    local function drawSort(a,b)
        return a.z < b.z
    end

    -- random shit
    local function rngColor(min,max)
    --RGB -> color (0..1)
        return math.random(min,max)
    end

  
    --local spdX, spdY = math.random(1,99) - 2
    --local foo = spdX
    --local bar = rngColor(0,1)
 




function love.load()
    
    lg.setDefaultFilter( 'nearest', 'nearest' )
      
     lg.setBackgroundColor(0,1,0)  
    love.window.setMode(800,600,
    {fullscreen = true,
     resizable = true  })
     -- loads TERMINAL (RotLove impl)
    R:load()

    -- loads STARFIELD
    str:new()
    str:load()
   
end



function love.update(dt)

    --cam:setWindow(0,0,800,600)
    --cam:setPosition(80,80, 80,80)

    -- mouse input position
    Mx, My = love.mouse.getPosition()

    str:update(dt, 40,40)
end

function love.draw()
     
    -- draw order table
    local drawList = {
        love.graphics.setColor(0, 1, 0),
        R:draw(),
        str:draw(),
   
      --lg.rectangle("fill",100,50,600,400),
        
    }

    -- ghost camera impl
    --cam:draw(function (l,t,w,h)

      --end

    -- z draw order      
    table.sort(drawList, drawSort)
    
        for i = 1,#drawList do
            drawList[i]:draw()
    end
 
end


function love.keypressed(key)

    if key == 'escape' then
        love.event.quit()
    end
end 