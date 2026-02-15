-- NYEMEK HUB - BROOKHAVEN VIP & PREMIUM BYPASS (SESSION ONLY)

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Nyemek HuB", 
   LoadingTitle = "Nyemek HuB: Brookhaven God",
   LoadingSubtitle = "Bypassing Gamepasses...",
   ConfigurationSaving = { Enabled = true, FolderName = "Nyemek_BH", FileName = "Config" },
   Discord = { Enabled = false },
   KeySystem = false,
})

-- Services
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- ============================================
-- THE VIP BYPASS LOGIC
-- ============================================

local function ActivateNyemekVIP()
    -- 1. Metatable Hooking (Menipu sistem pengecekan Gamepass)
    local mt = getrawmetatable(game)
    local oldNamecall = mt.__namecall
    setreadonly(mt, false)

    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        local args = {...}
        
        -- Menipu game agar menganggap player punya Gamepass ID apa pun
        if method == "UserOwnsGamePassAsync" or method == "PlayerOwnsAsset" then
            return true
        end
        return oldNamecall(self, unpack(args))
    end)
    setreadonly(mt, true)

    -- 2. Force Unlock UI Elements
    -- Menghapus status "Locked" pada UI Mobil dan Rumah
    task.spawn(function()
        while true do
            pcall(function()
                local mainGui = player.PlayerGui:FindFirstChild("MainGui") or player.PlayerGui:FindFirstChild("Z_MainGui")
                if mainGui then
                    for _, v in pairs(mainGui:GetDescendants()) do
                        if v.Name == "Locked" or v.Name == "LockIcon" or v:IsA("ImageLabel") and v.Image:find("rbxassetid://") then
                            v.Visible = false
                        end
                        -- Membuka tombol yang tadinya tidak bisa diklik
                        if v:IsA("TextButton") or v:IsA("ImageButton") then
                            v.Active = true
                            v.Selectable = true
                        end
                    end
                end
            end)
            task.wait(1.5)
        end
    end)

    Rayfield:Notify({
        Title = "Nyemek HuB",
        Content = "VIP & Premium Bypass Active! (Session Only)",
        Duration = 5
    })
end

-- ============================================
-- UI TABS
-- ============================================

local MainTab = Window:CreateTab("🔓 Unlocker", 4483362458)
MainTab:CreateButton({
   Name = "🚀 ACTIVATE VIP / PREMIUM ACCESS",
   Callback = function() ActivateNyemekVIP() end,
})

local PlayerTab = Window:CreateTab("👤 Player", 4483362458)
PlayerTab:CreateSlider({Name = "Walkspeed", Range = {16, 200}, CurrentValue = 16, Callback = function(v) player.Character.Humanoid.WalkSpeed = v end})

-- loadstring(game:HttpGet("https://raw.githubusercontent.com/Regall-art/Nyemek-HuB-Test-Script/refs/heads/main/Test.lua"))()
