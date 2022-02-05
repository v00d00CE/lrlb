
Position =  {x, y}

function Position:new(o , x,y)
    o = o or {}
    setmetatable(o, self)
    self._index = self
    self.x = x or 0
    self.y = y or 0

    return o
    
end

Sprite = {img}

function Sprite:new(i, img)
    i = i or {}
    setmetatable(i,self)
    self._index = self
    self.img =  nil
end