local potionEvent = game.ReplicatedStorage.remoteEvents.potionEvent

local player = game.Players.LocalPlayer
local mouse = player:GetMouse('Mouse')

mouse.Button1Up:Connect(function()
    potionEvent:FireServer()
end)