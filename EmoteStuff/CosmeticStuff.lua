local Var1 = game.Players.LocalPlayer
local Var2 = require(game.ReplicatedStorage.Info)

local Var3 = Var1.PlayerGui:FindFirstChild("Cosmetics", true)
if Var3 then
    Var3 = Var3:FindFirstChild("Frame")
end

if not Var3 then 
    return 
end

local Var4 = Var3:WaitForChild("AccessoriesSF")
local Var5 = Var3:WaitForChild("AurasSF")
local Var6 = Var4:WaitForChild("Frame")
local Var7 = Var3:WaitForChild("TitlesSF"):WaitForChild("Frame")

Var7.Parent = script
Var6.Parent = script

Var1:WaitForChild("LoadedData")
task.wait()
Var1:WaitForChild("GamepassesLoaded", 5)

if not Var1:GetAttribute("AllowedTitles") then
    local Var_t = tick()
    repeat
        task.wait()
    until tick() - Var_t > 5 or Var1:GetAttribute("AllowedTitles")
end

local Var8 = Var2.CosmeticProducts

function shared.cosgui()
    local Var_u = Var3.Parent
    if not Var_u.Enabled then
        local Var_g = Var1.PlayerGui:GetChildren()
        Var1.Character.Communicate:FireServer({
            Goal = "Delete Guis",
            guis = Var_g,
            caller = Var3
        })
        for _, v in pairs(Var_g) do
            if v.Name == "Cape Customization" or v.Name == "Awakening Outfit" or v.Name == "Kill Sound" then
                game:GetService("Debris"):AddItem(v, 0)
            end
            if (v.Name == "Emotes" or v.Name == "Gifting") and v ~= Var3.Parent then
                local Var_n = v:FindFirstChild("ImageLabel") or v:FindFirstChild("Frame")
                if Var_n then
                    Var_n.Visible = true
                    Var_n.Visible = false
                end
            end
        end
    end
    Var_u.Enabled = not Var_u.Enabled
end

local Var9 = table.clone(Var2.Cosmetics)
local Var10 = {}

local function Var_setup(Var_n, Var_d)
    local Var_s = "<font color=\"rgb(%s, %s, %s)\">%s</font>"
    game:GetService("TweenService"):Create(Var_n.ImageLabel, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        ImageColor3 = Color3.new(1, 1, 1)
    }):Play()

    local Var_st = string.format(Var_s, 143, 204, 140, "%s")

    if Var1.Character and Var1.Character:GetAttribute("WC_" .. string.gsub(Var_d[1], " ", "")) then
        game:GetService("TweenService"):Create(Var_n.ImageLabel, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
            ImageColor3 = Color3.new(1, 1, 1)
        }):Play()
    else
        game:GetService("TweenService"):Create(Var_n.ImageLabel, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
            ImageColor3 = Color3.new(0.35, 0.35, 0.35)
        }):Play()
    end

    Var_n.ImageLabel.Image = Var_d[3] or "rbxassetid://16523852699"
    Var_n.Info.Info.Text = string.format(Var_st, "UNLOCKED")
end

for _, v in pairs(Var9) do
    local Var_c = Var6:Clone()
    table.insert(Var10, { Var_c, v })
    Var_setup(Var_c, v)
    Var_c.Info.Text = string.format("<font size=\"30\">%s</font>", v[1])

    Var_c.ImageButton.MouseButton1Click:Connect(function()
        if Var1.Character and Var1.Character:FindFirstChild("Communicate") then
            shared.sfx({SoundId = "rbxassetid://6895079853", Volume = 0.5, Parent = workspace}):Play()
            Var1.Character.Communicate:FireServer({
                Goal = "Wear Cosmetic",
                cosmetic = v[1]
            })
        end
    end)
    Var_c.Parent = v[4] == "cosmetic" and Var4 or Var5
end

local function Var_ref()
    for _, v in pairs(Var10) do Var_setup(v[1], v[2]) end
end

Var1:GetAttributeChangedSignal("TotalKillsFrb"):Connect(Var_ref)
Var1:GetAttributeChangedSignal("Update"):Connect(Var_ref)
Var1:GetAttributeChangedSignal("HandlerLoaded"):Connect(Var_ref)
Var1:GetAttributeChangedSignal("CosmeticGamepass"):Connect(Var_ref)

for _, v in pairs(Var3:GetChildren()) do
    if v:IsA("ScrollingFrame") then
        local Var_l = v:FindFirstChildOfClass("UIGridLayout") or v:FindFirstChildOfClass("UIListLayout")
        v.CanvasSize = UDim2.new(0, 0, 0, Var_l.AbsoluteContentSize.Y)
        Var_l:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            v.CanvasSize = UDim2.new(0, 0, 0, Var_l.AbsoluteContentSize.Y)
        end)
    end
    if v:IsA("TextButton") then
        v.MouseButton1Click:Connect(function()
            local Var_sub = string.sub(v.Text, 2, #v.Text):lower()
            local Var_trg = Var3:FindFirstChild(string.sub(v.Text, 1, 1):upper() .. Var_sub .. "SF")
            for _, o in pairs(Var3:GetChildren()) do
                if o:IsA("ScrollingFrame") and o ~= Var_trg then o.Visible = false end
            end
            if Var_trg and not Var_trg.Visible then
                Var_trg.Visible = true
                shared.sfx({SoundId = "rbxassetid://15675032796", Volume = 0.5, Parent = workspace}):Play()
            end
        end)
    end
end

local function Var_tit()
    local Var_ts = Var3:FindFirstChild("TitlesSF")
    if not Var_ts then return end
    for _, e in pairs(Var_ts:GetChildren()) do
        if not (e:IsA("UIGridLayout") or e:IsA("UIListLayout")) then e:Destroy() end
    end
    for _, p in pairs(Var8) do if p.button then p.button.Visible = true end end

    local Var_un = {}
    if Var2.TitleDescriptions then
        for n, _ in pairs(Var2.TitleDescriptions) do Var_un[n] = true end
    end

    for n, _ in pairs(Var_un) do
        local Var_nt = Var7:Clone()
        Var_nt.UIGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(125, 255, 129))})
        Var_nt.Title.Text = n
        Var_nt.Description.Text = Var2.TitleDescriptions[n] or "Special Title"
        Var_nt.Parent = Var_ts

        Var_nt.Button.MouseButton1Click:Connect(function()
            shared.sfx({SoundId = "rbxassetid://552900451", Volume = 0.5, Parent = workspace}):Play()
            local Var_curr = game:GetService("HttpService"):JSONDecode(Var1:GetAttribute("AllowedTitles") or "{}")
            Var_curr[n] = not Var_curr[n]
            
            local Var_pld = {}
            for k, st in pairs(Var_curr) do if st then Var_pld[k] = true end end
            
            Var1.Character.Communicate:FireServer({Goal = "Update Titles", Title = game:GetService("HttpService"):JSONEncode(Var_pld)})
        end)
    end
end

Var1:GetAttributeChangedSignal("StoredTitles"):Connect(Var_tit)
Var_tit()

local Var_blk = Var3:FindFirstChild("Bulk") or Var3.Parent:FindFirstChild("Bulk")
if Var_blk then
    local Var_btn = Var_blk.ImageButton
    Var_btn.Name = "GP"
    Var_btn.Parent = script
    for _, p in pairs(Var8) do
        local Var_inf = game:GetService("MarketplaceService"):GetProductInfo(p.id, Enum.InfoType.Product)
        local Var_nb = Var_btn:Clone()
        Var_nb.Visible = false
        Var_nb.Parent = Var_blk
        Var_nb.Spin.Text = string.format("<font size=\"45\">%s SPINS</font>\n<font size=\"35\">%s ROBUX</font>", p.count, Var_inf.PriceInRobux)
        Var_nb.MouseButton1Click:Connect(function()
            Var1.Character.Communicate:FireServer({Goal = "Prompt Cosmetic", Id = p.id})
        end)
        p.button = Var_nb
    end
end
