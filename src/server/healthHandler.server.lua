local Players = game:GetService("Players")

local Characters = {}
 
function onCharacterSpawned(player)
    Characters[player].canHurt = true
end
 
function onCharacterDespawned(player)
    Characters[player] = nil
end

function onPlayerAdded(player)
    player.CharacterAdded:Connect(function ()
        onCharacterSpawned(player)
    end)
    player.CharacterRemoving:Connect(function ()
        onCharacterDespawned(player)
    end)
end

Players.PlayerAdded:Connect(onPlayerAdded)

function takeHealth(player)
    player.Character.Humanoid.Health -= 25
end

workspace.Part.Touched:Connect(function(otherPart)
    local player = game.Players:GetPlayerFromCharacter(otherPart.Parent)

    if Characters[player].canHurt == false then 
        return 
    else
        Characters[player].canHurt = false
        
        takeHealth(player)
        print('MESSAGE: took 25 health from '.. player.Name .. '.' .. '  2 seconds until next hurt!')
        print()
        wait(2)
        Characters[player].canHurt = true
    end
end)