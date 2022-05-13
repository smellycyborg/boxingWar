local potionEvent = game.ReplicatedStorage.KLEvents.PotionEvent

local player = game.Players.LocalPlayer
local mouse = player:GetMouse('Mouse')

local potion = 'fullHealth'

mouse.Button1Up:Connect(function()
    potionEvent:FireServer(potion)
end)