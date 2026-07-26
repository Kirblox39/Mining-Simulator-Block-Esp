-- Инициализация глобальной базы данных руд
local oreToWorldMap = {
    -- БАЗОВЫЕ И ДОРОГИЕ БЛОКИ МИРОВ
    ["stone"] = {{world = "Home World", layer = 0, prettyName = "Stone"}},
    ["dirt"] = {{world = "Home World", layer = 1, prettyName = "Dirt"}},
    ["mystic stone"] = {{world = "Magic Forest", layer = 0, prettyName = "Mystic Stone"}},
    ["magic stone"] = {{world = "Magic Forest", layer = 0, prettyName = "Magic Stone"}},
    ["space stone"] = {{world = "Space Adventure", layer = 0, prettyName = "Space Stone"}},
    ["prehistoric stone"] = {{world = "Dino Land", layer = 1, prettyName = "Prehistoric Stone"}},
    ["lava block"] = {{world = "Lava World", layer = 0, prettyName = "Lava Block"}},
    ["gem block"] = {{world = "Lava World", layer = 0, prettyName = "Gem Block"}},
    ["flour"] = {{world = "Food Land", layer = 0, prettyName = "Flour"}},
    ["sand"] = {{world = "Toy Land", layer = 0, prettyName = "Sand"}},
    ["sandstone"] = {
        {world = "Atlantis", layer = 0, prettyName = "Sandstone"},
        {world = "The Beach", layer = 0, prettyName = "Sandstone"}
    },
    ["cave stone"] = {{world = "Crystal Cavern", layer = 0, prettyName = "Cave Stone"}},
    ["sugar stone"] = {{world = "Candy Land", layer = 0, prettyName = "Sugar Stone"}},
    ["cyber block"] = {{world = "Cyber", layer = 0, prettyName = "Cyber Block"}},

    -- 1. HOME WORLD
    ["fossils"] = {{world = "Home World", layer = 2, prettyName = "Fossils"}}, 
    ["dinosaur bones"] = {{world = "Home World", layer = 2, prettyName = "Dinosaur Bones"}}, 
    ["skeleton stone"] = {{world = "Home World", layer = 4, prettyName = "Skeleton Stone"}}, 
    ["pezzottaite"] = {{world = "Home World", layer = 5, prettyName = "Pezzottaite"}}, 
    ["shadow stone"] = {{world = "Home World", layer = 9, prettyName = "Shadow Stone"}}, 
    ["illuminite"] = {{world = "Home World", layer = 9, prettyName = "Illuminite"}}, 
    ["rainbowite"] = {{world = "Home World", layer = 9, prettyName = "Rainbowite"}},

    -- 2. MAGIC FOREST
    ["twig ore"] = {{world = "Magic Forest", layer = 2, prettyName = "Twig Ore"}},
    ["magic wand"] = {{world = "Magic Forest", layer = 2, prettyName = "Magic Wand"}},
    ["gold ring ore"] = {{world = "Magic Forest", layer = 2, prettyName = "Gold Ring Ore"}},
    ["lily pad"] = {{world = "Magic Forest", layer = 3, prettyName = "Lily Pad"}},
    ["log ore"] = {{world = "Magic Forest", layer = 5, prettyName = "Log Ore"}},
    ["chest ore"] = {{world = "Magic Forest", layer = 5, prettyName = "Chest Ore"}},
    ["unicorn horn ore"] = {{world = "Magic Forest", layer = 5, prettyName = "Unicorn Horn Ore"}},
    ["mushroom ore"] = {{world = "Magic Forest", layer = 6, prettyName = "Mushroom Ore"}},
    ["orb ore"] = {{world = "Magic Forest", layer = 8, prettyName = "Orb Ore"}},

    -- 3. SPACE ADVENTURE
    ["asteroid rock"] = {{world = "Space Adventure", layer = 1, prettyName = "Asteroid Rock"}},
    ["ice"] = {{world = "Space Adventure", layer = 1, prettyName = "Ice"}},
    ["iron"] = {{world = "Space Adventure", layer = 2, prettyName = "Iron"}},
    ["opals"] = {{world = "Space Adventure", layer = 2, prettyName = "Opals"}},
    ["hematite"] = {{world = "Space Adventure", layer = 3, prettyName = "Hematite"}},
    ["cherry ruby"] = {{world = "Space Adventure", layer = 4, prettyName = "Cherry Ruby"}},
    ["bedrock"] = {{world = "Space Adventure", layer = 4, prettyName = "Bedrock"}},
    ["red beryl"] = {{world = "Space Adventure", layer = 5, prettyName = "Red Beryl"}},
    ["yellow beryl"] = {{world = "Space Adventure", layer = 5, prettyName = "Yellow Beryl"}},
    ["titanium"] = {{world = "Space Adventure", layer = 5, prettyName = "Titanium"}},
    ["amethyst"] = {{world = "Space Adventure", layer = 6, prettyName = "Amethyst"}},
    ["zircon"] = {{world = "Space Adventure", layer = 7, prettyName = "Zircon"}},
    ["blue beryl"] = {{world = "Space Adventure", layer = 7, prettyName = "Blue Beryl"}},

     -- 4. DINO LAND
    ["dinosaur eggs"] = {{world = "Dino Land", layer = 1, prettyName = "Dinosaur Eggs"}},
    ["meat bones"] = {{world = "Dino Land", layer = 2, prettyName = "Meat Bones"}},
    ["amber"] = {{world = "Dino Land", layer = 3, prettyName = "Amber"}},
    ["halite"] = {{world = "Dino Land", layer = 3, prettyName = "Halite"}},
    ["black onyx"] = {{world = "Dino Land", layer = 3, prettyName = "Black Onyx"}},
    ["fish bones"] = {{world = "Dino Land", layer = 4, prettyName = "Fish Bones"}},
    ["pyrite"] = {{world = "Dino Land", layer = 6, prettyName = "Pyrite"}},
    ["skeleton"] = {{world = "Dino Land", layer = 6, prettyName = "Skeleton"}},
    ["jade"] = {{world = "Dino Land", layer = 6, prettyName = "Jade"}},
    ["cannibar"] = {{world = "Dino Land", layer = 7, prettyName = "Cannibar"}},

    -- 5. LAVA WORLD
    ["slate"] = {{world = "Lava World", layer = 1, prettyName = "Slate"}},
    ["talc"] = {{world = "Lava World", layer = 2, prettyName = "Talc"}},
    ["fluorite"] = {{world = "Lava World", layer = 2, prettyName = "Fluorite"}},
    ["amertrine"] = {{world = "Lava World", layer = 2, prettyName = "Amertrine"}},
    ["garnet"] = {{world = "Lava World", layer = 4, prettyName = "Garnet"}},
    ["orpiment"] = {{world = "Lava World", layer = 5, prettyName = "Orpiment"}},
    ["citrine"] = {{world = "Lava World", layer = 5, prettyName = "Citrine"}},
    ["tanzanite"] = {{world = "Lava World", layer = 5, prettyName = "Tanzanite"}},
    ["aquamarine"] = {{world = "Lava World", layer = 5, prettyName = "Aquamarine"}},
    ["black diamond"] = {{world = "Lava World", layer = 8, prettyName = "Black Diamond"}},

    -- 6. FOOD LAND
    ["macaroni"] = {{world = "Food Land", layer = 1, prettyName = "Macaroni"}},
    ["french fries"] = {{world = "Food Land", layer = 2, prettyName = "French Fries"}},
    ["chicken nugget"] = {{world = "Food Land", layer = 2, prettyName = "Chicken Nugget"}},
    ["bananas"] = {{world = "Food Land", layer = 3, prettyName = "Bananas"}},
    ["bacon"] = {{world = "Food Land", layer = 3, prettyName = "Bacon"}},
    ["cookies"] = {{world = "Food Land", layer = 4, prettyName = "Cookies"}},
    ["watermelon"] = {{world = "Food Land", layer = 7, prettyName = "Watermelon"}},
    ["nachos"] = {{world = "Food Land", layer = 7, prettyName = "Nachos"}},
    ["pizza"] = {{world = "Food Land", layer = 8, prettyName = "Pizza"}},
    ["hotdogs"] = {{world = "Food Land", layer = 9, prettyName = "Hotdogs"}},

    -- 7. TOY LAND
    ["plastic"] = {{world = "Toy Land", layer = 1, prettyName = "Plastic"}},
    ["block ore"] = {{world = "Toy Land", layer = 2, prettyName = "Block Ore"}},
    ["gun ore"] = {{world = "Toy Land", layer = 2, prettyName = "Gun Ore"}},
    ["puzzle ore"] = {{world = "Toy Land", layer = 3, prettyName = "Puzzle Ore"}},
    ["car ore"] = {{world = "Toy Land", layer = 4, prettyName = "Car Ore"}},
    ["spaceship ore"] = {{world = "Toy Land", layer = 5, prettyName = "Spaceship Ore"}},
    ["airplane ore"] = {{world = "Toy Land", layer = 5, prettyName = "Airplane Ore"}},
    ["tank ore"] = {{world = "Toy Land", layer = 6, prettyName = "Tank Ore"}},
    ["teddybear ore"] = {{world = "Toy Land", layer = 6, prettyName = "Teddybear Ore"}},

    -- 8. ATLANTIS
    ["ancient stone"] = {{world = "Atlantis", layer = 1, prettyName = "Ancient Stone"}},
    ["seaweed"] = {{world = "Atlantis", layer = 2, prettyName = "Seaweed"}},
    ["kelp"] = {{world = "Atlantis", layer = 3, prettyName = "Kelp"}},
    ["golden coins"] = {{world = "Atlantis", layer = 3, prettyName = "Golden Coins"}},
    ["anchors"] = {{world = "Atlantis", layer = 3, prettyName = "Anchors"}},
    ["starfish"] = {{world = "Atlantis", layer = 3, prettyName = "Starfish"}},
    ["pearls"] = {{world = "Atlantis", layer = 5, prettyName = "Pearls"}},
    ["ancient artifact"] = {{world = "Atlantis", layer = 7, prettyName = "Ancient Artifact"}},
    ["ancient gem"] = {{world = "Atlantis", layer = 8, prettyName = "Ancient Gem"}},

    -- 9. CRYSTAL CAVERN
    ["crystal stone"] = {{world = "Crystal Cavern", layer = 1, prettyName = "Crystal Stone"}},
    ["thermium"] = {{world = "Crystal Cavern", layer = 2, prettyName = "Thermium"}},
    ["bonzanite"] = {{world = "Crystal Cavern", layer = 2, prettyName = "Bonzanite"}},
    ["blood stone"] = {{world = "Crystal Cavern", layer = 3, prettyName = "Blood Stone"}},
    ["chromius"] = {{world = "Crystal Cavern", layer = 3, prettyName = "Chromius"}},
    ["craxium"] = {{world = "Crystal Cavern", layer = 4, prettyName = "Craxium"}},
    ["crystalite"] = {{world = "Crystal Cavern", layer = 6, prettyName = "Crystalite"}},
    ["praxium"] = {{world = "Crystal Cavern", layer = 6, prettyName = "Praxium"}},
    ["royal ore"] = {{world = "Crystal Cavern", layer = 6, prettyName = "Royal Ore"}},
    ["oraxanium"] = {{world = "Crystal Cavern", layer = 7, prettyName = "Oraxanium"}},

    -- 10. THE BEACH
    ["sunscreen ore"] = {{world = "The Beach", layer = 2, prettyName = "Sunscreen Ore"}},
    ["shovel ore"] = {{world = "The Beach", layer = 2, prettyName = "Shovel Ore"}},
    ["sunglasses"] = {{world = "The Beach", layer = 3, prettyName = "Sunglasses"}},
    ["surfboard ore"] = {{world = "The Beach", layer = 4, prettyName = "Surfboard Ore"}},
    ["ice cream"] = {{world = "The Beach", layer = 6, prettyName = "Ice Cream"}},
    ["chlorite"] = {{world = "The Beach", layer = 6, prettyName = "Chlorite"}},
    ["ice pop"] = {{world = "The Beach", layer = 6, prettyName = "Ice Pop"}},
    ["mithril"] = {{world = "The Beach", layer = 7, prettyName = "Mithril"}},
    ["orcalium"] = {{world = "The Beach", layer = 8, prettyName = "Orcalium"}},

    -- 11. CANDY LAND
    ["icing"] = {{world = "Candy Land", layer = 1, prettyName = "Icing"}},
    ["peppermint"] = {{world = "Candy Land", layer = 2, prettyName = "Peppermint"}},
    ["skittles ore"] = {{world = "Candy Land", layer = 3, prettyName = "Skittles Ore"}},
    ["jellybean stone"] = {{world = "Candy Land", layer = 3, prettyName = "Jellybean Stone"}},
    -- ПРОДОЛЖЕНИЕ ТАБЛИЦЫ (Запусти этот кусок вторым)
    ["lollipop ore"] = {{world = "Candy Land", layer = 3, prettyName = "Lollipop Ore"}},
    ["gummy bear ore"] = {{world = "Candy Land", layer = 3, prettyName = "Gummy Bear Ore"}},
    ["gummy ore"] = {{world = "Candy Land", layer = 4, prettyName = "Gummy Ore"}},
    ["candy fish ore"] = {{world = "Candy Land", layer = 5, prettyName = "Candy Fish Ore"}},
    ["candy floss ore"] = {{world = "Candy Land", layer = 5, prettyName = "Candy Floss Ore"}},
    ["heart candy"] = {{world = "Candy Land", layer = 6, prettyName = "Heart Candy"}},
    ["egg candy"] = {{world = "Candy Land", layer = 6, prettyName = "Egg Candy"}},

    -- 12. CYBER WORLD (КИБЕР-ГОРОД)
    ["neon block"] = {{world = "Cyber", layer = 1, prettyName = "Neon Block"}},
    ["cybite"] = {{world = "Cyber", layer = 2, prettyName = "Cybite"}},
    ["techium"] = {{world = "Cyber", layer = 3, prettyName = "Techium"}},
    ["malwarite"] = {{world = "Cyber", layer = 3, prettyName = "Malwarite"}},
    ["trojanite"] = {{world = "Cyber", layer = 3, prettyName = "Trojanite"}},
    ["virusite"] = {{world = "Cyber", layer = 4, prettyName = "Virusite"}},
    ["spamite"] = {{world = "Cyber", layer = 6, prettyName = "Spamite"}},
    ["memorite"] = {{world = "Cyber", layer = 6, prettyName = "Memorite"}},
    ["ransomium"] = {{world = "Cyber", layer = 8, prettyName = "Ransomium"}},
    ["dark memorite"] = {{world = "Cyber", layer = 8, prettyName = "Dark Memorite"}},

    -- СУНДУКИ (CHESTS) И ИХ ДУБЛИКАТЫ
    ["wooden chest"] = {{world = "Home World", layer = 1, prettyName = "Wooden Chest"}},
    ["silver chest"] = {{world = "Home World", layer = 3, prettyName = "Silver Chest"}},
    ["magical chest"] = {{world = "Home World", layer = 5, prettyName = "Magical Chest"}},
    ["mythical chest"] = {{world = "Home World", layer = 5, prettyName = "Mythical Chest"}},
    ["unobtainable chest"] = {{world = "Home World", layer = 6, prettyName = "Unobtainable Chest"}},
    ["shadow chest"] = {{world = "Home World", layer = 6, prettyName = "Shadow Chest"}},
    ["light chest"] = {{world = "Home World", layer = 9, prettyName = "Light Chest"}},
    ["token chest"] = {{world = "Home World", layer = 10, prettyName = "Token Chest"}},
    ["unreal chest"] = {
        {world = "Magic Forest", layer = 8, prettyName = "Unreal Chest"},
        {world = "Crystal Cavern", layer = 8, prettyName = "Unreal Chest"}
    },
    ["crystal chest"] = {
        {world = "Magic Forest", layer = 11, prettyName = "Crystal Chest"},
        {world = "Crystal Cavern", layer = 11, prettyName = "Crystal Chest"}
    },
    ["emerald chest"] = {{world = "Atlantis", layer = 6, prettyName = "Emerald Chest"}},
    ["ruby chest"] = {{world = "Atlantis", layer = 8, prettyName = "Ruby Chest"}},
    ["sapphire chest"] = {{world = "Atlantis", layer = 10, prettyName = "Sapphire Chest"}},
    ["golden chest"] = {
        {world = "Home World", layer = 4, prettyName = "Golden Chest"},
        {world = "Atlantis", layer = 3, prettyName = "Golden Chest"}
    },

    -- ГЛОБАЛЬНЫЕ ДУБЛИРУЮЩИЕСЯ РУДЫ И ДРУГИЕ СВЯЗИ
    ["grass"] = {
        {world = "Home World", layer = 0, prettyName = "Grass"},
        {world = "Dino Land", layer = 0, prettyName = "Grass"}
    },
    ["grass ore"] = {{world = "Magic Forest", layer = 2, prettyName = "Grass Ore"}},
    ["coconuts"] = {{world = "The Beach", layer = 3, prettyName = "Coconuts"}},
    ["godly gem"] = {
        {world = "Space Adventure", layer = 9, prettyName = "Godly Gem"},
        {world = "Dino Land", layer = 8, prettyName = "Godly Gem"}
    },
    ["twilight gem"] = {{world = "Crystal Cavern", layer = 9, prettyName = "Twilight Gem"}},
    ["coal"] = {
        {world = "Home World", layer = 3, prettyName = "Coal"},
        {world = "Space Adventure", layer = 1, prettyName = "Coal"}
    },
    ["copper"] = {
        {world = "Home World", layer = 3, prettyName = "Copper"},
        {world = "Space Adventure", layer = 1, prettyName = "Copper"}
    },
    ["silver"] = {
        {world = "Home World", layer = 4, prettyName = "Silver"},
        {world = "Space Adventure", layer = 1, prettyName = "Silver"}
    },
    ["gold"] = {
        {world = "Home World", layer = 5, prettyName = "Gold"},
        {world = "Space Adventure", layer = 1, prettyName = "Gold"}
    },
    ["quartz"] = {
        {world = "Home World", layer = 4, prettyName = "Quartz"},
        {world = "Space Adventure", layer = 1, prettyName = "Quartz"}
    },
    ["emerald"] = {
        {world = "Home World", layer = 6, prettyName = "Emerald"},
        {world = "Space Adventure", layer = 3, prettyName = "Emerald"}
    },
    ["ruby"] = {
        {world = "Home World", layer = 6, prettyName = "Ruby"},
        {world = "Space Adventure", layer = 3, prettyName = "Ruby"}
    },
    ["lavastone"] = {
        {world = "Home World", layer = 6, prettyName = "Lavastone"},
        {world = "Space Adventure", layer = 3, prettyName = "Lavastone"}
    },
    ["sapphire"] = {
        {world = "Home World", layer = 6, prettyName = "Sapphire"},
        {world = "Space Adventure", layer = 4, prettyName = "Sapphire"}
    },
    ["obsidian"] = {
        {world = "Home World", layer = 6, prettyName = "Obsidian"},
        {world = "Space Adventure", layer = 5, prettyName = "Obsidian"}
    },
    ["glowstone"] = {
        {world = "Home World", layer = 6, prettyName = "Glowstone"},
        {world = "Space Adventure", layer = 5, prettyName = "Glowstone"}
    },
    ["diamond"] = {
        {world = "Home World", layer = 7, prettyName = "Diamond"},
        {world = "Space Adventure", layer = 3, prettyName = "Diamond"}
    },
    ["unobtainium"] = {
        {world = "Home World", layer = 7, prettyName = "Unobtainium"},
        {world = "Space Adventure", layer = 5, prettyName = "Unobtainium"}
    },
    ["lapis"] = {
        {world = "Home World", layer = 6, prettyName = "Lapis"},
        {world = "Space Adventure", layer = 5, prettyName = "Lapis"}
    },
    ["uranium"] = {
        {world = "Home World", layer = 6, prettyName = "Uranium"},
        {world = "Space Adventure", layer = 5, prettyName = "Uranium"}
    },
    ["platinum"] = {
        {world = "Home World", layer = 6, prettyName = "Platinum"},
        {world = "Space Adventure", layer = 5, prettyName = "Platinum"}
    },
    ["krixanium"] = {
        {world = "Home World", layer = 6, prettyName = "Krixanium"},
        {world = "Space Adventure", layer = 5, prettyName = "Krixanium"}
    },
    ["red rock"] = {
        {world = "Home World", layer = 6, prettyName = "Red Rock"},
        {world = "Space Adventure", layer = 5, prettyName = "Red Rock"}
    },
    ["dravite"] = {
        {world = "Home World", layer = 6, prettyName = "Dravite"},
        {world = "Space Adventure", layer = 5, prettyName = "Dravite"}
    },
    ["mythic stone"] = {
        {world = "Home World", layer = 7, prettyName = "Mythic Stone"},
        {world = "Space Adventure", layer = 5, prettyName = "Mythic Stone"}
    },
    ["legendary stone"] = {
        {world = "Home World", layer = 7, prettyName = "Legendary Stone"},
        {world = "Space Adventure", layer = 5, prettyName = "Legendary Stone"}
    },
    ["breadstone"] = {
        {world = "Home World", layer = 8, prettyName = "Breadstone"},
        {world = "Space Adventure", layer = 6, prettyName = "Breadstone"}
    }
}
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local BlocksFolder = Workspace:FindFirstChild("Blocks")

local LocalPlayer = Players.LocalPlayer

if not BlocksFolder then
    warn("Папка 'Blocks' не найдена в Workspace!")
    return
end

-- Получаем склеенную базу данных из памяти


-- Создание GUI
local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "DeltaOreSearcherWithDistance"

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 350, 0, 400)
MainFrame.Position = UDim2.new(0.1, 0, 0.25, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.Active = true
MainFrame.Draggable = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 8)

local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "Ore Searcher & Distance ESP"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16
Title.Font = Enum.Font.SourceSansBold
Title.BackgroundTransparency = 1

-- Кнопка Add Block
local AddBtn = Instance.new("TextButton", MainFrame)
AddBtn.Size = UDim2.new(0.44, 0, 0, 35)
AddBtn.Position = UDim2.new(0.04, 0, 0, 45)
AddBtn.Text = "+ Add Block"
AddBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AddBtn.BackgroundColor3 = Color3.fromRGB(40, 130, 40)
AddBtn.Font = Enum.Font.SourceSansBold
AddBtn.TextSize = 14
Instance.new("UICorner", AddBtn).CornerRadius = UDim.new(0, 5)

-- Кнопка Search
local SearchBtn = Instance.new("TextButton", MainFrame)
SearchBtn.Size = UDim2.new(0.44, 0, 0, 35)
SearchBtn.Position = UDim2.new(0.52, 0, 0, 45)
SearchBtn.Text = "🔍 Search"
SearchBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SearchBtn.BackgroundColor3 = Color3.fromRGB(30, 80, 160)
SearchBtn.Font = Enum.Font.SourceSansBold
SearchBtn.TextSize = 14
Instance.new("UICorner", SearchBtn).CornerRadius = UDim.new(0, 5)

-- ScrollingFrame для окошек настроек руд
local ScrollFrame = Instance.new("ScrollingFrame", MainFrame)
ScrollFrame.Size = UDim2.new(0.92, 0, 0, 295)
ScrollFrame.Position = UDim2.new(0.04, 0, 0, 95)
ScrollFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollFrame.ScrollBarThickness = 5
Instance.new("UICorner", ScrollFrame).CornerRadius = UDim.new(0, 5)

local UIListLayout = Instance.new("UIListLayout", ScrollFrame)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)
end)

-- Таблица, где хранятся настройки из активных окон (Имя -> {R, G, B, RealName})
local ConfiguredBlocks = {}

-- Поиск парта (ColorPart, Part или любой BasePart/MeshPart)
local function getValidPart(block)
    local part = block:FindFirstChild("ColorPart") or block:FindFirstChild("Part")
    if not part then
        for _, child in ipairs(block:GetChildren()) do
            if child:IsA("BasePart") or child:IsA("MeshPart") then
                part = child
                break
            end
        end
    end
    return part
end

-- Функция постоянного обновления дистанции до блока
local function startDistanceTracker(txtLabel, part, baseName)
    task.spawn(function()
        -- Пока BillboardGui существует и парта на месте, считаем дистанцию
        while part and part:IsDescendantOf(Workspace) and txtLabel and txtLabel.Parent do
            local character = LocalPlayer.Character
            local rootPart = character and character:FindFirstChild("HumanoidRootPart")
            
            if rootPart then
                -- Вычисление расстояния с помощью .Magnitude
                local distance = (rootPart.Position - part.Position).Magnitude
                
                -- Форматируем текст: "Название [150m]" (округляем до целого числа)
                txtLabel.Text = string.format("%s [%dm]", baseName, math.floor(distance))
            else
                txtLabel.Text = baseName .. " [--]"
            end
            
            task.wait(0.1) -- Частота обновления (раз в 100мс, оптимально для Delta)
        end
    end)
end

-- Создание и обновление ESP
local function applyESP(block)
    local cleanName = string.lower(block.Name)
    local config = ConfiguredBlocks[cleanName]
    if not config then return end -- Если такого блока нет в наших окошках, игнорируем

    local part = getValidPart(block)
    if not part then return end

    if part:FindFirstChild("BlockESP") then part.BlockESP:Destroy() end

    local bbGui = Instance.new("BillboardGui", part)
    bbGui.Name = "BlockESP"
    bbGui.AlwaysOnTop = true
    bbGui.Size = UDim2.new(0, 130, 0, 30) -- Чуть увеличили ширину для влезания метров
    bbGui.ExtentsOffset = Vector3.new(0, 2, 0)

    local txt = Instance.new("TextLabel", bbGui)
    txt.Size = UDim2.new(1, 0, 1, 0)
    txt.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    txt.BackgroundTransparency = 0.4
    txt.Text = config.RealName .. " [...]"
    txt.TextColor3 = Color3.fromRGB(config.R, config.G, config.B)
    txt.TextSize = 11 -- Немного уменьшили шрифт для красивого визуала дистанции
    txt.Font = Enum.Font.SourceSansBold
    Instance.new("UICorner", txt).CornerRadius = UDim.new(0, 4)

    -- Запуск отдельного потока для просчета метров
    startDistanceTracker(txt, part, config.RealName)
end

-- Функция создания нового окошка руды в ScrollingFrame
local function createBlockWindow()
    local itemFrame = Instance.new("Frame", ScrollFrame)
    itemFrame.Size = UDim2.new(1, -10, 0, 55)
    itemFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Instance.new("UICorner", itemFrame).CornerRadius = UDim.new(0, 4)

    -- Поле ввода имени блока
    local nameBox = Instance.new("TextBox", itemFrame)
    nameBox.Size = UDim2.new(0.45, 0, 0, 22)
    nameBox.Position = UDim2.new(0.03, 0, 0, 5)
    nameBox.Text = "stone"
    nameBox.PlaceholderText = "Ore Name"
    nameBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameBox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    nameBox.TextSize = 12
    nameBox.Font = Enum.Font.SourceSans
    Instance.new("UICorner", nameBox).CornerRadius = UDim.new(0, 4)

    -- Инпуты для RGB цвета
    local function addRGBInput(pos, def, ph)
        local box = Instance.new("TextBox", itemFrame)
        box.Size = UDim2.new(0.13, 0, 0, 22)
        box.Position = pos
        box.Text = def
        box.PlaceholderText = ph
        box.TextColor3 = Color3.fromRGB(255, 255, 255)
        box.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        box.TextSize = 11
        box.Font = Enum.Font.SourceSans
        Instance.new("UICorner", box).CornerRadius = UDim.new(0, 4)
        return box
    end

    local rBox = addRGBInput(UDim2.new(0.52, 0, 0, 5), "255", "R")
    local gBox = addRGBInput(UDim2.new(0.67, 0, 0, 5), "255", "G")
    local bBox = addRGBInput(UDim2.new(0.82, 0, 0, 5), "255", "B")

    -- Кнопка "Where?" для поиска информации по таблице
    local whereBtn = Instance.new("TextButton", itemFrame)
    whereBtn.Size = UDim2.new(0.45, 0, 0, 20)
    whereBtn.Position = UDim2.new(0.03, 0, 0, 30)
    whereBtn.Text = "📍 Where?"
    whereBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    whereBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    whereBtn.TextSize = 11
    whereBtn.Font = Enum.Font.SourceSansBold
    Instance.new("UICorner", whereBtn).CornerRadius = UDim.new(0, 4)

    local currentKey = "stone"

    local function updateData()
        if ConfiguredBlocks[currentKey] then ConfiguredBlocks[currentKey] = nil end
        
        local cleanName = string.lower(string.gsub(nameBox.Text, "^%s*(.-)%s*$", "%1"))
        currentKey = cleanName

        ConfiguredBlocks[cleanName] = {
            RealName = nameBox.Text,
            R = tonumber(rBox.Text) or 255,
            G = tonumber(gBox.Text) or 255,
            B = tonumber(bBox.Text) or 255
        }
    end

    nameBox:GetPropertyChangedSignal("Text"):Connect(updateData)
    rBox:GetPropertyChangedSignal("Text"):Connect(updateData)
    gBox:GetPropertyChangedSignal("Text"):Connect(updateData)
    bBox:GetPropertyChangedSignal("Text"):Connect(updateData)
    
    updateData()

    -- Логика кнопки "Where?"
    whereBtn.MouseButton1Click:Connect(function()
        local searchKey = string.lower(string.gsub(nameBox.Text, "^%s*(.-)%s*$", "%1"))
        local data = oreToWorldMap[searchKey]

        print("--- Info for: [" .. nameBox.Text .. "] ---")
        if data then
            for _, loc in ipairs(data) do
                print(string.format("Name: %s | World: %s | Layer: %d", loc.prettyName, loc.world, loc.layer))
            end
            whereBtn.Text = "Logs printed (F9)"
            task.delay(1.5, function() whereBtn.Text = "📍 Where?" end)
        else
            print("Block '" .. nameBox.Text .. "' not found in oreToWorldMap.")
            whereBtn.Text = "Not found!"
            task.delay(1.5, function() whereBtn.Text = "📍 Where?" end)
        end
    end)
end

-- Обработка кнопок интерфейса
AddBtn.MouseButton1Click:Connect(function()
    createBlockWindow()
end)

SearchBtn.MouseButton1Click:Connect(function()
    for _, block in ipairs(BlocksFolder:GetChildren()) do
        applyESP(block)
    end
end)

-- Автоматический трекер новых блоков (ChildAdded)
BlocksFolder.ChildAdded:Connect(function(newBlock)
    task.wait(0.2)
    applyESP(newBlock)
end)

-- Инициализируем одно окно по умолчанию при старте
createBlockWindow()
