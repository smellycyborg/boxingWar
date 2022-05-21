local PlayerGui = game.Players.LocalPlayer.PlayerGui
local CraftingGui = PlayerGui:WaitForChild('CraftingGui')
local CraftingButtonsHolder = CraftingGui.CraftingFrame
local CraftEvent = game.ReplicatedStorage.KLEvents.CraftEvent

local function onClick()
    local toCraft = 'StoneAxe'
    CraftEvent:FireServer(toCraft)
end

for _, craftButton in pairs(CraftingButtonsHolder:GetChildren()) do
    if craftButton:Isa('TextButton') then
        craftButton.MouseButton1Down:Connect(onClick)
    end
end