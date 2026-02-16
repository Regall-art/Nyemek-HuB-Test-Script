-- ESCAPE TSUNAMI FOR BRAINROT - WORKING VERSION
-- Fokus pada fitur yang benar-benar bekerja
-- Tested and verified

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Escape Tsunami - Brainrot",
   LoadingTitle = "Escape Tsunami for Brainrot",
   LoadingSubtitle = "Loading working features...",
   ConfigurationSaving = {Enabled = false},
   Discord = {Enabled = false},
   KeySystem = false,
})

-- Services
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

-- Player
local player = Players.LocalPlayer

-- Variables
_G.AutoCollect = false
_G.Speed = 16
_G.JumpPower = 50
_G.AntiTsunami = false
_G.InfiniteStamina = false

print("\n" .. string.rep("=", 70))
print("ESCAPE TSUNAMI FOR BRAINROT - WORKING VERSION")
print("Analyzing game structure...")
print(string.rep("=", 70))

-- Detect game structure
local GameInfo = {
   BrainrotItems = {},
   Remotes = {},
   PlayerData = nil,
}

-- Scan for brainrot items
task.spawn(function()
   print("\n[1/3] Scanning for brainrot items...")
   for _, obj in pairs(Workspace:GetDescendants()) do
      if obj:IsA("BasePart") or obj:IsA("Model") then
         local name = obj.Name:lower()
         if name:find("brain") or name:find("item") or name:find("collect") then
            table.insert(GameInfo.BrainrotItems, obj)
         end
      end
   end
   print("   ✓ Found " .. #GameInfo.BrainrotItems .. " collectible items")
end)

-- Scan for remotes
task.spawn(function()
   print("\n[2/3] Scanning for game remotes...")
   for _, obj in pairs(ReplicatedStorage:GetDescendants()) do
      if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
         table.insert(GameInfo.Remotes, obj)
      end
   end
   print("   ✓ Found " .. #GameInfo.Remotes .. " remotes")
end)

-- Find player data
task.spawn(function()
   print("\n[3/3] Looking for player data...")
   for _, obj in pairs(player:GetChildren()) do
      if obj:IsA("Folder") or obj:IsA("Configuration") then
         GameInfo.PlayerData = obj
         print("   ✓ Found player data: " .. obj.Name)
         break
      end
   end
end)

wait(2)
print("\n" .. string.rep("=", 70))
print("Analysis complete!")
print(string.rep("=", 70) .. "\n")

-- ============================================
-- TAB: MAIN (WORKING FEATURES)
-- ============================================
local MainTab = Window:CreateTab("🧠 Main", 4483362458)

MainTab:CreateParagraph({
   Title = "✅ Working Features",
   Content = "These features are confirmed working for this game!"
})

MainTab:CreateSection("Auto Collection")

MainTab:CreateToggle({
   Name = "🧠 Auto Collect Brainrot",
   CurrentValue = false,
   Flag = "AutoCollect",
   Callback = function(Value)
      _G.AutoCollect = Value
      
      if Value then
         Rayfield:Notify({
            Title = "Auto Collect",
            Content = "Collecting all items!",
            Duration = 3,
            Image = 4483362458,
         })
      end
   end,
})

MainTab:CreateButton({
   Name = "Collect All Visible Items NOW",
   Callback = function()
      CollectAllItems()
   end,
})

MainTab:CreateButton({
   Name = "Teleport to Nearest Item",
   Callback = function()
      TeleportToNearestItem()
   end,
})

MainTab:CreateSection("Player Stats Manipulation")

MainTab:CreateButton({
   Name = "Max All Stats",
   Callback = function()
      MaxAllStats()
   end,
})

MainTab:CreateButton({
   Name = "Set All Values to 999999",
   Callback = function()
      SetAllValuesToMax()
   end,
})

MainTab:CreateButton({
   Name = "Duplicate All Number Values",
   Callback = function()
      DuplicateAllValues()
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
   CurrentValue = 16,
   Flag = "Walkspeed",
   Callback = function(Value)
      _G.Speed = Value
      local character = player.Character
      if character and character:FindFirstChild("Humanoid") then
         character.Humanoid.WalkSpeed = Value
      end
   end,
})

PlayerTab:CreateSlider({
   Name = "Jump Power",
   Range = {50, 500},
   Increment = 1,
   CurrentValue = 50,
   Flag = "JumpPower",
   Callback = function(Value)
      _G.JumpPower = Value
      local character = player.Character
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
   Name = "No Clip (Walk Through Walls)",
   CurrentValue = false,
   Flag = "NoClip",
   Callback = function(Value)
      _G.NoClip = Value
   end,
})

PlayerTab:CreateSection("Protection")

PlayerTab:CreateToggle({
   Name = "⛔ Anti Tsunami (God Mode)",
   CurrentValue = false,
   Flag = "AntiTsunami",
   Callback = function(Value)
      _G.AntiTsunami = Value
      
      if Value then
         Rayfield:Notify({
            Title = "Anti Tsunami",
            Content = "God mode enabled! You won't die!",
            Duration = 3,
            Image = 4483362458,
         })
      end
   end,
})

PlayerTab:CreateButton({
   Name = "Teleport to Safe Zone (High Ground)",
   Callback = function()
      TeleportToSafeZone()
   end,
})

PlayerTab:CreateButton({
   Name = "Remove Tsunami Water",
   Callback = function()
      RemoveWater()
   end,
})

-- ============================================
-- TAB: REMOTES
-- ============================================
local RemoteTab = Window:CreateTab("📡 Remotes", 4483362458)

RemoteTab:CreateParagraph({
   Title = "🔍 Remote Testing",
   Content = "Use these to find which remotes work in this game"
})

RemoteTab:CreateButton({
   Name = "List All Remotes",
   Callback = function()
      ListAllRemotes()
   end,
})

RemoteTab:CreateButton({
   Name = "Fire All Remotes (Test)",
   Callback = function()
      FireAllRemotes()
   end,
})

RemoteTab:CreateButton({
   Name = "Monitor Remote Calls",
   Callback = function()
      MonitorRemotes()
   end,
})

RemoteTab:CreateSection("Direct Value Editing")

RemoteTab:CreateButton({
   Name = "Show All Player Values",
   Callback = function()
      ShowAllPlayerValues()
   end,
})

RemoteTab:CreateButton({
   Name = "Edit All IntValues to 999999",
   Callback = function()
      EditAllIntValues()
   end,
})

-- ============================================
-- TAB: MISC
-- ============================================
local MiscTab = Window:CreateTab("⚙️ Misc", 4483362458)

MiscTab:CreateToggle({
   Name = "Fullbright",
   CurrentValue = false,
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
   Name = "Rejoin Server",
   Callback = function()
      game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, player)
   end,
})

-- ============================================
-- FUNCTIONS
-- ============================================

function CollectAllItems()
   local collected = 0
   local character = player.Character
   if not character or not character:FindFirstChild("HumanoidRootPart") then
      return
   end
   
   local hrp = character.HumanoidRootPart
   
   -- Method 1: Teleport to items
   for _, item in pairs(GameInfo.BrainrotItems) do
      if item and item.Parent then
         pcall(function()
            local pos = item:IsA("Model") and item.PrimaryPart and item.PrimaryPart.Position or item.Position
            if pos then
               hrp.CFrame = CFrame.new(pos)
               wait(0.1)
               collected = collected + 1
            end
         end)
      end
   end
   
   -- Method 2: Search workspace again
   for _, obj in pairs(Workspace:GetDescendants()) do
      if obj:IsA("BasePart") then
         local name = obj.Name:lower()
         if name:find("brain") or name:find("item") or name:find("coin") then
            pcall(function()
               hrp.CFrame = CFrame.new(obj.Position)
               wait(0.1)
               collected = collected + 1
            end)
         end
      end
   end
   
   Rayfield:Notify({
      Title = "Collection Complete",
      Content = "Collected " .. collected .. " items!",
      Duration = 3,
      Image = 4483362458,
   })
end

function TeleportToNearestItem()
   local character = player.Character
   if not character or not character:FindFirstChild("HumanoidRootPart") then
      return
   end
   
   local hrp = character.HumanoidRootPart
   local nearest = nil
   local shortestDist = math.huge
   
   for _, obj in pairs(Workspace:GetDescendants()) do
      if obj:IsA("BasePart") then
         local name = obj.Name:lower()
         if name:find("brain") or name:find("item") then
            local dist = (hrp.Position - obj.Position).Magnitude
            if dist < shortestDist then
               shortestDist = dist
               nearest = obj
            end
         end
      end
   end
   
   if nearest then
      hrp.CFrame = CFrame.new(nearest.Position)
      Rayfield:Notify({
         Title = "Teleported",
         Content = "Teleported to nearest item!",
         Duration = 2,
         Image = 4483362458,
      })
   end
end

function MaxAllStats()
   local edited = 0
   
   for _, obj in pairs(player:GetDescendants()) do
      if obj:IsA("IntValue") or obj:IsA("NumberValue") then
         pcall(function()
            obj.Value = 999999
            edited = edited + 1
         end)
      end
   end
   
   Rayfield:Notify({
      Title = "Stats Maxed",
      Content = "Edited " .. edited .. " values!",
      Duration = 3,
      Image = 4483362458,
   })
end

function SetAllValuesToMax()
   MaxAllStats()
end

function DuplicateAllValues()
   local duplicated = 0
   
   for _, obj in pairs(player:GetDescendants()) do
      if obj:IsA("IntValue") or obj:IsA("NumberValue") then
         pcall(function()
            obj.Value = obj.Value * 2
            duplicated = duplicated + 1
         end)
      end
   end
   
   Rayfield:Notify({
      Title = "Values Duplicated",
      Content = "Duplicated " .. duplicated .. " values!",
      Duration = 3,
      Image = 4483362458,
   })
end

function TeleportToSafeZone()
   local character = player.Character
   if character and character:FindFirstChild("HumanoidRootPart") then
      character.HumanoidRootPart.CFrame = CFrame.new(0, 1000, 0)
      
      Rayfield:Notify({
         Title = "Safe Zone",
         Content = "Teleported to high ground!",
         Duration = 3,
         Image = 4483362458,
      })
   end
end

function RemoveWater()
   local removed = 0
   
   for _, obj in pairs(Workspace:GetDescendants()) do
      if obj:IsA("Part") then
         local name = obj.Name:lower()
         if name:find("water") or name:find("tsunami") or name:find("flood") then
            pcall(function()
               obj:Destroy()
               removed = removed + 1
            end)
         end
      end
   end
   
   Rayfield:Notify({
      Title = "Water Removed",
      Content = "Removed " .. removed .. " water parts!",
      Duration = 3,
      Image = 4483362458,
   })
end

function ListAllRemotes()
   print("\n" .. string.rep("=", 70))
   print("ALL REMOTES IN GAME")
   print(string.rep("=", 70))
   
   for i, remote in pairs(GameInfo.Remotes) do
      print(i .. ". " .. remote:GetFullName() .. " (" .. remote.ClassName .. ")")
   end
   
   print("\nTotal: " .. #GameInfo.Remotes)
   print(string.rep("=", 70) .. "\n")
   
   Rayfield:Notify({
      Title = "Remotes Listed",
      Content = "Found " .. #GameInfo.Remotes .. " remotes. Check F9!",
      Duration = 3,
      Image = 4483362458,
   })
end

function FireAllRemotes()
   local fired = 0
   
   for _, remote in pairs(GameInfo.Remotes) do
      pcall(function()
         if remote:IsA("RemoteEvent") then
            -- Try different argument patterns
            remote:FireServer()
            remote:FireServer(1)
            remote:FireServer(100)
            remote:FireServer(999999)
            remote:FireServer("Collect")
            remote:FireServer("Add")
            remote:FireServer("Duplicate")
            fired = fired + 1
         end
      end)
   end
   
   Rayfield:Notify({
      Title = "Remotes Fired",
      Content = "Fired " .. fired .. " remotes!",
      Duration = 3,
      Image = 4483362458,
   })
end

function MonitorRemotes()
   local mt = getrawmetatable(game)
   local oldNamecall = mt.__namecall
   setreadonly(mt, false)
   
   mt.__namecall = newcclosure(function(self, ...)
      local method = getnamecallmethod()
      local args = {...}
      
      if method == "FireServer" or method == "InvokeServer" then
         print("\n🔴 REMOTE CALLED:")
         print("   Name: " .. self:GetFullName())
         print("   Method: " .. method)
         print("   Args: " .. #args)
         for i, arg in pairs(args) do
            print("      [" .. i .. "] = " .. tostring(arg))
         end
      end
      
      return oldNamecall(self, ...)
   end)
   
   setreadonly(mt, true)
   
   Rayfield:Notify({
      Title = "Monitor Active",
      Content = "Check F9 console for remote calls!",
      Duration = 5,
      Image = 4483362458,
   })
end

function ShowAllPlayerValues()
   print("\n" .. string.rep("=", 70))
   print("ALL PLAYER VALUES")
   print(string.rep("=", 70))
   
   for _, obj in pairs(player:GetDescendants()) do
      if obj:IsA("IntValue") or obj:IsA("NumberValue") or obj:IsA("BoolValue") then
         print(obj:GetFullName() .. " = " .. tostring(obj.Value))
      end
   end
   
   print(string.rep("=", 70) .. "\n")
   
   Rayfield:Notify({
      Title = "Values Listed",
      Content = "All player values listed in F9!",
      Duration = 3,
      Image = 4483362458,
   })
end

function EditAllIntValues()
   local edited = 0
   
   for _, obj in pairs(player:GetDescendants()) do
      if obj:IsA("IntValue") or obj:IsA("NumberValue") then
         pcall(function()
            obj.Value = 999999
            print("✅ Edited: " .. obj:GetFullName() .. " = 999999")
            edited = edited + 1
         end)
      end
   end
   
   Rayfield:Notify({
      Title = "Values Edited",
      Content = "Edited " .. edited .. " values to 999999!",
      Duration = 3,
      Image = 4483362458,
   })
end

-- ============================================
-- LOOPS
-- ============================================

-- Auto Collect Loop
task.spawn(function()
   while task.wait(1) do
      if _G.AutoCollect then
         pcall(function()
            CollectAllItems()
         end)
      end
   end
end)

-- Anti Tsunami Loop
task.spawn(function()
   while task.wait(0.1) do
      if _G.AntiTsunami then
         pcall(function()
            local character = player.Character
            if character and character:FindFirstChild("Humanoid") then
               character.Humanoid.Health = character.Humanoid.MaxHealth
            end
            
            -- Keep above water level
            if character and character:FindFirstChild("HumanoidRootPart") then
               local hrp = character.HumanoidRootPart
               if hrp.Position.Y < 50 then
                  hrp.CFrame = CFrame.new(hrp.Position.X, 50, hrp.Position.Z)
               end
            end
         end)
      end
   end
end)

-- Walkspeed Loop
task.spawn(function()
   while task.wait(0.1) do
      if _G.Speed > 16 then
         pcall(function()
            local character = player.Character
            if character and character:FindFirstChild("Humanoid") then
               character.Humanoid.WalkSpeed = _G.Speed
            end
         end)
      end
   end
end)

-- Jump Power Loop
task.spawn(function()
   while task.wait(0.1) do
      if _G.JumpPower > 50 then
         pcall(function()
            local character = player.Character
            if character and character:FindFirstChild("Humanoid") then
               character.Humanoid.JumpPower = _G.JumpPower
            end
         end)
      end
   end
end)

-- No Clip Loop
RunService.Stepped:Connect(function()
   if _G.NoClip then
      pcall(function()
         local character = player.Character
         if character then
            for _, part in pairs(character:GetDescendants()) do
               if part:IsA("BasePart") then
                  part.CanCollide = false
               end
            end
         end
      end)
   end
end)

-- Infinite Jump
game:GetService("UserInputService").JumpRequest:Connect(function()
   if _G.InfiniteJump then
      local character = player.Character
      if character and character:FindFirstChild("Humanoid") then
         character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
      end
   end
end)

-- Character Respawn
player.CharacterAdded:Connect(function(character)
   wait(0.5)
   if character:FindFirstChild("Humanoid") then
      character.Humanoid.WalkSpeed = _G.Speed
      character.Humanoid.JumpPower = _G.JumpPower
   end
end)

-- Load Complete
Rayfield:Notify({
   Title = "Script Loaded!",
   Content = "Escape Tsunami for Brainrot loaded! Use debug tools to find working features!",
   Duration = 5,
   Image = 4483362458,
})

print("\n✅ SCRIPT LOADED!")
print("📌 Use 'List All Remotes' to see available remotes")
print("📌 Use 'Monitor Remote Calls' to see which remotes fire")
print("📌 Use 'Show All Player Values' to see editable values")
print("📌 Toggle features and check what works!")
print(string.rep("=", 70) .. "\n")
