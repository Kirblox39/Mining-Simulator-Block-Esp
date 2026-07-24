-- Надежный поиск папки Blocks для мобильных читов
shared.BlocksFolder = workspace:FindFirstChild("Blocks") or workspace:FindFirstChild("blocks")

if not shared.BlocksFolder then
    for _, child in ipairs(workspace:GetChildren()) do
        if child.Name:lower() == "blocks" then
            shared.BlocksFolder = child
            break
        end
    end
end

-- Если папка все еще загружается игрой, подождем ее секунду
if not shared.BlocksFolder then
    task.wait(1)
    shared.BlocksFolder = workspace:FindFirstChild("Blocks") or workspace:FindFirstChild("blocks")
end

-- Создаем внутреннюю короткую переменную для совместимости с остальным кодом
local blocksFolder = shared.BlocksFolder

local vim = game:GetService("VirtualInputManager")
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local camera = workspace.CurrentCamera

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BlockTrackerAutoFarmGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = game:GetService("CoreGui") or localPlayer:WaitForChild("PlayerGui")

-- Главная панель (расширена для кнопки авто-фарма)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 350, 0, 280)
mainFrame.Position = UDim2.new(0.1, 0, 0.3, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 10)

-- Панель сканера (Scanner Frame)
local scanFrame = Instance.new("Frame")
scanFrame.Size = UDim2.new(0, 220, 0, 280)
scanFrame.Position = UDim2.new(1, 10, 0, 0)
scanFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
scanFrame.BorderSizePixel = 0
scanFrame.Visible = false
scanFrame.Parent = mainFrame
Instance.new("UICorner", scanFrame).CornerRadius = UDim.new(0, 10)

-- Поиск внутри сканера
local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(1, -10, 0, 25)
searchBox.Position = UDim2.new(0, 5, 0, 5)
searchBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
searchBox.Text = ""
searchBox.PlaceholderText = "Search block..."
searchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
searchBox.TextSize = 13
searchBox.ClearTextOnFocus = false
searchBox.Parent = scanFrame
Instance.new("UICorner", searchBox).CornerRadius = UDim.new(0, 4)

-- Кнопка Обновить скан
local refreshScanBtn = Instance.new("TextButton")
refreshScanBtn.Size = UDim2.new(1, -10, 0, 25)
refreshScanBtn.Position = UDim2.new(0, 5, 0, 35)
refreshScanBtn.BackgroundColor3 = Color3.fromRGB(45, 75, 125)
refreshScanBtn.Text = "🔄 Refresh List"
refreshScanBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
refreshScanBtn.Font = Enum.Font.SourceSansBold
refreshScanBtn.TextSize = 13
refreshScanBtn.Parent = scanFrame
Instance.new("UICorner", refreshScanBtn).CornerRadius = UDim.new(0, 4)

local scanScroll = Instance.new("ScrollingFrame")
scanScroll.Size = UDim2.new(1, -10, 1, -75)
scanScroll.Position = UDim2.new(0, 5, 0, 65)
scanScroll.BackgroundTransparency = 1
scanScroll.BorderSizePixel = 0
scanScroll.ScrollBarThickness = 4
scanScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scanScroll.Parent = scanFrame

local scanListLayout = Instance.new("UIListLayout")
scanListLayout.Parent = scanScroll
scanListLayout.Padding = UDim.new(0, 3)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 0, 35)
title.Position = UDim2.new(0, 10, 0, 0)
title.Text = "Block Tracker & Auto-Mine"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextXAlignment = Enum.TextXAlignment.Left
title.BackgroundTransparency = 1
title.Font = Enum.Font.SourceSansBold
title.TextSize = 16
title.Parent = mainFrame

local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 30, 0, 30)
toggleBtn.Position = UDim2.new(1, -35, 0, 5)
toggleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
toggleBtn.Text = "−"
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.Font = Enum.Font.SourceSansBold
toggleBtn.TextSize = 18
toggleBtn.Parent = mainFrame
Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(0, 5)

local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, 0, 1, -35)
contentFrame.Position = UDim2.new(0, 0, 0, 35)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = mainFrame

local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(1, -10, 1, -85) -- Оставили место снизу для двух кнопок
scrollingFrame.Position = UDim2.new(0, 5, 0, 5)
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.BorderSizePixel = 0
scrollingFrame.ScrollBarThickness = 4
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollingFrame.Parent = contentFrame

local uiListLayout = Instance.new("UIListLayout")
uiListLayout.Parent = scrollingFrame
uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout.Padding = UDim.new(0, 5)

-- Кнопка "+ Add Block"
local addBtn = Instance.new("TextButton")
addBtn.Size = UDim2.new(0, 155, 0, 30)
addBtn.Position = UDim2.new(0, 10, 1, -75)
addBtn.BackgroundColor3 = Color3.fromRGB(45, 120, 45)
addBtn.Text = "+ Add Block"
addBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
addBtn.Font = Enum.Font.SourceSansBold
addBtn.TextSize = 14
addBtn.Parent = contentFrame
Instance.new("UICorner", addBtn).CornerRadius = UDim.new(0, 5)

-- Кнопка "🔍 Scan Blocks"
local scanToggleBtn = Instance.new("TextButton")
scanToggleBtn.Size = UDim2.new(0, 155, 0, 30)
scanToggleBtn.Position = UDim2.new(0, 175, 1, -75)
scanToggleBtn.BackgroundColor3 = Color3.fromRGB(45, 75, 125)
scanToggleBtn.Text = "🔍 Scan Blocks"
scanToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
scanToggleBtn.Font = Enum.Font.SourceSansBold
scanToggleBtn.TextSize = 14
scanToggleBtn.Parent = contentFrame
Instance.new("UICorner", scanToggleBtn).CornerRadius = UDim.new(0, 5)

-- Кнопка Переключения Авто-фарма (Toggle Auto-Mine)
local autoMineBtn = Instance.new("TextButton")
autoMineBtn.Size = UDim2.new(1, -20, 0, 35)
autoMineBtn.Position = UDim2.new(0, 10, 1, -40)
autoMineBtn.BackgroundColor3 = Color3.fromRGB(150, 40, 40) -- Красная по умолчанию (выключен)
autoMineBtn.Text = "Auto-Mine: OFF"
autoMineBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
autoMineBtn.Font = Enum.Font.SourceSansBold
autoMineBtn.TextSize = 15
autoMineBtn.Parent = contentFrame
Instance.new("UICorner", autoMineBtn).CornerRadius = UDim.new(0, 5)

-- Переменные логики
local trackedBlocks = {} 
local isAutoMining = false
local connection = nil
local createBlockRowGlobal = nil 
local runService = game:GetService("RunService")

-- Создаем скрытую локальную платформу, чтобы игрок никогда не падал в бездну
local antiFallPart = Instance.new("Part")
antiFallPart.Size = Vector3.new(5, 1, 5)
antiFallPart.Anchored = true
antiFallPart.Transparency = 1 -- Полностью невидимая
antiFallPart.Parent = workspace

-- Функция безопасной добычи без кликов по экрану
local function digBlock(blockModel)
    if not blockModel then return end
    local targetPart = blockModel:FindFirstChild("ColorPart") or blockModel:FindFirstChild("Part") or blockModel:FindFirstChildOfClass("BasePart")
    if not targetPart then return end
    
    local character = localPlayer.Character
    local rootPart = character and character:FindFirstChild("HumanoidRootPart")
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    
    if rootPart and humanoid then
        -- 1. Безопасно перемещаем платформу под ноги, а игрока над блоком
        antiFallPart.CFrame = targetPart.CFrame * CFrame.new(0, 3.5, 0)
        rootPart.CFrame = targetPart.CFrame * CFrame.new(0, 5, 0)
        rootPart.Velocity = Vector3.new(0, 0, 0) -- Обнуляем скорость падения
        
        -- 2. Экипируем кирку/инструмент из инвентаря, если она не в руках
        local tool = character:FindFirstChildOfClass("Tool")
        if not tool then
            local backpackTool = localPlayer.Backpack:FindFirstChildOfClass("Tool")
            if backpackTool then
                humanoid:EquipTool(backpackTool)
                tool = backpackTool
            end
        end
        
        -- 3. Копаем напрямую через активацию инструмента (ОБХОД КЛИКОВ ПО ЭКРАНУ!)
        if tool then
            -- Запускаем непрерывные удары, пока блок не исчезнет
            while blockModel and blockModel.Parent == blocksFolder and isAutoMining do
                tool:Activate() -- Активирует кирку напрямую в коде игры, не трогая экран и GUI
                task.wait(0.1)  -- Частота ударов кирки
                
                -- Удерживаем платформу под ногами во время копания
                antiFallPart.CFrame = targetPart.CFrame * CFrame.new(0, 3.5, 0)
            end
        end
    end
end

-- Функция умного спуска (копает строго под себя)
local function digStraightDown()
    local character = localPlayer.Character
    local rootPart = character and character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end
    
    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Include
    raycastParams.FilterDescendantsInstances = {blocksFolder}
    
    -- Стреляем лучом строго вниз из ног игрока
    local raycastResult = workspace:Raycast(rootPart.Position, Vector3.new(0, -6, 0), raycastParams)
    
    if raycastResult and raycastResult.Instance then
        local blockModel = raycastResult.Instance.Parent
        if blockModel and blockModel:IsA("Model") then
            digBlock(blockModel)
        end
    else
        -- Если под ногами временно пусто (блок удалился, а новый не заспавнился),
        -- удерживаем невидимую платформу под игроком, чтобы он не улетел вниз
        antiFallPart.CFrame = rootPart.CFrame * CFrame.new(0, -3.5, 0)
    end
end

-- Главный цикл авто-фарма с защитой от бесконечного спуска
task.spawn(function()
    while true do
        task.wait(0.1)
        if isAutoMining then
            local targetFound = nil
            
            -- 1. Ищем, есть ли нужный блок на карте
            for _, child in ipairs(blocksFolder:GetChildren()) do
                if child:IsA("Model") and trackedBlocks[child.Name:lower()] then
                    targetFound = child
                    break
                end
            end
            
            if targetFound then
                -- Если блок найден, летим и копаем его
                digBlock(targetFound)
            else
-- Функция безопасной добычи (зависание сбоку от блока)
local function digBlock(blockModel)
    if not blockModel then return end
    local targetPart = blockModel:FindFirstChild("ColorPart") or blockModel:FindFirstChild("Part") or blockModel:FindFirstChildOfClass("BasePart")
    if not targetPart then return end
    
    local character = localPlayer.Character
    local rootPart = character and character:FindFirstChild("HumanoidRootPart")
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    
    if rootPart and humanoid then
        -- 1. Полностью обездвиживаем игрока в воздухе (иммунитет к падению и флингам)
        rootPart.Anchored = true
        rootPart.Velocity = Vector3.new(0, 0, 0)
        
        -- 2. Телепортируем СБОКУ от блока (смещаем на 4 студа вбок по X и приподнимаем на 1 студ)
        -- Никакого застревания в текстурах! Позиция абсолютно чистая и свободная от блоков.
        rootPart.CFrame = targetPart.CFrame * CFrame.new(4, 1, 0)
        
        -- Экипируем кирку из инвентаря
        local tool = character:FindFirstChildOfClass("Tool")
        if not tool then
            local backpackTool = localPlayer.Backpack:FindFirstChildOfClass("Tool")
            if backpackTool then
                humanoid:EquipTool(backpackTool)
                tool = backpackTool
            end
        end
        
        -- 3. Безопасный авто-клик без участия экрана
        if tool then
            while blockModel and blockModel.Parent == blocksFolder and isAutoMining do
                -- На всякий случай жестко удерживаем позицию сбоку каждый цикл (защита от лагов античита)
                rootPart.CFrame = targetPart.CFrame * CFrame.new(4, 1, 0)
                
                tool:Activate() 
                task.wait(0.1) 
            end
        end
        
        -- Отпускаем заморозку, когда блок сломался
        rootPart.Anchored = false
    end
end

-- Функция умного спуска (копает любой блок строго под собой)
local function digStraightDown()
    local character = localPlayer.Character
    local rootPart = character and character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end
    
    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Include
    raycastParams.FilterDescendantsInstances = {blocksFolder}
    
    -- Стреляем лучиком вниз, чтобы найти преграду под ногами
    local raycastResult = workspace:Raycast(rootPart.Position, Vector3.new(0, -6, 0), raycastParams)
    
    if raycastResult and raycastResult.Instance then
        local blockModel = raycastResult.Instance.Parent
        if blockModel and blockModel:IsA("Model") then
            -- Снимаем анкер перед копанием вниз, чтобы плавно опускаться
            rootPart.Anchored = false
            digBlock(blockModel)
        end
    else
        -- Если под ногами пустота, временно держим игрока в воздухе, пока не спавнится блок
        rootPart.Anchored = true
        rootPart.Velocity = Vector3.new(0, 0, 0)
    end
end

-- Главный цикл авто-фарма
task.spawn(function()
    while true do
        task.wait(0.1)
        if isAutoMining then
            local targetFound = nil
            
            for _, child in ipairs(blocksFolder:GetChildren()) do
                if child:IsA("Model") and trackedBlocks[child.Name:lower()] then
                    targetFound = child
                    break
                end
            end
            
            if targetFound then
                digBlock(targetFound)
            else
                digStraightDown()
            end
        else
            -- Гарантируем, что если авто-фарм выключили, персонаж не останется забагованным в воздухе
            local character = localPlayer.Character
            local rootPart = character and character:FindFirstChild("HumanoidRootPart")
            if rootPart and rootPart.Anchored then
                rootPart.Anchored = false
            end
        end
    end
end)

local function clearOldESP()
    for _, child in ipairs(blocksFolder:GetChildren()) do
        local cp = child:FindFirstChild("ColorPart") or child:FindFirstChild("Part")
        if cp then
            local old = cp:FindFirstChild("UltimateBlockBillboard")
            if old then old:Destroy() end
        end
    end
end

local function createESP(child)
    if child:IsA("Model") then
        local data = trackedBlocks[child.Name:lower()]
        if data then
            local colorPart = child:WaitForChild("ColorPart", 3) or child:WaitForChild("Part", 1)
            if colorPart and not colorPart:FindFirstChild("UltimateBlockBillboard") then
                local billboard = Instance.new("BillboardGui")
                billboard.Name = "UltimateBlockBillboard"
                billboard.Size = UDim2.new(0, 14, 0, 14)
                billboard.AlwaysOnTop = true
                billboard.MaxDistance = math.huge
                
                local point = Instance.new("Frame")
                point.Size = UDim2.new(1, 0, 1, 0)
                point.BackgroundColor3 = data.color
                Instance.new("UICorner", point).CornerRadius = UDim.new(1, 0)
                point.Parent = billboard
                
                billboard.Parent = colorPart
            end
        end
    end
end

local function updateESP()
    if connection then connection:Disconnect() end
    clearOldESP()
    for _, child in ipairs(blocksFolder:GetChildren()) do createESP(child) end
    connection = blocksFolder.ChildAdded:Connect(createESP)
end

-- Логика сканера карты с поиском
local function refreshScanner()
    for _, child in ipairs(scanScroll:GetChildren()) do
        if child:IsA("Frame") then child:Destroy() end
    end
    
    local counts = {}
    local searchText = searchBox.Text:lower()
    
    for _, child in ipairs(blocksFolder:GetChildren()) do
        if child:IsA("Model") then
            if searchText == "" or string.find(child.Name:lower(), searchText) then
                counts[child.Name] = (counts[child.Name] or 0) + 1
            end
        end
    end
    
    for blockName, count in pairs(counts) do
        local itemFrame = Instance.new("Frame")
        itemFrame.Size = UDim2.new(1, -10, 0, 25)
        itemFrame.BackgroundTransparency = 1
        itemFrame.Parent = scanScroll
        
        local clickBtn = Instance.new("TextButton")
        clickBtn.Size = UDim2.new(1, 0, 1, 0)
        clickBtn.BackgroundTransparency = 0.9
        clickBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        clickBtn.Text = string.format(" %s: %d", blockName, count)
        clickBtn.TextColor3 = Color3.fromRGB(220, 220, 220)
        clickBtn.TextXAlignment = Enum.TextXAlignment.Left
        clickBtn.Font = Enum.Font.SourceSans
        clickBtn.TextSize = 14
        clickBtn.Parent = itemFrame
        Instance.new("UICorner", clickBtn).CornerRadius = UDim.new(0, 4)
        
        clickBtn.MouseButton1Click:Connect(function()
            if createBlockRowGlobal then
                createBlockRowGlobal(blockName, math.random(50,255), math.random(50,255), math.random(50,255))
            end
        end)
    end
    scanScroll.CanvasSize = UDim2.new(0, 0, 0, scanListLayout.AbsoluteContentSize.Y + 5)
end

refreshScanBtn.MouseButton1Click:Connect(refreshScanner)
searchBox:GetPropertyChangedSignal("Text"):Connect(refreshScanner)

scanToggleBtn.MouseButton1Click:Connect(function()
    scanFrame.Visible = not scanFrame.Visible
    if scanFrame.Visible then refreshScanner() end
end)

uiListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, uiListLayout.AbsoluteContentSize.Y + 10)
end)

local function createBlockRow(initialName, rVal, gVal, bVal)
    local rowFrame = Instance.new("Frame")
    rowFrame.Size = UDim2.new(1, -10, 0, 40)
    rowFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    rowFrame.Parent = scrollingFrame
    Instance.new("UICorner", rowFrame).CornerRadius = UDim.new(0, 5)

    local nameBox = Instance.new("TextBox")
    nameBox.Size = UDim2.new(0, 110, 0, 30)
    nameBox.Position = UDim2.new(0, 5, 0, 5)
    nameBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    nameBox.Text = initialName
    nameBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameBox.TextSize = 14
    nameBox.ClearTextOnFocus = false
    nameBox.Parent = rowFrame
    Instance.new("UICorner", nameBox).CornerRadius = UDim.new(0, 4)

    local function makeRGB(posX, val, plc)
        local box = Instance.new("TextBox")
        box.Size = UDim2.new(0, 35, 0, 30)
        box.Position = UDim2.new(0, posX, 0, 5)
        box.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        box.Text = tostring(val)
        box.TextColor3 = Color3.fromRGB(255, 255, 255)
        box.TextSize = 13
        box.ClearTextOnFocus = false
        box.PlaceholderText = plc
        box.Parent = rowFrame
        Instance.new("UICorner", box).CornerRadius = UDim.new(0, 4)
        return box
    end

    local rBox = makeRGB(120, rVal, "R")
    local gBox = makeRGB(160, gVal, "G")
    local bBox = makeRGB(200, bVal, "B")

    local colorIndicator = Instance.new("Frame")
    colorIndicator.Size = UDim2.new(0, 20, 0, 30)
    colorIndicator.Position = UDim2.new(0, 245, 0, 5)
    colorIndicator.BackgroundColor3 = Color3.fromRGB(rVal, gVal, bVal)
    colorIndicator.Parent = rowFrame
    Instance.new("UICorner", colorIndicator).CornerRadius = UDim.new(0, 4)

    local removeBtn = Instance.new("TextButton")
    removeBtn.Size = UDim2.new(0, 30, 0, 30)
    removeBtn.Position = UDim2.new(1, -35, 0, 5)
    removeBtn.BackgroundColor3 = Color3.fromRGB(120, 45, 45)
    removeBtn.Text = "X"
    removeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    removeBtn.Font = Enum.Font.SourceSansBold
    removeBtn.TextSize = 14
    removeBtn.Parent = rowFrame
    Instance.new("UICorner", removeBtn).CornerRadius = UDim.new(0, 4)

    local currentBlockKey = initialName:lower()
    
    local function applyRowSettings()
        if currentBlockKey and trackedBlocks[currentBlockKey] then trackedBlocks[currentBlockKey] = nil end
        local newName = nameBox.Text
        currentBlockKey = newName:lower()
        
        if newName ~= "" and newName ~= "Name..." then
            local r = math.clamp(tonumber(rBox.Text) or 0, 0, 255)
            local g = math.clamp(tonumber(gBox.Text) or 0, 0, 255)
            local b = math.clamp(tonumber(bBox.Text) or 0, 0, 255)
            rBox.Text, gBox.Text, bBox.Text = tostring(r), tostring(g), tostring(b)
            
            local finalColor = Color3.fromRGB(r, g, b)
            colorIndicator.BackgroundColor3 = finalColor
            trackedBlocks[currentBlockKey] = {color = finalColor, originalName = newName}
        end
        updateESP()
    end

    nameBox.FocusLost:Connect(applyRowSettings)
    rBox.FocusLost:Connect(applyRowSettings)
    gBox.FocusLost:Connect(applyRowSettings)
    bBox.FocusLost:Connect(applyRowSettings)

    removeBtn.MouseButton1Click:Connect(function()
        if currentBlockKey and trackedBlocks[currentBlockKey] then trackedBlocks[currentBlockKey] = nil end
        rowFrame:Destroy()
        updateESP()
    end)

    applyRowSettings()
end

createBlockRowGlobal = createBlockRow

addBtn.MouseButton1Click:Connect(function() createBlockRow("Name...", 255, 255, 255) end)

-- Логика переключения кнопки Auto-Mine
autoMineBtn.MouseButton1Click:Connect(function()
    isAutoMining = not isAutoMining
    if isAutoMining then
        autoMineBtn.BackgroundColor3 = Color3.fromRGB(45, 120, 45) -- Зеленая
        autoMineBtn.Text = "Auto-Mine: ON"
    else
        autoMineBtn.BackgroundColor3 = Color3.fromRGB(150, 40, 40) -- Красная
        autoMineBtn.Text = "Auto-Mine: OFF"
        -- Принудительно симулируем отжатие клика на всякий случай
        vim:SendMouseButtonEvent(0, 0, 0, false, game, 1)
    end
end)

local isMinimized = false
toggleBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    mainFrame.Size = isMinimized and UDim2.new(0, 350, 0, 40) or UDim2.new(0, 350, 0, 280)
    contentFrame.Visible = not isMinimized
    scanFrame.Visible = false
    toggleBtn.Text = isMinimized and "+" or "−"
end)
