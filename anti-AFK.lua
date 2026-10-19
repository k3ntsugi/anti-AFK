local genv = getgenv()
if genv.AntiAfkExecuted then return end
genv.AntiAfkExecuted = true

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local VirtualUser = game:GetService("VirtualUser")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer

-- Anti-AFK
LocalPlayer.Idled:Connect(function()
	VirtualUser:CaptureController()
	VirtualUser:ClickButton2(Vector2.new())
end)

-- GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "thisoneissocoldww"
screenGui.Parent = game.CoreGui
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Name = "madebybloodofbatus"
frame.Parent = screenGui
frame.BackgroundColor3 = Color3.fromRGB(18, 18, 20)
frame.BorderSizePixel = 0
frame.Position = UDim2.new(0.05, 0, 0.1, 0)
frame.Size = UDim2.new(0, 240, 0, 110)

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 8)

local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(55, 55, 60)
stroke.Thickness = 1

-- зелёная точка
local dot = Instance.new("Frame", frame)
dot.BackgroundColor3 = Color3.fromRGB(80, 220, 120)
dot.BorderSizePixel = 0
dot.Position = UDim2.new(0, 12, 0, 14)
dot.Size = UDim2.new(0, 6, 0, 6)
Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)

-- заголовок
local title = Instance.new("TextLabel", frame)
title.BackgroundTransparency = 1
title.Position = UDim2.new(0, 24, 0, 8)
title.Size = UDim2.new(0, 200, 0, 18)
title.Font = Enum.Font.Gotham
title.Text = "Anti-AFK · by k3ntsugi"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 11
title.TextXAlignment = Enum.TextXAlignment.Left

-- кнопка закрытия
local closeBtn = Instance.new("TextButton", frame)
closeBtn.BackgroundTransparency = 1
closeBtn.Position = UDim2.new(1, -28, 0, 8)
closeBtn.Size = UDim2.new(0, 20, 0, 20)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Text = "×"
closeBtn.TextColor3 = Color3.fromRGB(150, 150, 160)
closeBtn.TextSize = 18

closeBtn.MouseEnter:Connect(function()
	closeBtn.TextColor3 = Color3.fromRGB(220, 65, 65)
end)
closeBtn.MouseLeave:Connect(function()
	closeBtn.TextColor3 = Color3.fromRGB(150, 150, 160)
end)
closeBtn.MouseButton1Click:Connect(function()
	genv.AntiAfkExecuted = false
	screenGui:Destroy()
end)

-- разделитель
local line1 = Instance.new("Frame", frame)
line1.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
line1.BorderSizePixel = 0
line1.Position = UDim2.new(0, 12, 0, 30)
line1.Size = UDim2.new(1, -24, 0, 1)

-- подписи
local pingLabel = Instance.new("TextLabel", frame)
pingLabel.BackgroundTransparency = 1
pingLabel.Position = UDim2.new(0, 12, 0, 38)
pingLabel.Size = UDim2.new(0, 72, 0, 14)
pingLabel.Font = Enum.Font.Gotham
pingLabel.Text = "PING"
pingLabel.TextColor3 = Color3.fromRGB(160, 160, 175)
pingLabel.TextSize = 9
pingLabel.TextXAlignment = Enum.TextXAlignment.Left

local fpsLabel = Instance.new("TextLabel", frame)
fpsLabel.BackgroundTransparency = 1
fpsLabel.Position = UDim2.new(0, 92, 0, 38)
fpsLabel.Size = UDim2.new(0, 72, 0, 14)
fpsLabel.Font = Enum.Font.Gotham
fpsLabel.Text = "FPS"
fpsLabel.TextColor3 = Color3.fromRGB(160, 160, 175)
fpsLabel.TextSize = 9
fpsLabel.TextXAlignment = Enum.TextXAlignment.Left

local timeLabel = Instance.new("TextLabel", frame)
timeLabel.BackgroundTransparency = 1
timeLabel.Position = UDim2.new(0, 162, 0, 38)
timeLabel.Size = UDim2.new(0, 72, 0, 14)
timeLabel.Font = Enum.Font.Gotham
timeLabel.Text = "TIME"
timeLabel.TextColor3 = Color3.fromRGB(160, 160, 175)
timeLabel.TextSize = 9
timeLabel.TextXAlignment = Enum.TextXAlignment.Left

-- значения
local pingValue = Instance.new("TextLabel", frame)
pingValue.BackgroundTransparency = 1
pingValue.Position = UDim2.new(0, 12, 0, 52)
pingValue.Size = UDim2.new(0, 72, 0, 28)
pingValue.Font = Enum.Font.GothamBold
pingValue.Text = "--"
pingValue.TextColor3 = Color3.fromRGB(255, 255, 255)
pingValue.TextSize = 14
pingValue.TextXAlignment = Enum.TextXAlignment.Left

local fpsValue = Instance.new("TextLabel", frame)
fpsValue.BackgroundTransparency = 1
fpsValue.Position = UDim2.new(0, 92, 0, 52)
fpsValue.Size = UDim2.new(0, 72, 0, 28)
fpsValue.Font = Enum.Font.GothamBold
fpsValue.Text = "--"
fpsValue.TextColor3 = Color3.fromRGB(255, 255, 255)
fpsValue.TextSize = 14
fpsValue.TextXAlignment = Enum.TextXAlignment.Left

local timeValue = Instance.new("TextLabel", frame)
timeValue.BackgroundTransparency = 1
timeValue.Position = UDim2.new(0, 162, 0, 52)
timeValue.Size = UDim2.new(0, 72, 0, 28)
timeValue.Font = Enum.Font.GothamBold
timeValue.Text = "0:0:0"
timeValue.TextColor3 = Color3.fromRGB(255, 255, 255)
timeValue.TextSize = 12
timeValue.TextXAlignment = Enum.TextXAlignment.Left

-- нижний разделитель
local line2 = Instance.new("Frame", frame)
line2.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
line2.BorderSizePixel = 0
line2.Position = UDim2.new(0, 12, 0, 84)
line2.Size = UDim2.new(1, -24, 0, 1)

-- подпись внизу
local credit = Instance.new("TextLabel", frame)
credit.BackgroundTransparency = 1
credit.Position = UDim2.new(0, 12, 0, 90)
credit.Size = UDim2.new(0, 220, 0, 16)
credit.Font = Enum.Font.Gotham
credit.Text = "thanks for using"
credit.TextColor3 = Color3.fromRGB(220, 220, 230)
credit.TextSize = 11
credit.TextXAlignment = Enum.TextXAlignment.Left

-- анимация точки
task.spawn(function()
	while frame.Parent do
		TweenService:Create(dot, TweenInfo.new(0.9, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
			BackgroundColor3 = Color3.fromRGB(40, 160, 80)
		}):Play()
		task.wait(0.9)
		TweenService:Create(dot, TweenInfo.new(0.9, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
			BackgroundColor3 = Color3.fromRGB(80, 220, 120)
		}):Play()
		task.wait(0.9)
	end
end)

-- перетаскивание окна
local dragging = false
local dragStart, startPos

frame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = frame.Position
	end
end)

frame.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = false
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - dragStart
		frame.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)

-- обновление Ping
task.spawn(function()
	while frame.Parent do
		local ping = Stats:FindFirstChild("PerformanceStats") and Stats.PerformanceStats:FindFirstChild("Ping")
		if ping then
			pingValue.Text = math.floor(ping:GetValue())
		end
		task.wait(1)
	end
end)

-- обновление FPS
local lastTime = tick()
local frames = 0
RunService.RenderStepped:Connect(function()
	frames += 1
	if tick() - lastTime >= 1 then
		fpsValue.Text = frames
		frames = 0
		lastTime = tick()
	end
end)

-- таймер
local seconds = 0
task.spawn(function()
	while frame.Parent do
		local h = math.floor(seconds / 3600)
		local m = math.floor((seconds % 3600) / 60)
		local s = seconds % 60
		timeValue.Text = string.format("%d:%d:%d", h, m, s)
		seconds += 1
		task.wait(1)
	end
end)
