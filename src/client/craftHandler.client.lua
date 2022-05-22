local KLItems = require(game.ReplicatedStorage.Common.KLItems)

local PlayerGui = game.Players.LocalPlayer.PlayerGui
local CraftingGui = PlayerGui:WaitForChild('CraftingGui')
local CraftingCategories = CraftingGui.CraftingCategories
local CraftingItems = CraftingGui.CraftingItems
local CraftEvent = game.ReplicatedStorage.KLEvents.CraftEvent
local CraftingVisibleEvent = game.ReplicatedStorage.KLEvents.CraftingVisibleEvent

local function onItemClick(toCraft)
    CraftEvent:FireServer(toCraft)
end

local function handleButtonInstance(value, parent)
    local button = Instance.new('TextButton', parent)
    button.Name = value
    button.Text = string.lower(value:gsub("(%l)(%u)", "%1 %2"))

    button.MouseButton1Down:Connect(function()
        onItemClick(button.Name)
    end)
end

local function createItemButtons(category)
    local function destroyOldButtons()
        for _, v in pairs(CraftingItems:GetChildren()) do
            if v:IsA('TextButton') then
                v:Destroy()
            end
        end
    end
    destroyOldButtons()

    for categoryIndex, items in pairs(KLItems.CraftingItems) do
        if categoryIndex == category then
            for item, _ in pairs(items) do
                handleButtonInstance(item, CraftingItems)
            end
        end
    end
end

local function onCatergoryClick(value)
    createItemButtons(value)
end

local function onItemClick(toCraft)
    CraftEvent:FireServer(toCraft)
end

for _, button in pairs(CraftingCategories:GetChildren()) do
    local isButton = button:IsA('TextButton')
    if isButton then
        button.MouseButton1Down:Connect(function()
            onCatergoryClick(button.Name)
        end)
    end
end

local function handleCraftingVisible()
    CraftingGui.Enabled = not CraftingGui.Enabled
end

-- / Bindings
CraftingVisibleEvent.OnClientEvent:Connect(handleCraftingVisible)



