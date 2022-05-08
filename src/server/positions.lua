local positions = {}

function positions.positionfy(object)
    local position
    local xRange = math.random(-0.125, 30)
    local zRange = math.random(2, 50)
    local yRange = 5.5
    position = Vector3.new(xRange, yRange, zRange)
    if table.find(positions, position) then
        positions.positionfy(object)
    else
        table.insert(positions, position)
        return position
    end
end

return positions