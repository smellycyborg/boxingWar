local player = game.Players.LocalPlayer 
local character = player.Character or player.CharacterAdded:wait()

local fieldOfView = 75
local offset = Vector3.new(-5 ,15, 12)
local camera = workspace.CurrentCamera

local runService = game:GetService('RunService')

function onRenderStep()
    camera.FieldOfView = fieldOfView
    camera.CameraType = Enum.CameraType.Scriptable
    local playerPosition = character.HumanoidRootPart.Position
    local cameraPosition = playerPosition + offset
    camera.CoordinateFrame = CFrame.new(cameraPosition, playerPosition)
end

runService:BindToRenderStep('Camera', Enum.RenderPriority.Camera.Value, onRenderStep)