-- ROBLOX FPS OPTIMIZER - BEAUTIFUL CUSTOM UI
-- Modern design with smooth animations
-- Mirip Rayfield tapi lebih bagus!

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Settings
local Settings = {
   FPSBoost = false,
   RemoveTextures = false,
   RemoveParticles = false,
   RemoveShadows = false,
   RemoveFog = false,
   ShowFPS = false,
}

-- Theme Colors (Discord-like)
local Theme = {
   Background = Color3.fromRGB(32, 34, 37),
   Secondary = Color3.fromRGB(47, 49, 54),
   Tertiary = Color3.fromRGB(54, 57, 63),
   Primary = Color3.fromRGB(88, 101, 242),
   Success = Color3.fromRGB(67, 181, 129),
   Warning = Color3.fromRGB(250, 166, 26),
   Danger = Color3.fromRGB(237, 66, 69),
   Text = Color3.fromRGB(255, 255, 255),
   TextDark = Color3.fromRGB(142, 146, 151),
   Accent = Color3.fromRGB(114, 137, 218),
}

print("\n" .. string.rep("=", 70))
print("FPS OPTIMIZER - CUSTOM UI LOADING")
print(string.rep("=", 70) .. "\n")

-- Create ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FPSOptimizerUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = playerGui

-- Blur Background
local Blur = Instance.new("BlurEffect")
Blur.Size = 0
Blur.Parent = game.Lighting

-- Main Container
local MainContainer = Instance.new("Frame")
MainContainer.Name = "MainContainer"
MainContainer.Size = UDim2.new(0, 0, 0, 0)
MainContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
MainContainer.AnchorPoint = Vector2.new(0.5, 0.5)
MainContainer.BackgroundTransparency = 1
MainContainer.Parent = ScreenGui

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(1, 0, 1, 0)
MainFrame.BackgroundColor3 = Theme.Background
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = MainContainer

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 16)
MainCorner.Parent = MainFrame

-- Drop Shadow
local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
Shadow.BackgroundTransparency = 1
Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
Shadow.Size = UDim2.new(1, 40, 1, 40)
Shadow.ZIndex = -1
Shadow.Image = "rbxassetid://5554236805"
Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency = 0.3
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(23, 23, 277, 277)
Shadow.Parent = MainFrame

-- Topbar
local Topbar = Instance.new("Frame")
Topbar.Name = "Topbar"
Topbar.Size = UDim2.new(1, 0, 0, 50)
Topbar.BackgroundColor3 = Theme.Secondary
Topbar.BorderSizePixel = 0
Topbar.Parent = MainFrame

local TopbarCorner = Instance.new("UICorner")
TopbarCorner.CornerRadius = UDim.new(0, 16)
TopbarCorner.Parent = Topbar

-- Cover bottom of topbar
local TopbarCover = Instance.new("Frame")
TopbarCover.Size = UDim2.new(1, 0, 0, 16)
TopbarCover.Position = UDim2.new(0, 0, 1, -16)
TopbarCover.BackgroundColor3 = Theme.Secondary
TopbarCover.BorderSizePixel = 0
TopbarCover.Parent = Topbar

-- Logo/Icon
local Logo = Instance.new("ImageLabel")
Logo.Size = UDim2.new(0, 30, 0, 30)
Logo.Position = UDim2.new(0, 15, 0.5, -15)
Logo.BackgroundTransparency = 1
Logo.Image = "rbxassetid://7733964370" -- Thunder icon
Logo.ImageColor3 = Theme.Primary
Logo.Parent = Topbar

-- Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 200, 1, 0)
Title.Position = UDim2.new(0, 55, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "FPS OPTIMIZER"
Title.TextColor3 = Theme.Text
Title.TextSize = 16
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Topbar

-- Version
local Version = Instance.new("TextLabel")
Version.Size = UDim2.new(0, 50, 0, 18)
Version.Position = UDim2.new(0, 55, 1, -22)
Version.BackgroundTransparency = 1
Version.Text = "v2.0"
Version.TextColor3 = Theme.TextDark
Version.TextSize = 11
Version.Font = Enum.Font.Gotham
Version.TextXAlignment = Enum.TextXAlignment.Left
Version.Parent = Topbar

-- Close Button
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 40, 0, 40)
CloseButton.Position = UDim2.new(1, -45, 0, 5)
CloseButton.BackgroundColor3 = Theme.Tertiary
CloseButton.BorderSizePixel = 0
CloseButton.Text = ""
CloseButton.AutoButtonColor = false
CloseButton.Parent = Topbar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseButton

local CloseIcon = Instance.new("TextLabel")
CloseIcon.Size = UDim2.new(1, 0, 1, 0)
CloseIcon.BackgroundTransparency = 1
CloseIcon.Text = "×"
CloseIcon.TextColor3 = Theme.TextDark
CloseIcon.TextSize = 28
CloseIcon.Font = Enum.Font.GothamBold
CloseIcon.Parent = CloseButton

-- Minimize Button
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Size = UDim2.new(0, 40, 0, 40)
MinimizeButton.Position = UDim2.new(1, -90, 0, 5)
MinimizeButton.BackgroundColor3 = Theme.Tertiary
MinimizeButton.BorderSizePixel = 0
MinimizeButton.Text = ""
MinimizeButton.AutoButtonColor = false
MinimizeButton.Parent = Topbar

local MinimizeCorner = Instance.new("UICorner")
MinimizeCorner.CornerRadius = UDim.new(0, 8)
MinimizeCorner.Parent = MinimizeButton

local MinimizeIcon = Instance.new("TextLabel")
MinimizeIcon.Size = UDim2.new(1, 0, 1, 0)
MinimizeIcon.BackgroundTransparency = 1
MinimizeIcon.Text = "−"
MinimizeIcon.TextColor3 = Theme.TextDark
MinimizeIcon.TextSize = 24
MinimizeIcon.Font = Enum.Font.GothamBold
MinimizeIcon.Parent = MinimizeButton

-- Content Container
local ContentContainer = Instance.new("Frame")
ContentContainer.Name = "ContentContainer"
ContentContainer.Size = UDim2.new(1, -30, 1, -65)
ContentContainer.Position = UDim2.new(0, 15, 0, 60)
ContentContainer.BackgroundTransparency = 1
ContentContainer.Parent = MainFrame

-- Scrolling Frame
local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Size = UDim2.new(1, 0, 1, 0)
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.BorderSizePixel = 0
ScrollFrame.ScrollBarThickness = 6
ScrollFrame.ScrollBarImageColor3 = Theme.Primary
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollFrame.Parent = ContentContainer

local ScrollPadding = Instance.new("UIPadding")
ScrollPadding.PaddingRight = UDim.new(0, 10)
ScrollPadding.Parent = ScrollFrame

local ListLayout = Instance.new("UIListLayout")
ListLayout.Padding = UDim.new(0, 12)
ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
ListLayout.Parent = ScrollFrame

-- FPS Counter
local FPSFrame = Instance.new("Frame")
FPSFrame.Name = "FPSCounter"
FPSFrame.Size = UDim2.new(0, 100, 0, 60)
FPSFrame.Position = UDim2.new(1, -110, 0, 10)
FPSFrame.BackgroundColor3 = Theme.Secondary
FPSFrame.BorderSizePixel = 0
FPSFrame.Visible = false
FPSFrame.Parent = ScreenGui

local FPSCorner = Instance.new("UICorner")
FPSCorner.CornerRadius = UDim.new(0, 12)
FPSCorner.Parent = FPSFrame

local FPSGradient = Instance.new("UIGradient")
FPSGradient.Color = ColorSequence.new({
   ColorSequenceKeypoint.new(0, Theme.Secondary),
   ColorSequenceKeypoint.new(1, Theme.Tertiary)
})
FPSGradient.Rotation = 45
FPSGradient.Parent = FPSFrame

local FPSLabel = Instance.new("TextLabel")
FPSLabel.Size = UDim2.new(1, 0, 0, 20)
FPSLabel.Position = UDim2.new(0, 0, 0, 8)
FPSLabel.BackgroundTransparency = 1
FPSLabel.Text = "FPS"
FPSLabel.TextColor3 = Theme.TextDark
FPSLabel.TextSize = 11
FPSLabel.Font = Enum.Font.GothamBold
FPSLabel.Parent = FPSFrame

local FPSValue = Instance.new("TextLabel")
FPSValue.Size = UDim2.new(1, 0, 0, 30)
FPSValue.Position = UDim2.new(0, 0, 0, 25)
FPSValue.BackgroundTransparency = 1
FPSValue.Text = "60"
FPSValue.TextColor3 = Theme.Success
FPSValue.TextSize = 26
FPSValue.Font = Enum.Font.GothamBold
FPSValue.Parent = FPSFrame

-- Update FPS Counter
task.spawn(function()
   while task.wait(0.5) do
      local fps = math.floor(1 / RunService.RenderStepped:Wait())
      FPSValue.Text = tostring(fps)
      
      if fps >= 60 then
         FPSValue.TextColor3 = Theme.Success
      elseif fps >= 30 then
         FPSValue.TextColor3 = Theme.Warning
      else
         FPSValue.TextColor3 = Theme.Danger
      end
   end
end)

-- UI Building Functions
local function CreateSection(name)
   local Section = Instance.new("Frame")
   Section.Name = "Section"
   Section.Size = UDim2.new(1, 0, 0, 30)
   Section.BackgroundTransparency = 1
   Section.Parent = ScrollFrame
   
   local SectionLabel = Instance.new("TextLabel")
   SectionLabel.Size = UDim2.new(1, 0, 1, 0)
   SectionLabel.BackgroundTransparency = 1
   SectionLabel.Text = name
   SectionLabel.TextColor3 = Theme.TextDark
   SectionLabel.TextSize = 13
   SectionLabel.Font = Enum.Font.GothamBold
   SectionLabel.TextXAlignment = Enum.TextXAlignment.Left
   SectionLabel.TextTransparency = 0.3
   SectionLabel.Parent = Section
   
   return Section
end

local function CreateButton(name, description, callback, color)
   local Button = Instance.new("TextButton")
   Button.Name = "Button"
   Button.Size = UDim2.new(1, 0, 0, description and 65 or 50)
   Button.BackgroundColor3 = color or Theme.Tertiary
   Button.BorderSizePixel = 0
   Button.AutoButtonColor = false
   Button.Text = ""
   Button.ClipsDescendants = true
   Button.Parent = ScrollFrame
   
   local ButtonCorner = Instance.new("UICorner")
   ButtonCorner.CornerRadius = UDim.new(0, 10)
   ButtonCorner.Parent = Button
   
   -- Gradient
   local Gradient = Instance.new("UIGradient")
   Gradient.Color = ColorSequence.new({
      ColorSequenceKeypoint.new(0, color or Theme.Tertiary),
      ColorSequenceKeypoint.new(1, Color3.fromRGB(
         math.max(0, (color or Theme.Tertiary).R * 255 - 10),
         math.max(0, (color or Theme.Tertiary).G * 255 - 10),
         math.max(0, (color or Theme.Tertiary).B * 255 - 10)
      ))
   })
   Gradient.Rotation = 45
   Gradient.Parent = Button
   
   local Title = Instance.new("TextLabel")
   Title.Size = UDim2.new(1, -20, 0, description and 25 or 50)
   Title.Position = UDim2.new(0, 15, 0, description and 10 or 0)
   Title.BackgroundTransparency = 1
   Title.Text = name
   Title.TextColor3 = Theme.Text
   Title.TextSize = 14
   Title.Font = Enum.Font.GothamBold
   Title.TextXAlignment = Enum.TextXAlignment.Left
   Title.Parent = Button
   
   if description then
      local Desc = Instance.new("TextLabel")
      Desc.Size = UDim2.new(1, -20, 0, 25)
      Desc.Position = UDim2.new(0, 15, 0, 35)
      Desc.BackgroundTransparency = 1
      Desc.Text = description
      Desc.TextColor3 = Theme.TextDark
      Desc.TextSize = 11
      Desc.Font = Enum.Font.Gotham
      Desc.TextXAlignment = Enum.TextXAlignment.Left
      Desc.TextWrapped = true
      Desc.Parent = Button
   end
   
   -- Hover effect
   Button.MouseEnter:Connect(function()
      TweenService:Create(Button, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
         BackgroundColor3 = Color3.fromRGB(
            math.min(255, (color or Theme.Tertiary).R * 255 + 15),
            math.min(255, (color or Theme.Tertiary).G * 255 + 15),
            math.min(255, (color or Theme.Tertiary).B * 255 + 15)
         )
      }):Play()
   end)
   
   Button.MouseLeave:Connect(function()
      TweenService:Create(Button, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
         BackgroundColor3 = color or Theme.Tertiary
      }):Play()
   end)
   
   -- Click effect
   Button.MouseButton1Click:Connect(function()
      -- Ripple effect
      local Ripple = Instance.new("Frame")
      Ripple.Size = UDim2.new(0, 0, 0, 0)
      Ripple.Position = UDim2.new(0.5, 0, 0.5, 0)
      Ripple.AnchorPoint = Vector2.new(0.5, 0.5)
      Ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      Ripple.BackgroundTransparency = 0.5
      Ripple.BorderSizePixel = 0
      Ripple.Parent = Button
      
      local RippleCorner = Instance.new("UICorner")
      RippleCorner.CornerRadius = UDim.new(1, 0)
      RippleCorner.Parent = Ripple
      
      local size = math.max(Button.AbsoluteSize.X, Button.AbsoluteSize.Y) * 2
      
      TweenService:Create(Ripple, TweenInfo.new(0.5), {
         Size = UDim2.new(0, size, 0, size),
         BackgroundTransparency = 1
      }):Play()
      
      task.delay(0.5, function()
         Ripple:Destroy()
      end)
      
      if callback then
         callback()
      end
   end)
   
   return Button
end

local function CreateToggle(name, description, default, callback)
   local Toggle = Instance.new("Frame")
   Toggle.Name = "Toggle"
   Toggle.Size = UDim2.new(1, 0, 0, description and 65 or 50)
   Toggle.BackgroundColor3 = Theme.Tertiary
   Toggle.BorderSizePixel = 0
   Toggle.Parent = ScrollFrame
   
   local ToggleCorner = Instance.new("UICorner")
   ToggleCorner.CornerRadius = UDim.new(0, 10)
   ToggleCorner.Parent = Toggle
   
   local Title = Instance.new("TextLabel")
   Title.Size = UDim2.new(1, -80, 0, description and 25 or 50)
   Title.Position = UDim2.new(0, 15, 0, description and 10 or 0)
   Title.BackgroundTransparency = 1
   Title.Text = name
   Title.TextColor3 = Theme.Text
   Title.TextSize = 14
   Title.Font = Enum.Font.GothamBold
   Title.TextXAlignment = Enum.TextXAlignment.Left
   Title.Parent = Toggle
   
   if description then
      local Desc = Instance.new("TextLabel")
      Desc.Size = UDim2.new(1, -80, 0, 25)
      Desc.Position = UDim2.new(0, 15, 0, 35)
      Desc.BackgroundTransparency = 1
      Desc.Text = description
      Desc.TextColor3 = Theme.TextDark
      Desc.TextSize = 11
      Desc.Font = Enum.Font.Gotham
      Desc.TextXAlignment = Enum.TextXAlignment.Left
      Desc.TextWrapped = true
      Desc.Parent = Toggle
   end
   
   -- Toggle Switch
   local Switch = Instance.new("TextButton")
   Switch.Size = UDim2.new(0, 50, 0, 26)
   Switch.Position = UDim2.new(1, -60, 0.5, -13)
   Switch.BackgroundColor3 = Theme.Secondary
   Switch.BorderSizePixel = 0
   Switch.AutoButtonColor = false
   Switch.Text = ""
   Switch.Parent = Toggle
   
   local SwitchCorner = Instance.new("UICorner")
   SwitchCorner.CornerRadius = UDim.new(1, 0)
   SwitchCorner.Parent = Switch
   
   local Circle = Instance.new("Frame")
   Circle.Size = UDim2.new(0, 20, 0, 20)
   Circle.Position = UDim2.new(0, 3, 0.5, -10)
   Circle.BackgroundColor3 = Theme.Text
   Circle.BorderSizePixel = 0
   Circle.Parent = Switch
   
   local CircleCorner = Instance.new("UICorner")
   CircleCorner.CornerRadius = UDim.new(1, 0)
   CircleCorner.Parent = Circle
   
   local enabled = default or false
   
   local function UpdateToggle(animate)
      if enabled then
         local tweenInfo = animate and TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out) or TweenInfo.new(0)
         TweenService:Create(Switch, tweenInfo, {BackgroundColor3 = Theme.Primary}):Play()
         TweenService:Create(Circle, tweenInfo, {Position = UDim2.new(1, -23, 0.5, -10)}):Play()
      else
         local tweenInfo = animate and TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out) or TweenInfo.new(0)
         TweenService:Create(Switch, tweenInfo, {BackgroundColor3 = Theme.Secondary}):Play()
         TweenService:Create(Circle, tweenInfo, {Position = UDim2.new(0, 3, 0.5, -10)}):Play()
      end
   end
   
   UpdateToggle(false)
   
   Switch.MouseButton1Click:Connect(function()
      enabled = not enabled
      UpdateToggle(true)
      if callback then
         callback(enabled)
      end
   end)
   
   return Toggle
end

local function CreateNotification(title, message, duration, notifType)
   local color = Theme.Primary
   if notifType == "success" then
      color = Theme.Success
   elseif notifType == "warning" then
      color = Theme.Warning
   elseif notifType == "error" then
      color = Theme.Danger
   end
   
   local Notif = Instance.new("Frame")
   Notif.Size = UDim2.new(0, 320, 0, 80)
   Notif.Position = UDim2.new(1, 350, 1, -100)
   Notif.BackgroundColor3 = Theme.Secondary
   Notif.BorderSizePixel = 0
   Notif.Parent = ScreenGui
   
   local NotifCorner = Instance.new("UICorner")
   NotifCorner.CornerRadius = UDim.new(0, 12)
   NotifCorner.Parent = Notif
   
   local Accent = Instance.new("Frame")
   Accent.Size = UDim2.new(0, 4, 1, 0)
   Accent.BackgroundColor3 = color
   Accent.BorderSizePixel = 0
   Accent.Parent = Notif
   
   local AccentCorner = Instance.new("UICorner")
   AccentCorner.CornerRadius = UDim.new(0, 12)
   AccentCorner.Parent = Accent
   
   local NotifTitle = Instance.new("TextLabel")
   NotifTitle.Size = UDim2.new(1, -20, 0, 25)
   NotifTitle.Position = UDim2.new(0, 15, 0, 12)
   NotifTitle.BackgroundTransparency = 1
   NotifTitle.Text = title
   NotifTitle.TextColor3 = Theme.Text
   NotifTitle.TextSize = 14
   NotifTitle.Font = Enum.Font.GothamBold
   NotifTitle.TextXAlignment = Enum.TextXAlignment.Left
   NotifTitle.Parent = Notif
   
   local NotifDesc = Instance.new("TextLabel")
   NotifDesc.Size = UDim2.new(1, -20, 0, 35)
   NotifDesc.Position = UDim2.new(0, 15, 0, 40)
   NotifDesc.BackgroundTransparency = 1
   NotifDesc.Text = message
   NotifDesc.TextColor3 = Theme.TextDark
   NotifDesc.TextSize = 12
   NotifDesc.Font = Enum.Font.Gotham
   NotifDesc.TextXAlignment = Enum.TextXAlignment.Left
   NotifDesc.TextWrapped = true
   NotifDesc.Parent = Notif
   
   -- Slide in
   TweenService:Create(Notif, TweenInfo.new(0.4, Enum.EasingStyle.Back), {
      Position = UDim2.new(1, -330, 1, -100)
   }):Play()
   
   -- Wait then slide out
   task.wait(duration or 3)
   TweenService:Create(Notif, TweenInfo.new(0.3), {
      Position = UDim2.new(1, 350, 1, -100)
   }):Play()
   
   task.wait(0.3)
   Notif:Destroy()
end

-- Build UI
CreateSection("🚀 QUICK BOOST")

CreateButton("⚡ ULTRA FPS BOOST", "Apply all optimizations (collision preserved)", function()
   CreateNotification("Ultra FPS Boost", "Applying all optimizations! FPS will increase!", 3, "success")
   ApplyAllOptimizationsSafe()
end, Theme.Success)

CreateButton("🥔 POTATO MODE", "Maximum FPS for low-end PCs", function()
   CreateNotification("Potato Mode", "Maximum FPS mode activated!", 3, "warning")
   ApplyPotatoMode()
end, Theme.Warning)

CreateButton("⚡ PERFORMANCE MODE", "Balanced settings for mid-range PCs", function()
   CreateNotification("Performance Mode", "Balanced settings applied!", 3, "success")
   ApplyPerformanceMode()
end, Theme.Primary)

CreateSection("📊 MONITORING")

CreateToggle("Show FPS Counter", "Display live FPS counter", false, function(value)
   FPSFrame.Visible = value
   Settings.ShowFPS = value
end)

CreateSection("🎨 GRAPHICS OPTIMIZATION")

CreateToggle("Remove Textures", "Remove all textures for FPS boost", false, function(value)
   Settings.RemoveTextures = value
   if value then
      RemoveTextures()
      CreateNotification("Textures", "All textures removed!", 2, "success")
   end
end)

CreateToggle("Remove Particles", "Remove particle effects", false, function(value)
   Settings.RemoveParticles = value
   if value then
      RemoveParticles()
      CreateNotification("Particles", "Particle effects removed!", 2, "success")
   end
end)

CreateToggle("Remove Shadows", "Disable all shadows", false, function(value)
   Settings.RemoveShadows = value
   RemoveShadows(value)
   if value then
      CreateNotification("Shadows", "Shadows disabled!", 2, "success")
   end
end)

CreateToggle("Remove Fog", "Remove distance fog", false, function(value)
   Settings.RemoveFog = value
   RemoveFog(value)
   if value then
      CreateNotification("Fog", "Fog removed!", 2, "success")
   end
end)

CreateSection("🛡️ ANTI LAG")

CreateButton("🧹 Clear Memory", "Clear memory cache", function()
   ClearMemoryCache()
   CreateNotification("Memory", "Memory cache cleared!", 2, "success")
end, Theme.Primary)

CreateButton("⚙️ Optimize Workspace", "Optimize workspace rendering", function()
   OptimizeWorkspace()
   CreateNotification("Workspace", "Workspace optimized!", 2, "success")
end, Theme.Primary)

CreateButton("🔧 Fix Physics Lag", "Optimize physics calculations", function()
   FixPhysicsLag()
   CreateNotification("Physics", "Physics optimized!", 2, "success")
end, Theme.Primary)

CreateSection("⚙️ ADVANCED")

CreateButton("🗑️ Remove Unused Assets", "Delete unused game assets", function()
   RemoveUnusedAssets()
   CreateNotification("Assets", "Unused assets removed!", 2, "warning")
end, Theme.Warning)

CreateButton("↩️ Restore Defaults", "Reset all settings", function()
   RestoreDefaults()
   CreateNotification("Restored", "Settings restored to default!", 2, "error")
end, Theme.Danger)

-- Button Hover Effects
local buttons = {CloseButton, MinimizeButton}
for _, button in pairs(buttons) do
   button.MouseEnter:Connect(function()
      TweenService:Create(button, TweenInfo.new(0.2), {
         BackgroundColor3 = Theme.Secondary
      }):Play()
   end)
   
   button.MouseLeave:Connect(function()
      TweenService:Create(button, TweenInfo.new(0.2), {
         BackgroundColor3 = Theme.Tertiary
      }):Play()
   end)
end

-- Mini Toggle Button (appears after close)
local MiniButton = Instance.new("ImageButton")
MiniButton.Name = "MiniToggle"
MiniButton.Size = UDim2.new(0, 60, 0, 60)
MiniButton.Position = UDim2.new(1, -70, 0.5, -30)
MiniButton.BackgroundColor3 = Theme.Primary
MiniButton.BorderSizePixel = 0
MiniButton.Visible = false
MiniButton.Image = ""
MiniButton.AutoButtonColor = false
MiniButton.Parent = ScreenGui

local MiniCorner = Instance.new("UICorner")
MiniCorner.CornerRadius = UDim.new(0, 30)
MiniCorner.Parent = MiniButton

-- Gradient for mini button
local MiniGradient = Instance.new("UIGradient")
MiniGradient.Color = ColorSequence.new({
   ColorSequenceKeypoint.new(0, Theme.Primary),
   ColorSequenceKeypoint.new(1, Theme.Accent)
})
MiniGradient.Rotation = 45
MiniGradient.Parent = MiniButton

-- Icon for mini button
local MiniIcon = Instance.new("TextLabel")
MiniIcon.Size = UDim2.new(1, 0, 1, 0)
MiniIcon.BackgroundTransparency = 1
MiniIcon.Text = "⚡"
MiniIcon.TextColor3 = Theme.Text
MiniIcon.TextSize = 30
MiniIcon.Font = Enum.Font.GothamBold
MiniIcon.Parent = MiniButton

-- Pulse animation for mini button
local function PulseMini()
   while MiniButton.Visible do
      TweenService:Create(MiniButton, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
         Size = UDim2.new(0, 65, 0, 65)
      }):Play()
      task.wait(1)
      TweenService:Create(MiniButton, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
         Size = UDim2.new(0, 60, 0, 60)
      }):Play()
      task.wait(1)
   end
end

-- Mini button hover effect
MiniButton.MouseEnter:Connect(function()
   TweenService:Create(MiniButton, TweenInfo.new(0.2), {
      Size = UDim2.new(0, 70, 0, 70),
      BackgroundColor3 = Theme.Accent
   }):Play()
   TweenService:Create(MiniIcon, TweenInfo.new(0.2), {
      Rotation = 15
   }):Play()
end)

MiniButton.MouseLeave:Connect(function()
   TweenService:Create(MiniButton, TweenInfo.new(0.2), {
      Size = UDim2.new(0, 60, 0, 60),
      BackgroundColor3 = Theme.Primary
   }):Play()
   TweenService:Create(MiniIcon, TweenInfo.new(0.2), {
      Rotation = 0
   }):Play()
end)

-- Mini button click - reopen UI
MiniButton.MouseButton1Click:Connect(function()
   -- Hide mini button
   TweenService:Create(MiniButton, TweenInfo.new(0.3), {
      Size = UDim2.new(0, 0, 0, 0)
   }):Play()
   
   task.wait(0.3)
   MiniButton.Visible = false
   
   -- Show main UI again
   MainContainer.Visible = true
   TweenService:Create(Blur, TweenInfo.new(0.3), {Size = 10}):Play()
   TweenService:Create(MainContainer, TweenInfo.new(0.5, Enum.EasingStyle.Back), {
      Size = UDim2.new(0, 450, 0, 550)
   }):Play()
   
   CreateNotification("Welcome Back!", "UI reopened successfully!", 2, "success")
end)

-- Make mini button draggable
local miniDragging = false
local miniDragStart
local miniStartPos

MiniButton.InputBegan:Connect(function(input)
   if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
      miniDragging = true
      miniDragStart = input.Position
      miniStartPos = MiniButton.Position
      
      input.Changed:Connect(function()
         if input.UserInputState == Enum.UserInputState.End then
            miniDragging = false
         end
      end)
   end
end)

UserInputService.InputChanged:Connect(function(input)
   if miniDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
      local delta = input.Position - miniDragStart
      MiniButton.Position = UDim2.new(
         miniStartPos.X.Scale,
         miniStartPos.X.Offset + delta.X,
         miniStartPos.Y.Scale,
         miniStartPos.Y.Offset + delta.Y
      )
   end
end)

-- Close Button (modified to show mini button)
local uiClosed = false
CloseButton.MouseButton1Click:Connect(function()
   if uiClosed then return end
   uiClosed = true
   
   -- Close main UI
   TweenService:Create(Blur, TweenInfo.new(0.3), {Size = 0}):Play()
   TweenService:Create(MainContainer, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
      Size = UDim2.new(0, 0, 0, 0)
   }):Play()
   
   task.wait(0.3)
   MainContainer.Visible = false
   
   -- Show mini button
   MiniButton.Visible = true
   MiniButton.Size = UDim2.new(0, 0, 0, 0)
   MiniButton.Position = UDim2.new(1, -70, 0.5, -30)
   
   TweenService:Create(MiniButton, TweenInfo.new(0.4, Enum.EasingStyle.Back), {
      Size = UDim2.new(0, 60, 0, 60)
   }):Play()
   
   -- Start pulse animation
   task.spawn(PulseMini)
   
   uiClosed = false
end)

-- Minimize Button
local minimized = false
MinimizeButton.MouseButton1Click:Connect(function()
   minimized = not minimized
   
   if minimized then
      TweenService:Create(MainContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
         Size = UDim2.new(0, 450, 0, 50)
      }):Play()
      ContentContainer.Visible = false
   else
      TweenService:Create(MainContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
         Size = UDim2.new(0, 450, 0, 550)
      }):Play()
      ContentContainer.Visible = true
   end
end)

-- Dragging
local dragging, dragInput, dragStart, startPos
Topbar.InputBegan:Connect(function(input)
   if input.UserInputType == Enum.UserInputType.MouseButton1 then
      dragging = true
      dragStart = input.Position
      startPos = MainContainer.Position
      
      input.Changed:Connect(function()
         if input.UserInputState == Enum.UserInputState.End then
            dragging = false
         end
      end)
   end
end)

Topbar.InputChanged:Connect(function(input)
   if input.UserInputType == Enum.UserInputType.MouseMovement then
      dragInput = input
   end
end)

UserInputService.InputChanged:Connect(function(input)
   if input == dragInput and dragging then
      local delta = input.Position - dragStart
      MainContainer.Position = UDim2.new(
         startPos.X.Scale,
         startPos.X.Offset + delta.X,
         startPos.X.Scale,
         startPos.Y.Offset + delta.Y
      )
   end
end)

-- Entrance Animation
TweenService:Create(Blur, TweenInfo.new(0.3), {Size = 10}):Play()
TweenService:Create(MainContainer, TweenInfo.new(0.5, Enum.EasingStyle.Back), {
   Size = UDim2.new(0, 450, 0, 550)
}):Play()

task.wait(0.6)
CreateNotification("FPS Optimizer", "Welcome! Click Ultra FPS Boost to start!", 4, "success")

print("✅ Custom UI Loaded!")
print("🎨 Modern design with smooth animations!")

-- OPTIMIZATION FUNCTIONS
function ApplyAllOptimizationsSafe()
   print("\n⚡ Applying optimizations (Safe Mode)...")
   RemoveTextures()
   RemoveParticles()
   RemoveShadows(true)
   RemoveFog(true)
   OptimizeWorkspace()
   print("✅ Optimizations complete!")
end

function ApplyPotatoMode()
   print("\n🥔 Potato Mode activated...")
   for _, obj in pairs(Workspace:GetDescendants()) do
      pcall(function()
         if obj:IsA("Texture") or obj:IsA("Decal") then obj:Destroy() end
         if obj:IsA("ParticleEmitter") or obj:IsA("Trail") then obj:Destroy() end
         if obj:IsA("MeshPart") then obj.TextureID = "" end
      end)
   end
   Lighting.GlobalShadows = false
   Lighting.FogEnd = 100000
   settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
   print("✅ Potato mode complete!")
end

function ApplyPerformanceMode()
   print("\n⚡ Performance Mode...")
   RemoveShadows(true)
   RemoveFog(true)
   RemoveParticles()
   Lighting.Brightness = 2
   print("✅ Performance mode complete!")
end

function RemoveTextures()
   local count = 0
   for _, obj in pairs(Workspace:GetDescendants()) do
      pcall(function()
         if obj:IsA("Texture") then obj:Destroy() count = count + 1
         elseif obj:IsA("MeshPart") then obj.TextureID = "" count = count + 1
         end
      end)
   end
   print("✅ Removed " .. count .. " textures")
end

function RemoveParticles()
   local count = 0
   for _, obj in pairs(Workspace:GetDescendants()) do
      pcall(function()
         if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Smoke") or obj:IsA("Fire") then
            obj:Destroy()
            count = count + 1
         end
      end)
   end
   print("✅ Removed " .. count .. " particles")
end

function RemoveShadows(enabled)
   if enabled then
      Lighting.GlobalShadows = false
      for _, obj in pairs(Workspace:GetDescendants()) do
         pcall(function()
            if obj:IsA("BasePart") then obj.CastShadow = false end
         end)
      end
      print("✅ Shadows removed")
   else
      Lighting.GlobalShadows = true
   end
end

function RemoveFog(enabled)
   Lighting.FogEnd = enabled and 100000 or 500
   print("✅ Fog " .. (enabled and "removed" or "restored"))
end

function OptimizeWorkspace()
   for _, obj in pairs(Workspace:GetDescendants()) do
      pcall(function()
         if obj:IsA("BasePart") and obj.Transparency >= 0.98 then
            obj.Material = Enum.Material.SmoothPlastic
         end
      end)
   end
   print("✅ Workspace optimized")
end

function ClearMemoryCache()
   for i = 1, 10 do
      wait()
      collectgarbage("collect")
   end
   print("✅ Memory cleared")
end

function RemoveUnusedAssets()
   local count = 0
   for _, obj in pairs(Workspace:GetDescendants()) do
      pcall(function()
         if obj:IsA("Sound") and not obj.IsPlaying then
            obj:Destroy()
            count = count + 1
         end
      end)
   end
   print("✅ Removed " .. count .. " unused assets")
end

function FixPhysicsLag()
   for _, obj in pairs(Workspace:GetDescendants()) do
      pcall(function()
         if obj:IsA("BasePart") then obj.Massless = true end
      end)
   end
   print("✅ Physics optimized")
end

function RestoreDefaults()
   Lighting.GlobalShadows = true
   Lighting.FogEnd = 500
   Lighting.Brightness = 1
   settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
   print("✅ Defaults restored")
end

print("\n" .. string.rep("=", 70))
print("FPS OPTIMIZER READY!")
print("UI: Modern Discord-style design")
print("Animations: Smooth tweens and effects")
print(string.rep("=", 70) .. "\n")
