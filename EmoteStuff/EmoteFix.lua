--[All Open Source]
local TS = game:GetService("TweenService")
local RS = game:GetService("RunService")
local SG = game:GetService("StarterGui")
local CG = game:GetService("CoreGui")

local screen = Instance.new("ScreenGui")
screen.Name = "KhatarsizxUI"
screen.Parent = CG
screen.IgnoreGuiInset = true

local canvas = Instance.new("CanvasGroup")
canvas.Size = UDim2.new(1, 0, 1, 0)
canvas.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
canvas.BackgroundTransparency = 0.2
canvas.GroupTransparency = 1
canvas.Parent = screen

local mainTitle = Instance.new("TextLabel")
mainTitle.Size = UDim2.new(0, 500, 0, 60)
mainTitle.Position = UDim2.new(0.5, -250, 0.4, -30)
mainTitle.BackgroundTransparency = 1
mainTitle.Text = "KHATARSIZX"
mainTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
mainTitle.TextSize = 50
mainTitle.Font = Enum.Font.LuckiestGuy
mainTitle.Parent = canvas

local subTitle = Instance.new("TextLabel")
subTitle.Size = UDim2.new(0, 500, 0, 30)
subTitle.Position = UDim2.new(0.5, -250, 0.4, 30)
subTitle.BackgroundTransparency = 1
subTitle.Text = "ALL Emotes"
subTitle.TextColor3 = Color3.fromRGB(180, 180, 180)
subTitle.TextSize = 22
subTitle.Font = Enum.Font.GothamBold
subTitle.Parent = canvas

local loadLabel = Instance.new("TextLabel")
loadLabel.Size = UDim2.new(0, 500, 0, 30)
loadLabel.Position = UDim2.new(0.5, -250, 0.65, 0)
loadLabel.BackgroundTransparency = 1
loadLabel.Text = "Loading..."
loadLabel.TextColor3 = Color3.fromRGB(140, 140, 140)
loadLabel.TextSize = 16
loadLabel.Font = Enum.Font.Code
loadLabel.Parent = canvas

local barBack = Instance.new("Frame")
barBack.Size = UDim2.new(0, 280, 0, 6)
barBack.Position = UDim2.new(0.5, -140, 0.6, 0)
barBack.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
barBack.BorderSizePixel = 0
barBack.Parent = canvas

local barFill = Instance.new("Frame")
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
barFill.BorderSizePixel = 0
barFill.Parent = barBack

local gear = Instance.new("TextLabel")
gear.Size = UDim2.new(0, 60, 0, 60)
gear.Position = UDim2.new(1, -70, 1, -70)
gear.BackgroundTransparency = 1
gear.Text = "⚙️"
gear.TextSize = 45
gear.Parent = canvas

local lines = {
    "JERKING OFF", "I love femboys", "Nameless is gay???", "Asking for a update (pls update the Game)",
    "Loading Emotes", "Obtaining SFX", "using animations", "Bypassing protocols",
    "Fetching assets", "Injecting scripts", "Khatarsizx initialization", "Syncing server",
    "Optimizing data", "Loading UI", "Finalizing setup", "Applying patches",
    "Checking version", "Parsing emotes", "Connecting API", "Setting variables",
    "Refreshing cache", "Clearing memory", "Starting engine", "Verifying files",
    "Loading sounds", "Building wheel", "Reading database", "Globalizing",
    "Encrypting", "Done"
}

task.spawn(function()
    while canvas.Parent do
        gear.Rotation = gear.Rotation + 3
        task.wait()
    end
end)

TS:Create(canvas, TweenInfo.new(0.8), {GroupTransparency = 0}):Play()
task.wait(0.8)

local start = tick()
task.spawn(function()
    while tick() - start < 5 do
        loadLabel.Text = lines[math.random(1, #lines)]
        task.wait(math.random(7, 12) / 10)
    end
end)

TS:Create(barFill, TweenInfo.new(5, Enum.EasingStyle.Linear), {Size = UDim2.new(1, 0, 1, 0)}):Play()
task.wait(5)

TS:Create(canvas, TweenInfo.new(0.8), {GroupTransparency = 1}):Play()
task.wait(0.8)
screen:Destroy()

SG:SetCore("SendNotification", {
    Title = "All Emotes Loaded",
    Text = "Success! Everything is ready.",
    Duration = 4,
    Button1 = "ok"
})

task.wait(2)

local callback = Instance.new("BindableFunction")
callback.OnInvoke = function(button)
    if button == "ok" then
        setclipboard("https://discord.gg/invitacion")
    end
end

SG:SetCore("SendNotification", {
    Title = "Copy discord",
    Text = "Ts server is for reporting problems with emotes",
    Duration = 10,
    Callback = callback,
    Button1 = "ok",
    Button2 = "cancel"
})



--[Get all emotes]
local Var1 = game.Players.LocalPlayer
local Var2 = game:GetService("ReplicatedStorage")
local Var3 = require(Var2:WaitForChild("Emotes"))
local Var4 = require(Var2.Emotes:WaitForChild("VFX"))

local Var5 = Var3:Play(Var1.Character, nil, true, nil, true)

if Var5["BigSlash"] then
    Var5["World Cutting Slash"] = Var5["BigSlash"]
    Var5["BigSlash"] = nil
end

local Var6 = {}
for Var7, _ in pairs(Var5) do
    table.insert(Var6, Var7)
end
Var1:SetAttribute("Emotes", game:GetService("HttpService"):JSONEncode(Var6))

local Var8 = nil
local Var9 = false
local Var10 = {}

local function Var11()
    if not Var9 then return end
    Var9 = false
    
    local Var12 = Var1.Character
    local Var13 = Var12 and Var12:FindFirstChildOfClass("Humanoid")
    if Var13 then
        Var13.WalkSpeed = 16
        Var13.JumpPower = 50
    end
    if Var12 then Var12:SetAttribute("ForcedCFrame", nil) end
    
    for _, Var14 in pairs(Var10) do
        if typeof(Var14) == "Instance" and Var14.Parent then 
            Var14:Destroy() 
        elseif typeof(Var14) == "RBXScriptConnection" then
            Var14:Disconnect()
        end
    end
    Var10 = {}
    
    if Var8 then Var8:Stop() Var8:Destroy() Var8 = nil end
end

local function Var15(Var16)
    local Var17 = Var1.Character
    local Var18 = Var17 and Var17:FindFirstChildOfClass("Humanoid")
    if not Var18 then return end
    
    local Var19 = Var5[Var16]
    if not Var19 then return end

    Var11()
    Var9 = true
    Var18.WalkSpeed = 0
    Var18.JumpPower = 0

    local Var20 = {}
    local Var21 = {interrupted = false}
    local Var22 = Instance.new("Folder")

    local Var23 = Instance.new("Animation")
    Var23.AnimationId = "rbxassetid://" .. (Var19.Animation or "")
    Var8 = Var18:LoadAnimation(Var23)
    
    local Var24 = Var16:lower()
    Var8.Looped = Var19.Looped or Var24:find("idle") or Var24:find("loop") or Var24:find("pose") or Var24:find("rest") or false
    Var8:Play()
    
    task.spawn(function()
        while Var9 and task.wait() do
            if Var18.MoveDirection.Magnitude > 0 or Var17:GetAttribute("Dashing") or Var17:GetAttribute("Dash") then
                Var21.interrupted = true
                Var11()
                break
            end
        end
    end)

    if Var19.Startup then
        task.spawn(function()
            pcall(function() Var19.Startup(Var10, Var8, Var20, Var19, Var21, Var22) end)
        end)
    end
    
    task.spawn(function()
        pcall(function()
            local Var25 = Instance.new("Accessory", Var17)
            Var25.Name = "LocalVFX"
            table.insert(Var10, Var25)
            
            local Var26 = (Var16 == "World Cutting Slash" and "HugeSlash" or Var16)
            local Var27 = Var2.Emotes.VFX
            local Var28 = Var27:FindFirstChild("RealAssets") and Var27.RealAssets:FindFirstChild(Var26) 
                          or Var27:FindFirstChild("VfxMods") and Var27.VfxMods:FindFirstChild(Var26) 
                          or Var27
            
            Var4:MainFunction({
                Character = Var17,
                vfxName = Var26,
                SpecificModule = Var28,
                AnimSent = tonumber(Var19.Animation),
                RealBind = Var25,
                CanRotate = true,
                DirectData = Var19
            })
        end)
    end)

    if Var19.Keyframes then
        for Var29, Var30 in pairs(Var19.Keyframes) do
            local Var31 = Var8:GetMarkerReachedSignal(Var29):Connect(function()
                if Var9 and not Var21.interrupted then
                    task.spawn(function()
                        pcall(function() Var30(Var20, Var10, Var8, Var21) end)
                    end)
                end
            end)
            table.insert(Var10, Var31)
        end
    end

    if Var19.Sounds then
        for Var32, Var33 in pairs(Var19.Sounds) do
            task.delay(tonumber(Var32) or 0, function()
                if Var9 and not Var21.interrupted then
                    local Var34 = Instance.new("Sound")
                    Var34.SoundId = Var33.SoundId
                    Var34.Volume = Var33.Volume or 1
                    Var34.Looped = Var33.Looped or false
                    Var34.Parent = Var33.ParentTorso and Var17:FindFirstChild("Torso") or Var17.PrimaryPart
                    Var34:Play()
                    table.insert(Var10, Var34)
                    if not Var34.Looped then game.Debris:AddItem(Var34, Var34.TimeLength + 2) end
                end
            end)
        end
    end

    local Var35
    Var35 = Var8.Stopped:Connect(function()
        if Var9 and not Var8.Looped then Var11() end
    end)
    table.insert(Var10, Var35)
end

game:GetService("UserInputService").JumpRequest:Connect(function()
    if Var9 then Var11() end
end)

task.spawn(function()
    while task.wait(0.2) do
        local Var36 = Var1.PlayerGui:FindFirstChild("Emotes")
        if not Var36 then continue end
        local Var37 = Var36:FindFirstChild("ImageLabel")
        if not Var37 then continue end

        for Var38 = 1, 8 do
            local Var39 = Var37:FindFirstChild(tostring(Var38))
            local Var40 = Var39 and Var39:FindFirstChild("Button")
            
            if Var40 and not Var40:GetAttribute("HookedUp") then
                Var40:SetAttribute("HookedUp", true)
                Var40.InputBegan:Connect(function(Var41)
                    if Var41.UserInputType == Enum.UserInputType.MouseButton1 or Var41.UserInputType == Enum.UserInputType.Touch then
                        local Var42 = Var39:GetAttribute("Emote")
                        if Var42 then Var15(Var42) end
                    end
                end)
            end
        end
    end
end)

--[Divine Form]
local Var43 = game:GetService("Players").LocalPlayer
local Var44 = game:GetService("ReplicatedStorage")

local Var45 = {133094662049155, 134711731729986, 76963965406296, 92546791251633, 128188725134114, 109088632860488, 78339272602733, 127015697036075}
local Var46 = {72555434288985, 91067294642442, 104124534923268}
local Var47 = "116187503451999"

local function Var48()
    local Var49 = Var43.Character
    local Var50 = Var49 and Var49:FindFirstChild("HumanoidRootPart")
    if Var50 then
        local Var51 = Instance.new("Sound", Var50)
        Var51.SoundId = "rbxassetid://" .. Var46[math.random(1, #Var46)]
        Var51.Volume = 2
        Var51:Play()
        game.Debris:AddItem(Var51, 3)
    end
end

local function Var52(Var53)
    local Var54 = Var53:WaitForChild("Humanoid")
    local Var55 = Var53:GetAttribute("BlockReact") or 0
    local Var56 = 1

    local Var57 = Instance.new("Folder", Var53)
    Var57.Name = "AuraHolder"
    Var57:SetAttribute("DivineForm", true)
    
    local Var58 = Var44.Emotes.VFX.VfxMods.Evolved.vfx.Folder
    for _, Var59 in pairs(Var58:GetChildren()) do
        if Var59:IsA("BasePart") then
            local Var60 = Var53:FindFirstChild(Var59.Name)
            if Var60 then
                local Var61 = Var59:Clone()
                Var61.Transparency = 1
                Var61.Massless = true
                Var61.CanCollide = false
                Var61.Parent = Var57
                local Var62 = Instance.new("Weld", Var61)
                Var62.Part0 = Var60
                Var62.Part1 = Var61
                for _, Var63 in pairs(Var61:GetDescendants()) do
                    if Var63:IsA("ParticleEmitter") or Var63:IsA("Beam") then Var63.Enabled = true end
                end
            end
        end
    end

    local Var64 = Var53:GetAttributeChangedSignal("BlockReact"):Connect(function()
        local Var65 = math.abs(Var53:GetAttribute("BlockReact") or 0)
        if Var65 ~= Var55 then
            Var48()
            local Var66 = Instance.new("Animation")
            Var66.AnimationId = "rbxassetid://" .. Var45[Var56]
            local Var67 = Var54:LoadAnimation(Var66)
            Var67.Priority = Enum.AnimationPriority.Action
            Var67:Play(0.1)
            
            Var56 = Var56 + 1
            if Var56 > #Var45 then Var56 = 1 end
            Var55 = Var65
        end
    end)

    Var54.Died:Connect(function()
        if Var64 then Var64:Disconnect() end
        Var57:Destroy()
    end)
end

local function Var68(Var69)
    local Var70 = Var69:WaitForChild("Humanoid")
    local Var71 = false

    Var70.AnimationPlayed:Connect(function(Var72)
        local Var73 = tostring(Var72.Animation.AnimationId)
        if Var73:find(Var47) and not Var71 then
            Var71 = true
            
            local Var74 = Instance.new("Accessory", Var69)
            Var74.Name = "#EmoteHolder_Divine"
            Var74:SetAttribute("EmoteProperty", true)
            
            pcall(function()
                require(Var44.Emotes.VFX):MainFunction({
                    Character = Var69,
                    vfxName = "Divine Form",
                    SpecificModule = Var44.Emotes.VFX,
                    AnimSent = 116187503451999,
                    RealBind = Var74
                })
            end)

            task.delay(3, function()
                if Var70.Health > 0 then
                    Var52(Var69)
                end
            end)
        end
    end)
end

if Var43.Character then Var68(Var43.Character) end
Var43.CharacterAdded:Connect(Var68)

--[The fallen]
local Var75 = game:GetService("Players").LocalPlayer
local Var76 = game:GetService("ReplicatedStorage")
local Var77 = game:GetService("Workspace")

local Var78 = "133818134745501"
local Var79 = "Pride"
local Var80 = "rbxassetid://18463718356"
local Var81 = "rbxassetid://93369149563360"

local Var82 = false
local Var83 = 0
local Var84 = nil

local function Var85(Var86, Var87, Var88)
    if not Var86 then return end
    local Var89 = Instance.new("Part")
    Var89.Size = Vector3.new(1, 1, 1)
    Var89.Transparency = 1
    Var89.CanCollide = false
    Var89.Massless = true
    Var89.Parent = Var77
    
    local Var90 = Instance.new("ParticleEmitter")
    Var90.Texture = Var80
    Var90.Shape = Enum.ParticleEmitterShape.Disc
    Var90.Lifetime = NumberRange.new(0.04)
    Var90.Brightness = 30
    Var90.Rate = 500
    Var90.ZOffset = 3
    Var90.Size = NumberSequence.new(Var88, 0)
    Var90.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0), NumberSequenceKeypoint.new(0.8,0), NumberSequenceKeypoint.new(1,1)})
    Var90.Parent = Var89
    
    local Var91 = Instance.new("Weld")
    Var91.Part0 = Var86
    Var91.Part1 = Var89
    Var91.C0 = Var87
    Var91.Parent = Var89
    
    task.delay(0.2, function()
        Var90.Rate = 0
        task.wait(0.1)
        Var89:Destroy()
    end)
end

local function Var92()
    Var82 = false
    if Var84 then Var84:Disconnect() Var84 = nil end
    local Var93 = Var75.Character
    if Var93 then
        local Var94 = Var93:FindFirstChild("DismantleEffect")
        if Var94 then Var94:Destroy() end
    end
end

local function Var95(Var96)
    Var92()
    Var82 = true
    Var83 = tick()
    
    Var84 = Var96:GetAttributeChangedSignal("LastM1Hitted"):Connect(function()
        if not Var82 then return end
        local Var97 = Var96:GetAttribute("LastM1Hitted")
        if not Var97 or Var97 == "" then return end
        
        Var83 = tick()
        local Var98 = tostring(Var97):match("([^;]+)")
        local Var99 = Var77:FindFirstChild(Var98) or (Var77:FindFirstChild("Live") and Var77.Live:FindFirstChild(Var98))
        
        if Var99 and Var99:FindFirstChild("Humanoid") then
            local Var100 = Var99:FindFirstChild("HumanoidRootPart") or Var99:FindFirstChild("Torso") or Var99:FindFirstChild("UpperTorso")
            if Var100 then
                Var85(Var100, CFrame.new(0,0,0), 5)
                Var85(Var100, CFrame.new(-1.5, 1.5, 0), 3.5)
                Var85(Var100, CFrame.new(1.5, -1.5, 0), 2.5)
            end
        end
    end)

    task.spawn(function()
        local Var101 = tick()
        while Var82 do
            task.wait(0.5)
            local Var102 = tick()
            if (Var102 - Var101 >= 35) or (Var102 - Var83 >= 20) then
                Var92()
                break
            end
        end
    end)
end

local function Var103(Var104)
    local Var105 = Var104:WaitForChild("Humanoid")
    
    Var105.AnimationPlayed:Connect(function(Var106)
        if tostring(Var106.Animation.AnimationId):find(Var78) then
            
            local Var107 = Instance.new("Sound", Var104:FindFirstChild("Torso") or Var104.PrimaryPart)
            Var107.SoundId = Var81
            Var107.Volume = 2
            Var107:Play()
            game.Debris:AddItem(Var107, 5)

            local Var108 = Instance.new("Accessory", Var104)
            Var108.Name = "DismantleEffect"
            Var108:SetAttribute("EmoteEffect", true)
            
            pcall(function()
                require(Var76.Emotes.VFX):MainFunction({
                    Character = Var104,
                    vfxName = Var79,
                    SpecificModule = Var76.Emotes.VFX,
                    AnimSent = tonumber(Var78),
                    RealBind = Var108,
                    CanRotate = true
                })
            end)

            Var95(Var104)

            task.spawn(function()
                while Var106.IsPlaying do
                    if Var106.TimePosition >= Var106.Length - 0.1 then
                        Var106:AdjustSpeed(0)
                        Var106.TimePosition = Var106.Length - 0.01
                        break
                    end
                    task.wait()
                end
            end)

            local Var109
            Var109 = Var105.Running:Connect(function(Var110)
                if Var110 > 0.1 then
                    Var106:Stop(0.2)
                    Var109:Disconnect()
                end
            end)
        end
    end)
end

if Var75.Character then Var103(Var75.Character) end
Var75.CharacterAdded:Connect(Var103)

--[The strongest]
local Var111 = game:GetService("Players").LocalPlayer
local Var112 = game:GetService("ReplicatedStorage")

local Var113 = "86505219150915"
local Var114 = {
    [0] = {SoundId = "rbxassetid://117787451950766", Volume = 2},
    [0.01] = {SoundId = "rbxassetid://97998065677521", Volume = 1.85},
    [2.29] = {SoundId = "rbxassetid://99535007576182", Looped = true, Volume = 2}
}

local function Var115(Var116)
    if Var116:IsA("BasePart") then
        Var116.CanCollide = false
        Var116.CanTouch = false
        Var116.CanQuery = false
        Var116.Massless = true
        Var116.Anchored = false
    end
end

local function Var117(Var118)
    local Var119 = Var112.Emotes:FindFirstChild("TheStrongestEmote")
    if not Var119 then return end
    
    for _, Var120 in ipairs(Var119:GetChildren()) do
        local Var121 = Var118:FindFirstChild(Var120.Name)
        if Var121 and Var121:IsA("BasePart") then
            local Var122 = Instance.new("Folder")
            Var122.Name = "Strongest_" .. Var120.Name
            Var122.Parent = Var118
            
            for _, Var123 in ipairs(Var120:GetChildren()) do
                local Var124 = Var123:Clone()
                if Var124:IsA("BasePart") or Var124:IsA("Model") then
                    Var124.Parent = Var122
                    local Var125 = Var124:IsA("Model") and (Var124.PrimaryPart or Var124:FindFirstChildWhichIsA("BasePart")) or Var124
                    if Var125 then
                        local Var126 = Instance.new("Weld")
                        Var126.Part0 = Var121
                        Var126.Part1 = Var125
                        Var126.C0 = CFrame.new(0, 0, 0)
                        Var126.Parent = Var125
                        Var115(Var124)
                        for _, Var127 in ipairs(Var124:GetDescendants()) do 
                            Var115(Var127) 
                            if Var127:IsA("ParticleEmitter") then Var127.Enabled = true Var127:Emit(50) end
                        end
                    end
                elseif Var124:IsA("ParticleEmitter") or Var124:IsA("Attachment") then
                    Var124.Parent = Var121
                    if Var124:IsA("ParticleEmitter") then Var124.Enabled = true Var124:Emit(50) end
                end
            end
        end
    end
end

local function Var128(Var129)
    local Var130 = Var129:WaitForChild("Humanoid")
    
    Var130.AnimationPlayed:Connect(function(Var131)
        if tostring(Var131.Animation.AnimationId):find(Var113) then
            
            for Var132, Var133 in pairs(Var114) do
                task.delay(Var132, function()
                    local Var134 = Instance.new("Sound", workspace)
                    Var134.SoundId = Var133.SoundId
                    Var134.Volume = Var133.Volume
                    Var134.Looped = Var133.Looped or false
                    Var134:Play()
                    if not Var134.Looped then game.Debris:AddItem(Var134, 8) end
                end)
            end

            task.delay(0.1, function()
                local Var135 = Instance.new("Folder", Var129)
                Var135.Name = "PrideBind"
                Var135:SetAttribute("EmoteProperty", true)
                pcall(function()
                    require(Var112.Emotes.VFX):MainFunction({
                        Character = Var129,
                        vfxName = "Boss Raid",
                        SpecificModule = Var112.Emotes.VFX,
                        AnimSent = tonumber(Var113),
                        RealBind = Var135
                    })
                end)
            end)

            task.spawn(function()
                while Var131.IsPlaying do
                    if Var131.TimePosition >= Var131.Length - 0.1 then
                        Var131:AdjustSpeed(0)
                        Var131.TimePosition = Var131.Length - 0.01
                        break
                    end
                    task.wait()
                end
            end)

            local Var136
            Var136 = Var130.Running:Connect(function(Var137)
                if Var137 > 0.1 then
                    Var131:Stop(0.2)
                    Var117(Var129)
                    Var136:Disconnect()
                end
            end)
        end
    end)
end

if Var111.Character then Var128(Var111.Character) end
Var111.CharacterAdded:Connect(Var128)

--[Shadow Emerge]
local Var138 = game:GetService("Players").LocalPlayer
local Var139 = game:GetService("ReplicatedStorage")

local Var140 = "121032789756540"
local Var141 = Var139.Emotes.auraNew

local function Var142(Var143)
    for _, Var144 in pairs(Var141:GetChildren()) do
        local Var145 = Var143:FindFirstChild(Var144.Name)

        if Var145 and Var145:IsA("BasePart") then
            local Var146 = Instance.new("Folder")
            Var146.Name = "AuraEffect_" .. Var144.Name
            Var146.Parent = Var143
            
            for _, Var147 in pairs(Var144:GetChildren()) do
                local Var148 = Var147:Clone()
                
                if Var148:IsA("BasePart") or Var148:IsA("Model") then
                    Var148.Parent = Var146
                    local Var149 = Var148:IsA("Model") and (Var148.PrimaryPart or Var148:FindFirstChildWhichIsA("BasePart")) or Var148
                    
                    if Var149 then
                        local Var150 = Instance.new("Weld")
                        Var150.Part0 = Var145
                        Var150.Part1 = Var149
                        Var150.C0 = CFrame.new(0, 0, 0)
                        Var150.Parent = Var149
                        
                        local function Var151(Var152)
                            if Var152:IsA("BasePart") then
                                Var152.Anchored = false
                                Var152.CanCollide = false
                                Var152.Massless = true
                            elseif Var152:IsA("ParticleEmitter") then
                                Var152.Enabled = true
                            end
                        end
                        
                        Var151(Var148)
                        for _, Var153 in ipairs(Var148:GetDescendants()) do Var151(Var153) end
                    end
                    
                elseif Var148:IsA("ParticleEmitter") or Var148:IsA("Attachment") then
                    Var148.Parent = Var145
                    if Var148:IsA("ParticleEmitter") then Var148.Enabled = true end
                end
            end
        end
    end
end

local function Var154(Var155)
    local Var156 = Var155:WaitForChild("Humanoid")
    local Var157 = false

    Var156.AnimationPlayed:Connect(function(Var158)
        if tostring(Var158.Animation.AnimationId):find(Var140) and not Var157 then
            Var157 = true
            
            task.delay(3, function()
                if Var155 and Var156.Health > 0 then
                    Var142(Var155)
                end
            end)
        end
    end)
end

if Var138.Character then Var154(Var138.Character) end
Var138.CharacterAdded:Connect(Var154)

--[Amplify]
local Var159 = game:GetService("Players")
local Var160 = Var159.LocalPlayer
local Var161 = game:GetService("ReplicatedStorage")
local Var162 = game:GetService("Workspace")
local Var163 = game:GetService("Debris")

local Var164 = "106778226674700"
local Var165 = false
local Var166 = 0
local Var167 = nil

local Var168 = {
    [2] = {{id = "13064223399", volume = 2}},
    [3] = {{id = "13064223291", volume = 2}},
    [4] = {{id = "13064223483", volume = 2}},
    [5] = {{id = "13064223399", volume = 2}}
}

local function Var169(Var170, Var171)
    local Var172 = Instance.new("Sound")
    Var172.SoundId = "rbxassetid://" .. Var170
    Var172.Volume = Var171
    Var172.Parent = Var160:WaitForChild("PlayerGui")
    Var172:Play()
    Var163:AddItem(Var172, 2)
end

local function Var173(Var174)
    local Var175 = Var161.Resources.MeleeEffects.Amplify.Real:FindFirstChild("part")
    if not Var175 then return end

    local Var176 = Instance.new("Attachment", Var174)
    Var163:AddItem(Var176, 3)

    for _, Var177 in ipairs(Var175:GetChildren()) do
        if Var177:IsA("ParticleEmitter") or Var177:IsA("Attachment") then
            local Var178 = Var177:Clone()
            
            if Var178:IsA("Attachment") then
                Var178.Parent = Var174
                Var178.WorldCFrame = Var174.CFrame
                for _, Var179 in ipairs(Var178:GetDescendants()) do
                    if Var179:IsA("ParticleEmitter") then Var179:Emit(Var179:GetAttribute("EmitCount") or 50) end
                end
                Var163:AddItem(Var178, 3)
            else
                Var178.Parent = Var176
                Var178:Emit(Var178:GetAttribute("EmitCount") or 50)
            end
        elseif Var177:IsA("BasePart") or Var177:IsA("MeshPart") then
            if Var177.Transparency < 1 then
                local Var180 = Var177:Clone()
                Var180.Parent = Var162
                Var180.CFrame = Var174.CFrame
                Var180.Anchored = true
                Var180.CanCollide = false
                
                for _, Var181 in ipairs(Var180:GetDescendants()) do
                    if Var181:IsA("ParticleEmitter") then Var181:Emit(Var181:GetAttribute("EmitCount") or 50) end
                end
                Var163:AddItem(Var180, 1)
            end
        end
    end
end

local function Var182()
    Var165 = false
    if Var167 then Var167:Disconnect() Var167 = nil end
end

local function Var183(Var184)
    Var182()
    Var165 = true
    Var166 = tick()
    local Var185 = tick()

    Var167 = Var184:GetAttributeChangedSignal("LastM1Hitted"):Connect(function()
        if not Var165 then return end
        local Var186 = Var184:GetAttribute("LastM1Hitted")
        local Var187 = Var184:GetAttribute("Combo")
        
        if Var168[Var187] then
            for _, Var188 in ipairs(Var168[Var187]) do
                task.spawn(Var169, Var188.id, Var188.volume)
            end
        end

        local Var189 = Var186 and Var186:match("([^;]+)")
        local Var190 = Var162:FindFirstChild(Var189) or (Var162:FindFirstChild("Live") and Var162.Live:FindFirstChild(Var189))
        
        if Var190 then
            local Var191 = Var190:FindFirstChild("HumanoidRootPart") or Var190:FindFirstChild("Torso")
            if Var191 then
                Var166 = tick()
                Var173(Var191)
            end
        end
    end)

    task.spawn(function()
        while Var165 do
            task.wait(1)
            if tick() - Var185 >= 35 or tick() - Var166 >= 20 then
                Var182()
                break
            end
        end
    end)
end

local function Var192(Var193, Var194)
    local Var195 = Var161.Emotes:FindFirstChild("AmplifyVfx")
    if not Var195 then return end

    local function Var196(Var197, Var198)
        local Var199 = Var195[Var197]:Clone()
        Var199.Parent = Var198
        local Var200 = Var199:FindFirstChildOfClass("Motor6D")
        if Var200 then
            Var199.Anchored = false
            Var200.Part0 = Var198
            Var200.Part1 = Var199
        end
        for _, Var201 in pairs(Var199:GetDescendants()) do
            if Var201:IsA("ParticleEmitter") then
                Var201:Emit(Var201:GetAttribute("EmitCount") or 10)
                if Var200 then Var201.Enabled = true end
            end
        end
        Var163:AddItem(Var199, 5)
    end

    Var194:GetMarkerReachedSignal("first"):Connect(function()
        Var196("arm", Var193["Right Arm"])
        Var196("head", Var193.Head)
    end)

    Var194:GetMarkerReachedSignal("sec"):Connect(function()
        Var196("arm2", Var193["Left Arm"])
        Var196("auraoff", Var193["Left Arm"])
    end)
end

local function Var202(Var203)
    local Var204 = Var203:WaitForChild("Humanoid")
    Var204.AnimationPlayed:Connect(function(Var205)
        if tostring(Var205.Animation.AnimationId):find(Var164) then
            local Var206 = Instance.new("Sound", Var203.PrimaryPart)
            Var206.SoundId = "rbxassetid://112089323132965"
            Var206.Volume = 2
            Var206:Play()
            Var163:AddItem(Var206, 5)
            Var192(Var203, Var205)
            Var183(Var203)
        end
    end)
end

if Var160.Character then Var202(Var160.Character) end
Var160.CharacterAdded:Connect(Var202)

--[My brother]
local Var207 = game:GetService("Players").LocalPlayer
local Var208 = game:GetService("ReplicatedStorage")
local Var209 = Var208:WaitForChild("Replication")

local Var210 = "123464270068243"

local function Var211()
    local Var212, Var213 = pcall(function()
        return Var207:GetFriendsAsync(Var207.UserId)
    end)
    
    if Var212 then
        local Var214 = Var213:GetCurrentPage()
        if #Var214 > 0 then
            return Var214[math.random(1, #Var214)].Id
        end
    end
    return 261
end

local function Var215(Var216)
    local Var217 = Var216:WaitForChild("Humanoid")
    
    Var217.AnimationPlayed:Connect(function(Var218)
        if tostring(Var218.Animation.AnimationId):find(Var210) then
            
            local Var219 = Var211()

            task.delay(2.4, function()
                if getconnections then
                    for _, Var220 in pairs(getconnections(Var209.OnClientEvent)) do
                        if Var220.Function then
                            pcall(function()
                                Var220.Function({
                                    Effect = "Best Brother",
                                    char = Var216,
                                    Id = Var219
                                })
                            end)
                        end
                    end
                end
            end)
        end
    end)
end

if Var207.Character then Var215(Var207.Character) end
Var207.CharacterAdded:Connect(Var215)
