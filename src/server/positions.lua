local positions = {}

function positions.positionfy(object)
    local xRange = math.random(-0.125, 30)
    local zRange = math.random(2, 50)
    local yRange = 5.5
    local position = Vector3.new(xRange, yRange, zRange)
    return position
end

return positions