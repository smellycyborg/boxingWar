local PlayerGui = game.Players.LocalPlayer.PlayerGui
local CraftingGui = PlayerGui:WaitForChild('CraftingGui')
local CraftingButtonsHolder = CraftingGui.CraftingFrame
local CraftEvent = game.ReplicatedStorage.KLEvents.CraftEvent

for _, craftButton in pairs(CraftingButtonsHolder:GetChildren()) do
    if craftButton:IsA('TextButton') then
        local function onClick()
            local toCraft = craftButton.Name
            CraftEvent:FireServer(toCraft)
        end
        craftButton.MouseButton1Down:Connect(onClick)
    end
end