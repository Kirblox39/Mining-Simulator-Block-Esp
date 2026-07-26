-- =============================================================================
-- ULTIMATE MINING HUB (ВЕРСИЯ ДЛЯ DELTA EXECUTOR)
-- ЧАСТЬ 1.1: ИНИЦИАЛИЗАЦИЯ И СТАРТ ГЛОБАЛЬНОЙ БАЗЫ ДАННЫХ
-- =============================================================================

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

-- АВТО-ВКЛЮЧЕНИЕ ТАЙМЕРА СБРОСА ШАХТЫ (COLLAPSE VISIBLE)
task.spawn(function()
    task.wait(2) 
    pcall(function()
        local playerGui = localPlayer:WaitForChild("PlayerGui", 5)
        local screenGui = playerGui and playerGui:FindFirstChild("ScreenGui")
        if screenGui then
            local gameCollapseTimer = screenGui:FindFirstChild("Collapse")
            if gameCollapseTimer then
                gameCollapseTimer.Visible = true
                for _, child in ipairs(gameCollapseTimer:GetChildren()) do
                    if child:IsA("TextLabel") or child:IsA("Frame") then
                        child.Visible = true
                    end
                end
                print("[HUB]: Collapse timer is now visible for free!")
            end
        end
    end)
end)

-- ГЛОБАЛЬНЫЙ СЛОВАРЬ МИРОВ, СЛОЕВ И СУНДУКОВ (НАЧАЛО)
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

    -- 1. HOME WORLD (УНИКАЛЬНЫЕ РУДЫ)
    ["fossils"] = {{world = "Home World", layer = 2, prettyName = "Fossils"}}, 
    ["dinosaur bones"] = {{world = "Home World", layer = 2, prettyName = "Dinosaur Bones"}}, 
    ["skeleton stone"] = {{world = "Home World", layer = 4, prettyName = "Skeleton Stone"}}, 
    ["pezzottaite"] = {{world = "Home World", layer = 5, prettyName = "Pezzottaite"}}, 
    ["shadow stone"] = {{world = "Home World", layer = 9, prettyName = "Shadow Stone"}}, 
    ["illuminite"] = {{world = "Home World", layer = 9, prettyName = "Illuminite"}}, 
    ["rainbowite"] = {{world = "Home World", layer = 9, prettyName = "Rainbowite"}},

    -- 2. MAGIC FOREST (УНИКАЛЬНЫЕ РУДЫ)
    ["twig ore"] = {{world = "Magic Forest", layer = 2, prettyName = "Twig Ore"}},
    ["magic wand"] = {{world = "Magic Forest", layer = 2, prettyName = "Magic Wand"}},
    ["gold ring ore"] = {{world = "Magic Forest", layer = 2, prettyName = "Gold Ring Ore"}},
    ["lily pad"] = {{world = "Magic Forest", layer = 3, prettyName = "Lily Pad"}},
    ["log ore"] = {{world = "Magic Forest", layer = 5, prettyName = "Log Ore"}},
    ["chest ore"] = {{world = "Magic Forest", layer = 5, prettyName = "Chest Ore"}},
    ["unicorn horn ore"] = {{world = "Magic Forest", layer = 5, prettyName = "Unicorn Horn Ore"}},
    ["mushroom ore"] = {{world = "Magic Forest", layer = 6, prettyName = "Mushroom Ore"}},
    ["orb ore"] = {{world = "Magic Forest", layer = 8, prettyName = "Orb Ore"}},

    -- 3. SPACE ADVENTURE (УНИКАЛЬНЫЕ РУДЫ)
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

     -- 4. DINO LAND (УНИКАЛЬНЫЕ РУДЫ)
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

    -- 5. LAVA WORLD (УНИКАЛЬНЫЕ РУДЫ)
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

    -- 6. FOOD LAND (УНИКАЛЬНЫЕ РУДЫ)
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

    -- 7. TOY LAND (УНИКАЛЬНЫЕ РУДЫ)
    ["plastic"] = {{world = "Toy Land", layer = 1, prettyName = "Plastic"}},
    ["block ore"] = {{world = "Toy Land", layer = 2, prettyName = "Block Ore"}},
    ["gun ore"] = {{world = "Toy Land", layer = 2, prettyName = "Gun Ore"}},
    ["puzzle ore"] = {{world = "Toy Land", layer = 3, prettyName = "Puzzle Ore"}},
    ["car ore"] = {{world = "Toy Land", layer = 4, prettyName = "Car Ore"}},
    ["spaceship ore"] = {{world = "Toy Land", layer = 5, prettyName = "Spaceship Ore"}},
    ["airplane ore"] = {{world = "Toy Land", layer = 5, prettyName = "Airplane Ore"}},
    ["tank ore"] = {{world = "Toy Land", layer = 6, prettyName = "Tank Ore"}},
    ["teddybear ore"] = {{world = "Toy Land", layer = 6, prettyName = "Teddybear Ore"}},

    -- 8. ATLANTIS (УНИКАЛЬНЫЕ РУДЫ)
    ["ancient stone"] = {{world = "Atlantis", layer = 1, prettyName = "Ancient Stone"}},
    ["seaweed"] = {{world = "Atlantis", layer = 2, prettyName = "Seaweed"}},
    ["kelp"] = {{world = "Atlantis", layer = 3, prettyName = "Kelp"}},
    ["golden coins"] = {{world = "Atlantis", layer = 3, prettyName = "Golden Coins"}},
    ["anchors"] = {{world = "Atlantis", layer = 3, prettyName = "Anchors"}},
    ["starfish"] = {{world = "Atlantis", layer = 3, prettyName = "Starfish"}},
    ["pearls"] = {{world = "Atlantis", layer = 5, prettyName = "Pearls"}},
    ["ancient artifact"] = {{world = "Atlantis", layer = 7, prettyName = "Ancient Artifact"}},
    ["ancient gem"] = {{world = "Atlantis", layer = 8, prettyName = "Ancient Gem"}},

    -- 9. CRYSTAL CAVERN (УНИКАЛЬНЫЕ РУДЫ)
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

    -- 10. THE BEACH (УНИКАЛЬНЫЕ РУДЫ)
    ["sunscreen ore"] = {{world = "The Beach", layer = 2, prettyName = "Sunscreen Ore"}},
    ["shovel ore"] = {{world = "The Beach", layer = 2, prettyName = "Shovel Ore"}},
    ["sunglasses"] = {{world = "The Beach", layer = 3, prettyName = "Sunglasses"}},
    ["surfboard ore"] = {{world = "The Beach", layer = 4, prettyName = "Surfboard Ore"}},
    ["ice cream"] = {{world = "The Beach", layer = 6, prettyName = "Ice Cream"}},
    ["chlorite"] = {{world = "The Beach", layer = 6, prettyName = "Chlorite"}},
    ["ice pop"] = {{world = "The Beach", layer = 6, prettyName = "Ice Pop"}},
    ["mithril"] = {{world = "The Beach", layer = 7, prettyName = "Mithril"}},
    ["orcalium"] = {{world = "The Beach", layer = 8, prettyName = "Orcalium"}},

    -- 11. CANDY LAND (УНИКАЛЬНЫЕ РУДЫ)
    ["icing"] = {{world = "Candy Land", layer = 1, prettyName = "Icing"}},
    ["peppermint"] = {{world = "Candy Land", layer = 2, prettyName = "Peppermint"}},
    ["skittles ore"] = {{world = "Candy Land", layer = 3, prettyName = "Skittles Ore"}},
    ["jellybean stone"] = {{world = "Candy Land", layer = 3, prettyName = "Jellybean Stone"}},
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

-- =============================================================================
-- ЧАСТЬ 2: СОЗДАНИЕ КРАСИВОГО ИНТЕРФЕЙСА (ГЛАВНОЕ МЕНЮ И СКАНЕР)
-- =============================================================================
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
searchBox.Size = UDim2.new(1, -40, 0, 25) -- Сужено для кнопки Wiki
searchBox.Position = UDim2.new(0, 5, 0, 5)
searchBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
searchBox.Text = ""
searchBox.PlaceholderText = "Search block..."
searchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
searchBox.TextSize = 13
searchBox.ClearTextOnFocus = false
searchBox.Parent = scanFrame
Instance.new("UICorner", searchBox).CornerRadius = UDim.new(0, 4)

local wikiBtn = Instance.new("TextButton")
wikiBtn.Size = UDim2.new(0, 25, 0, 25)
wikiBtn.Position = UDim2.new(1, -30, 0, 5)
wikiBtn.BackgroundColor3 = Color3.fromRGB(60, 110, 60)
wikiBtn.Text = "🔍"
wikiBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
wikiBtn.Font = Enum.Font.SourceSansBold
wikiBtn.TextSize = 14
wikiBtn.Parent = scanFrame
Instance.new("UICorner", wikiBtn).CornerRadius = UDim.new(0, 4)

local wikiInfoLabel = Instance.new("TextLabel")
wikiInfoLabel.Size = UDim2.new(1, -10, 0, 50)
wikiInfoLabel.Position = UDim2.new(0, 5, 0, 65)
wikiInfoLabel.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
wikiInfoLabel.TextColor3 = Color3.fromRGB(100, 215, 100)
wikiInfoLabel.TextSize = 12
wikiInfoLabel.Font = Enum.Font.SourceSansItalic
wikiInfoLabel.TextWrapped = true
wikiInfoLabel.Visible = false
wikiInfoLabel.Parent = scanFrame
Instance.new("UICorner", wikiInfoLabel).CornerRadius = UDim.new(0, 4)

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
scanScroll.Size = UDim2.new(1, -10, 1, -130)
scanScroll.Position = UDim2.new(0, 5, 0, 120)
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
scrollingFrame.Size = UDim2.new(1, -10, 1, -265) -- Изменено, чтобы влезли новые кнопки
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

-- =============================================================================
-- ЧАСТЬ 3: КНОПКИ УПРАВЛЕНИЯ, ПЕРЕМЕННЫЕ СОСТОЯНИЙ И ПЛАТФОРМА
-- =============================================================================
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

local standaloneRebirthBtn = Instance.new("TextButton")
standaloneRebirthBtn.Size = UDim2.new(0, 155, 0, 30)
standaloneRebirthBtn.Position = UDim2.new(0, 10, 1, -115)
standaloneRebirthBtn.BackgroundColor3 = Color3.fromRGB(150, 80, 30)
standaloneRebirthBtn.Text = "Lava Rebirth: OFF"
standaloneRebirthBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
standaloneRebirthBtn.Font = Enum.Font.SourceSansBold
standaloneRebirthBtn.TextSize = 13
standaloneRebirthBtn.Parent = contentFrame
Instance.new("UICorner", standaloneRebirthBtn).CornerRadius = UDim.new(0, 5)

local toggleBackgroundRebirthBtn = Instance.new("TextButton")
toggleBackgroundRebirthBtn.Size = UDim2.new(0, 155, 0, 30)
toggleBackgroundRebirthBtn.Position = UDim2.new(0, 175, 1, -115)
toggleBackgroundRebirthBtn.BackgroundColor3 = Color3.fromRGB(80, 40, 120)
toggleBackgroundRebirthBtn.Text = "BG Rebirth: OFF"
toggleBackgroundRebirthBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBackgroundRebirthBtn.Font = Enum.Font.SourceSansBold
toggleBackgroundRebirthBtn.TextSize = 13
toggleBackgroundRebirthBtn.Parent = contentFrame
Instance.new("UICorner", toggleBackgroundRebirthBtn).CornerRadius = UDim.new(0, 5)

local boostFpsBtn = Instance.new("TextButton")
boostFpsBtn.Size = UDim2.new(1, -20, 0, 30)
boostFpsBtn.Position = UDim2.new(0, 10, 1, -150)
boostFpsBtn.BackgroundColor3 = Color3.fromRGB(40, 110, 110)
boostFpsBtn.Text = "Boost FPS: OFF"
boostFpsBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
boostFpsBtn.Font = Enum.Font.SourceSansBold
boostFpsBtn.TextSize = 13
boostFpsBtn.Parent = contentFrame
Instance.new("UICorner", boostFpsBtn).CornerRadius = UDim.new(0, 5)

local autoEquipEggBtn = Instance.new("TextButton")
autoEquipEggBtn.Size = UDim2.new(1, -20, 0, 30)
autoEquipEggBtn.Position = UDim2.new(0, 10, 1, -225)
autoEquipEggBtn.BackgroundColor3 = Color3.fromRGB(110, 40, 80)
autoEquipEggBtn.Text = "Auto-Equip Next Egg: OFF"
autoEquipEggBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
autoEquipEggBtn.Font = Enum.Font.SourceSansBold
autoEquipEggBtn.TextSize = 13
autoEquipEggBtn.Parent = contentFrame
Instance.new("UICorner", autoEquipEggBtn).CornerRadius = UDim.new(0, 5)

local saveConfigBtn = Instance.new("TextButton")
saveConfigBtn.Size = UDim2.new(0, 155, 0, 30)
saveConfigBtn.Position = UDim2.new(0, 10, 1, -190)
saveConfigBtn.BackgroundColor3 = Color3.fromRGB(45, 90, 145)
saveConfigBtn.Text = "💾 Save Config"
saveConfigBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
saveConfigBtn.Font = Enum.Font.SourceSansBold
saveConfigBtn.TextSize = 13
saveConfigBtn.Parent = contentFrame
Instance.new("UICorner", saveConfigBtn).CornerRadius = UDim.new(0, 5)

local loadConfigBtn = Instance.new("TextButton")
loadConfigBtn.Size = UDim2.new(0, 155, 0, 30)
loadConfigBtn.Position = UDim2.new(0, 175, 1, -190)
loadConfigBtn.BackgroundColor3 = Color3.fromRGB(120, 95, 45)
loadConfigBtn.Text = "📂 Load Config"
loadConfigBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
loadConfigBtn.Font = Enum.Font.SourceSansBold
loadConfigBtn.TextSize = 13
loadConfigBtn.Parent = contentFrame
Instance.new("UICorner", loadConfigBtn).CornerRadius = UDim.new(0, 5)

local trackedBlocks = {} 
local isAutoMining = false
local isSmartRebirthing = false
local isBackgroundRebirthEnabled = false
local isFpsBoostEnabled = false
local isAutoEquipEggEnabled = false
local connection = nil
local createBlockRowGlobal = nil 

local safePlatform = Instance.new("Part")
safePlatform.Size = Vector3.new(4, 1, 4)
safePlatform.Anchored = true
safePlatform.Transparency = 1
safePlatform.CanCollide = true
safePlatform.Parent = workspace

-- =============================================================================
-- ЧАСТЬ 4: ПЕРЕХВАТЧИК REМОТЕ И ФУНКЦИЯ ПАКЕТНОГО КОПАНИЯ (DIG BLOCK)
-- =============================================================================
local mainRemote = nil

-- Сканируем ReplicatedStorage для перехвата скрытого RemoteEvent игры
for _, child in ipairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
    if child:IsA("RemoteEvent") then
        mainRemote = child
        break
    end
end

local function digBlock(blockModel)
    if not blockModel or not mainRemote then return end
    local targetPart = blockModel:FindFirstChild("ColorPart") or blockModel:FindFirstChild("Part") or blockModel:FindFirstChildOfClass("BasePart")
    if not targetPart then return end
    
    local character = localPlayer.Character
    local rootPart = character and character:FindFirstChild("HumanoidRootPart")
    
    if rootPart then
        -- Умный 3D-поиск свободной зоны вокруг блока (сверху, сбоку, снизу)
        local offsets = {
            CFrame.new(0, 5, 0),    -- Сверху (стоим НА блоке)
            CFrame.new(4, 0, 0),    -- Справа
            CFrame.new(-4, 0, 0),   -- Слева
            CFrame.new(0, 0, 4),    -- Спереди
            CFrame.new(0, 0, -4),   -- Сзади
            CFrame.new(0, -5, 0)    -- Снизу (под блоком)
        }
        
        local safeCFrame = targetPart.CFrame * CFrame.new(0, -4.5, 0)
        local isStandingOnTop = false
        
        local raycastParams = RaycastParams.new()
        raycastParams.FilterType = Enum.RaycastFilterType.Include
        raycastParams.FilterDescendantsInstances = {blocksFolder}
        
        for i, offset in ipairs(offsets) do
            local checkPos = (targetPart.CFrame * offset).Position
            local hit = workspace:Raycast(checkPos + Vector3.new(0, 2, 0), Vector3.new(0, -4, 0), raycastParams)
            if not hit then
                safeCFrame = targetPart.CFrame * offset
                if i == 1 then isStandingOnTop = true end
                break
            end
        end

        -- Первичный телепорт к блоку и настройка опоры
        if isStandingOnTop then
            safePlatform.CFrame = CFrame.new(0, -9999, 0) -- Прячем пол, стоим на самом блоке
        else
            safePlatform.CFrame = safeCFrame * CFrame.new(0, -1, 0) -- Ставим пол под ноги
        end
        
        rootPart.CFrame = safeCFrame * CFrame.new(0, 1, 0)
        rootPart.Velocity = Vector3.new(0, 0, 0)
        task.wait(0.05)

        -- ЦИКЛ МГНОВЕННОГО УНИЧТОЖЕНИЯ БЛОКА ЧЕРЕЗ СЕТЕВЫЕ ПАКЕТЫ
        while blockModel and blockModel.Parent == blocksFolder and (isAutoMining or isSmartRebirthing) do
            -- Проверка на жесткий отброс античитом (возвращаем обратно)
            if (rootPart.Position - safeCFrame.Position).Magnitude > 15 then
                rootPart.CFrame = safeCFrame * CFrame.new(0, 1, 0)
                rootPart.Velocity = Vector3.new(0, 0, 0)
            end
            
            -- Удерживаем платформу, только если мы не на блоке сверху
            if not isStandingOnTop then
                safePlatform.CFrame = safeCFrame * CFrame.new(0, -1, 0)
            else
                safePlatform.CFrame = CFrame.new(0, -9999, 0)
            end
            
            -- Сигнализируем серверу о поломке блока по протоколу Watzz (3 удара за итерацию)
            mainRemote:FireServer("MineBlock", {{blockModel}})
            mainRemote:FireServer("MineBlock", {{blockModel}})
            mainRemote:FireServer("MineBlock", {{blockModel}})
            
            task.wait(0.03)
        end
        
        safePlatform.CFrame = CFrame.new(0, -9999, 0)
    end
end

-- =============================================================================
-- ЧАСТЬ 5: АВТОФАРМ ПОД СЕБЯ, ПОТОКИ REBIRTH / SELL И ЦИКЛ 12 МИРОВ
-- =============================================================================
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

-- 1. СЕТЕВОЙ ЦИКЛ ОБРАБОТКИ ПЕРЕРОЖДЕНИЙ И СДАЧИ РЕСУРСОВ
task.spawn(function()
    while true do
        task.wait(0.4)
        if mainRemote then
            if isAutoMining or isSmartRebirthing then
                mainRemote:FireServer("SellItems", {{}})
            end
            if isAutoMining and isBackgroundRebirthEnabled then
                mainRemote:FireServer("Rebirth", {{}})
            end
            if isSmartRebirthing then
                mainRemote:FireServer("Rebirth", {{}})
            end
        end
    end
end)

-- 2. ГЛАВНЫЙ БЕСКОНЕЧНЫЙ ЦИКЛ ПОИСКА И СКАНИРОВАНИЯ КАРТЫ
task.spawn(function()
    while true do
        task.wait(0.1)
        
        -- РЕЖИМ 1: ЛАВОВЫЙ STANDALONE-ФАРМ РЕБЁРТХОВ
        if isSmartRebirthing then
            local inLavaWorld = false
            for _, child in ipairs(blocksFolder:GetChildren()) do
                if child:IsA("Model") and (child.Name:lower() == "lava block" or child.Name:lower() == "gem block") then
                    inLavaWorld = true
                    break
                end
            end
            
            if not inLavaWorld then
                isSmartRebirthing = false
                standaloneRebirthBtn.BackgroundColor3 = Color3.fromRGB(150, 90, 40)
                standaloneRebirthBtn.Text = "Please TP to: Lava World"
                local character = localPlayer.Character
                if character and character:FindFirstChild("HumanoidRootPart") then character.HumanoidRootPart.Anchored = false end
                continue
            end
            digStraightDown()
            
        -- РЕЖИМ 2: СТАНДАРТНЫЙ АВТОФАРМ ИЗ СПИСКА TRACKED BLOCKS
        elseif isAutoMining then
            local targetFound = nil
            local targetOreName = ""
            
            for lowerName, _ in pairs(trackedBlocks) do
                targetOreName = lowerName
                break
            end
            
            if targetOreName == "" then
                isAutoMining = false
                autoMineBtn.BackgroundColor3 = Color3.fromRGB(150, 40, 40)
                autoMineBtn.Text = "Auto-Mine: OFF (List Empty)"
                continue
            end
            
            for _, child in ipairs(blocksFolder:GetChildren()) do
                if child:IsA("Model") and child.Name:lower() == targetOreName then
                    targetFound = child
                    break
                end
            end
            
            if targetFound then
                digBlock(targetFound)
            else
                local oreInfoArray = oreToWorldMap[targetOreName]
                local currentMapHasLocalBlocks = false
                local estimatedWorld = nil
                
                if oreInfoArray then
                    for _, location in ipairs(oreInfoArray) do
                        estimatedWorld = location.world
                        for _, child in ipairs(blocksFolder:GetChildren()) do
                            if child:IsA("Model") then
                                local mapOreData = oreToWorldMap[child.Name:lower()]
                                if mapOreData then
                                    for _, mapLoc in ipairs(mapOreData) do
                                        if mapLoc.world == estimatedWorld then
                                            currentMapHasLocalBlocks = true
                                            break
                                        end
                                    end
                                end
                            end
                            if currentMapHasLocalBlocks then break end
                        end
                        if currentMapHasLocalBlocks then break end
                    end
                end
                
                if estimatedWorld and not currentMapHasLocalBlocks then
                    isAutoMining = false
                    autoMineBtn.BackgroundColor3 = Color3.fromRGB(150, 90, 40)
                    autoMineBtn.Text = "Please teleport to: " .. estimatedWorld
                    local character = localPlayer.Character
                    if character and character:FindFirstChild("HumanoidRootPart") then character.HumanoidRootPart.Anchored = false end
                else
                    digStraightDown()
                end
            end
        else
            local character = localPlayer.Character
            local rootPart = character and character:FindFirstChild("HumanoidRootPart")
            if rootPart and rootPart.Anchored then rootPart.Anchored = false end
        end
    end
end)

-- =============================================================================
-- ЧАСТЬ 6: СИСТЕМА ДИНАМИЧЕСКОГО 3D ESP И ОРБИТАЛЬНЫЙ КОМПАС (НАВИГАТОР)
-- =============================================================================
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
                billboard.Size = UDim2.new(0, 50, 0, 35)
                billboard.AlwaysOnTop = true
                billboard.MaxDistance = 150
                
                local point = Instance.new("Frame")
                point.Size = UDim2.new(0, 10, 0, 10)
                point.Position = UDim2.new(0.5, -5, 0, 0)
                point.BackgroundColor3 = data.color
                Instance.new("UICorner", point).CornerRadius = UDim.new(1, 0)
                point.Parent = billboard
                
                local distLabel = Instance.new("TextLabel")
                distLabel.Name = "DistanceText"
                distLabel.Size = UDim2.new(1, 0, 0, 15)
                distLabel.Position = UDim2.new(0, 0, 0, 12)
                distLabel.BackgroundTransparency = 1
                distLabel.Text = "0m"
                distLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                distLabel.TextSize = 11
                distLabel.Font = Enum.Font.SourceSansBold
                distLabel.Parent = billboard
                
                local stroke = Instance.new("UIStroke")
                stroke.Thickness = 1.2
                stroke.Color = Color3.fromRGB(0, 0, 0)
                stroke.Parent = distLabel
                
                billboard.Parent = colorPart
                
                task.spawn(function()
                    while billboard and billboard.Parent and child.Parent == blocksFolder do
                        local character = localPlayer.Character
                        local rootPart = character and character:FindFirstChild("HumanoidRootPart")
                        if rootPart and colorPart then
                            local dist = (rootPart.Position - colorPart.Position).Magnitude
                            distLabel.Text = string.format("%dm", math.floor(dist))
                        end
                        task.wait(0.2)
                    end
                end)
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

local runService = game:GetService("RunService")
local indicatorsFolder = Instance.new("ScreenGui")
indicatorsFolder.Name = "MiningDamageStyleIndicators"
indicatorsFolder.ResetOnSpawn = false
indicatorsFolder.Parent = game:GetService("CoreGui") or localPlayer:WaitForChild("PlayerGui")

local activeIndicators = {}

local function createArrowIndicator(id, blockColor)
    local arrow = Instance.new("TextLabel")
    arrow.Name = "Indicator_" .. tostring(id)
    arrow.Size = UDim2.new(0, 20, 0, 20)
    arrow.AnchorPoint = Vector2.new(0.5, 0.5)
    arrow.BackgroundTransparency = 1
    arrow.Text = "▲"
    arrow.TextColor3 = blockColor
    arrow.TextSize = 20
    arrow.Font = Enum.Font.SourceSansBold
    arrow.Parent = indicatorsFolder
    
    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 1.5
    stroke.Color = Color3.fromRGB(0, 0, 0)
    stroke.Parent = arrow
    
    return arrow
end

runService.RenderStepped:Connect(function()
    if isAutoMining or isSmartRebirthing then
        for _, arrow in pairs(activeIndicators) do arrow:Destroy() end
        table.clear(activeIndicators)
        return
    end

    local character = localPlayer.Character
    local rootPart = character and character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end

    local validTargets = {}
    for _, child in ipairs(blocksFolder:GetChildren()) do
        if child:IsA("Model") then
            local data = trackedBlocks[child.Name:lower()]
            if data then
                local colorPart = child:FindFirstChild("ColorPart") or child:FindFirstChild("Part")
                if colorPart then
                    table.insert(validTargets, {part = colorPart, color = data.color, id = child})
                end
            end
        end
    end

    for id, arrow in pairs(activeIndicators) do
        local stillExists = false
        for _, t in ipairs(validTargets) do
            if t.id == id then stillExists = true break end
        end
        if not stillExists then
            arrow:Destroy()
            activeIndicators[id] = nil
        end
    end

    local viewportSize = camera.ViewportSize
    local screenCenter = Vector2.new(viewportSize.X / 2, viewportSize.Y / 2)
    local orbitRadius = 110 

    for _, target in ipairs(validTargets) do
        local blockPos = target.part.Position
        local screenPos, onScreen = camera:WorldToViewportPoint(blockPos)
        local distance = (rootPart.Position - blockPos).Magnitude
        
        if (not onScreen or screenPos.Z < 0) and distance < 120 then
            if not activeIndicators[target.id] then
                activeIndicators[target.id] = createArrowIndicator(target.id, target.color)
            end
            
            local arrow = activeIndicators[target.id]
            arrow.Visible = true

            local camCFrame = camera.CFrame
            local objectDir = (blockPos - camCFrame.Position).Unit
            local xDot = objectDir:Dot(camCFrame.RightVector)
            local yDot = objectDir:Dot(camCFrame.UpVector)
            local angle = math.atan2(xDot, yDot)
            
            local targetX = screenCenter.X + math.sin(angle) * orbitRadius
            local targetY = screenCenter.Y - math.cos(angle) * orbitRadius
            
            arrow.Position = UDim2.new(0, targetX, 0, targetY)
            arrow.Rotation = math.deg(angle)
        else
            if activeIndicators[target.id] then
                activeIndicators[target.id].Visible = false
            end
        end
    end
end)

-- =============================================================================
-- ЧАСТЬ 7: ЛОГИКА ГЛОБАЛЬНОГО СКАНЕРА КАРТЫ, WIKI-ЛУПЫ И СТРОК УПРАВЛЕНИЯ
-- =============================================================================
local function refreshScanner()
    for _, child in ipairs(scanScroll:GetChildren()) do
        if child:IsA("Frame") then child:Destroy() end
    end
    
    local searchText = searchBox.Text:lower()
    local currentCounts = {}
    
    for _, child in ipairs(blocksFolder:GetChildren()) do
        if child:IsA("Model") then
            currentCounts[child.Name:lower()] = (currentCounts[child.Name:lower()] or 0) + 1
        end
    end
    
    for internalName, locations in pairs(oreToWorldMap) do
        local locData = type(locations) == "table" and (locations[1] or locations) or {}
        local pretty = locData.prettyName or (internalName:sub(1,1):upper() .. internalName:sub(2))
        
        if searchText == "" or string.find(internalName, searchText) then
            local mapCount = currentCounts[internalName] or 0
            
            local itemFrame = Instance.new("Frame")
            itemFrame.Size = UDim2.new(1, -10, 0, 25)
            itemFrame.BackgroundTransparency = 1
            itemFrame.Parent = scanScroll
            
            local clickBtn = Instance.new("TextButton")
            clickBtn.Size = UDim2.new(1, 0, 1, 0)
            clickBtn.BackgroundTransparency = 0.9
            clickBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            clickBtn.Text = string.format(" %s: %d", pretty, mapCount)
            clickBtn.TextColor3 = mapCount > 0 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(130, 130, 130)
            clickBtn.TextXAlignment = Enum.TextXAlignment.Left
            clickBtn.Font = Enum.Font.SourceSans
            clickBtn.TextSize = 14
            clickBtn.Parent = itemFrame
            Instance.new("UICorner", clickBtn).CornerRadius = UDim.new(0, 4)
            
            clickBtn.MouseButton1Click:Connect(function()
                if createBlockRowGlobal then
                    createBlockRowGlobal(pretty, math.random(50,255), math.random(50,255), math.random(50,255))
                end
            end)
        end
    end
    scanScroll.CanvasSize = UDim2.new(0, 0, 0, scanListLayout.AbsoluteContentSize.Y + 5)
end

wikiBtn.MouseButton1Click:Connect(function()
    local text = searchBox.Text:lower()
    if text == "" then
        wikiInfoLabel.Visible = false
        return
    end
    
    local matchedOre = nil
    for k, v in pairs(oreToWorldMap) do
        if string.find(k, text) then matchedOre = v break end
    end
    
    if matchedOre then
        local infoText = "Found in:\n"
        if matchedOre[1] then
            for _, loc in ipairs(matchedOre) do
                infoText = infoText .. string.format("• %s (Layer: %d+)\n", loc.world, loc.layer)
            end
        else
            infoText = infoText .. string.format("• %s (Layer: %d+)\n", matchedOre.world, matchedOre.layer)
        end
        wikiInfoLabel.Text = infoText
        wikiInfoLabel.Visible = true
    else
        wikiInfoLabel.Text = "Ore not found in global database."
        wikiInfoLabel.Visible = true
    end
end)

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

-- =============================================================================
-- ЧАСТЬ 8: ФИНАЛЬНЫЕ ОБРАБОТЧИКИ КНОПОК, МАСКИРОВКА И КОНФИГИ (JSON)
-- =============================================================================
toggleBtn.MouseButton1Click:Connect(function()
    local isMinimized = (mainFrame.Size.Y.Offset == 40)
    isMinimized = not isMinimized
    mainFrame.Size = isMinimized and UDim2.new(0, 350, 0, 40) or UDim2.new(0, 350, 0, 280)
    contentFrame.Visible = not isMinimized
    scanFrame.Visible = false
    toggleBtn.Text = isMinimized and "+" or "−"
end)

-- 1. Исправление кнопки обычного Авто-Майна
autoMineBtn.MouseButton1Click:Connect(function()
    isAutoMining = not isAutoMining
    if isAutoMining then
        if isSmartRebirthing then 
            isSmartRebirthing = false 
            standaloneRebirthBtn.BackgroundColor3 = Color3.fromRGB(150, 80, 30) 
            standaloneRebirthBtn.Text = "Lava Rebirth: OFF" 
        end
        autoMineBtn.BackgroundColor3 = Color3.fromRGB(45, 120, 45)
        autoMineBtn.Text = "Auto-Mine: ON"
    else
        autoMineBtn.BackgroundColor3 = Color3.fromRGB(150, 40, 40)
        autoMineBtn.Text = "Auto-Mine: OFF"
        if mainRemote then mainRemote:FireServer("MineBlock", {}) end
    end
end)

-- =============================================================================
-- ИСПРАВЛЕННЫЕ И ДОБАВЛЕННЫЕ ОБРАБОТЧИКИ КНОПОК (ВСТАВИТЬ В КОНЕЦ ЧАСТИ 8)
-- =============================================================================

-- 2. ДОБАВЛЕНО: Обработчик для Лавового Ребёртх-Фарма (Lava Rebirth)
standaloneRebirthBtn.MouseButton1Click:Connect(function()
    isSmartRebirthing = not isSmartRebirthing
    if isSmartRebirthing then
        if isAutoMining then 
            isAutoMining = false 
            autoMineBtn.BackgroundColor3 = Color3.fromRGB(150, 40, 40) 
            autoMineBtn.Text = "Auto-Mine: OFF" 
        end
        standaloneRebirthBtn.BackgroundColor3 = Color3.fromRGB(45, 120, 45)
        standaloneRebirthBtn.Text = "Lava Rebirth: ON"
    else
        standaloneRebirthBtn.BackgroundColor3 = Color3.fromRGB(150, 80, 30)
        standaloneRebirthBtn.Text = "Lava Rebirth: OFF"
        local character = localPlayer.Character
        if character and character:FindFirstChild("HumanoidRootPart") then 
            character.HumanoidRootPart.Anchored = false 
        end
    end
end)

-- 3. ДОБАВЛЕНО: Обработчик фонового перерождения (BG Rebirth)
toggleBackgroundRebirthBtn.MouseButton1Click:Connect(function()
    isBackgroundRebirthEnabled = not isBackgroundRebirthEnabled
    if isBackgroundRebirthEnabled then
        toggleBackgroundRebirthBtn.BackgroundColor3 = Color3.fromRGB(45, 120, 45)
        toggleBackgroundRebirthBtn.Text = "BG Rebirth: ON"
    else
        toggleBackgroundRebirthBtn.BackgroundColor3 = Color3.fromRGB(80, 40, 120)
        toggleBackgroundRebirthBtn.Text = "BG Rebirth: OFF"
    end
end)

-- 4. ДОБАВЛЕНО: Обработчик авто-экипировки яиц (Auto-Equip Egg)
autoEquipEggBtn.MouseButton1Click:Connect(function()
    isAutoEquipEggEnabled = not isAutoEquipEggEnabled
    if isAutoEquipEggEnabled then
        autoEquipEggBtn.BackgroundColor3 = Color3.fromRGB(45, 120, 45)
        autoEquipEggBtn.Text = "Auto-Equip Next Egg: ON"
    else
        autoEquipEggBtn.BackgroundColor3 = Color3.fromRGB(110, 40, 80)
        autoEquipEggBtn.Text = "Auto-Equip Next Egg: OFF"
    end
end)


boostFpsBtn.MouseButton1Click:Connect(function()
    if isFpsBoostEnabled then return end
    isFpsBoostEnabled = true
    boostFpsBtn.BackgroundColor3 = Color3.fromRGB(45, 120, 45)
    boostFpsBtn.Text = "⚡ FPS Boosted! (Smooth Mode)"
    if setfpscap then setfpscap(240) end
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    game:GetService("Lighting").GlobalShadows = false
    game:GetService("Lighting").FogEnd = 9e9
    game:GetService("Lighting").Brightness = 1
    for _, effect in ipairs(game:GetService("Lighting"):GetChildren()) do
        if effect:IsA("BloomEffect") or effect:IsA("ColorCorrectionEffect") or effect:IsA("DepthOfFieldEffect") or effect:IsA("SunRaysEffect") or effect:IsA("BlurEffect") then
            effect.Enabled = false
        end
    end
    local terrain = workspace:FindFirstChildOfClass("Terrain")
    if terrain then terrain.WaterWaveSize, terrain.WaterWaveSpeed, terrain.WaterReflectance, terrain.WaterTransparency = 0, 0, 0, 0 end
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") then
            obj.Material = Enum.Material.SmoothPlastic
            obj.Reflectance, obj.CastShadow = 0, false
        elseif obj:IsA("Texture") or obj:IsA("Decal") then
            obj:Destroy()
        elseif obj:IsA("ParticleEmitter") or obj:IsA("Beam") or obj:IsA("Trail") or obj:IsA("Explosion") then
            obj.Enabled = false
        elseif obj:IsA("MeshPart") then
            obj.TextureID = ""
            obj.Material = Enum.Material.SmoothPlastic
        end
    end
    for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
        if player ~= localPlayer and player.Character then
            for _, obj in ipairs(player.Character:GetDescendants()) do
                if obj:IsA("Accessory") or obj:IsA("Hat") or obj:IsA("Clothing") or obj:IsA("Animator") then obj:Destroy() end
            end
        end
    end
end)

local httpService = game:GetService("HttpService")
local configFileName = "UltimateMiningHub_Config.txt"

local function saveCurrentConfig()
    if not writefile then saveConfigBtn.Text = "❌ Not Supported" task.wait(1.5) saveConfigBtn.Text = "💾 Save Config" return end
    local dataToSave = {}
    for lowerName, info in pairs(trackedBlocks) do
        dataToSave[lowerName] = {
            originalName = info.originalName,
            colorRGB = {info.color.R * 255, info.color.G * 255, info.color.B * 255}
        }
    end
    local success, jsonString = pcall(function() return httpService:JSONEncode(dataToSave) end)
    if success then
        writefile(configFileName, jsonString)
        saveConfigBtn.BackgroundColor3 = Color3.fromRGB(45, 120, 45)
        saveConfigBtn.Text = "✅ Config Saved!"
        task.wait(1)
        saveConfigBtn.BackgroundColor3 = Color3.fromRGB(45, 90, 145)
        saveConfigBtn.Text = "💾 Save Config"
    end
end

local function loadSavedConfig()
    if not readfile or not isfile then loadConfigBtn.Text = "❌ Not Supported" task.wait(1.5) loadConfigBtn.Text = "📂 Load Config" return end
    if not isfile(configFileName) then loadConfigBtn.Text = "❌ No File Found" task.wait(1.5) loadConfigBtn.Text = "📂 Load Config" return end
    local fileContent = readfile(configFileName)
    local success, decodedData = pcall(function() return httpService:JSONDecode(fileContent) end)
    if success and decodedData then
        for _, child in ipairs(scrollingFrame:GetChildren()) do if child:IsA("Frame") then child:Destroy() end end
        table.clear(trackedBlocks)
        for lowerName, info in pairs(decodedData) do
            local r = info.colorRGB[1]
            local g = info.colorRGB[2]
            local b = info.colorRGB[3]
            if createBlockRowGlobal then createBlockRowGlobal(info.originalName, r, g, b) end
        end
        loadConfigBtn.BackgroundColor3 = Color3.fromRGB(45, 120, 45)
        loadConfigBtn.Text = "✅ Config Loaded!"
        task.wait(1)
        loadConfigBtn.BackgroundColor3 = Color3.fromRGB(120, 95, 45)
        loadConfigBtn.Text = "📂 Load Config"
    end
end

saveConfigBtn.MouseButton1Click:Connect(saveCurrentConfig)
loadConfigBtn.MouseButton1Click:Connect(loadSavedConfig)

task.spawn(function()
    while true do
        task.wait(1)
        pcall(function()
            local screenGui = localPlayer:WaitForChild("PlayerGui"):FindFirstChild("ScreenGui")
            if screenGui then
                local inventoryFrame = screenGui:FindFirstChild("InventoryFrame")
                if isAutoEquipEggEnabled and inventoryFrame and inventoryFrame.Visible == true then
                    if inventoryFrame:FindFirstChild("Items") then inventoryFrame.Items.Visible = false end
                    if inventoryFrame:FindFirstChild("Categories") then inventoryFrame.Categories.Visible = false end
                    if inventoryFrame:FindFirstChild("Search") then inventoryFrame.Search.Visible = false end
                    if inventoryFrame:FindFirstChild("SortBy") then inventoryFrame.SortBy.Visible = false end
                    inventoryFrame.BackgroundTransparency = 1
                    local closeBtn = inventoryFrame:FindFirstChild("Close")
                    if closeBtn then closeBtn.Visible = true closeBtn.BackgroundTransparency = 0 end
                elseif not isAutoEquipEggEnabled and inventoryFrame then
                    if inventoryFrame:FindFirstChild("Items") then inventoryFrame.Items.Visible = true end
                    if inventoryFrame:FindFirstChild("Categories") then inventoryFrame.Categories.Visible = true end
                    if inventoryFrame:FindFirstChild("Search") then inventoryFrame.Search.Visible = true end
                    if inventoryFrame:FindFirstChild("SortBy") then inventoryFrame.SortBy.Visible = true end
                    inventoryFrame.BackgroundTransparency = 0
                end
                if isAutoEquipEggEnabled then
                    local lootPage = screenGui:FindFirstChild("LootPage")
                    if lootPage and lootPage.Visible == true then
                        local panel = lootPage:FindFirstChild("Panel")
                        local actions = panel and panel:FindFirstChild("Actions")
                        local activateBtn = actions and actions:FindFirstChild("Activate")
                        if activateBtn and activateBtn:IsA("TextButton") then firesignal(activateBtn.MouseButton1Click) end
                    else
                        if inventoryFrame and inventoryFrame.Visible == true then
                            local itemsContainer = inventoryFrame:FindFirstChild("Items", true) and inventoryFrame.Items:FindFirstChild("Items")
                            if itemsContainer then
                                for _, item in ipairs(itemsContainer:GetChildren()) do
                                    local decore = item:FindFirstChild("Decore")
                                    local itemLevel = decore and decore:FindFirstChild("ItemLevel")
                                    if itemLevel and itemLevel.Text == "" then
                                        local clickArea = item:IsA("TextButton") and item or item:FindFirstChildOfClass("TextButton")
                                        if clickArea then firesignal(clickArea.MouseButton1Click) break end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)

task.spawn(function() task.wait(1.5) if readfile and isfile and isfile(configFileName) then loadSavedConfig() end end)
