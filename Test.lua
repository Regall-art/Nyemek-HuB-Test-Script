-- NYEMEK HUB - BROOKHAVEN ULTIMATE UNLOCKER
-- Fitur: Unlock All Cars, Premium Bypass, Speed, & More

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Nyemek HuB", 
   LoadingTitle = "Nyemek HuB: Brookhaven Edition",
   LoadingSubtitle = "Unlocking Premium Assets...",
   ConfigurationSaving = { Enabled = true, FolderName = "Nyemek_Brookhaven", FileName = "Config" },
   Discord = { Enabled = false },
   KeySystem = false,
})

-- Services
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- ============================================
-- THE UNLOCKER LOGIC
-- ============================================

local function UnlockBrookhaven()
    -- 1. Bypass Premium & Gamepass Status
    -- Menipu game agar menganggap player memiliki akses premium
    local mt = getrawmetatable(game)
    local old = mt.__namecall
    setreadonly(mt, false)

    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        if method == "UserOwnsGamePassAsync" or method == "PlayerOwnsAsset" then
            return true
        end
        return old(self, ...)
    end)
    setreadonly(mt, true)

    -- 2. Visual Unlock (Menghilangkan ikon gembok di UI)
    task.spawn(function()
        while true do
            pcall(function()
                local gui = player.PlayerGui:FindFirstChild("ItemsGui") or player.PlayerGui:FindFirstChild("Z_MainGui")
                if gui then
                    for _, v in pairs(gui:GetDescendants()) do
                        if v.Name == "Locked" or v.Name == "Lock" or v.Name == "RobuxIcon" then
                            v.Visible = false
                        end
                    end
                end
            end)
            task.wait(1)
        end
    end)

    Rayfield:Notify({
        Title = "Nyemek HuB",
        Content = "Premium & All Cars Unlocked! (Temporary Session)",
        Duration = 5
    })
end

-- ============================================
-- UI TABS
-- ============================================

local MainTab = Window:CreateTab("🔓 Unlocker", 4483362458)
MainTab:CreateButton({
   Name = "🚀 ACTIVATE PREMIUM & ALL CARS",
   Callback = function() UnlockBrookhaven() end,
})

local PlayerTab = Window:CreateTab("👤 Player", 4483362458)
PlayerTab:CreateSlider({
    Name = "Walkspeed", 
    Range = {16, 200}, 
    CurrentValue = 16, 
    Callback = function(v) 
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = v 
        end
    end
})

PlayerTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Callback = function(v)
        _G.InfJump = v
        game:GetService("UserInputService").JumpRequest:Connect(function()
            if _G.InfJump then
                player.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
            end
        end)
    end
})

-- ============================================
-- LOADSTRING COMMAND
-- ============================================
-- loadstring(game:HttpGet("https://raw.githubusercontent.com/Regall-art/Nyemek-HuB-Test-Script/refs/heads/main/Test.lua"))()

Rayfield:Notify({Title = "Nyemek HuB", Content = "Siap digunakan di Brookhaven!"})
