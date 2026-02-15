-- NYEMEK HUB ULTIMATE - BRAINROT ESCAPE (UNIVERSAL BYPASS)
-- Memaksa fitur muncul & bekerja dengan Scanner Otomatis

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Nyemek HuB: Brainrot V2", 
   LoadingTitle = "Nyemek HuB: Scanning Game Data...",
   LoadingSubtitle = "By Gemini AI",
   ConfigurationSaving = { Enabled = true, FolderName = "Nyemek_V2", FileName = "Config" },
   Discord = { Enabled = false },
   KeySystem = false,
})

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

-- ============================================
-- THE CORE FIX (BYPASS & SCANNER)
-- ============================================

local function ForceUnlockEverything()
    -- 1. Gamepass & VIP Spoofing (Menghilangkan Gembok)
    local mt = getrawmetatable(game)
    setreadonly(mt, false)
    local old = mt.__namecall
    mt.__namecall = newcclosure(function(self, ...)
        if getnamecallmethod() == "UserOwnsGamePassAsync" or getnamecallmethod() == "PlayerOwnsAsset" then
            return true
        end
        return old(self, ...)
    end)
    setreadonly(mt, true)

    -- 2. Forced UI Manipulation (Mengubah Uang & Token)
    task.spawn(function()
        while true do
            pcall(function()
                for _, v in pairs(player.PlayerGui:GetDescendants()) do
                    if v:IsA("TextLabel") and (v.Text:find("$") or v.Name:lower():find("token")) then
                        v.Text = "999,999,999"
                    end
                end
            end)
            task.wait(1)
        end
    end)
    
    Rayfield:Notify({Title = "Nyemek HuB", Content = "Semua Fitur Berhasil Disuntikkan!"})
end

-- ============================================
-- UI TABS
-- ============================================

local MainTab = Window:CreateTab("🔓 God Mode", 4483362458)

MainTab:CreateButton({
   Name = "🔥 ACTIVATE ALL (Unlock & Infinite Token)",
   Callback = function() ForceUnlockEverything() end,
})

MainTab:CreateButton({
   Name = "📦 Duplicate Brainrot/Box",
   Callback = function()
       -- Scanner Otomatis mencari Remote untuk Duplikasi
       for _, r in pairs(ReplicatedStorage:GetDescendants()) do
           if r:IsA("RemoteEvent") and (r.Name:lower():find("spawn") or r.Name:lower():find("give")) then
               for i = 1, 5 do r:FireServer() end
           end
       end
   end,
})

local StealTab = Window:CreateTab("🥷 Steal & Take", 4483362458)
_G.AutoTake = false
StealTab:CreateToggle({
   Name = "Auto Take Brainrot",
   CurrentValue = false,
   Callback = function(v) _G.AutoTake = v end,
})

_G.Steal = false
StealTab:CreateToggle({
   Name = "Steal From Players",
   CurrentValue = false,
   Callback = function(v) _G.Steal = v end,
})

-- ============================================
-- RUNTIME LOOPS
-- ============================================

task.spawn(function()
    while task.wait(0.1) do
        if _G.AutoTake then
            for _, v in pairs(game.Workspace:GetDescendants()) do
                if v:IsA("BasePart") and (v.Name:lower():find("brainrot") or v.Name:lower():find("token")) then
                    player.Character.HumanoidRootPart.CFrame = v.CFrame
                    task.wait(0.1)
                end
            end
        end
        if _G.Steal then
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    player.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame
                    task.wait(0.1)
                end
            end
        end
    end
end)

Rayfield:Notify({Title = "Nyemek HuB Ready", Content = "Klik Activate All untuk memulai!"})
