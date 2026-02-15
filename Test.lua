-- NYEMEK HUB V6 - BRAINROT SPECIALIST
-- Fokus: Token UI, Advanced Spawn, & Fixed Duplicate

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Nyemek HuB V6", 
   LoadingTitle = "Nyemek HuB: Brainrot Engine",
   LoadingSubtitle = "Scanning Item Templates...",
   ConfigurationSaving = { Enabled = true, FolderName = "Nyemek_V6", FileName = "Config" },
   Discord = { Enabled = false },
   KeySystem = false,
})

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterPlayer = game:GetService("StarterPlayer")
local player = Players.LocalPlayer

-- ============================================
-- THE BRAINROT ENGINE
-- ============================================

-- 1. Manipulasi UI (Hanya Token & Cash)
local function ManipulateCurrencyUI()
    task.spawn(function()
        while true do
            pcall(function()
                local gui = player.PlayerGui:FindFirstChild("MainGui") or player.PlayerGui:FindFirstChild("HUD")
                if gui then
                    for _, v in pairs(gui:GetDescendants()) do
                        if v:IsA("TextLabel") then
                            -- Hanya target teks yang mengandung simbol uang atau kata kunci token
                            if v.Text:find("$") or v.Name:lower():find("token") or v.Name:lower():find("cash") then
                                v.Text = "999,999,999"
                            end
                        end
                    end
                end
            end)
            task.wait(1)
        end
    end)
end

-- 2. Spawn Brainrot (Scanner dari berbagai source)
local function SpawnBrainrot()
    local foundTemplate = nil
    -- Cari di ReplicatedStorage, Workspace, dan StarterPlayer
    local sources = {ReplicatedStorage, game.Workspace, StarterPlayer}
    
    for _, src in pairs(sources) do
        for _, obj in pairs(src:GetDescendants()) do
            if obj.Name:lower():find("brainrot") and (obj:IsA("Model") or obj:IsA("BasePart")) then
                foundTemplate = obj
                break
            end
        end
        if foundTemplate then break end
    end

    if foundTemplate then
        -- Coba clone secara lokal (hanya terlihat olehmu)
        local clone = foundTemplate:Clone()
        clone.Parent = game.Workspace
        clone:MoveTo(player.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 0))
        
        -- Coba tembus server via Remote
        for _, r in pairs(ReplicatedStorage:GetDescendants()) do
            if r:IsA("RemoteEvent") and (r.Name:lower():find("spawn") or r.Name:lower():find("create")) then
                r:FireServer(foundTemplate.Name)
            end
        end
        Rayfield:Notify({Title = "Nyemek HuB", Content = "Mencoba Spawn Item!"})
    else
        Rayfield:Notify({Title = "Nyemek HuB", Content = "Template Item Tidak Ditemukan!"})
    end
end

-- ============================================
-- UI TABS
-- ============================================

local MainTab = Window:CreateTab("🌀 Brainrot Ops", 4483362458)

MainTab:CreateButton({
   Name = "💰 Manipulate Token UI Only",
   Callback = function() ManipulateCurrencyUI() end,
})

MainTab:CreateButton({
   Name = "✨ Spawn Brainrot (Multi-Source Scan)",
   Callback = function() SpawnBrainrot() end,
})

_G.DuplicateFixed = false
MainTab:CreateToggle({
   Name = "📦 Duplicate Box/Item (Experimental)",
   CurrentValue = false,
   Callback = function(v) _G.DuplicateFixed = v end,
})

-- Loop Duplicate Fixed
task.spawn(function()
    while true do
        if _G.DuplicateFixed then
            pcall(function()
                -- Menggunakan Remote Spy sederhana untuk mencari event yang aktif
                for _, v in pairs(ReplicatedStorage:GetDescendants()) do
                    if v:IsA("RemoteEvent") and (v.Name:find("Box") or v.Name:find("Item")) then
                        v:FireServer()
                    end
                end
            end)
        end
        task.wait(0.3) -- Jeda agar tidak terkena kick dari server
    end
end)

-- loadstring(game:HttpGet("https://raw.githubusercontent.com/Regall-art/Nyemek-HuB-Test-Script/refs/heads/main/Test.lua"))()
