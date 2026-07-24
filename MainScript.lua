local blocksFolder = workspace:WaitForChild("Blocks", 15)
if not blocksFolder then return end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BlockTrackerUltimateESP"
screenGui.ResetOnSpawn = false
screenGui.Parent = game:GetService("CoreGui") or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

-- Главная панель
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 350, 0, 240)
mainFrame.Position = UDim2.new(0.1, 0, 0.3, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 10)

-- Панель сканера (Scanner Frame)
local scanFrame = Instance.new("Frame")
scanFrame.Size = UDim2.new(0, 200, 0, 240)
scanFrame.Position = UDim2.new(1, 10, 0, 0) -- Справа от главного окна
scanFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
scanFrame.BorderSizePixel = 0
scanFrame.Visible = false
scanFrame.Parent = mainFrame
Instance.new("UICorner", scanFrame).CornerRadius = UDim.new(0, 10)

local scanTitle = Instance.new("TextLabel")
scanTitle.Size = UDim2.new(1, 0, 0, 35)
scanTitle.Text = "Blocks Map Scan"
scanTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
scanTitle.BackgroundTransparency = 1
scanTitle.Font = Enum.Font.SourceSansBold
scanTitle.TextSize = 14
scanTitle.Parent = scanFrame

local scanScroll = Instance.new("ScrollingFrame")
scanScroll.Size = UDim2.new(1, -10, 1, -45)
scanScroll.Position = UDim2.new(0, 5, 0, 35)
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
title.Text = "Block Tracker ESP"
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
scrollingFrame.Size = UDim2.new(1, -10, 1, -45)
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

-- Кнопка "+ Add"
local addBtn = Instance.new("TextButton")
addBtn.Size = UDim2.new(0, 155, 0, 30)
addBtn.Position = UDim2.new(0, 10, 1, -35)
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
scanToggleBtn.Position = UDim2.new(0, 175, 0, 170)
scanToggleBtn.BackgroundColor3 = Color3.fromRGB(45, 75, 125)
scanToggleBtn.Text = "🔍 Scan Blocks"
scanToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
scanToggleBtn.Font = Enum.Font.SourceSansBold
scanToggleBtn.TextSize = 14
scanToggleBtn.Parent = contentFrame
Instance.new("UICorner", scanToggleBtn).CornerRadius = UDim.new(0, 5)

local trackedBlocks = {} 
local activeBillboards = {} 
local connection = nil
local createBlockRowGlobal = nil 

local function clearOldESP()
    activeBillboards = {}
    for _, child in ipairs(blocksFolder:GetChildren()) do
        local colorPart = child:FindFirstChild("ColorPart")
        if colorPart then
            local old = colorPart:FindFirstChild("UltimateBlockBillboard")
            if old then old:Destroy() end
        end
    end
end

local function createESP(child)
    if child:IsA("Model") then
        local data = trackedBlocks[child.Name:lower()]
        if data then
            local colorPart = child:WaitForChild("ColorPart", 3)
            if colorPart and not colorPart:FindFirstChild("UltimateBlockBillboard") then
                local billboard = Instance.new("BillboardGui")
                billboard.Name = "UltimateBlockBillboard"
                billboard.Size = UDim2.new(0, 60, 0, 60)
                billboard.AlwaysOnTop = true
                billboard.MaxDistance = math.huge
                
                local point = Instance.new("Frame")
                point.Size = UDim2.new(0, 12, 0, 12)
                point.Position = UDim2.new(0.5, -6, 0.5, -6)
                point.BackgroundColor3 = data.color
                Instance.new("UICorner", point).CornerRadius = UDim.new(1, 0)
                point.Parent = billboard
                
                local distLabel = Instance.new("TextLabel")
                distLabel.Size = UDim2.new(2, 0, 0, 20)
                distLabel.Position = UDim2.new(-0.5, 0, -0.5, -8)
                distLabel.BackgroundTransparency = 1
                distLabel.Text = ""
                distLabel.TextColor3 = data.color
                distLabel.TextStrokeTransparency = 0
                distLabel.Font = Enum.Font.SourceSansBold
                distLabel.TextSize = 13
                distLabel.Parent = billboard
                
                billboard.Parent = colorPart
                table.insert(activeBillboards, {gui = distLabel, part = colorPart})
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

-- Надежный трекер дистанции через текущую камеру (всегда работает)
game:GetService("RunService").RenderStepped:Connect(function()
    local camera = workspace.CurrentCamera
    if not camera then return end
    local camPos = camera.CFrame.Position
    
    for i = #activeBillboards, 1, -1 do
        local item = activeBillboards[i]
        if item.part and item.part.Parent and item.gui and item.gui.Parent then
            local distance = (camPos - item.part.Position).Magnitude
            if distance < 600 then
                item.gui.Text = string.format("%d m", math.floor(distance))
                item.gui.Visible = true
            else
                item.gui.Visible = false
            end
        else
            table.remove(activeBillboards, i)
        end
    end
end)

-- Логика обновления меню сканера карты
local function refreshScanner()
    for _, child in ipairs(scanScroll:GetChildren()) do
        if child:IsA("Frame") then child:Destroy() end
    end
    
    local counts = {}
    for _, child in ipairs(blocksFolder:GetChildren()) do
        if child:IsA("Model") then
            counts[child.Name] = (counts[child.Name] or 0) + 1
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
                local r = math.random(50, 255)
                local g = math.random(50, 255)
                local b = math.random(50, 255)
                createBlockRowGlobal(blockName, r, g, b)
            end
        end)
    end
    scanScroll.CanvasSize = UDim2.new(0, 0, 0, scanListLayout.AbsoluteContentSize.Y + 5)
end

scanToggleBtn.MouseButton1Click:Connect(function()
    scanFrame.Visible = not scanFrame.Visible
    if scanFrame.Visible then refreshScanner() end
end)

blocksFolder.ChildAdded:Connect(function() if scanFrame.Visible then refreshScanner() end end)
blocksFolder.ChildRemoved:Connect(function() if scanFrame.Visible then refreshScanner() end end)

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

local isMinimized = false
toggleBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    mainFrame.Size = isMinimized and UDim2.new(0, 350, 0, 40) or UDim2.new(0, 350, 0, 240)
    contentFrame.Visible = not isMinimized
    scanFrame.Visible = false
    toggleBtn.Text = isMinimized and "+" or "−"
end)
