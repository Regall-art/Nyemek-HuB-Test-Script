-- NYEMEK HUB V2 - BROOKHAVEN AGGRESSIVE BYPASS
-- Metode: Remote Spoofing & UI Force Hijack

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Nyemek HuB V2", 
   LoadingTitle = "Nyemek HuB: Cracking Brookhaven...",
   LoadingSubtitle = "Bypassing Server Checks",
   ConfigurationSaving = { Enabled = true, FolderName = "Nyemek_BH_V2", FileName = "Config" },
   Discord = { Enabled = false },
   KeySystem = false,
})

-- Services
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- ============================================
-- CORE: AGGRESSIVE VIP BYPASS
-- ============================================

local function NyemekAggressiveUnlock()
    -- 1. Menghilangkan Notifikasi "Need Premium" secara paksa
    task.spawn(function()
        while true do
            pcall(function()
                local gui = player.PlayerGui:FindFirstChild("MainGui") or player.PlayerGui:FindFirstChild("Z_MainGui")
                if gui then
                    -- Cari Pop-Up "Unlock Premium" dan hapus
                    local premiumPopUp = gui:FindFirstChild("Premium") or gui:FindFirstChild("Purchase")
                    if premiumPopUp then premiumPopUp.Visible = false end
                    
                    -- Hapus semua ikon gembok biru (Premium Star)
                    for _, v in pairs(gui:GetDescendants()) do
                        if v:IsA("ImageLabel") and (v.Image:find("7229528578") or v.Name == "Locked") then
                            v.Visible = false
                        end
                    end
                end
            end)
            task.wait(0.5)
        end
    end)

    -- 2. Remote Spoofing (Menipu Server)
    local mt = getrawmetatable(game)
    local old = mt.__namecall
    setreadonly(mt, false)

    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        if method == "UserOwnsGamePassAsync" or method == "PlayerOwnsAsset" then
            return true -- Selalu lapor ke game bahwa kita "Punya" VIP
        end
        return old(self, ...)
    end)
    setreadonly(mt, true)

    Rayfield:Notify({Title = "Nyemek HuB", Content = "Aggressive Mode Aktif! Coba spawn mobil sekarang."})
end

-- ============================================
-- UI TABS
-- ============================================

local MainTab = Window:CreateTab("🔓 Unlocker", 4483362458)
MainTab:CreateButton({
   Name = "🚀 FORCE UNLOCK PREMIUM/VIP",
   Callback = function() NyemekAggressiveUnlock() end,
})

local PlayerTab = Window:CreateTab("👤 Player", 4483362458)
PlayerTab:CreateSlider({Name = "Speed", Range = {16, 300}, CurrentValue = 16, Callback = function(v) player.Character.Humanoid.WalkSpeed = v end})
PlayerTab:CreateButton({Name = "Teleport to VIP House", Callback = function() 
    -- Koordinat rumah VIP biasanya di sini
    player.Character.HumanoidRootPart.CFrame = CFrame.new(-396, 22, -373) 
end})

-- Tetap pakai loadstring yang sama:
-- loadstring(game:HttpGet("https://raw.githubusercontent.com/Regall-art/Nyemek-HuB-Test-Script/refs/heads/main/Test.lua"))()
