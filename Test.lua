-- NYEMEK HUB V5 - BRAINROT BASE STEALER & DUPLICATOR
-- Fokus: Mencuri dari Base & Bypass Duplicate Check

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Nyemek HuB V5", 
   LoadingTitle = "Nyemek HuB: Stealer & Duplicator",
   LoadingSubtitle = "Aggressive Remote Access...",
   ConfigurationSaving = { Enabled = true, FolderName = "Nyemek_V5", FileName = "Config" },
   Discord = { Enabled = false },
   KeySystem = false,
})

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

-- ============================================
-- THE AGGRESSIVE BRAINROT FUNCTIONS
-- ============================================

local function ActivateStealAndDuplicate()
    -- 1. STEAL FROM BASE (Teleport ke objek di dalam Base Player lain)
    task.spawn(function()
        while _G.StealFromBase do
            pcall(function()
                for _, otherPlayer in pairs(Players:GetPlayers()) do
                    if otherPlayer ~= player then
                        -- Mencari objek Brainrot yang sudah ada di Base player lain
                        for _, obj in pairs(game.Workspace:GetDescendants()) do
                            if (obj.Name:lower():find("brainrot") or obj.Name:lower():find("box")) and obj:IsDescendantOf(game.Workspace:FindFirstChild(otherPlayer.Name .. "Base") or game.Workspace) then
                                if obj:IsA("BasePart") then
                                    player.Character.HumanoidRootPart.CFrame = obj.CFrame
                                    task.wait(0.2)
                                end
                            end
                        end
                    end
                end
            end)
            task.wait(1)
        end
    end)

    -- 2. DUPLICATE FIX (Spamming Remote dengan bypass delay)
    task.spawn(function()
        while _G.DuplicateActive do
            pcall(function()
                -- Mencari Remote Event spesifik untuk Spawn atau Claim
                for _, r in pairs(ReplicatedStorage:GetDescendants()) do
                    if r:IsA("RemoteEvent") and (r.Name:find("Claim") or r.Name:find("Spawn")) then
                        for i = 1, 15 do -- Spam 15 kali sekaligus
                            r:FireServer()
                        end
                    end
                end
            end)
            task.wait(0.1)
        end
    end)
    
    Rayfield:Notify({Title = "Nyemek HuB", Content = "Stealer & Duplicate Mode Aktif!"})
end

-- ============================================
-- UI TABS
-- ============================================

local MainTab = Window:CreateTab("🌀 Brainrot Ops", 4483362458)

_G.StealFromBase = false
MainTab:CreateToggle({
   Name = "🥷 Steal Brainrot from Base",
   CurrentValue = false,
   Callback = function(v) _G.StealFromBase = v end,
})

_G.DuplicateActive = false
MainTab:CreateToggle({
   Name = "📦 Duplicate Brainrot/Box (Loop)",
   CurrentValue = false,
   Callback = function(v) _G.DuplicateActive = v end,
})

MainTab:CreateButton({
   Name = "🚀 ACTIVATE ALL FUNCTIONS",
   Callback = function() ActivateStealAndDuplicate() end,
})

-- loadstring(game:HttpGet("https://raw.githubusercontent.com/Regall-art/Nyemek-HuB-Test-Script/refs/heads/main/Test.lua"))()
