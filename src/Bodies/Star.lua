local class = require "lib.middleclass"
local Body = require "Bodies.Body"
local Star = class("Bodies.Star", Body)

local random = math.random

function Star:initialize(distance)
    Body.initialize(self)
    self.type = "Star"
    self.name = "U-Type Star" --TODO make types of stars actually a thing..not that they can be targeted

    local direction = random()*math.pi*2
    self.x = distance * math.cos(direction)
    self.y = distance * math.sin(direction)

    self.image = 3
    self.sx = random(13, 30)
    self.sy = self.sx

    -- we must be brighter!
    for i=1,#self.color do
        self.color[i] = self.color[i] + self.color[i]*0.5
        if self.color[i] > 255 then self.color[i] = 255 end
    end
    --TODO types of stars, better color choice, red/brown dwarfs, blue giants, white neutrons, etc

    self.r = random()*math.pi*2
end

return Star
