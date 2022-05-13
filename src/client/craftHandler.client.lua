local PlayerGui = game.Players.LocalPlayer.PlayerGui
local CraftButton = PlayerGui:WaitForChild('ScreenGui').CraftingFrame.TextButton
local CraftEvent = game.ReplicatedStorage.KLEvents.CraftEvent

local function onClick()
    local toCraft = 'StoneAxe'
    CraftEvent:FireServer(toCraft)
end

CraftButton.MouseButton1Down:Connect(onClick)