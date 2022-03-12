function takeHealth(player)
    player.Character.Humanoid.Health -= 25
end

local canHurt = true
workspace.Part.Touched:Connect(function(otherPart)
    if not canHurt then return end

    if canHurt then
        local player = game.Players:GetPlayerFromCharacter(otherPart.Parent)
        takeHealth(player)
        print('MESSAGE: took 25 health from '.. player.Name .. '.' .. '  2 seconds until next hurt!')
        print()
        canHurt = false
        wait(2)
        canHurt = true
    end
end)