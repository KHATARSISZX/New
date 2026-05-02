local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local Lighting = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")
local Thrown = workspace:WaitForChild("Thrown")

local effectClasses = {
    ParticleEmitter = true,
    Trail = true,
    Fire = true,
    Smoke = true,
    Sparkles = true,
    Beam = true,
    Explosion = true,
}

local function removeEffects(part)
    if part then
        for _, descendant in ipairs(part:GetDescendants()) do
            if effectClasses[descendant.ClassName] then
                descendant:Destroy()
            end
        end
    end
end

task.spawn(function()
    while true do
        for _, player in ipairs(Players:GetPlayers()) do
            if player.Character then
                for _, child in ipairs(player.Character:GetChildren()) do
                    if child:IsA("BasePart") then
                        removeEffects(child)
                    end
                end
            end
        end

        local npc = workspace:FindFirstChild("Weakest Dummy")
        if npc then
            removeEffects(npc)
        end

        local terrain = workspace:FindFirstChild("Terrain")
        if terrain then
            for _, descendant in ipairs(terrain:GetDescendants()) do
                if descendant.Name == "SmokeBack" or descendant.Name == "Attachment" then
                    descendant:Destroy()
                end
            end
        end
        task.wait(1) 
    end
end)

RunService.Heartbeat:Connect(function()
    for _, obj in ipairs(Thrown:GetChildren()) do
        if not (obj:IsA("Model") and (obj.Name == "Aurora" or obj.Name == "Donation Leaderboard")) then
            obj:Destroy()
        end
    end
end)

Lighting.GlobalShadows = false
Lighting.FogEnd = 9e9
Lighting.Brightness = 1

for _, v in ipairs(Lighting:GetChildren()) do
    if v:IsA("Sky") or v:IsA("Atmosphere") or v:IsA("PostEffect") or v:IsA("SunRaysEffect") then
        v:Destroy()
    end
end

local function cleanPart(p)
    if p:IsA("BasePart") then
        p.Material = Enum.Material.SmoothPlastic
        p.Reflectance = 0
        p.CastShadow = false
    elseif p:IsA("Texture") or p:IsA("Decal") then
        p:Destroy()
    elseif p:IsA("ParticleEmitter") or p:IsA("Trail") then
        p.Enabled = false
    end
end

for _, p in ipairs(workspace:GetDescendants()) do
    cleanPart(p)
end

workspace.DescendantAdded:Connect(function(new)
    cleanPart(new)
end)

pcall(function()
    settings().Rendering.QualityLevel = 1
end)

local fflags = {
    FFlagReduceTextureMemory = "True",
    DFIntTexturePoolSize = "512",
    DFIntMobileTextureQuality = "1",
    DFIntTextureQualityOverride = "1",
    DFIntTextureCompressionLevel = "1",
    FIntDebugTextureManagerSkipMips = "10",
    FFlagDisablePostFx = "true",
    FFlagOptimizeMobileRendering = "True",
    FFlagOptimizeAvatarLoading = "True",
    FFlagEnableTerrainOptimizations = "True",
    FFlagRenderNoLowFrmBloom = "true",
    FFlagRenderFixFog = "True",
    FFlagGraphicsFixMsaaInGuiScene = "true",
    FFlagEnableBetterCulling = "True",
    FFlagEnableFasterRendering = "True",
    DFFlagDebugRenderForceTechnologyVoxel = "True",
    FIntRomarkStartWithGraphicQualityLevel = "1",
    DFIntDebugFRMQualityLevelOverride = "1",
    FFlagFixInputLag = "True",
    FFlagEnablePingOptimizations = "True",
    FFlagEnableAggressivePacketResends = "True",
    DFFlagClampIncomingReplicationLag = "true",
    DFIntS2PhysicsSenderRate = "15000",
    DFIntDataSenderRate = "38760",
    DFIntPhysicsSenderMaxBandwidthBps = "20000",
    DFIntReplicatorAnimationTrackLimitPerAnimator = "-1"
}

for name, val in pairs(fflags) do
    local cleanName = name:gsub("^(D?F%a+)", "")
    pcall(function()
        setfflag(cleanName, tostring(val))
    end)
end

if not _G.DisableNotification then
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "Scripters Library",
            Icon = "rbxassetid://123239118477029",
            Text = "More Fps, lower Ping",
            Duration = 5,
            Button1 = "Oke"
        })
    end)
end
