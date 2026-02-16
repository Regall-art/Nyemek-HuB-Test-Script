-- ROBLOX FPS OPTIMIZER & ANTI LAG - UNIVERSAL
-- Works on ALL Roblox games
-- Boost FPS, Reduce Lag, Optimize Performance

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "FPS Optimizer & Anti Lag",
   LoadingTitle = "FPS Booster",
   LoadingSubtitle = "Loading optimization tools...",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "FPSOptimizer"
   },
   Discord = {
      Enabled = false,
   },
   KeySystem = false,
})

-- Services
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")

-- Player
local player = Players.LocalPlayer

-- FPS Counter
local FPSCounter = 0
local LastUpdate = tick()

-- Settings
local Settings = {
   FPSBoost = false,
   RemoveTextures = false,
   RemoveParticles = false,
   RemoveTerrain = false,
   LowGraphics = false,
   DisableAnimations = false,
   ReduceDrawDistance = false,
   RemoveShadows = true,
   RemoveFog = true,
   RemoveDecals = false,
   RemoveMeshes = false,
   FPSCap = 0,
}

print("\n" .. string.rep("=", 70))
print("ROBLOX FPS OPTIMIZER & ANTI LAG")
print("Universal script for all games")
print(string.rep("=", 70) .. "\n")

-- ============================================
-- TAB: FPS BOOST
-- ============================================
local FPSTab = Window:CreateTab("⚡ FPS Boost", 4483362458)

FPSTab:CreateParagraph({
   Title = "📊 Current FPS",
   Content = "FPS will be displayed in the UI after enabling boost"
})

FPSTab:CreateSection("Main FPS Boost")

FPSTab:CreateButton({
   Name = "🚀 ULTRA FPS BOOST (Safe - Collision ON)",
   Callback = function()
      Settings.FPSBoost = true
      Settings.RemoveTextures = true
      Settings.RemoveParticles = true
      Settings.LowGraphics = true
      Settings.RemoveShadows = true
      Settings.RemoveFog = true
      Settings.ReduceDrawDistance = true
      
      ApplyAllOptimizationsSafe()
      
      Rayfield:Notify({
         Title = "Ultra FPS Boost (Safe)",
         Content = "All optimizations applied! Parts remain walkable!",
         Duration = 5,
         Image = 4483362458,
      })
   end,
})

FPSTab:CreateButton({
   Name = "⚡ PERFORMANCE MODE (Balanced)",
   Callback = function()
      Settings.RemoveShadows = true
      Settings.RemoveFog = true
      Settings.RemoveParticles = true
      Settings.LowGraphics = true
      
      ApplyPerformanceMode()
      
      Rayfield:Notify({
         Title = "Performance Mode",
         Content = "Balanced settings applied!",
         Duration = 3,
         Image = 4483362458,
      })
   end,
})

FPSTab:CreateButton({
   Name = "🎮 POTATO MODE (Maximum FPS)",
   Callback = function()
      ApplyPotatoMode()
      
      Rayfield:Notify({
         Title = "Potato Mode",
         Content = "Maximum FPS mode! Graphics will be minimal!",
         Duration = 3,
         Image = 4483362458,
      })
   end,
})

FPSTab:CreateSection("FPS Settings")

FPSTab:CreateToggle({
   Name = "Show FPS Counter",
   CurrentValue = false,
   Flag = "ShowFPS",
   Callback = function(Value)
      ShowFPSCounter(Value)
   end,
})

FPSTab:CreateSlider({
   Name = "FPS Cap (0 = Unlimited)",
   Range = {0, 240},
   Increment = 10,
   Suffix = " FPS",
   CurrentValue = 0,
   Flag = "FPSCap",
   Callback = function(Value)
      Settings.FPSCap = Value
      if Value > 0 then
         setfpscap(Value)
      else
         setfpscap(999)
      end
   end,
})

-- ============================================
-- TAB: GRAPHICS OPTIMIZATION
-- ============================================
local GraphicsTab = Window:CreateTab("🎨 Graphics", 4483362458)

GraphicsTab:CreateSection("Texture & Visual Optimization")

GraphicsTab:CreateToggle({
   Name = "Remove All Textures",
   CurrentValue = false,
   Flag = "RemoveTextures",
   Callback = function(Value)
      Settings.RemoveTextures = Value
      if Value then
         RemoveTextures()
      end
   end,
})

GraphicsTab:CreateToggle({
   Name = "Remove Particles & Effects",
   CurrentValue = false,
   Flag = "RemoveParticles",
   Callback = function(Value)
      Settings.RemoveParticles = Value
      if Value then
         RemoveParticles()
      end
   end,
})

GraphicsTab:CreateToggle({
   Name = "Remove Decals & Stickers",
   CurrentValue = false,
   Flag = "RemoveDecals",
   Callback = function(Value)
      Settings.RemoveDecals = Value
      if Value then
         RemoveDecals()
      end
   end,
})

GraphicsTab:CreateToggle({
   Name = "Simplify Meshes",
   CurrentValue = false,
   Flag = "SimplifyMeshes",
   Callback = function(Value)
      Settings.RemoveMeshes = Value
      if Value then
         SimplifyMeshes()
      end
   end,
})

GraphicsTab:CreateSection("Lighting Optimization")

GraphicsTab:CreateToggle({
   Name = "Remove Shadows",
   CurrentValue = false,
   Flag = "RemoveShadows",
   Callback = function(Value)
      Settings.RemoveShadows = Value
      RemoveShadows(Value)
   end,
})

GraphicsTab:CreateToggle({
   Name = "Remove Fog",
   CurrentValue = false,
   Flag = "RemoveFog",
   Callback = function(Value)
      Settings.RemoveFog = Value
      RemoveFog(Value)
   end,
})

GraphicsTab:CreateToggle({
   Name = "Disable Blur & Color Effects",
   CurrentValue = false,
   Flag = "DisableEffects",
   Callback = function(Value)
      DisableLightingEffects(Value)
   end,
})

GraphicsTab:CreateSection("Render Distance")

GraphicsTab:CreateToggle({
   Name = "Reduce Draw Distance",
   CurrentValue = false,
   Flag = "ReduceDrawDistance",
   Callback = function(Value)
      Settings.ReduceDrawDistance = Value
      ReduceDrawDistance(Value)
   end,
})

GraphicsTab:CreateButton({
   Name = "Hide Distant Objects",
   Callback = function()
      HideDistantObjects()
   end,
})

-- ============================================
-- TAB: ANTI LAG
-- ============================================
local AntiLagTab = Window:CreateTab("🛡️ Anti Lag", 4483362458)

AntiLagTab:CreateSection("Memory Optimization")

AntiLagTab:CreateButton({
   Name = "Clear Memory Cache",
   Callback = function()
      ClearMemoryCache()
   end,
})

AntiLagTab:CreateButton({
   Name = "Remove Unused Assets",
   Callback = function()
      RemoveUnusedAssets()
   end,
})

AntiLagTab:CreateButton({
   Name = "Optimize Workspace",
   Callback = function()
      OptimizeWorkspace()
   end,
})

AntiLagTab:CreateSection("Animation & Physics")

AntiLagTab:CreateToggle({
   Name = "Disable Animations",
   CurrentValue = false,
   Flag = "DisableAnimations",
   Callback = function(Value)
      Settings.DisableAnimations = Value
      DisableAnimations(Value)
   end,
})

AntiLagTab:CreateToggle({
   Name = "Reduce Physics Quality",
   CurrentValue = false,
   Flag = "ReducePhysics",
   Callback = function(Value)
      ReducePhysics(Value)
   end,
})

AntiLagTab:CreateButton({
   Name = "Fix Physics Lag",
   Callback = function()
      FixPhysicsLag()
   end,
})

AntiLagTab:CreateSection("Network Optimization")

AntiLagTab:CreateButton({
   Name = "Optimize Network Traffic",
   Callback = function()
      OptimizeNetwork()
   end,
})

AntiLagTab:CreateToggle({
   Name = "Reduce Network Data",
   CurrentValue = false,
   Flag = "ReduceNetwork",
   Callback = function(Value)
      ReduceNetworkData(Value)
   end,
})

-- ============================================
-- TAB: ADVANCED
-- ============================================
local AdvancedTab = Window:CreateTab("⚙️ Advanced", 4483362458)

AdvancedTab:CreateSection("Advanced Optimizations")

AdvancedTab:CreateToggle({
   Name = "Remove Terrain Textures",
   CurrentValue = false,
   Flag = "RemoveTerrain",
   Callback = function(Value)
      Settings.RemoveTerrain = Value
      RemoveTerrainTextures(Value)
   end,
})

AdvancedTab:CreateToggle({
   Name = "Disable Post-Processing",
   CurrentValue = false,
   Flag = "DisablePostProcessing",
   Callback = function(Value)
      DisablePostProcessing(Value)
   end,
})

AdvancedTab:CreateButton({
   Name = "Delete All Unnecessary Parts",
   Callback = function()
      DeleteUnnecessaryParts()
   end,
})

AdvancedTab:CreateButton({
   Name = "Optimize All Characters",
   Callback = function()
      OptimizeAllCharacters()
   end,
})

AdvancedTab:CreateSection("Extreme Optimizations")

AdvancedTab:CreateButton({
   Name = "⚠️ DESTROY ALL VISUALS (MAX FPS)",
   Callback = function()
      DestroyAllVisuals()
      
      Rayfield:Notify({
         Title = "Maximum Optimization",
         Content = "All visuals destroyed! Max FPS mode!",
         Duration = 5,
         Image = 4483362458,
      })
   end,
})

AdvancedTab:CreateButton({
   Name = "Restore Default Settings",
   Callback = function()
      RestoreDefaults()
   end,
})

-- ============================================
-- TAB: INFO
-- ============================================
local InfoTab = Window:CreateTab("ℹ️ Info", 4483362458)

InfoTab:CreateParagraph({
   Title = "📊 System Information",
   Content = "Monitor your game performance"
})

InfoTab:CreateButton({
   Name = "Show Performance Stats",
   Callback = function()
      ShowPerformanceStats()
   end,
})

InfoTab:CreateButton({
   Name = "Show Memory Usage",
   Callback = function()
      ShowMemoryUsage()
   end,
})

InfoTab:CreateSection("Recommendations")

InfoTab:CreateParagraph({
   Title = "🎮 Low-End PC",
   Content = "Recommended: Ultra FPS Boost + Potato Mode\nRemove all textures and particles"
})

InfoTab:CreateParagraph({
   Title = "💻 Mid-Range PC",
   Content = "Recommended: Performance Mode\nRemove shadows and fog only"
})

InfoTab:CreateParagraph({
   Title = "🖥️ High-End PC",
   Content = "Recommended: Graphics optimizations only\nKeep visuals, remove shadows"
})

-- ============================================
-- FUNCTIONS
-- ============================================

-- Main Optimization Functions
function ApplyAllOptimizations()
   print("\n⚡ Applying ALL optimizations...")
   
   RemoveTextures()
   RemoveParticles()
   RemoveDecals()
   RemoveShadows(true)
   RemoveFog(true)
   DisableLightingEffects(true)
   ReduceDrawDistance(true)
   DisableAnimations(true)
   ReducePhysics(true)
   RemoveTerrainTextures(true)
   DisablePostProcessing(true)
   OptimizeWorkspace()
   
   print("✅ All optimizations applied!")
end

function ApplyAllOptimizationsSafe()
   print("\n⚡ Applying ALL optimizations (SAFE MODE - Collision preserved)...")
   
   RemoveTextures()
   RemoveParticles()
   RemoveDecals()
   RemoveShadows(true)
   RemoveFog(true)
   DisableLightingEffects(true)
   -- ReduceDrawDistance will keep CanCollide ON
   ReduceDrawDistance(true)
   DisableAnimations(true)
   -- ReducePhysics modified to not affect walkable surfaces
   ReducePhysicsSafe(true)
   RemoveTerrainTextures(true)
   DisablePostProcessing(true)
   OptimizeWorkspace()
   
   print("✅ All optimizations applied (collision preserved)!")
end

function ApplyPerformanceMode()
   print("\n⚡ Applying Performance Mode...")
   
   RemoveShadows(true)
   RemoveFog(true)
   RemoveParticles()
   DisableLightingEffects(true)
   
   Lighting.Brightness = 2
   Lighting.GlobalShadows = false
   
   print("✅ Performance mode applied!")
end

function ApplyPotatoMode()
   print("\n🥔 Applying POTATO MODE...")
   
   -- Remove everything
   for _, obj in pairs(Workspace:GetDescendants()) do
      pcall(function()
         if obj:IsA("Texture") then obj:Destroy() end
         if obj:IsA("Decal") then obj:Destroy() end
         if obj:IsA("ParticleEmitter") then obj:Destroy() end
         if obj:IsA("Trail") then obj:Destroy() end
         if obj:IsA("Smoke") then obj:Destroy() end
         if obj:IsA("Fire") then obj:Destroy() end
         if obj:IsA("Sparkles") then obj:Destroy() end
         if obj:IsA("MeshPart") then obj.TextureID = "" end
         if obj:IsA("Part") then obj.Material = Enum.Material.SmoothPlastic end
      end)
   end
   
   -- Lighting to minimum
   Lighting.GlobalShadows = false
   Lighting.FogEnd = 100000
   Lighting.Brightness = 0
   
   -- Remove all lighting effects
   for _, effect in pairs(Lighting:GetChildren()) do
      if effect:IsA("PostEffect") then
         effect.Enabled = false
      end
   end
   
   -- Set graphics quality to minimum
   settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
   
   print("✅ POTATO MODE activated!")
end

-- Texture Removal
function RemoveTextures()
   print("\n🎨 Removing textures...")
   local removed = 0
   
   for _, obj in pairs(Workspace:GetDescendants()) do
      pcall(function()
         if obj:IsA("Texture") then
            obj:Destroy()
            removed = removed + 1
         elseif obj:IsA("MeshPart") then
            obj.TextureID = ""
            removed = removed + 1
         elseif obj:IsA("Part") then
            obj.Material = Enum.Material.SmoothPlastic
         end
      end)
   end
   
   print("✅ Removed " .. removed .. " textures")
   
   Rayfield:Notify({
      Title = "Textures Removed",
      Content = "Removed " .. removed .. " textures!",
      Duration = 3,
      Image = 4483362458,
   })
end

-- Particle Removal
function RemoveParticles()
   print("\n✨ Removing particles...")
   local removed = 0
   
   for _, obj in pairs(Workspace:GetDescendants()) do
      pcall(function()
         if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or 
            obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Sparkles") then
            obj:Destroy()
            removed = removed + 1
         end
      end)
   end
   
   print("✅ Removed " .. removed .. " particle effects")
   
   Rayfield:Notify({
      Title = "Particles Removed",
      Content = "Removed " .. removed .. " effects!",
      Duration = 3,
      Image = 4483362458,
   })
end

-- Decal Removal
function RemoveDecals()
   print("\n🖼️ Removing decals...")
   local removed = 0
   
   for _, obj in pairs(Workspace:GetDescendants()) do
      pcall(function()
         if obj:IsA("Decal") or obj:IsA("SurfaceGui") then
            obj:Destroy()
            removed = removed + 1
         end
      end)
   end
   
   print("✅ Removed " .. removed .. " decals")
end

-- Mesh Simplification
function SimplifyMeshes()
   print("\n🔷 Simplifying meshes...")
   
   for _, obj in pairs(Workspace:GetDescendants()) do
      pcall(function()
         if obj:IsA("SpecialMesh") then
            obj:Destroy()
         elseif obj:IsA("MeshPart") then
            obj.RenderFidelity = Enum.RenderFidelity.Performance
         end
      end)
   end
   
   print("✅ Meshes simplified")
end

-- Shadow Removal
function RemoveShadows(enabled)
   if enabled then
      Lighting.GlobalShadows = false
      Lighting.Brightness = 2
      
      for _, obj in pairs(Workspace:GetDescendants()) do
         pcall(function()
            if obj:IsA("Part") or obj:IsA("MeshPart") then
               obj.CastShadow = false
            end
         end)
      end
      
      print("✅ Shadows removed")
   else
      Lighting.GlobalShadows = true
      Lighting.Brightness = 1
   end
end

-- Fog Removal
function RemoveFog(enabled)
   if enabled then
      Lighting.FogEnd = 100000
      Lighting.FogStart = 0
      print("✅ Fog removed")
   else
      Lighting.FogEnd = 500
   end
end

-- Lighting Effects
function DisableLightingEffects(enabled)
   if enabled then
      for _, effect in pairs(Lighting:GetChildren()) do
         pcall(function()
            if effect:IsA("BloomEffect") or effect:IsA("BlurEffect") or 
               effect:IsA("ColorCorrectionEffect") or effect:IsA("SunRaysEffect") or
               effect:IsA("DepthOfFieldEffect") then
               effect.Enabled = false
            end
         end)
      end
      print("✅ Lighting effects disabled")
   end
end

-- Draw Distance
function ReduceDrawDistance(enabled)
   if enabled then
      for _, obj in pairs(Workspace:GetDescendants()) do
         pcall(function()
            if obj:IsA("BasePart") then
               local distance = (player.Character.HumanoidRootPart.Position - obj.Position).Magnitude
               if distance > 500 then
                  obj.Transparency = 1
                  -- KEEP CanCollide = true so parts remain walkable!
               end
            end
         end)
      end
      print("✅ Draw distance reduced (CanCollide kept ON)")
   end
end

function HideDistantObjects()
   local hidden = 0
   local character = player.Character
   
   if character and character:FindFirstChild("HumanoidRootPart") then
      local hrp = character.HumanoidRootPart
      
      for _, obj in pairs(Workspace:GetDescendants()) do
         pcall(function()
            if obj:IsA("BasePart") then
               local distance = (hrp.Position - obj.Position).Magnitude
               if distance > 1000 then
                  -- Make invisible but keep collision
                  obj.Transparency = 1
                  hidden = hidden + 1
               end
            end
         end)
      end
   end
   
   Rayfield:Notify({
      Title = "Objects Hidden",
      Content = "Hidden " .. hidden .. " distant objects (collision kept)!",
      Duration = 3,
      Image = 4483362458,
   })
end

-- Memory Optimization
function ClearMemoryCache()
   print("\n🧹 Clearing memory cache...")
   
   -- Force garbage collection
   for i = 1, 10 do
      wait()
      pcall(function()
         game:GetService("ContentProvider"):PreloadAsync({})
      end)
   end
   
   collectgarbage("collect")
   
   print("✅ Memory cache cleared")
   
   Rayfield:Notify({
      Title = "Memory Cleared",
      Content = "Memory cache cleared!",
      Duration = 3,
      Image = 4483362458,
   })
end

function RemoveUnusedAssets()
   print("\n🗑️ Removing unused assets...")
   local removed = 0
   
   for _, obj in pairs(Workspace:GetDescendants()) do
      pcall(function()
         if obj:IsA("Sound") and not obj.IsPlaying then
            obj:Destroy()
            removed = removed + 1
         end
      end)
   end
   
   print("✅ Removed " .. removed .. " unused assets")
end

function OptimizeWorkspace()
   print("\n⚙️ Optimizing workspace...")
   
   -- Optimize without disabling collisions
   for _, obj in pairs(Workspace:GetDescendants()) do
      pcall(function()
         if obj:IsA("BasePart") then
            -- Only optimize rendering, keep physics intact
            if obj.Transparency >= 0.98 then
               -- Keep CanCollide true for walkable surfaces
               -- Just optimize material
               if obj.Material ~= Enum.Material.Air then
                  obj.Material = Enum.Material.SmoothPlastic
               end
            end
         end
      end)
   end
   
   print("✅ Workspace optimized (collision preserved)")
   
   Rayfield:Notify({
      Title = "Workspace Optimized",
      Content = "Workspace optimized (floors still walkable)!",
      Duration = 3,
      Image = 4483362458,
   })
end

-- Animation Control
function DisableAnimations(enabled)
   if enabled then
      for _, player in pairs(Players:GetPlayers()) do
         pcall(function()
            if player.Character then
               for _, track in pairs(player.Character.Humanoid:GetPlayingAnimationTracks()) do
                  track:Stop()
               end
            end
         end)
      end
      print("✅ Animations disabled")
   end
end

-- Physics Optimization
function ReducePhysics(enabled)
   if enabled then
      settings().Physics.AllowSleep = true
      settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.DefaultAuto
      
      for _, obj in pairs(Workspace:GetDescendants()) do
         pcall(function()
            if obj:IsA("BasePart") then
               obj.Massless = true
            end
         end)
      end
      
      print("✅ Physics quality reduced")
   end
end

function ReducePhysicsSafe(enabled)
   if enabled then
      settings().Physics.AllowSleep = true
      settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.DefaultAuto
      
      for _, obj in pairs(Workspace:GetDescendants()) do
         pcall(function()
            if obj:IsA("BasePart") then
               -- Only set massless, don't touch CanCollide
               obj.Massless = true
               -- Keep CanCollide as is (usually true for floors/walls)
            end
         end)
      end
      
      print("✅ Physics quality reduced (collision preserved)")
   end
end

function FixPhysicsLag()
   for _, obj in pairs(Workspace:GetDescendants()) do
      pcall(function()
         if obj:IsA("BasePart") then
            obj.Massless = true
            obj.CanCollide = true
         end
      end)
   end
   
   Rayfield:Notify({
      Title = "Physics Fixed",
      Content = "Physics lag should be reduced!",
      Duration = 3,
      Image = 4483362458,
   })
end

-- Network Optimization
function OptimizeNetwork()
   settings().Network.IncomingReplicationLag = 0
   
   Rayfield:Notify({
      Title = "Network Optimized",
      Content = "Network traffic optimized!",
      Duration = 3,
      Image = 4483362458,
   })
end

function ReduceNetworkData(enabled)
   if enabled then
      settings().Network.IncomingReplicationLag = 0
      settings().Network.FreeMemoryMBytes = 1
   end
end

-- Terrain Optimization
function RemoveTerrainTextures(enabled)
   if enabled then
      pcall(function()
         Workspace.Terrain.Decoration = false
         Workspace.Terrain.WaterWaveSize = 0
         Workspace.Terrain.WaterWaveSpeed = 0
         Workspace.Terrain.WaterReflectance = 0
         Workspace.Terrain.WaterTransparency = 0
      end)
      print("✅ Terrain textures removed")
   end
end

-- Post Processing
function DisablePostProcessing(enabled)
   if enabled then
      for _, effect in pairs(Lighting:GetChildren()) do
         pcall(function()
            if effect:IsA("PostEffect") then
               effect.Enabled = false
            end
         end)
      end
      print("✅ Post-processing disabled")
   end
end

-- Extreme Optimizations
function DeleteUnnecessaryParts()
   local deleted = 0
   
   for _, obj in pairs(Workspace:GetDescendants()) do
      pcall(function()
         if obj:IsA("BasePart") then
            if obj.Transparency >= 0.98 or obj.Size.X < 0.5 then
               obj:Destroy()
               deleted = deleted + 1
            end
         end
      end)
   end
   
   Rayfield:Notify({
      Title = "Parts Deleted",
      Content = "Deleted " .. deleted .. " unnecessary parts!",
      Duration = 3,
      Image = 4483362458,
   })
end

function OptimizeAllCharacters()
   for _, player in pairs(Players:GetPlayers()) do
      pcall(function()
         if player.Character then
            for _, obj in pairs(player.Character:GetDescendants()) do
               if obj:IsA("Accessory") then
                  obj:Destroy()
               elseif obj:IsA("Shirt") or obj:IsA("Pants") then
                  obj:Destroy()
               end
            end
         end
      end)
   end
   
   Rayfield:Notify({
      Title = "Characters Optimized",
      Content = "All characters optimized!",
      Duration = 3,
      Image = 4483362458,
   })
end

function DestroyAllVisuals()
   ApplyPotatoMode()
   RemoveTextures()
   RemoveParticles()
   RemoveDecals()
   SimplifyMeshes()
   DeleteUnnecessaryParts()
end

function RestoreDefaults()
   Lighting.GlobalShadows = true
   Lighting.FogEnd = 500
   Lighting.Brightness = 1
   
   for _, effect in pairs(Lighting:GetChildren()) do
      pcall(function()
         if effect:IsA("PostEffect") then
            effect.Enabled = true
         end
      end)
   end
   
   settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
   
   Rayfield:Notify({
      Title = "Defaults Restored",
      Content = "Graphics restored to default!",
      Duration = 3,
      Image = 4483362458,
   })
end

-- Performance Stats
function ShowPerformanceStats()
   local stats = game:GetService("Stats")
   
   print("\n" .. string.rep("=", 70))
   print("PERFORMANCE STATISTICS")
   print(string.rep("=", 70))
   print("FPS: " .. math.floor(1 / RunService.RenderStepped:Wait()))
   print("Memory: " .. math.floor(stats:GetTotalMemoryUsageMb()) .. " MB")
   print("Ping: " .. math.floor(player:GetNetworkPing()) .. " ms")
   print(string.rep("=", 70) .. "\n")
   
   Rayfield:Notify({
      Title = "Performance Stats",
      Content = "Check console (F9) for details!",
      Duration = 3,
      Image = 4483362458,
   })
end

function ShowMemoryUsage()
   local stats = game:GetService("Stats")
   local memory = math.floor(stats:GetTotalMemoryUsageMb())
   
   print("\n📊 Memory Usage: " .. memory .. " MB")
   
   Rayfield:Notify({
      Title = "Memory Usage",
      Content = memory .. " MB currently used",
      Duration = 3,
      Image = 4483362458,
   })
end

-- FPS Counter
function ShowFPSCounter(enabled)
   if enabled then
      local ScreenGui = Instance.new("ScreenGui")
      ScreenGui.Name = "FPSCounter"
      ScreenGui.Parent = player.PlayerGui
      ScreenGui.ResetOnSpawn = false
      
      local Frame = Instance.new("Frame")
      Frame.Size = UDim2.new(0, 200, 0, 60)
      Frame.Position = UDim2.new(1, -210, 0, 10)
      Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
      Frame.BorderSizePixel = 0
      Frame.Parent = ScreenGui
      
      local UICorner = Instance.new("UICorner")
      UICorner.CornerRadius = UDim.new(0, 10)
      UICorner.Parent = Frame
      
      local FPSLabel = Instance.new("TextLabel")
      FPSLabel.Size = UDim2.new(1, 0, 1, 0)
      FPSLabel.BackgroundTransparency = 1
      FPSLabel.Text = "FPS: Calculating..."
      FPSLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
      FPSLabel.TextSize = 20
      FPSLabel.Font = Enum.Font.GothamBold
      FPSLabel.Parent = Frame
      
      -- FPS Update Loop
      task.spawn(function()
         while FPSLabel.Parent do
            local fps = math.floor(1 / RunService.RenderStepped:Wait())
            FPSLabel.Text = "FPS: " .. fps
            
            -- Color based on FPS
            if fps >= 60 then
               FPSLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
            elseif fps >= 30 then
               FPSLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
            else
               FPSLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
            end
            
            wait(0.5)
         end
      end)
   else
      if player.PlayerGui:FindFirstChild("FPSCounter") then
         player.PlayerGui.FPSCounter:Destroy()
      end
   end
end

-- ============================================
-- AUTO OPTIMIZATION LOOP
-- ============================================

-- Continuously remove new particles/effects
task.spawn(function()
   while wait(5) do
      if Settings.RemoveParticles then
         for _, obj in pairs(Workspace:GetDescendants()) do
            pcall(function()
               if obj:IsA("ParticleEmitter") or obj:IsA("Trail") then
                  obj:Destroy()
               end
            end)
         end
      end
   end
end)

-- Load Complete
Rayfield:Notify({
   Title = "FPS Optimizer Loaded!",
   Content = "Click 'Ultra FPS Boost' for maximum performance!",
   Duration = 5,
   Image = 4483362458,
})

print("\n✅ FPS OPTIMIZER & ANTI LAG LOADED!")
print("🚀 Click 'Ultra FPS Boost' for best results!")
print("🥔 Use 'Potato Mode' for maximum FPS on low-end PCs!")
print(string.rep("=", 70) .. "\n")
