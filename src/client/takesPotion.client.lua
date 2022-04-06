local potionEvent = game.ReplicatedStorage.potionEvent

local player = game.Players.LocalPlayer
local mouse = player:GetMouse('Mouse')

local potion = 'fullHealth'

mouse.Button1Up:Connect(function()
    potionEvent:FireServer(potion)
end)