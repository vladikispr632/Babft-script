-- SADHUB | Build A Boat Ultimate & Premium (Real Gamepass Purchases)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local MarketplaceService = game:GetService("MarketplaceService")
local player = Players.LocalPlayer

local old = player.PlayerGui:FindFirstChild("SADHUB_Main")
if old then old:Destroy() end

-- ================= 1. СИСТЕМА КЛЮЧА =================
local validStandard = "Ask123"
local validPremium = "AskPremium123"

local keyGui = Instance.new("ScreenGui")
keyGui.Name = "SADHUB_Key"
keyGui.ResetOnSpawn = false
keyGui.IgnoreGuiInset = true
keyGui.DisplayOrder = 100
keyGui.Parent = player.PlayerGui

local keyFrame = Instance.new("Frame")
keyFrame.Size = UDim2.new(0, 320, 0, 180)
keyFrame.Position = UDim2.new(0.5, -160, 0.5, -90)
keyFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
keyFrame.Parent = keyGui
Instance.new("UICorner", keyFrame).CornerRadius = UDim.new(0, 10)

local keyTitle = Instance.new("TextLabel")
keyTitle.Size = UDim2.new(1, 0, 0, 40)
keyTitle.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
keyTitle.Text = "🔑 SADHUB KEY SYSTEM"
keyTitle.TextColor3 = Color3.fromRGB(240, 240, 250)
keyTitle.Font = Enum.Font.GothamBold
keyTitle.TextSize = 15
keyTitle.Parent = keyFrame
Instance.new("UICorner", keyTitle).CornerRadius = UDim.new(0, 10)

local keyInput = Instance.new("TextBox")
keyInput.Size = UDim2.new(1, -40, 0, 36)
keyInput.Position = UDim2.new(0, 20, 0, 55)
keyInput.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
keyInput.Font = Enum.Font.Gotham
keyInput.TextSize = 14
keyInput.PlaceholderText = "Ask123 (Standart) or AskPremium123 (Premium)"
keyInput.Text = ""
keyInput.Parent = keyFrame
Instance.new("UICorner", keyInput).CornerRadius = UDim.new(0, 6)

local keyBtn = Instance.new("TextButton")
keyBtn.Size = UDim2.new(1, -40, 0, 36)
keyBtn.Position = UDim2.new(0, 20, 0, 105)
keyBtn.BackgroundColor3 = Color3.fromRGB(120, 80, 200)
keyBtn.Text = "ПРОВЕРИТЬ КЛЮЧ"
keyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
keyBtn.Font = Enum.Font.GothamBold
keyBtn.TextSize = 14
keyBtn.Parent = keyFrame
Instance.new("UICorner", keyBtn).CornerRadius = UDim.new(0, 6)

local keyStatus = Instance.new("TextLabel")
keyStatus.Size = UDim2.new(1, -40, 0, 20)
keyStatus.Position = UDim2.new(0, 20, 1, -25)
keyStatus.BackgroundTransparency = 1
keyStatus.Text = ""
keyStatus.TextColor3 = Color3.fromRGB(255, 100, 100)
keyStatus.Font = Enum.Font.Gotham
keyStatus.TextSize = 12
keyStatus.Parent = keyFrame

keyBtn.MouseButton1Click:Connect(function()
    local text = keyInput.Text
    if text == validStandard then
        keyStatus.Text = "✅ Загрузка Standart..."
        keyStatus.TextColor3 = Color3.fromRGB(100, 255, 100)
        task.wait(1)
        keyGui:Destroy()
        loadMainUI(false)
    elseif text == validPremium then
        keyStatus.Text = "👑 Загрузка Premium..."
        keyStatus.TextColor3 = Color3.fromRGB(255, 215, 0)
        task.wait(1)
        keyGui:Destroy()
        loadMainUI(true)
    else
        keyStatus.Text = "❌ Неверный ключ!"
    end
end)

-- ================= 2. ОСНОВНОЙ ИНТЕРФЕЙС =================
function loadMainUI(isPremium)
    local gui = Instance.new("ScreenGui")
    gui.Name = "SADHUB_Main"
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true
    gui.DisplayOrder = 99
    gui.Parent = player.PlayerGui

    -- Цветовая палитра
    local bgColor = isPremium and Color3.fromRGB(15, 10, 25) or Color3.fromRGB(15, 15, 22)
    local accentColor = isPremium and Color3.fromRGB(180, 100, 255) or Color3.fromRGB(120, 80, 200)
    local strokeColor = isPremium and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(80, 80, 120)
    local titleText = isPremium and "👑 SADHUB PREMIUM" or "SADHUB | Ultimate"

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 0, 0, 0)
    mainFrame.Position = UDim2.new(0.5, -260, 0.5, -160)
    mainFrame.BackgroundColor3 = bgColor
    mainFrame.Active = true
    mainFrame.Draggable = true
    mainFrame.ClipsDescendants = true
    mainFrame.Parent = gui
    Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 12)

    local stroke = Instance.new("UIStroke")
    stroke.Color = strokeColor
    stroke.Thickness = isPremium and 2 or 1.5
    stroke.Parent = mainFrame

    TweenService:Create(mainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 520, 0, 340)
    }):Play()

    local titleBar = Instance.new("Frame")
    titleBar.Size = UDim2.new(1, 0, 0, 40)
    titleBar.BackgroundColor3 = isPremium and Color3.fromRGB(35, 15, 45) or Color3.fromRGB(25, 25, 35)
    titleBar.Parent = mainFrame

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -50, 1, 0)
    titleLabel.Position = UDim2.new(0, 15, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = titleText
    titleLabel.TextColor3 = isPremium and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(240, 240, 250)
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 16
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = titleBar

    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 30, 0, 30)
    closeBtn.Position = UDim2.new(1, -35, 0, 5)
    closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    closeBtn.Text = "X"
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.Parent = titleBar
    Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)

    closeBtn.MouseButton1Click:Connect(function()
        TweenService:Create(mainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 0, 0, 0)}):Play()
        task.wait(0.3)
        gui:Destroy()
    end)

    local sidebar = Instance.new("Frame")
    sidebar.Size = UDim2.new(0, 130, 1, -40)
    sidebar.Position = UDim2.new(0, 0, 0, 40)
    sidebar.BackgroundColor3 = isPremium and Color3.fromRGB(25, 10, 35) or Color3.fromRGB(20, 20, 28)
    sidebar.Parent = mainFrame

    local contentArea = Instance.new("Frame")
    contentArea.Size = UDim2.new(1, -130, 1, -40)
    contentArea.Position = UDim2.new(0, 130, 0, 40)
    contentArea.BackgroundTransparency = 1
    contentArea.Parent = mainFrame

    -- ===== ВСПОМОГАТЕЛЬНЫЕ ФУНКЦИИ =====
    local function createTab(text, yPos)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, 0, 0, 40)
        btn.Position = UDim2.new(0, 0, 0, yPos)
        btn.BackgroundTransparency = 1
        btn.Text = text
        btn.TextColor3 = Color3.fromRGB(150, 150, 160)
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 13
        btn.Parent = sidebar
        
        local page = Instance.new("ScrollingFrame")
        page.Size = UDim2.new(1, -10, 1, -10)
        page.Position = UDim2.new(0, 5, 0, 5)
        page.BackgroundTransparency = 1
        page.ScrollBarThickness = 3
        page.Visible = false
        page.Parent = contentArea
        
        local layout = Instance.new("UIListLayout")
        layout.Padding = UDim.new(0, 8)
        layout.Parent = page

        btn.MouseButton1Click:Connect(function()
            for _, child in ipairs(sidebar:GetChildren()) do
                if child:IsA("TextButton") then child.TextColor3 = Color3.fromRGB(150, 150, 160) end
            end
            for _, child in ipairs(contentArea:GetChildren()) do
                if child:IsA("ScrollingFrame") then child.Visible = false end
            end
            btn.TextColor3 = isPremium and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(255, 255, 255)
            page.Visible = true
        end)
        return page
    end

    local function createToggle(parent, name, defaultState, callback)
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 0, 36)
        frame.BackgroundColor3 = isPremium and Color3.fromRGB(40, 20, 50) or Color3.fromRGB(25, 25, 35)
        frame.Parent = parent
        Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 6)

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, -60, 1, 0)
        label.Position = UDim2.new(0, 10, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = name
        label.TextColor3 = Color3.fromRGB(220, 220, 230)
        label.Font = Enum.Font.Gotham
        label.TextSize = 13
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = frame

        local toggle = Instance.new("TextButton")
        toggle.Size = UDim2.new(0, 40, 0, 20)
        toggle.Position = UDim2.new(1, -50, 0.5, -10)
        toggle.BackgroundColor3 = defaultState and (isPremium and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(40, 150, 80)) or Color3.fromRGB(60, 60, 70)
        toggle.Text = ""
        toggle.Parent = frame
        Instance.new("UICorner", toggle).CornerRadius = UDim.new(0, 10)

        local circle = Instance.new("Frame")
        circle.Size = UDim2.new(0, 16, 0, 16)
        circle.Position = defaultState and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
        circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        circle.Parent = toggle
        Instance.new("UICorner", circle).CornerRadius = UDim.new(0, 8)

        local isToggled = defaultState
        toggle.MouseButton1Click:Connect(function()
            isToggled = not isToggled
            if isToggled then
                TweenService:Create(circle, TweenInfo.new(0.2), {Position = UDim2.new(1, -18, 0.5, -8)}):Play()
                TweenService:Create(toggle, TweenInfo.new(0.2), {BackgroundColor3 = isPremium and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(40, 150, 80)}):Play()
            else
                TweenService:Create(circle, TweenInfo.new(0.2), {Position = UDim2.new(0, 2, 0.5, -8)}):Play()
                TweenService:Create(toggle, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 60, 70)}):Play()
            end
            if callback then callback(isToggled) end
        end)
    end

    local function createButton(parent, name, callback, customColor)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, 0, 0, 36)
        btn.BackgroundColor3 = customColor or accentColor
        btn.Text = name
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 13
        btn.Parent = parent
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
        
        btn.MouseButton1Click:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.1), {Size = UDim2.new(0.95, 0, 0, 34)}):Play()
            task.wait(0.1)
            TweenService:Create(btn, TweenInfo.new(0.1), {Size = UDim2.new(1, 0, 0, 36)}):Play()
            if callback then callback() end
        end)
    end

    local function createInput(parent, name, defaultText, callback)
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 0, 36)
        frame.BackgroundColor3 = isPremium and Color3.fromRGB(40, 20, 50) or Color3.fromRGB(25, 25, 35)
        frame.Parent = parent
        Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 6)

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(0.5, 0, 1, 0)
        label.Position = UDim2.new(0, 10, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = name
        label.TextColor3 = Color3.fromRGB(220, 220, 230)
        label.Font = Enum.Font.Gotham
        label.TextSize = 13
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = frame

        local box = Instance.new("TextBox")
        box.Size = UDim2.new(0, 80, 0, 24)
        box.Position = UDim2.new(1, -90, 0.5, -12)
        box.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
        box.TextColor3 = Color3.fromRGB(255, 255, 255)
        box.Font = Enum.Font.Gotham
        box.TextSize = 13
        box.Text = defaultText
        box.Parent = frame
        Instance.new("UICorner", box).CornerRadius = UDim.new(0, 4)

        box.FocusLost:Connect(function()
            local num = tonumber(box.Text)
            if num and callback then callback(num) end
        end)
    end

    -- ===== ВКЛАДКИ =====
    local FarmPage = createTab("💰 Автофарм", 5)
    local FeaturePage = createTab(isPremium and "⚡ Premium" or "⚙ Features", 45)
    local ShopPage = isPremium and createTab("🛒 Gamepasses", 85) or nil

    sidebar:GetChildren()[1].TextColor3 = isPremium and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(255, 255, 255)
    FarmPage.Visible = true

    -- ================= 3. АВТОФАРМ С ТЕЛЕПОРТОМ К СУНДУКУ =================
    createButton(FarmPage, "▶ Автофарм + Сундук", function()
        local stages = {
            CFrame.new(-14.241774, 26.622606, 1364.338379),
            CFrame.new(3.665485, 31.618034, 2133.135986),
            CFrame.new(8.441872, 52.658176, 2902.652832),
            CFrame.new(-17.868896, 69.207741, 3679.890625),
            CFrame.new(-11.043743, 36.730087, 4445.333496),
            CFrame.new(10.835979, 46.826912, 5217.289551),
            CFrame.new(-40.286644, 39.011356, 5984.904297),
            CFrame.new(-40.286644, 39.011356, 5995.904297), -- Координаты сундука
        }
        task.spawn(function()
            for _, cf in ipairs(stages) do
                if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    player.Character.HumanoidRootPart.CFrame = cf
                end
                task.wait(2.2)
            end
        end)
    end, Color3.fromRGB(40, 150, 80))

    -- ================= 4. ФУНКЦИИ (STANDARD vs PREMIUM) =================
    if not isPremium then
        -- Стандартные 5 функций
        createInput(FeaturePage, "Скорость ходьбы", "16", function(val)
            if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
                player.Character.Humanoid.WalkSpeed = val
            end
        end)

        createInput(FeaturePage, "Сила прыжка", "50", function(val)
            if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
                player.Character.Humanoid.JumpPower = val
            end
        end)

        createToggle(FeaturePage, "🦘 Бесконечный прыжок", false, function(state) _G.InfJump = state end)
        createToggle(FeaturePage, "👻 Noclip", false, function(state) _G.Noclip = state end)
        createToggle(FeaturePage, "🛡 Anti-AFK", true, function(state) _G.AntiAFK = state end)
    else
        -- Премиум 5 функций
        local flyEnabled = false
        local flySpeed = 50
        local flyBV = nil

        createToggle(FeaturePage, "✈ Плавный полёт", false, function(state)
            flyEnabled = state
            if state then
                flyBV = Instance.new("BodyVelocity")
                flyBV.MaxForce = Vector3.new(1e5, 1e5, 1e5)
                flyBV.Velocity = Vector3.zero
                if player.Character then flyBV.Parent = player.Character.HumanoidRootPart end
            else
                if flyBV then flyBV:Destroy() flyBV = nil end
            end
        end)

        createInput(FeaturePage, "Скорость полёта", "50", function(val) flySpeed = val end)

        createButton(FeaturePage, "📦 Infinite Blocks", function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/TheRealAsu/BABFT/refs/heads/main/Loader.lua'))()
        end)

        createToggle(FeaturePage, "📡 ESP (Игроки)", false, function(state)
            for _, plr in ipairs(Players:GetPlayers()) do
                if plr ~= player and plr.Character then
                    local hl = plr.Character:FindFirstChild("SADHUB_ESP")
                    if state and not hl then
                        hl = Instance.new("Highlight")
                        hl.Name = "SADHUB_ESP"
                        hl.FillColor = Color3.fromRGB(255, 0, 0)
                        hl.Parent = plr.Character
                    elseif not state and hl then
                        hl:Destroy()
                    end
                end
            end
        end)

        createToggle(FeaturePage, "🌈 Радужная аура", false, function(state) _G.RainbowAura = state end)

        RunService.RenderStepped:Connect(function()
            local char = player.Character
            if not char or not char:FindFirstChild("HumanoidRootPart") then return end

            if flyEnabled and flyBV then
                local cam = workspace.CurrentCamera
                local moveDir = UserInputService:GetMoveVector()
                local targetVel = (cam.CFrame.LookVector * moveDir.Z + cam.CFrame.RightVector * moveDir.X) * flySpeed
                flyBV.Velocity = targetVel
            end

            if _G.RainbowAura then
                local hue = (tick() % 5) / 5
                for _, part in ipairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.Color = Color3.fromHSV(hue, 1, 1)
                    end
                end
            end
        end)
    end

    -- ================= 5. ПРЕМИУМ МАГАЗИН (РЕАЛЬНЫЕ ГЕЙМПАССЫ) =================
    if isPremium and ShopPage then
        local gpList = {
            {name = "💰 Gold Multiplier (x2)", price = 500},
            {name = "🦊 Fox Character", price = 250},
            {name = "🐧 Penguin Character", price = 250},
            {name = "🐔 Chicken Character", price = 250},
        }
        
        local selectedGP = gpList[1]

        local dropdown = Instance.new("TextButton")
        dropdown.Size = UDim2.new(1, 0, 0, 36)
        dropdown.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
        dropdown.Text = "Выбрать: " .. selectedGP.name .. " (" .. selectedGP.price .. " R$)"
        dropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
        dropdown.Font = Enum.Font.Gotham
        dropdown.Parent = ShopPage
        Instance.new("UICorner", dropdown).CornerRadius = UDim.new(0, 6)

        local currentIdx = 1
        dropdown.MouseButton1Click:Connect(function()
            currentIdx = currentIdx + 1
            if currentIdx > #gpList then currentIdx = 1 end
            selectedGP = gpList[currentIdx]
            dropdown.Text = "Выбрать: " .. selectedGP.name .. " (" .. selectedGP.price .. " R$)"
        end)

        createButton(ShopPage, "💸 ОТКРЫТЬ ОКНО ПОКУПКИ", function()
            -- Вызов официального окна покупки геймпасса Roblox
            pcall(function()
                MarketplaceService:PromptGamePassPurchase(player, selectedGP.price)
            end)
        end, Color3.fromRGB(200, 100, 255))

        local hint = Instance.new("TextLabel")
        hint.Size = UDim2.new(1, 0, 0, 40)
        hint.BackgroundTransparency = 1
        hint.Text = "⚠️ Откроется системное окно Roblox. Покупка за настоящие Robux."
        hint.TextColor3 = Color3.fromRGB(180, 180, 190)
        hint.Font = Enum.Font.Gotham
        hint.TextSize = 11
        hint.TextWrapped = true
        hint.Parent = ShopPage
    end

    -- ================= 6. ОБЩИЕ ЦИКЛЫ (Noclip, Anti-AFK, InfJump) =================
    RunService.RenderStepped:Connect(function()
        if _G.Noclip and player.Character then
            for _, part in ipairs(player.Character:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
        end
        
        if _G.AntiAFK then
            local vu = game:GetService("VirtualUser")
            player.Idled:Connect(function()
                vu:CaptureController()
                vu:ClickButton2(Vector2.new())
            end)
            _G.AntiAFK = false
        end
    end)

    UserInputService.JumpRequest:Connect(function()
        if _G.InfJump and player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
            player.Character.Humanoid:ChangeState("Jumping")
        end
    end)
end
