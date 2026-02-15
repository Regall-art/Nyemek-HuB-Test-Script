-- NYEMEK HUB V3 - BROOKHAVEN GAMEPASS SPOOFER (SESSION ONLY)
-- Metode: Deep Metatable Hooking & UI Bypass

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Nyemek HuB V3", 
   LoadingTitle = "Nyemek HuB: Brookhaven Bypass",
   LoadingSubtitle = "Spoofing Gamepass Data...",
   ConfigurationSaving = { Enabled = true, FolderName = "Nyemek_BH_V3", FileName = "Config" },
   Discord = { Enabled = false },
   KeySystem = false,
})

-- Services
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- ============================================
-- THE DEEP SPOOFER LOGIC
-- ============================================

local function ManipulateGamepass()
    -- 1. FORCE GAMEPASS OWNED (Metatable Hook)
    -- Menipu fungsi pengecekan aset agar selalu mengembalikan nilai 'true'
    local mt = getrawmetatable(game)
    local oldNamecall = mt.__namecall
    setreadonly(mt, false)

    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        if method == "UserOwnsGamePassAsync" or method == "PlayerOwnsAsset" or method == "GetProductInfo" then
            return true
        end
        return oldNamecall(self, unpack({...}))
    end)
    setreadonly(mt, true)

    -- 2. UI BYPASS (Menghapus Notifikasi "You need the Premium...")
    task.spawn(function()
        while true do
            pcall(function()
                local mainGui = player.PlayerGui:FindFirstChild("MainGui") or player.PlayerGui:FindFirstChild("Z_MainGui")
                if mainGui then
                    -- Menghapus pop-up pembelian (275 Robux) yang muncul di foto kamu
                    if mainGui:FindFirstChild("Premium") then mainGui.Premium.Visible = false end
                    if mainGui:FindFirstChild("PurchaseUI") then mainGui.PurchaseUI.Visible = false end
                    
                    -- Menghapus teks "You need the Premium..." yang menutupi layar
                    for _, v in pairs(mainGui:GetDescendants()) do
                        if v:IsA("TextLabel") and v.Text:find("Premium") then
                            v.Parent.Visible = false
                        end
                    end
                end
            end)
            task.wait(0.5)
        end
    end)

    Rayfield:Notify({
        Title = "Nyemek HuB",
        Content = "Gamepasses Spoofed! Coba akses mobil VIP sekarang.",
        Duration = 5
    })
end

-- ============================================
-- UI TABS
-- ============================================

local MainTab = Window:CreateTab("🔓 Unlocker", 4483362458)
MainTab:CreateButton({
   Name = "🔥 MANIPULATE GAMEPASS (Owned)",
   Callback = function() ManipulateGamepass() end,
})

local PlayerTab = Window:CreateTab("👤 Player", 4483362458)
PlayerTab:CreateSlider({Name = "Walkspeed", Range = {16, 300}, CurrentValue = 16, Callback = function(v) player.Character.Humanoid.WalkSpeed = v end})

-- loadstring(game:HttpGet("https://raw.githubusercontent.com/Regall-art/Nyemek-HuB-Test-Script/refs/heads/main/Test.lua"))()
