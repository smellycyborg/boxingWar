function takeHealth(player)
    player.Character.Humanoid.Health -= 25
end

local canHurt = true
workspace.Part.Touched:Connect(function(otherPart)
    if canHurt then return end

    if not canHurt then
        takeHealth(game.Players:GetPlayerFromCharacter(otherPart.Parent))
        canHurt = false
        wait(2)
        canHurt = true
    end
end)