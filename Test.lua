-- NYEMEK HUB V7 - BRAINROT COMMANDER
-- Fitur: Advanced Spawn Menu, Token Spoofer, & Forced Duplicate

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Nyemek HuB V7", 
   LoadingTitle = "Nyemek HuB: Brainrot Commander",
   LoadingSubtitle = "Scanning for Spawnable Assets...",
   ConfigurationSaving = { Enabled = true, FolderName = "Nyemek_V7", FileName = "Config" },
   Discord = { Enabled = false },
   KeySystem = false,
})

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

-- ============================================
-- CORE ENGINE: SPAWN & DUPLICATE
-- ============================================

-- List item yang ditemukan untuk diisi ke Scroll UI
local brainrotItems = {}
for _, v in pairs(game:GetDescendants()) do
    if (v:IsA("Model") or v:IsA("BasePart")) and (v.Name:lower():find("brainrot") or v.Name:lower():find("skibidi")) then
        if not table.find(brainrotItems, v.Name) then
            table.insert(brainrotItems, v.Name)
        end
    end
end

-- ============================================
-- UI TABS
-- ============================================

local MainTab = Window:CreateTab("💰 Economy", 4483362458)
MainTab:CreateButton({
   Name = "💎 Fake Token (UI Only)",
   Callback = function()
       task.spawn(function()
           while true do
               pcall(function()
                   local gui = player.PlayerGui:FindFirstChild("MainGui") or player.PlayerGui:FindFirstChild("HUD")
                   for _, v in pairs(gui:GetDescendants()) do
                       if v:IsA("TextLabel") and (v.Name:lower():find("token") or v.Text:find("$")) then
                           v.Text = "999,999,999"
                       end
                   end
               end)
               task.wait(1)
           end
       end)
   end,
})

local SpawnTab = Window:CreateTab("✨ Spawn Menu", 4483362458)
SpawnTab:CreateDropdown({
   Name = "Select Brainrot to Spawn",
   Options = brainrotItems,
   CurrentOption = "",
   MultipleOptions = false,
   Callback = function(Option)
       local targetName = Option[1]
       -- Mencoba mencari remote spawn secara agresif
       for _, r in pairs(ReplicatedStorage:GetDescendants()) do
           if r:IsA("RemoteEvent") and (r.Name:lower():find("spawn") or r.Name:lower():find("give")) then
               r:FireServer(targetName)
           end
       end
       Rayfield:Notify({Title = "Nyemek HuB", Content = "Spawning: " .. targetName})
   end,
})

local DupTab = Window:CreateTab("📦 Duplicator", 4483362458)
_G.DupLoop = false
DupTab:CreateToggle({
   Name = "Forced Duplicate Loop",
   CurrentValue = false,
   Callback = function(v) _G.DupLoop = v end,
})

-- Duplicate Logic (Metode Drop-Pick)
task.spawn(function()
    while true do
        if _G.DupLoop then
            pcall(function()
                -- Mencoba menipu server dengan mengirim sinyal 'PickUp' berkali-kali pada item terdekat
                for _, v in pairs(game.Workspace:GetDescendants()) do
                    if v:IsA("TouchTransmitter") and v.Parent.Name:lower():find("brainrot") then
                        firetouchinterest(player.Character.HumanoidRootPart, v.Parent, 0)
                        firetouchinterest(player.Character.HumanoidRootPart, v.Parent, 1)
                    end
                end
            end)
        end
        task.wait(0.1)
    end
end)

-- loadstring(game:HttpGet("https://raw.githubusercontent.com/Regall-art/Nyemek-HuB-Test-Script/refs/heads/main/Test.lua"))()
