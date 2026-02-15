-- ESCAPE TSUNAMI FOR BRAINROT - ULTIMATE SCRIPT
-- All Features: Auto Take, Duplicate, Steal, Infinite Token, UI Manipulation, etc.
-- Version: Ultimate Edition

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Escape Tsunami for Brainrot",
   LoadingTitle = "Escape Tsunami Ultimate",
   LoadingSubtitle = "Loading all features...",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "EscapeTsunami_Brainrot"
   },
   Discord = {
      Enabled = false,
   },
   KeySystem = false,
})

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

-- Player
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- Variables
_G.AutoTakeBrainrot = false
_G.AutoStealBrainrot = false
_G.InfiniteToken = false
_G.AutoDuplicateBrainrot = false
_G.AutoDuplicateBox = false
_G.TeleportSpeed = 0.1

print("\n" .. string.rep("=", 70))
print("ESCAPE TSUNAMI FOR BRAINROT - ULTIMATE SCRIPT")
print("Loading all features...")
print(string.rep("=", 70) .. "\n")

-- ============================================
-- TAB: BRAINROT MAIN
-- ============================================
local BrainrotTab = Window:CreateTab("🧠 Brainrot", 4483362458)

BrainrotTab:CreateParagraph({
   Title = "🔥 Main Features",
   Content = "Auto take, duplicate, and steal brainrot items!"
})

BrainrotTab:CreateSection("Auto Farm Brainrot")

BrainrotTab:CreateToggle({
   Name = "🧠 Auto Take Brainrot (Collect All)",
   CurrentValue = false,
   Flag = "AutoTakeBrainrot",
   Callback = function(Value)
      _G.AutoTakeBrainrot = Value
      
      if Value then
         Rayfield:Notify({
            Title = "Auto Take Brainrot",
            Content = "Collecting all brainrot items!",
            Duration = 3,
            Image = 4483362458,
         })
      else
         Rayfield:Notify({
            Title = "Auto Take Brainrot",
            Content = "Stopped collecting!",
            Duration = 2,
            Image = 4483362458,
         })
      end
   end,
})

BrainrotTab:CreateToggle({
   Name = "👥 Auto Steal Player Brainrot",
   CurrentValue = false,
   Flag = "AutoStealBrainrot",
   Callback = function(Value)
      _G.AutoStealBrainrot = Value
      
      if Value then
         Rayfield:Notify({
            Title = "Auto Steal",
            Content = "Stealing brainrot from other players!",
            Duration = 3,
            Image = 4483362458,
         })
      end
   end,
})

BrainrotTab:CreateSlider({
   Name = "Collection Speed",
   Range = {0.01, 2},
   Increment = 0.01,
   Suffix = "s",
   CurrentValue = 0.1,
   Flag = "CollectionSpeed",
   Callback = function(Value)
      _G.TeleportSpeed = Value
   end,
})

BrainrotTab:CreateSection("Manual Actions")

BrainrotTab:CreateButton({
   Name = "Collect All Brainrot NOW",
   Callback = function()
      CollectAllBrainrot()
   end,
})

BrainrotTab:CreateButton({
   Name = "Collect Nearest Brainrot",
   Callback = function()
      CollectNearestBrainrot()
   end,
})

BrainrotTab:CreateButton({
   Name = "Steal All Players Brainrot",
   Callback = function()
      StealAllPlayersBrainrot()
   end,
})

-- ============================================
-- TAB: DUPLICATION
-- ============================================
local DupeTab = Window:CreateTab("📦 Duplication", 4483362458)

DupeTab:CreateParagraph({
   Title = "⚠️ Duplication System",
   Content = "Duplicate your brainrot items and boxes!"
})

DupeTab:CreateSection("Auto Duplication")

DupeTab:CreateToggle({
   Name = "🧠 Auto Duplicate Brainrot",
   CurrentValue = false,
   Flag = "AutoDupeBrainrot",
   Callback = function(Value)
      _G.AutoDuplicateBrainrot = Value
      
      if Value then
         Rayfield:Notify({
            Title = "Auto Duplicate",
            Content = "Auto duplicating brainrot!",
            Duration = 3,
            Image = 4483362458,
         })
      end
   end,
})

DupeTab:CreateToggle({
   Name = "📦 Auto Duplicate Box",
   CurrentValue = false,
   Flag = "AutoDupeBox",
   Callback = function(Value)
      _G.AutoDuplicateBox = Value
      
      if Value then
         Rayfield:Notify({
            Title = "Auto Duplicate Box",
            Content = "Auto duplicating boxes!",
            Duration = 3,
            Image = 4483362458,
         })
      end
   end,
})

DupeTab:CreateSection("Manual Duplication")

DupeTab:CreateButton({
   Name = "Duplicate Current Brainrot (x2)",
   Callback = function()
      DuplicateBrainrot(2)
   end,
})

DupeTab:CreateButton({
   Name = "Duplicate Current Brainrot (x10)",
   Callback = function()
      DuplicateBrainrot(10)
   end,
})

DupeTab:CreateButton({
   Name = "Duplicate Current Brainrot (x100)",
   Callback = function()
      DuplicateBrainrot(100)
   end,
})

DupeTab:CreateButton({
   Name = "Duplicate All Boxes",
   Callback = function()
      DuplicateAllBoxes()
   end,
})

DupeTab:CreateSection("Advanced Duplication")

DupeTab:CreateButton({
   Name = "Duplicate Inventory (All Items)",
   Callback = function()
      DuplicateInventory()
   end,
})

DupeTab:CreateButton({
   Name = "Max Stack All Items",
   Callback = function()
      MaxStackAllItems()
   end,
})

-- ============================================
-- TAB: TOKENS & CURRENCY
-- ============================================
local TokenTab = Window:CreateTab("🪙 Tokens", 4483362458)

TokenTab:CreateSection("Token Manipulation")

TokenTab:CreateToggle({
   Name = "♾️ Infinite Token",
   CurrentValue = false,
   Flag = "InfiniteToken",
   Callback = function(Value)
      _G.InfiniteToken = Value
      
      if Value then
         Rayfield:Notify({
            Title = "Infinite Token",
            Content = "Infinite token enabled!",
            Duration = 3,
            Image = 4483362458,
         })
      end
   end,
})

TokenTab:CreateButton({
   Name = "Set Token to 10,000",
   Callback = function()
      SetToken(10000)
   end,
})

TokenTab:CreateButton({
   Name = "Set Token to 100,000",
   Callback = function()
      SetToken(100000)
   end,
})

TokenTab:CreateButton({
   Name = "Set Token to 1,000,000",
   Callback = function()
      SetToken(1000000)
   end,
})

TokenTab:CreateButton({
   Name = "Set Token to 999,999,999",
   Callback = function()
      SetToken(999999999)
   end,
})

TokenTab:CreateSection("Currency Manipulation")

TokenTab:CreateButton({
   Name = "Max All Currencies",
   Callback = function()
      MaxAllCurrencies()
   end,
})

TokenTab:CreateButton({
   Name = "Duplicate Current Token",
   Callback = function()
      DuplicateToken()
   end,
})

-- ============================================
-- TAB: ADD BRAINROT
-- ============================================
local AddTab = Window:CreateTab("➕ Add Brainrot", 4483362458)

AddTab:CreateSection("Add Brainrot to Inventory")

AddTab:CreateButton({
   Name = "Add 1 Random Brainrot",
   Callback = function()
      AddBrainrot(1)
   end,
})

AddTab:CreateButton({
   Name = "Add 10 Random Brainrot",
   Callback = function()
      AddBrainrot(10)
   end,
})

AddTab:CreateButton({
   Name = "Add 100 Random Brainrot",
   Callback = function()
      AddBrainrot(100)
   end,
})

AddTab:CreateButton({
   Name = "Add 1000 Random Brainrot",
   Callback = function()
      AddBrainrot(1000)
   end,
})

AddTab:CreateSection("Add Specific Brainrot")

AddTab:CreateButton({
   Name = "Add Rare Brainrot (x10)",
   Callback = function()
      AddSpecificBrainrot("Rare", 10)
   end,
})

AddTab:CreateButton({
   Name = "Add Epic Brainrot (x10)",
   Callback = function()
      AddSpecificBrainrot("Epic", 10)
   end,
})

AddTab:CreateButton({
   Name = "Add Legendary Brainrot (x10)",
   Callback = function()
      AddSpecificBrainrot("Legendary", 10)
   end,
})

AddTab:CreateButton({
   Name = "Add ALL Types Brainrot",
   Callback = function()
      AddAllTypesBrainrot()
   end,
})

-- ============================================
-- TAB: GAMEPASS BYPASS
-- ============================================
local GamepassTab = Window:CreateTab("💎 GamePass", 4483362458)

GamepassTab:CreateSection("GamePass Bypass")

GamepassTab:CreateButton({
   Name = "🔓 Unlock All GamePasses",
   Callback = function()
      UnlockAllGamepasses()
      Rayfield:Notify({
         Title = "GamePass Unlocked",
         Content = "All gamepasses unlocked!",
         Duration = 3,
         Image = 4483362458,
      })
   end,
})

GamepassTab:CreateButton({
   Name = "Enable GamePass Bypass Hook",
   Callback = function()
      EnableGamepassBypass()
   end,
})

GamepassTab:CreateButton({
   Name = "Unlock VIP Benefits",
   Callback = function()
      UnlockVIP()
   end,
})

GamepassTab:CreateButton({
   Name = "Unlock Premium Benefits",
   Callback = function()
      UnlockPremium()
   end,
})

GamepassTab:CreateSection("GamePass Features")

GamepassTab:CreateButton({
   Name = "Enable Double Brainrot",
   Callback = function()
      EnableDoubleBrainrot()
   end,
})

GamepassTab:CreateButton({
   Name = "Enable Auto Collect",
   Callback = function()
      EnableAutoCollect()
   end,
})

GamepassTab:CreateButton({
   Name = "Enable Faster Speed",
   Callback = function()
      EnableFasterSpeed()
   end,
})

-- ============================================
-- TAB: UI MANIPULATION
-- ============================================
local UITab = Window:CreateTab("🎨 UI Manipulation", 4483362458)

UITab:CreateSection("UI Modifications")

UITab:CreateButton({
   Name = "Show All Hidden UI",
   Callback = function()
      ShowAllHiddenUI()
   end,
})

UITab:CreateButton({
   Name = "Hide All Annoying UI",
   Callback = function()
      HideAnnoyingUI()
   end,
})

UITab:CreateButton({
   Name = "Modify Brainrot Counter (999999)",
   Callback = function()
      ModifyBrainrotCounter(999999)
   end,
})

UITab:CreateButton({
   Name = "Fake Display Max Items",
   Callback = function()
      FakeMaxItems()
   end,
})

UITab:CreateSection("UI Customization")

UITab:CreateButton({
   Name = "Make UI Transparent",
   Callback = function()
      MakeUITransparent()
   end,
})

UITab:CreateButton({
   Name = "Enlarge Important UI",
   Callback = function()
      EnlargeUI()
   end,
})

UITab:CreateButton({
   Name = "Reset All UI",
   Callback = function()
      ResetAllUI()
   end,
})

-- ============================================
-- TAB: PLAYER
-- ============================================
local PlayerTab = Window:CreateTab("👤 Player", 4483362458)

PlayerTab:CreateSection("Movement")

PlayerTab:CreateSlider({
   Name = "Walkspeed",
   Range = {16, 500},
   Increment = 1,
   Suffix = "",
   CurrentValue = 16,
   Flag = "Walkspeed",
   Callback = function(Value)
      if character and character:FindFirstChild("Humanoid") then
         character.Humanoid.WalkSpeed = Value
      end
   end,
})

PlayerTab:CreateSlider({
   Name = "Jump Power",
   Range = {50, 500},
   Increment = 1,
   Suffix = "",
   CurrentValue = 50,
   Flag = "JumpPower",
   Callback = function(Value)
      if character and character:FindFirstChild("Humanoid") then
         character.Humanoid.JumpPower = Value
      end
   end,
})

PlayerTab:CreateToggle({
   Name = "Infinite Jump",
   CurrentValue = false,
   Flag = "InfiniteJump",
   Callback = function(Value)
      _G.InfiniteJump = Value
   end,
})

PlayerTab:CreateToggle({
   Name = "No Clip",
   CurrentValue = false,
   Flag = "NoClip",
   Callback = function(Value)
      _G.NoClip = Value
   end,
})

PlayerTab:CreateSection("Tsunami Protection")

PlayerTab:CreateToggle({
   Name = "Anti Tsunami (God Mode)",
   CurrentValue = false,
   Flag = "AntiTsunami",
   Callback = function(Value)
      _G.AntiTsunami = Value
   end,
})

PlayerTab:CreateButton({
   Name = "Teleport to Safe Zone",
   Callback = function()
      TeleportToSafeZone()
   end,
})

-- ============================================
-- TAB: MISC
-- ============================================
local MiscTab = Window:CreateTab("⚙️ Misc", 4483362458)

MiscTab:CreateToggle({
   Name = "Fullbright",
   CurrentValue = false,
   Flag = "Fullbright",
   Callback = function(Value)
      if Value then
         game.Lighting.Brightness = 3
         game.Lighting.ClockTime = 14
         game.Lighting.FogEnd = 100000
         game.Lighting.GlobalShadows = false
      else
         game.Lighting.Brightness = 1
         game.Lighting.ClockTime = 12
         game.Lighting.FogEnd = 500
         game.Lighting.GlobalShadows = true
      end
   end,
})

MiscTab:CreateButton({
   Name = "Anti AFK",
   Callback = function()
      local vu = game:GetService("VirtualUser")
      player.Idled:connect(function()
         vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
         wait(1)
         vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
      end)
      
      Rayfield:Notify({
         Title = "Anti AFK",
         Content = "Anti AFK enabled!",
         Duration = 3,
         Image = 4483362458,
      })
   end,
})

MiscTab:CreateButton({
   Name = "Remove Tsunami Water",
   Callback = function()
      RemoveTsunamiWater()
   end,
})

-- ============================================
-- FUNCTIONS
-- ============================================

-- Brainrot Collection Functions
function CollectAllBrainrot()
   local collected = 0
   
   -- Search for brainrot items in workspace
   for _, obj in pairs(Workspace:GetDescendants()) do
      if obj:IsA("BasePart") or obj:IsA("Model") then
         local name = obj.Name:lower()
         if name:find("brainrot") or name:find("brain") or name:find("item") then
            pcall(function()
               local pos = obj:IsA("Model") and obj.PrimaryPart and obj.PrimaryPart.Position or obj.Position
               if pos then
                  humanoidRootPart.CFrame = CFrame.new(pos)
                  wait(_G.TeleportSpeed)
                  
                  -- Fire collection remote
                  for _, remote in pairs(ReplicatedStorage:GetDescendants()) do
                     if remote:IsA("RemoteEvent") then
                        local remoteName = remote.Name:lower()
                        if remoteName:find("collect") or remoteName:find("take") or remoteName:find("pickup") then
                           remote:FireServer(obj)
                           remote:FireServer()
                        end
                     end
                  end
                  
                  collected = collected + 1
               end
            end)
         end
      end
   end
   
   Rayfield:Notify({
      Title = "Collection Complete",
      Content = "Collected " .. collected .. " brainrot items!",
      Duration = 3,
      Image = 4483362458,
   })
end

function CollectNearestBrainrot()
   local nearestBrainrot = nil
   local shortestDistance = math.huge
   
   for _, obj in pairs(Workspace:GetDescendants()) do
      if obj:IsA("BasePart") then
         local name = obj.Name:lower()
         if name:find("brainrot") or name:find("brain") then
            local distance = (humanoidRootPart.Position - obj.Position).Magnitude
            if distance < shortestDistance then
               shortestDistance = distance
               nearestBrainrot = obj
            end
         end
      end
   end
   
   if nearestBrainrot then
      humanoidRootPart.CFrame = CFrame.new(nearestBrainrot.Position)
   end
end

function StealAllPlayersBrainrot()
   print("\n👥 Stealing brainrot from all players...")
   local stolen = 0
   
   for _, targetPlayer in pairs(Players:GetPlayers()) do
      if targetPlayer ~= player then
         pcall(function()
            -- Try to steal their brainrot
            for _, item in pairs(targetPlayer:GetDescendants()) do
               if item:IsA("IntValue") or item:IsA("NumberValue") then
                  local name = item.Name:lower()
                  if name:find("brainrot") or name:find("item") then
                     -- Transfer to self
                     local selfItem = player:FindFirstChild(item.Name)
                     if selfItem then
                        selfItem.Value = selfItem.Value + item.Value
                        item.Value = 0
                        stolen = stolen + 1
                     end
                  end
               end
            end
            
            -- Fire steal remote
            for _, remote in pairs(ReplicatedStorage:GetDescendants()) do
               if remote:IsA("RemoteEvent") then
                  local remoteName = remote.Name:lower()
                  if remoteName:find("steal") or remoteName:find("take") then
                     remote:FireServer(targetPlayer)
                  end
               end
            end
         end)
      end
   end
   
   Rayfield:Notify({
      Title = "Steal Complete",
      Content = "Stole from " .. stolen .. " players!",
      Duration = 3,
      Image = 4483362458,
   })
end

-- Duplication Functions
function DuplicateBrainrot(multiplier)
   print("\n📦 Duplicating brainrot x" .. multiplier)
   
   -- Find brainrot values in player
   for _, item in pairs(player:GetDescendants()) do
      if item:IsA("IntValue") or item:IsA("NumberValue") then
         local name = item.Name:lower()
         if name:find("brainrot") or name:find("item") or name:find("count") then
            pcall(function()
               item.Value = item.Value * multiplier
               print("✅ Duplicated: " .. item:GetFullName() .. " x" .. multiplier)
            end)
         end
      end
   end
   
   -- Fire duplication remotes
   for _, remote in pairs(ReplicatedStorage:GetDescendants()) do
      if remote:IsA("RemoteEvent") then
         local remoteName = remote.Name:lower()
         if remoteName:find("duplicate") or remoteName:find("dupe") or remoteName:find("copy") then
            for i = 1, multiplier do
               pcall(function()
                  remote:FireServer()
                  remote:FireServer("Brainrot")
               end)
            end
         end
      end
   end
   
   Rayfield:Notify({
      Title = "Duplication",
      Content = "Duplicated brainrot x" .. multiplier .. "!",
      Duration = 3,
      Image = 4483362458,
   })
end

function DuplicateAllBoxes()
   print("\n📦 Duplicating all boxes...")
   
   for _, remote in pairs(ReplicatedStorage:GetDescendants()) do
      if remote:IsA("RemoteEvent") then
         local remoteName = remote.Name:lower()
         if remoteName:find("box") or remoteName:find("chest") or remoteName:find("crate") then
            for i = 1, 100 do
               pcall(function()
                  remote:FireServer()
                  remote:FireServer("Duplicate")
                  remote:FireServer(i)
               end)
            end
         end
      end
   end
   
   Rayfield:Notify({
      Title = "Box Duplication",
      Content = "Duplicated all boxes!",
      Duration = 3,
      Image = 4483362458,
   })
end

function DuplicateInventory()
   print("\n📦 Duplicating entire inventory...")
   
   -- Clone all inventory items
   for _, item in pairs(player:GetDescendants()) do
      if item:IsA("IntValue") or item:IsA("NumberValue") then
         pcall(function()
            item.Value = item.Value * 2
         end)
      end
   end
   
   Rayfield:Notify({
      Title = "Inventory Duplication",
      Content = "Duplicated entire inventory!",
      Duration = 3,
      Image = 4483362458,
   })
end

function MaxStackAllItems()
   for _, item in pairs(player:GetDescendants()) do
      if item:IsA("IntValue") or item:IsA("NumberValue") then
         pcall(function()
            item.Value = 999999999
         end)
      end
   end
   
   Rayfield:Notify({
      Title = "Max Stack",
      Content = "All items maxed to 999,999,999!",
      Duration = 3,
      Image = 4483362458,
   })
end

-- Token Functions
function SetToken(amount)
   print("\n🪙 Setting token to: " .. amount)
   
   for _, item in pairs(player:GetDescendants()) do
      if item:IsA("IntValue") or item:IsA("NumberValue") then
         local name = item.Name:lower()
         if name:find("token") or name:find("coin") or name:find("currency") then
            item.Value = amount
            print("✅ Set: " .. item:GetFullName() .. " = " .. amount)
         end
      end
   end
   
   Rayfield:Notify({
      Title = "Token Set",
      Content = "Token set to " .. amount .. "!",
      Duration = 3,
      Image = 4483362458,
   })
end

function MaxAllCurrencies()
   for _, item in pairs(player:GetDescendants()) do
      if item:IsA("IntValue") or item:IsA("NumberValue") then
         pcall(function()
            item.Value = 999999999
         end)
      end
   end
   
   Rayfield:Notify({
      Title = "Max Currency",
      Content = "All currencies maxed!",
      Duration = 3,
      Image = 4483362458,
   })
end

function DuplicateToken()
   for _, item in pairs(player:GetDescendants()) do
      if item:IsA("IntValue") or item:IsA("NumberValue") then
         local name = item.Name:lower()
         if name:find("token") then
            pcall(function()
               item.Value = item.Value * 2
            end)
         end
      end
   end
   
   Rayfield:Notify({
      Title = "Token Duplicated",
      Content = "Token doubled!",
      Duration = 3,
      Image = 4483362458,
   })
end

-- Add Brainrot Functions
function AddBrainrot(amount)
   print("\n➕ Adding " .. amount .. " brainrot...")
   
   for _, remote in pairs(ReplicatedStorage:GetDescendants()) do
      if remote:IsA("RemoteEvent") then
         local remoteName = remote.Name:lower()
         if remoteName:find("add") or remoteName:find("give") or remoteName:find("reward") then
            for i = 1, amount do
               pcall(function()
                  remote:FireServer("Brainrot")
                  remote:FireServer(1)
               end)
            end
         end
      end
   end
   
   -- Direct add to player data
   for _, item in pairs(player:GetDescendants()) do
      if item:IsA("IntValue") or item:IsA("NumberValue") then
         local name = item.Name:lower()
         if name:find("brainrot") or name:find("item") then
            pcall(function()
               item.Value = item.Value + amount
            end)
         end
      end
   end
   
   Rayfield:Notify({
      Title = "Brainrot Added",
      Content = "Added " .. amount .. " brainrot!",
      Duration = 3,
      Image = 4483362458,
   })
end

function AddSpecificBrainrot(rarity, amount)
   print("\n➕ Adding " .. amount .. " " .. rarity .. " brainrot...")
   
   for i = 1, amount do
      for _, remote in pairs(ReplicatedStorage:GetDescendants()) do
         if remote:IsA("RemoteEvent") then
            pcall(function()
               remote:FireServer(rarity)
               remote:FireServer("Brainrot", rarity)
            end)
         end
      end
   end
   
   Rayfield:Notify({
      Title = "Brainrot Added",
      Content = "Added " .. amount .. " " .. rarity .. " brainrot!",
      Duration = 3,
      Image = 4483362458,
   })
end

function AddAllTypesBrainrot()
   local types = {"Common", "Uncommon", "Rare", "Epic", "Legendary", "Mythic"}
   
   for _, rarity in pairs(types) do
      AddSpecificBrainrot(rarity, 10)
   end
   
   Rayfield:Notify({
      Title = "All Types Added",
      Content = "Added 10 of each brainrot type!",
      Duration = 3,
      Image = 4483362458,
   })
end

-- GamePass Functions
function UnlockAllGamepasses()
   print("\n💎 Unlocking all gamepasses...")
   
   EnableGamepassBypass()
   
   -- Modify player gamepass data
   for _, value in pairs(player:GetDescendants()) do
      if value:IsA("BoolValue") then
         local name = value.Name:lower()
         if name:find("gamepass") or name:find("pass") or name:find("vip") or name:find("premium") then
            value.Value = true
         end
      end
   end
   
   print("✅ All gamepasses unlocked!")
end

function EnableGamepassBypass()
   local mt = getrawmetatable(game)
   local oldNamecall = mt.__namecall
   setreadonly(mt, false)
   
   mt.__namecall = newcclosure(function(self, ...)
      local method = getnamecallmethod()
      
      if method == "UserOwnsGamePassAsync" then
         return true
      end
      
      if method == "PlayerOwnsAsset" then
         return true
      end
      
      return oldNamecall(self, ...)
   end)
   
   setreadonly(mt, true)
   
   Rayfield:Notify({
      Title = "GamePass Bypass",
      Content = "GamePass bypass enabled!",
      Duration = 3,
      Image = 4483362458,
   })
end

function UnlockVIP()
   for _, value in pairs(player:GetDescendants()) do
      if value:IsA("BoolValue") then
         local name = value.Name:lower()
         if name:find("vip") then
            value.Value = true
         end
      end
   end
   
   Rayfield:Notify({
      Title = "VIP Unlocked",
      Content = "VIP benefits unlocked!",
      Duration = 3,
      Image = 4483362458,
   })
end

function UnlockPremium()
   for _, value in pairs(player:GetDescendants()) do
      if value:IsA("BoolValue") then
         local name = value.Name:lower()
         if name:find("premium") then
            value.Value = true
         end
      end
   end
   
   Rayfield:Notify({
      Title = "Premium Unlocked",
      Content = "Premium benefits unlocked!",
      Duration = 3,
      Image = 4483362458,
   })
end

function EnableDoubleBrainrot()
   _G.DoubleBrainrot = true
   
   Rayfield:Notify({
      Title = "Double Brainrot",
      Content = "Double brainrot enabled!",
      Duration = 3,
      Image = 4483362458,
   })
end

function EnableAutoCollect()
   _G.AutoTakeBrainrot = true
   
   Rayfield:Notify({
      Title = "Auto Collect",
      Content = "Auto collect enabled!",
      Duration = 3,
      Image = 4483362458,
   })
end

function EnableFasterSpeed()
   if character and character:FindFirstChild("Humanoid") then
      character.Humanoid.WalkSpeed = 100
   end
   
   Rayfield:Notify({
      Title = "Faster Speed",
      Content = "Speed increased to 100!",
      Duration = 3,
      Image = 4483362458,
   })
end

-- UI Manipulation Functions
function ShowAllHiddenUI()
   for _, gui in pairs(player.PlayerGui:GetDescendants()) do
      if gui:IsA("GuiObject") then
         gui.Visible = true
      end
   end
   
   Rayfield:Notify({
      Title = "UI Shown",
      Content = "All hidden UI revealed!",
      Duration = 3,
      Image = 4483362458,
   })
end

function HideAnnoyingUI()
   for _, gui in pairs(player.PlayerGui:GetDescendants()) do
      if gui:IsA("GuiObject") then
         local name = gui.Name:lower()
         if name:find("ad") or name:find("promo") or name:find("popup") then
            gui.Visible = false
         end
      end
   end
   
   Rayfield:Notify({
      Title = "UI Hidden",
      Content = "Annoying UI hidden!",
      Duration = 3,
      Image = 4483362458,
   })
end

function ModifyBrainrotCounter(amount)
   for _, gui in pairs(player.PlayerGui:GetDescendants()) do
      if gui:IsA("TextLabel") or gui:IsA("TextBox") then
         local text = gui.Text:lower()
         if text:find("brainrot") or text:find("item") or text:find("count") then
            gui.Text = tostring(amount)
         end
      end
   end
   
   Rayfield:Notify({
      Title = "Counter Modified",
      Content = "Brainrot counter set to " .. amount .. "!",
      Duration = 3,
      Image = 4483362458,
   })
end

function FakeMaxItems()
   ModifyBrainrotCounter(999999)
end

function MakeUITransparent()
   for _, gui in pairs(player.PlayerGui:GetDescendants()) do
      if gui:IsA("GuiObject") then
         gui.BackgroundTransparency = 0.5
      end
   end
   
   Rayfield:Notify({
      Title = "UI Transparency",
      Content = "UI made transparent!",
      Duration = 3,
      Image = 4483362458,
   })
end

function EnlargeUI()
   for _, gui in pairs(player.PlayerGui:GetDescendants()) do
      if gui:IsA("GuiObject") then
         gui.Size = gui.Size * 1.5
      end
   end
   
   Rayfield:Notify({
      Title = "UI Enlarged",
      Content = "UI size increased!",
      Duration = 3,
      Image = 4483362458,
   })
end

function ResetAllUI()
   player.PlayerGui:ClearAllChildren()
   wait(1)
   player.PlayerGui = player.PlayerGui
   
   Rayfield:Notify({
      Title = "UI Reset",
      Content = "All UI reset!",
      Duration = 3,
      Image = 4483362458,
   })
end

-- Misc Functions
function TeleportToSafeZone()
   -- Teleport to high ground
   humanoidRootPart.CFrame = CFrame.new(0, 1000, 0)
   
   Rayfield:Notify({
      Title = "Safe Zone",
      Content = "Teleported to safe zone!",
      Duration = 3,
      Image = 4483362458,
   })
end

function RemoveTsunamiWater()
   for _, water in pairs(Workspace:GetDescendants()) do
      if water:IsA("Part") then
         local name = water.Name:lower()
         if name:find("tsunami") or name:find("water") or name:find("flood") then
            water:Destroy()
         end
      end
   end
   
   Rayfield:Notify({
      Title = "Tsunami Removed",
      Content = "Tsunami water removed!",
      Duration = 3,
      Image = 4483362458,
   })
end

-- ============================================
-- AUTO LOOPS
-- ============================================

-- Auto Take Brainrot Loop
task.spawn(function()
   while task.wait(_G.TeleportSpeed) do
      if _G.AutoTakeBrainrot then
         pcall(function()
            CollectAllBrainrot()
         end)
      end
   end
end)

-- Auto Steal Brainrot Loop
task.spawn(function()
   while task.wait(1) do
      if _G.AutoStealBrainrot then
         pcall(function()
            StealAllPlayersBrainrot()
         end)
      end
   end
end)

-- Auto Duplicate Brainrot Loop
task.spawn(function()
   while task.wait(1) do
      if _G.AutoDuplicateBrainrot then
         pcall(function()
            DuplicateBrainrot(2)
         end)
      end
   end
end)

-- Auto Duplicate Box Loop
task.spawn(function()
   while task.wait(2) do
      if _G.AutoDuplicateBox then
         pcall(function()
            DuplicateAllBoxes()
         end)
      end
   end
end)

-- Infinite Token Loop
task.spawn(function()
   while task.wait(0.5) do
      if _G.InfiniteToken then
         pcall(function()
            SetToken(999999999)
         end)
      end
   end
end)

-- Double Brainrot Loop
task.spawn(function()
   while task.wait(1) do
      if _G.DoubleBrainrot then
         pcall(function()
            for _, item in pairs(player:GetDescendants()) do
               if item:IsA("IntValue") or item:IsA("NumberValue") then
                  local name = item.Name:lower()
                  if name:find("brainrot") then
                     item.Value = item.Value * 2
                  end
               end
            end
         end)
      end
   end
end)

-- Anti Tsunami Loop
task.spawn(function()
   while task.wait(0.1) do
      if _G.AntiTsunami then
         pcall(function()
            if character and character:FindFirstChild("Humanoid") then
               character.Humanoid.Health = character.Humanoid.MaxHealth
            end
            
            -- Keep player above water
            if humanoidRootPart.Position.Y < 100 then
               humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position.X, 100, humanoidRootPart.Position.Z)
            end
         end)
      end
   end
end)

-- No Clip Loop
RunService.Stepped:Connect(function()
   if _G.NoClip then
      if character then
         for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
               part.CanCollide = false
            end
         end
      end
   end
end)

-- Infinite Jump
game:GetService("UserInputService").JumpRequest:Connect(function()
   if _G.InfiniteJump and character and character:FindFirstChild("Humanoid") then
      character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
   end
end)

-- Character Respawn Handler
player.CharacterAdded:Connect(function(char)
   character = char
   humanoidRootPart = char:WaitForChild("HumanoidRootPart")
end)

-- Load Complete
Rayfield:Notify({
   Title = "Script Loaded!",
   Content = "Escape Tsunami for Brainrot Ultimate loaded!",
   Duration = 5,
   Image = 4483362458,
})

print("\n✅ ESCAPE TSUNAMI FOR BRAINROT SCRIPT LOADED!")
print("🧠 Auto Take Brainrot: Toggle ON to start!")
print("📦 Duplicate: Use manual buttons or toggle auto!")
print("💎 GamePass: Click 'Unlock All GamePasses'!")
print("🪙 Token: Toggle 'Infinite Token' or use Set buttons!")
print(string.rep("=", 70) .. "\n")
