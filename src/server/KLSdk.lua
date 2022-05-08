local KLDealer = require(game.ServerScriptService.Server.KLDealer)

local Sdk = {
    data = {}
}

local function onCharacherTouched(part, player)
    local attribute = part:GetAttribute('String')
    if not attribute then return end

    local data = Sdk.data
    data[player][attribute]+=1
end

local function onCharacterAdded(character)
    local player = game.Players:GetPlayerFromCharacter(character)
    local characterChildren = character:GetChildren()

    for _, v in pairs(characterChildren) do
        local isPart = v:IsA('Part')
        if isPart then
            v.Touched:Connect(onCharacherTouched)
        end
    end
end

local function takesPotion(player, potion)
    local data = Sdk.data
    local potions = data[player].Potions
    local potionBool = potions[potion].bool
    local potionValue = potions[potion].value

    local hasPotion = potionBool == true
    if hasPotion then
        potions[potion].bool = false
        KLDealer.addHealth(player, potionValue)

        warn(player.Name .. ' took a '.. potion .. ' potion and has been given more health :)')
    end
end

local function onPlayerAdded(player)
    local data = Sdk.data
    data[player] = {}

    --/ potions
    data[player].Potions = {}
    local potions = data[player].Potions
    potions['halfHealth'] = {bool = true, value = 50}
    potions['fullHealth'] = {bool = true, value = 100}

    --/ canHurt
    data[player].canHurt = true

    --/ level
    local level = data[player].Level
    level = 1
    local xp = data[player].Xp
    xp = 0

    -- Todo add formula for xp and level so that you need more xp to reach next level
    local function levelAndXpHandler()
        local canAddXp = true
        if canAddXp == true then
            xp+=1
            canAddXp = false
            wait(1)
            canAddXp = true
        end

        if xp == 10 then
            xp = 0
            level +=1
        end
    end

    warn('data has been added for '..player.Name)

    while true do
        task.wait()
        local playerData = data[player]
        KLDealer.smoke(player, playerData)
        levelAndXpHandler()
    end
end

local function onPlayerRemoving(player)
    local data = Sdk.data
    data[player] = nil 

    warn('data has been removed for ' ..player.Name)
end

function Sdk.initialize()

    local potionEvent = Instance.new('RemoteEvent')
    potionEvent.Parent = game.ReplicatedStorage
    potionEvent.Name = 'potionEvent'

    --/ Event Bindings
    potionEvent.OnServerEvent:Connect(takesPotion)

    game.Players.PlayerAdded:Connect(onPlayerAdded)
    game.Players.PlayerRemoving:Connect(onPlayerRemoving)

end

return Sdk