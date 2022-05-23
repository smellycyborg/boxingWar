local KLDealer = require(script.Parent.KLDealer)
local KLPositions = require(script.Parent.KLPositions)
local KLItems = require(game.ReplicatedStorage.Common.KLItems)
local ReplicatedStorage = game.ReplicatedStorage

local Sdk = {
    data = {}
}

local function onCharacherTouched(part, player)
    local attribute = part:GetAttribute('String')
    if not attribute then return end

    local data = Sdk.data
    data[player].Materials[attribute].amount+=1
    part:Destroy()
    print('MESSAGE/Info: ' .. player.Name .. ' has picked up a ' .. attribute .. ' and their ' .. attribute .. ' are now ' .. data[player].Materials[attribute].amount .. '.')
end

local function onCharacterAdded(character)
    local player = game.Players:GetPlayerFromCharacter(character)
    local characterChildren = character:GetChildren()

    for _, v in pairs(characterChildren) do
        local isPart = v:IsA('Part')
        if isPart then
            v.Touched:Connect(function(part)
                onCharacherTouched(part, player)
            end)
        end
    end
end

local function onCharacterRemoving(character)
    local player = game.Players:GetPlayerFromCharacter(character)
    local data = Sdk.data
	for category, items in pairs(data[player]) do
        local isCanHurt = category == 'canHurt'
        if isCanHurt then
            continue
        else
            local isPotions = category == 'Potions'
            if isPotions then
                for item, value in pairs(items) do
                    value.bool = false
                end
            else
                for item, value in pairs(items) do
                    value.amount = 0
                end
            end
        end
    end
end

local function takesPotion(player, potion)
    local data = Sdk.data
    local potions = data[player].Items['Potions']
    local potionAmount = potions[potion].amount
    local potionValue = potions[potion].value

    local hasPotion = potionAmount > 0
    if hasPotion then
        data[player].Items['Potions'][potion].amount-=1
        KLDealer.addHealth(player, potionValue)

        print('MESSAGE/Info: ' .. player.Name .. ' took a '.. potion .. ' potion and has been given more health.  :)')
    else
        print('MESSAGE/Info: ' .. player.Name .. ' has no potion.')
    end
end

local function onPlayerAdded(player)
    local data = Sdk.data
    data[player] = {}

    --/ materials
    data[player].Materials = {}
    for _, material in pairs(KLItems.Materials) do
        data[player].Materials[material] = {amount = 0, }
    end

    --/ crafting items
    data[player].Items = {}
    for category, items in pairs(KLItems.Items) do
        data[player].Items[category] = {}
        for item, _ in pairs(items) do
            data[player].Items[category][item] = {amount = 0, }
        end
    end

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

    warn('MESSAGE/Info: Data has been added for ' .. player.Name .. '.')

    player.CharacterAdded:Connect(onCharacterAdded)
    player.CharacterRemoving:Connect(onCharacterRemoving)

    while true do
        task.wait()
        local playerData = data[player]
        KLDealer.smoke(player, playerData)
        levelAndXpHandler()
    end
end


local function removePlayerData(player)
    local data = Sdk.data
    local playerIndex = table.find(data, player)
    table.remove(data, playerIndex)
end 

local function onPlayerRemoving(player)
    removePlayerData(player)

    warn('MESSAGE/Info:  Data has been removed for ' .. player.Name .. '.')
end

local function cloneMaterials(material)
    local Materials = ReplicatedStorage:WaitForChild('Materials')
    local material = Materials[material]

    for i = 1, math.random(4, 7) do
        local materialClone = material:Clone()
        materialClone.Parent = workspace
        materialClone.Position = KLPositions.positionfy(materialClone)
        materialClone:SetAttribute('String', tostring(material))
    end
end

local function createMaterials(materials)
    for _, material in pairs(materials) do
        local isPureWater = material == 'PureWater'
        if isPureWater then 
            continue
        end
        cloneMaterials(material)
    end
end

local function findItemData(object, item)
	for index, value in pairs(object) do
		if value[item] == nil then
			continue
		else
			return value[item]
		end
	end
end

local function doesPlayerHaveEnoughMaterials(itemData, playerData)
    local playerHasEnough
    for material, amount in pairs(itemData.MaterialsNeeded) do
        if playerData[material] >= amount then
            playerHasEnough = true
        else
            playerHasEnough = false
            break
        end
    end
    return playerHasEnough
end

local function handleDataForCraft()
end

local function handleCraft(player, itemToCraft)
    local data = Sdk.data 
    local Items = KLItems.ItemsItems
    local itemToCraftData = findItemData(Items, itemToCraft)
    local playerInventory = data[player].Items[itemToCraftData.TypeOfItem]
    local playerMaterials = data[player].Materials

    local playerHasMaterials = doesPlayerHaveEnoughMaterials(itemToCraftData, playerMaterials)
    
    if playerHasMaterials then
        playerInventory[itemToCraft]+=1
        
        for material, amount in pairs(itemToCraftData.MaterialsNeeded) do
            playerMaterials[material]-=amount
        end

        print('MESSAGE/Info:  ' .. player.Name .. ' has crafted a ' .. itemToCraft .. '.')
    end
end

function Sdk.initialize()
    createMaterials(KLItems.Materials)

    --/ Events
    local KLEvents = Instance.new('Folder', ReplicatedStorage)
    KLEvents.Name = 'KLEvents'
    local potionEvent = Instance.new('RemoteEvent', KLEvents)
    potionEvent.Name = 'PotionEvent'
    local craftEvent = Instance.new('RemoteEvent', KLEvents)
    craftEvent.Name = 'CraftEvent'

    --/ Event Bindings
    potionEvent.OnServerEvent:Connect(takesPotion)
    craftEvent.OnServerEvent:Connect(handleCraft)

    game.Players.PlayerAdded:Connect(onPlayerAdded)
    game.Players.PlayerRemoving:Connect(onPlayerRemoving)
end

return Sdk