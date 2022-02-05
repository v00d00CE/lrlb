R = require'libs.rotLove.src.rot'
str = require 'libs.STARFIELD'

map = {}

function map:load()
    -- size of the rect 
    f=ROT.Display:new(80,38)
    -- size of the arena // no control here for initial pos (impl that)
    m=ROT.Map.Arena:new(40,19)

  
    function callbak(x,y,val)
        f:write(val == 1 and '#' or '.',x,y,fg,bg)
    end
    m:create(callbak)
end
function map:draw()


  f:draw()
  
  end

return map