-- 1. ГЛОБАЛЬНЫЙ И БЕЗОПАСНЫЙ ПОИСК ПАПКИ С БЛОКАМИ
shared.BlocksFolder = workspace:FindFirstChild("Blocks") or workspace:FindFirstChild("blocks")
if not shared.BlocksFolder then
    for _, child in ipairs(workspace:GetChildren()) do
        if child.Name:lower() == "blocks" then
            shared.BlocksFolder = child
            break
        end
    end
end
if not shared.BlocksFolder then
    task.wait(1)
    shared.BlocksFolder = workspace:FindFirstChild("Blocks") or workspace:FindFirstChild("blocks")
end

local blocksFolder = shared.BlocksFolder
local vim = game:GetService("VirtualInputManager")
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local camera = workspace.CurrentCamera

-- 2. ТАБЛИЦА МИРОВ, СЛОЕВ И ДИАПАЗОНОВ СПАВНА РУД
local worldData = {
    ["Home World"] = {
        startHeight = 50, -- Начальная высота поверхности мира (в студах)
        layerSize = 6,    -- Высота одного слоя/блока (в студах)
        maxLayer = 12,    -- Максимальная глубина шахты в этом мире
        ores = {
            ["fossils"] = {min = 2, max = 12},
            ["dinosaur bones"] = {min = 2, max = 12},
            ["coal"] = {min = 3, max = 12},
            ["copper"] = {min = 3, max = 12},
            ["silver"] = {min = 4, max = 12},
            ["quartz"] = {min = 4, max = 12},
            ["skeleton stone"] = {min = 4, max = 12},
            ["gold"] = {min = 5, max = 12},
            ["pezzottaite"] = {min = 5, max = 12},
            ["obsidian"] = {min = 6, max = 12},
            ["emerald"] = {min = 6, max = 12},
            ["ruby"] = {min = 6, max = 12},
            ["lavastone"] = {min = 6, max = 12},
            ["sapphire"] = {min = 6, max = 12},
            ["glowstone"] = {min = 6, max = 12},
            ["uranium"] = {min = 6, max = 12},
            ["platinum"] = {min = 6, max = 12},
            ["lapis"] = {min = 6, max = 12},
            ["krixanium"] = {min = 6, max = 12},
            ["red rock"] = {min = 6, max = 12},
            ["dravite"] = {min = 6, max = 12},
            ["diamond"] = {min = 7, max = 12},
            ["unobtainium"] = {min = 7, max = 12},
            ["mythic stone"] = {min = 7, max = 12},
            ["legendary stone"] = {min = 7, max = 12},
            ["breadstone"] = {min = 8, max = 12},
            ["shadow stone"] = {min = 9, max = 12},
            ["illuminite"] = {min = 9, max = 12},
            ["rainbowite"] = {min = 9, max = 12},
            ["wooden chest"] = {min = 1, max = 12},
            ["silver chest"] = {min = 3, max = 12},
            ["golden chest"] = {min = 4, max = 12},
            ["magical chest"] = {min = 5, max = 12},
            ["mythical chest"] = {min = 5, max = 12},
            ["unobtainable chest"] = {min = 6, max = 12},
            ["shadow chest"] = {min = 6, max = 12},
            ["light chest"] = {min = 9, max = 12},
            ["token chest"] = {min = 10, max = 12}
        }
    },
    ["Toy Land"] = {
        startHeight = 40,
        layerSize = 6,
        maxLayer = 8,
        ores = {
            ["plastic"] = {min = 1, max = 6},
            ["toy"] = {min = 1, max = 6},
            ["teddybear"] = {min = 1, max = 6},
            ["block chest"] = {min = 1, max = 6}
        }
    }
    -- Сюда мы добавим остальные 9 миров по такой же схеме!
}

-- 3. СОЗДАНИЕ ГЛАВНОГО ИНТЕРФЕЙСА (GUI)
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "UltimateMiningHub"
screenGui.ResetOnSpawn = false
screenGui.Parent = game:GetService("CoreGui") or localPlayer:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 350, 0, 280)
mainFrame.Position = UDim2.new(0.1, 0, 0.3, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 10)

local scanFrame = Instance.new("Frame")
scanFrame.Size = UDim2.new(0, 220, 0, 280)
scanFrame.Position = UDim2.new(1, 10, 0, 0)
scanFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
scanFrame.BorderSizePixel = 0
scanFrame.Visible = false
scanFrame.Parent = mainFrame
Instance.new("UICorner", scanFrame).CornerRadius = UDim.new(0, 10)

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
title.Text = "Pro Mining Simulator HUB"
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
scrollingFrame.Size = UDim2.new(1, -10, 1, -85)
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

local autoMineBtn = Instance.new("TextButton")
autoMineBtn.Size = UDim2.new(1, -20, 0, 35)
autoMineBtn.Position = UDim2.new(0, 10, 1, -40)
autoMineBtn.BackgroundColor3 = Color3.fromRGB(150, 40, 40)
autoMineBtn.Text = "Auto-Mine: OFF"
autoMineBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
autoMineBtn.Font = Enum.Font.SourceSansBold
autoMineBtn.TextSize = 15
autoMineBtn.Parent = contentFrame
Instance.new("UICorner", autoMineBtn).CornerRadius = UDim.new(0, 5)

local trackedBlocks = {} 
local isAutoMining = false
local connection = nil
local createBlockRowGlobal = nil 

-- Функция автоматического определения текущей зоны игрока
local function getCurrentWorld()
    -- Проверяем популярные папки локаций в симуляторах копания
    local currentZone = "Home World" -- По умолчанию
    
    -- Проверка через атрибуты игрока или папки в Workspace
    if workspace:FindFirstChild("Worlds") then
        for _, world in ipairs(workspace.Worlds:GetChildren()) do
            -- Если находим плеер внутри папки зоны или зона активна
            if world:FindFirstChild(localPlayer.Name) or world:GetAttribute("Active") == true then
                currentZone = world.Name
            end
        end
    elseif localPlayer:FindFirstChild("Leaderstats") and localPlayer.Leaderstats:FindFirstChild("World") then
        currentZone = localPlayer.Leaderstats.World.Value
    elseif workspace:FindFirstChild("CurrentWorld") then
        currentZone = workspace.CurrentWorld.Value
    end
    
    return currentZone
end

-- Функция безопасной добычи (зависание сбоку от блока)
local function digBlock(blockModel)
    if not blockModel then return end
    local targetPart = blockModel:FindFirstChild("ColorPart") or blockModel:FindFirstChild("Part") or blockModel:FindFirstChildOfClass("BasePart")
    if not targetPart then return end
    
    local character = localPlayer.Character
    local rootPart = character and character:FindFirstChild("HumanoidRootPart")
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    
    if rootPart and humanoid then
        rootPart.Anchored = true
        rootPart.Velocity = Vector3.new(0, 0, 0)
        
        -- Смещаемся на 4 студа сбоку, чтобы не застревать внутри текстуры руды
        rootPart.CFrame = targetPart.CFrame * CFrame.new(4, 1, 0)
        
        local tool = character:FindFirstChildOfClass("Tool")
        if not tool then
            local backpackTool = localPlayer.Backpack:FindFirstChildOfClass("Tool")
            if backpackTool then
                humanoid:EquipTool(backpackTool)
                tool = backpackTool
            end
        end
        
        if tool then
            while blockModel and blockModel.Parent == blocksFolder and isAutoMining do
                rootPart.CFrame = targetPart.CFrame * CFrame.new(4, 1, 0)
                tool:Activate() 
                task.wait(0.1) 
            end
        end
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
    
    local raycastResult = workspace:Raycast(rootPart.Position, Vector3.new(0, -6, 0), raycastParams)
    
    if raycastResult and raycastResult.Instance then
        local blockModel = raycastResult.Instance.Parent
        if blockModel and blockModel:IsA("Model") then
            rootPart.Anchored = false
            digBlock(blockModel)
        end
    else
        rootPart.Anchored = true
        rootPart.Velocity = Vector3.new(0, 0, 0)
    end
end

-- Главный цикл авто-фарма с проверкой миров и зон
task.spawn(function()
    while true do
        task.wait(0.1)
        if isAutoMining then
            local currentWorld = getCurrentWorld()
            local currentWorldConfig = worldData[currentWorld]
            
            -- Проверяем, есть ли конфигурация для текущего мира
            if currentWorldConfig then
                local targetFound = nil
                local targetOreName = ""
                
                -- Ищем, какой блок из списка отслеживания сейчас выбран игроком
                for lowerName, _ in pairs(trackedBlocks) do
                    targetOreName = lowerName
                    break
                end
                
                if targetOreName == "" then
                    -- Если список пуст, выключаем фарм
                    isAutoMining = false
                    autoMineBtn.BackgroundColor3 = Color3.fromRGB(150, 40, 40)
                    autoMineBtn.Text = "Auto-Mine: OFF (List Empty)"
                    continue
                end
                
                -- Проверяем, существует ли эта руда в текущем мире по нашей таблице
                local oreConfig = currentWorldConfig.ores[targetOreName]
                
                if not oreConfig then
                    -- РУДЫ НЕТ В ЭТОМ МИРЕ! Ищем, в каком мире она есть
                    local correctWorld = "Unknown World"
                    for worldName, data in pairs(worldData) do
                        if data.ores[targetOreName] then
                            correctWorld = worldName
                            break
                        end
                    end
                    
                    -- Останавливаем фарм и просим игрока сменить зону
                    isAutoMining = false
                    autoMineBtn.BackgroundColor3 = Color3.fromRGB(150, 80, 40) -- Оранжевый цвет предупреждения
                    autoMineBtn.Text = "Go to: " .. correctWorld
                    local character = localPlayer.Character
                    if character and character:FindFirstChild("HumanoidRootPart") then
                        character.HumanoidRootPart.Anchored = false
                    end
                    continue
                end
                
                -- Если руда верная для этого мира, ищем её на карте
                for _, child in ipairs(blocksFolder:GetChildren()) do
                    if child:IsA("Model") and child.Name:lower() == targetOreName then
                        targetFound = child
                        break
                    end
                end
                
                if targetFound then
                    digBlock(targetFound)
                else
                    -- Если руды нет на текущем экране, проверяем глубину
                    local character = localPlayer.Character
                    local rootPart = character and character:FindFirstChild("HumanoidRootPart")
                    if rootPart then
                        local currentLayer = math.floor((currentWorldConfig.startHeight - rootPart.Position.Y) / currentWorldConfig.layerSize)
                        
                        -- Копаем строго до максимального слоя спавна этой руды в этом мире
                        if currentLayer < oreConfig.max then
                            digStraightDown()
                        else
                            -- Если дошли до дна зоны спавна, а руды нет — ждем обновления карты
                            rootPart.Anchored = true
                            autoMineBtn.Text = "Auto-Mine: Waiting for Spawn..."
                        end
                    end
                end
            else
                -- Если мир не распознан в таблице, копаем по старой базовой логике
                local targetFound = nil
                for _, child in ipairs(blocksFolder:GetChildren()) do
                    if child:IsA("Model") and trackedBlocks[child.Name:lower()] then
                        targetFound = child
                        break
                    end
                end
                if targetFound then digBlock(targetFound) else digStraightDown() end
            end
        else
            local character = localPlayer.Character
            local rootPart = character and character:FindFirstChild("HumanoidRootPart")
            if rootPart and rootPart.Anchored then rootPart.Anchored = false end
        end
    end
end)

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

autoMineBtn.MouseButton1Click:Connect(function()
    isAutoMining = not isAutoMining
    if isAutoMining then
        autoMineBtn.BackgroundColor3 = Color3.fromRGB(45, 120, 45)
        autoMineBtn.Text = "Auto-Mine: ON"
    else
        autoMineBtn.BackgroundColor3 = Color3.fromRGB(150, 40, 40)
        autoMineBtn.Text = "Auto-Mine: OFF"
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

