-- NYEMEK HUB - ESCAPE TSUNAMI BRAINROT EDITION
-- Fitur: Auto Take, Duplicate, Steal, Infinite Token, Gamepass Bypass

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Nyemek HuB: Brainrot", 
   LoadingTitle = "Nyemek HuB: Brainrot God Mode",
   LoadingSubtitle = "Executing Skibidi Scripts...",
   ConfigurationSaving = { Enabled = true, FolderName = "Nyemek_Brainrot", FileName = "Config" },
   Discord = { Enabled = false },
   KeySystem = false,
})

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

-- Global Toggles
_G.AutoTake = false
_G.StealPlayer = false

-- ============================================
-- THE BRAINROT EXPLOITS
-- ============================================

local function ActivateGodStuff()
    -- 1. UNLOCK ALL GAMEPASS (Session Only)
    -- Menipu sistem agar menganggap kamu pemilik VIP dan Gamepass Brainrot
    local mt = getrawmetatable(game)
    local old = mt.__namecall
    setreadonly(mt, false)
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        if method == "UserOwnsGamePassAsync" or method == "PlayerOwnsAsset" then
            return true
        end
        return old(self, unpack({...}))
    end)
    setreadonly(mt, true)

    -- 2. INFINITE TOKEN & MONEY MANIPULATION
    -- Mengunci angka token di UI agar terlihat tidak terbatas
    task.spawn(function()
        while true do
            pcall(function()
                local gui = player.PlayerGui:FindFirstChild("MainGui") or player.PlayerGui:FindFirstChild("HUD")
                if gui then
                    for _, v in pairs(gui:GetDescendants()) do
                        if v:IsA("TextLabel") and (v.Name:lower():find("token") or v.Name:lower():find("coin")) then
                            v.Text = "999,999,999"
                        end
                    end
                end
            end)
            task.wait(0.5)
        end
    end)
    
    Rayfield:Notify({Title = "Nyemek HuB", Content = "Unlock All & Infinite Token Aktif!"})
end

-- ============================================
-- UI TABS
-- ============================================

local MainTab = Window:CreateTab("🌀 Brainrot Ops", 4483362458)

MainTab:CreateButton({
   Name = "🔓 Unlock All Gamepass (Temporary)",
   Callback = function() ActivateGodStuff() end,
})

MainTab:CreateToggle({
   Name = "🤲 Auto Take Brainrot",
   CurrentValue = false,
   Callback = function(v) _G.AutoTake = v end,
})

MainTab:CreateButton({
   Name = "📦 Duplicate Box/Brainrot",
   Callback = function()
      -- Mencoba memicu Remote Event untuk duplikasi item
      local rem = ReplicatedStorage:FindFirstChild("Events") or ReplicatedStorage:FindFirstChild("Remotes")
      if rem then
          for i = 1, 10 do -- Duplikasi 10 kali
              -- Sesuaikan dengan nama event di game (contoh: SpawnItem)
              pcall(function() rem:FindFirstChildOfClass("RemoteEvent"):FireServer() end)
          end
      end
      Rayfield:Notify({Title = "Nyemek HuB", Content = "Duplicating Items..."})
   end,
})

MainTab:CreateToggle({
   Name = "🥷 Steal Player Brainrot",
   CurrentValue = false,
   Callback = function(v) _G.StealPlayer = v end,
})

local PlayerTab = Window:CreateTab("👤 Player", 4483362458)
PlayerTab:CreateSlider({Name = "Speed", Range = {16, 500}, CurrentValue = 16, Callback = function(v) player.Character.Humanoid.WalkSpeed = v end})

-- ============================================
-- RUNTIME LOOPS
-- ============================================

task.spawn(function()
    while task.wait(0.1) do
        -- Auto Take Logic
        if _G.AutoTake then
            for _, v in pairs(game.Workspace:GetDescendants()) do
                if v.Name == "Brainrot" or v.Name == "Token" then
                    if v:IsA("BasePart") then
                        player.Character.HumanoidRootPart.CFrame = v.CFrame
                    end
                end
            end
        end
        
        -- Steal Player Logic
        if _G.StealPlayer then
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    -- Mendekati player lain untuk mengambil item mereka secara paksa
                    player.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-2)
                end
            end
        end
    end
end)

Rayfield:Notify({Title = "Nyemek HuB Loaded", Content = "Siap untuk Brainrot!"})
