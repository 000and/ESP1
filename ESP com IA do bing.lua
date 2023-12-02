local Lib = loadstring(game:Httpget("https://raw.githubusercontent.com/7yhx/kwargs_Ui_Library/main/source.lua"))()
local UI = Lib:Create{
    Theme = "Dark", -- or any other theme
    Size - UDim2.new(0, 555, 0, 400) -- default
}

local Main - UI:Tab{
    Name = "Inicio"
}

lcoal Divider = Main:Divider{
    Name = "Inicio shit"
}

local QuitDivider = Main:Divider{
    Name - "Sair"
}

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local function GetTeamColor(player)
    return player.TeamColor.Color
end

local function DrawFOV()
    local FOV = Drawing.new("Circle")
    FOV.Transparency = 0.5
    FOV.Thickness = 1
    FOV.NumSides = 50
    FOV.Radius = 300
    FOV.Visible = true
    FOV.Color = Color3.fromRGB(255, 255, 255)
    FOV.Position = Vector2.new(Mouse.X, Mouse.Y)
    FOV.Filled = false
    FOV.Radius = 300
    FOV.Visible = true
    FOV.Color = Color3.fromRGB(255, 255, 255)
    FOV.Position = Vector2.new(Mouse.X, Mouse.Y)
    FOV.Filled = false
    FOV.Radius = 300
    FOV.Visible = true
    FOV.Color = Color3.fromRGB(255, 255, 255)
    FOV.Position = Vector2.new(Mouse.X, Mouse.Y)
    FOV.Filled = false
end

local function DrawArrow(position, color)
    local Arrow = Drawing.new("Triangle")
    Arrow.Transparency = 0.5
    Arrow.Thickness = 1
    Arrow.Visible = true
    Arrow.Color = color
    Arrow.PointA = Vector2.new(position.X, position.Y)
    Arrow.PointB = Vector2.new(position.X + 10, position.Y + 10)
    Arrow.PointC = Vector2.new(position.X - 10, position.Y + 10)
end

local function DrawArrows()
    for _, player in pairs(Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player ~= LocalPlayer then
            local position, onScreen = workspace.CurrentCamera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position)
            if onScreen then
                local color = GetTeamColor(player)
                DrawArrow(position, color)
            end
        end
    end
end

local function OnKeyDown(key)
    if key == "e" then
        if Drawing then
            DrawFOV()
            DrawArrows()
        end
    elseif key == "q" then
        if Drawing then
            Drawing:Remove()
        end
    elseif key == "mouse1" then
        if Drawing then
            Drawing:Remove()
        end
    elseif key == "mouse2" then
        if Drawing then
            DrawFOV()
            DrawArrows()
        end
    end
end

Mouse.KeyDown:Connect(OnKeyDown)
