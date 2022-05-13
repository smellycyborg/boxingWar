local PlayerGui = game.Players.LocalPlayer.PlayerGUi
local CraftButton = PlayerGui.ScreenGui.CraftingFrame.TextButton
local CraftEvent = game.ReplicatedStorage.KLEvents.CraftEvent

local function onClick()
    local toCraft = 'StoneAxe'
    CraftEvent:FireServer(toCraft)
end

CraftButton.MouseButton1Down:Connect(onClick)