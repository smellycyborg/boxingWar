local KLItems = require(game.ReplicatedStorage.Common.KLItems)

local PlayerGui = game.Players.LocalPlayer.PlayerGui
local CraftingGui = PlayerGui:WaitForChild('CraftingGui')
local CraftingCategories = CraftingGui.CraftingCategories
local CraftingItems = CraftingGui.CraftingItems
local CraftEvent = game.ReplicatedStorage.KLEvents.CraftEvent

local function handleButtonInstance(value, parent)
    local valueButton = Instance.new('TextButton', parent)
    valueButton.Name = value
    valueButton.Text = value
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

local function onItemClick(value)
    local toCraft = value.Name
    CraftEvent:FireServer(toCraft)
end

for _, button in pairs(CraftingGui:GetDescendants()) do
    local isCategoryButton = button:IsA('TextButton') and button.Parent == CraftingCategories
    local isItemButton = button:IsA('TextButton') and button.Parent == CraftingItems
    if isCategoryButton then
        button.MouseButton1Down:Connect(function()
            onCatergoryClick(button.Name)
        end)
    else
        if isItemButton then
            button.MouseButton1Down:Connect(onItemClick)
        end
    end
end