local P_ = game:GetService("Players")
local T_ = game:GetService("TweenService")
local R_ = game:GetService("RunService")
local A_ = game:GetService("AvatarEditorService")
local localPlayer = P_.LocalPlayer
local anim_id = "rbxassetid://68433924"
local track_ = nil
local weight_ = Instance.new("NumberValue")
weight_.Value = 0
local h_conn = nil
local w_conn = nil
getgenv().ZuriFreeze = true

local function apply_effect(char)
    local hum = char:WaitForChild("Humanoid", 10)
    if not hum then return end
    if hum.RigType ~= Enum.HumanoidRigType.R6 then
        pcall(function() A_:PromptSaveAvatar(hum:GetAppliedDescription(), Enum.HumanoidRigType.R6) end)
        return
    end

    for _, v in pairs(hum:GetPlayingAnimationTracks()) do
        v:Stop(0)
        v:Destroy()
    end

    local a_ = Instance.new("Animation")
    a_.AnimationId = anim_id
    track_ = hum:LoadAnimation(a_)
    track_.Priority = Enum.AnimationPriority.Action4
    track_:Play(0, 0, 0)
    track_:AdjustSpeed(0)
    track_:AdjustWeight(0, 0)

    T_:Create(weight_, TweenInfo.new(1.8, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Value = 1}):Play()

    if w_conn then w_conn:Disconnect() end
    w_conn = weight_.Changed:Connect(function()
        if track_ and track_.Parent then
            pcall(function() track_:AdjustWeight(weight_.Value, 0.08) end)
        end
    end)

    if h_conn then h_conn:Disconnect() end
    h_conn = R_.Heartbeat:Connect(function()
        if not track_ or not track_.Parent or not getgenv().ZuriFreeze then return end
        track_:Play(0, 0, 0)
        track_:AdjustSpeed(0)
        track_:AdjustWeight(1, 0)
        for _, v in pairs(hum:GetPlayingAnimationTracks()) do
            if v ~= track_ and v.Priority.Value < Enum.AnimationPriority.Action4.Value then
                v:Stop(0)
            end
        end
    end)

    track_.Stopped:Connect(function()
        if getgenv().ZuriFreeze and char.Parent and track_ then
            task.defer(function()
                track_:Play(0, 0, 0)
                track_:AdjustSpeed(0)
                track_:AdjustWeight(1, 0)
            end)
        end
    end)
end

local function on_spawn(new_char)
    task.delay(2.2, function()
        if new_char and new_char.Parent then apply_effect(new_char) end
    end)
end

localPlayer.CharacterAdded:Connect(on_spawn)
if localPlayer.Character then
    task.spawn(function()
        task.wait(1.8)
        apply_effect(localPlayer.Character)
    end)
end

if not getgenv().ZuriNotified then
    getgenv().ZuriNotified = true
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Zuri Headless R6",
        Text = "Active. For best results, use a small head accessory.",
        Duration = 10,
        Icon = "rbxassetid://6031075931"
    })
end
