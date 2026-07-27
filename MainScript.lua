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
-- ====================================================================
-- ЧАСТЬ 1: ИНИЦИАЛИЗАЦИЯ И ОСНОВНОЙ НАБОР СТИЛЕЙ GUI
-- ====================================================================
local desiredGravity = 196
local gravityLockEnabled = true

game:GetService("RunService").Stepped:Connect(function()
    if gravityLockEnabled and workspace.Gravity ~= desiredGravity then
        workspace.Gravity = desiredGravity
    end
end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local MarketplaceService = game:GetService("MarketplaceService")
local LocalPlayer = Players.LocalPlayer
local placeId = game.PlaceId

local trackedBlocks = {}
local activeEspGuis = {}

local function getCharacter()
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local hrp = character:WaitForChild("HumanoidRootPart")
    local humanoid = character:WaitForChild("Humanoid")
    return character, hrp, humanoid
end

local function createNotification(text)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.IgnoreGuiInset = true

    local Note = Instance.new("TextLabel")
    Note.Size = UDim2.new(0, 320, 0, 40)
    Note.Position = UDim2.new(0.5, -160, 0.1, -20)
    Note.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Note.TextColor3 = Color3.fromRGB(255, 255, 255)
    Note.Font = Enum.Font.GothamBold
    Note.TextScaled = true
    Note.Text = text
    Note.Parent = ScreenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = Note

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(0, 170, 255)
    stroke.Thickness = 2
    stroke.Parent = Note

    Note.BackgroundTransparency = 1
    Note.TextTransparency = 1
    for i = 1, 20 do
        Note.BackgroundTransparency = 1 - (i * 0.05)
        Note.TextTransparency = 1 - (i * 0.05)
        task.wait(0.02)
    end
    task.wait(3)
    for i = 1, 20 do
        Note.BackgroundTransparency = i * 0.05
        Note.TextTransparency = i * 0.05
        task.wait(0.02)
    end
    ScreenGui:Destroy()
end

-- Изменено приветствие по вашей просьбе
task.spawn(function()
    createNotification("Made by Watzz and Kirblox39")
end)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MiningSimPlusGUI"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- Главная панель (немного увеличена по Y для размещения 4-х новых кнопок меню)
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 280, 0, 290)
MainFrame.Position = UDim2.new(0.5, -140, 0.3, -145)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 12)
Corner.Parent = MainFrame

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(0, 170, 255)
Stroke.Thickness = 2
Stroke.Parent = MainFrame

MainFrame.Active = true
MainFrame.Draggable = true

local OpenButton = Instance.new("TextButton")
OpenButton.Size = UDim2.new(0, 30, 0, 60)
OpenButton.Position = UDim2.new(0, 0, 0.5, -30)
OpenButton.Text = ">"
OpenButton.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
OpenButton.Parent = ScreenGui
OpenButton.Visible = false

local OpenCorner = Instance.new("UICorner")
OpenCorner.CornerRadius = UDim.new(0, 6)
OpenCorner.Parent = OpenButton

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 25, 0, 25)
CloseButton.Position = UDim2.new(1, -30, 0, 5)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
CloseButton.Parent = MainFrame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseButton

local GameThumbnail = Instance.new("ImageLabel")
GameThumbnail.Size = UDim2.new(0, 60, 0, 60)
GameThumbnail.Position = UDim2.new(0, 10, 0, 10)
GameThumbnail.BackgroundTransparency = 1
GameThumbnail.Parent = MainFrame

local GameTitle = Instance.new("TextLabel")
GameTitle.Size = UDim2.new(0, 200, 0, 30)
GameTitle.Position = UDim2.new(0, 80, 0, 10)
GameTitle.BackgroundTransparency = 1
GameTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
GameTitle.TextScaled = true
GameTitle.Font = Enum.Font.GothamBold
GameTitle.Text = "Mining Simulator"
GameTitle.Parent = MainFrame

local InfoLabel = Instance.new("TextLabel")
InfoLabel.Size = UDim2.new(0, 200, 0, 40)
InfoLabel.Position = UDim2.new(0, 80, 0, 50)
InfoLabel.BackgroundTransparency = 1
InfoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoLabel.TextScaled = true
InfoLabel.TextWrapped = true
InfoLabel.Font = Enum.Font.Gotham
InfoLabel.Text = "Ping: ...\nServer: ..."
InfoLabel.Parent = MainFrame

pcall(function()
    local success, info = pcall(function()
        return MarketplaceService:GetProductInfo(placeId, Enum.InfoType.Asset)
    end)
    if success and info then
        GameTitle.Text = info.Name
        GameThumbnail.Image = "https://roblox.com" .. info.AssetId .. "&width=150&height=150"
    end
end)

RunService.RenderStepped:Connect(function()
    local ping = math.floor(LocalPlayer:GetNetworkPing() * 1000)
    local serverID = game.JobId:sub(1, 6)
    InfoLabel.Text = string.format("Ping: %d ms\nServer: %s", ping, serverID)
end)

local function MakeButton(text, xPos, yPos, parentFrame, sizeX, sizeY)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, sizeX or 120, 0, sizeY or 30)
    btn.Position = UDim2.new(0, xPos, 0, yPos)
    btn.Text = text
    btn.Font = Enum.Font.GothamBold
    btn.TextScaled = true
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    btn.Parent = parentFrame or MainFrame

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = btn

    return btn
end

-- Кнопки изначального скрипта (смещены ниже под инфо-панель)
local AutoRebirth = MakeButton("Auto Rebirth", 20, 100)
local AutoMine = MakeButton("Auto Mine", 150, 100)
local DupeButton = MakeButton("Dupe", 20, 140)
local BoostFPS = MakeButton("Boost FPS", 150, 140)

-- Дополнительные кнопки навигации списков (ESP и WIKI)
local EspListBtn = MakeButton("ESP Блоки", 20, 180)
local WikiListBtn = MakeButton("WIKI Блоки", 150, 180)

-- Кнопка управления дополнительным окном (размещена справа на высоте кнопки X)
local SidebarToggleBtn = Instance.new("TextButton")
SidebarToggleBtn.Size = UDim2.new(0, 25, 0, 25)
SidebarToggleBtn.Position = UDim2.new(1, 5, 0, 5)
SidebarToggleBtn.Text = "<<"
SidebarToggleBtn.Font = Enum.Font.GothamBold
SidebarToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SidebarToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
SidebarToggleBtn.Parent = MainFrame

local SideCorner = Instance.new("UICorner")
SideCorner.CornerRadius = UDim.new(0, 6)
SideCorner.Parent = SidebarToggleBtn

-- ====================================================================
-- ЧАСТЬ 2: ДОПОЛНИТЕЛЬНЫЕ ПАНЕЛИ, ЛОГИКА ESP И WIKI ОКН
-- ====================================================================
local ListFrame = Instance.new("Frame")
ListFrame.Size = UDim2.new(0, 280, 0, 290)
ListFrame.Position = UDim2.new(0, -290, 0, 0)
ListFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
ListFrame.BorderSizePixel = 0
ListFrame.Parent = MainFrame
ListFrame.Visible = false

local ListCorner = Instance.new("UICorner")
ListCorner.CornerRadius = UDim.new(0, 12)
ListCorner.Parent = ListFrame

local ListStroke = Instance.new("UIStroke")
ListStroke.Color = Color3.fromRGB(0, 170, 255)
ListStroke.Thickness = 2
ListStroke.Parent = ListFrame

local SearchBox = Instance.new("TextBox")
SearchBox.Size = UDim2.new(1, -20, 0, 30)
SearchBox.Position = UDim2.new(0, 10, 0, 10)
SearchBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
SearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SearchBox.PlaceholderText = "Поиск блока..."
SearchBox.Font = Enum.Font.Gotham
SearchBox.TextSize = 14
SearchBox.Text = ""
SearchBox.Parent = ListFrame

local SearchCorner = Instance.new("UICorner")
SearchCorner.CornerRadius = UDim.new(0, 6)
SearchCorner.Parent = SearchBox

local ScrollingList = Instance.new("ScrollingFrame")
ScrollingList.Size = UDim2.new(1, -20, 1, -60)
ScrollingList.Position = UDim2.new(0, 10, 0, 50)
ScrollingList.BackgroundTransparency = 1
ScrollingList.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingList.ScrollBarThickness = 4
ScrollingList.Parent = ListFrame

local ListLayout = Instance.new("UIListLayout")
ListLayout.Parent = ScrollingList
ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
ListLayout.Padding = UDim.new(0, 5)

local DisplayFrame = Instance.new("Frame")
DisplayFrame.Size = UDim2.new(0, 280, 0, 290)
DisplayFrame.Position = UDim2.new(1, 40, 0, 0)
DisplayFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
DisplayFrame.BorderSizePixel = 0
DisplayFrame.Parent = MainFrame
DisplayFrame.Visible = false

local DisplayCorner = Instance.new("UICorner")
DisplayCorner.CornerRadius = UDim.new(0, 12)
DisplayCorner.Parent = DisplayFrame

local DisplayStroke = Instance.new("UIStroke")
DisplayStroke.Color = Color3.fromRGB(0, 170, 255)
DisplayStroke.Thickness = 2
DisplayStroke.Parent = DisplayFrame

local currentMode = "ESP" 

local function getPartToApplyEsp(blockModel)
    if not blockModel or not blockModel:IsA("Model") then return nil end
    local cp = blockModel:FindFirstChild("ColorPart")
    local p = blockModel:FindFirstChild("Part")
    local b = blockModel:FindFirstChild("Base")
    local primary = blockModel.PrimaryPart
    
    if cp and cp:IsA("BasePart") then return cp end
    if p and p:IsA("BasePart") then return p end
    if b and b:IsA("BasePart") then return b end
    if primary then return primary end
    
    for _, child in ipairs(blockModel:GetChildren()) do
        if child:IsA("BasePart") then return child end
    end
    return nil
end

local function removeEspFromBlock(blockModel)
    if not blockModel then return end
    local target = getPartToApplyEsp(blockModel)
    if target then
        local old = target:FindFirstChild("BlockEspGui")
        if old then old:Destroy() end
    end
end

local function applyEspToBlock(blockModel, nameLower, config)
    if not blockModel or not config.enabled then return end
    local target = getPartToApplyEsp(blockModel)
    if not target then return end
    
    local old = target:FindFirstChild("BlockEspGui")
    if old then old:Destroy() end
    
    local bgui = Instance.new("BillboardGui")
    bgui.Name = "BlockEspGui"
    bgui.Size = UDim2.new(0, 16, 0, 16)
    bgui.AlwaysOnTop = true
    
    local f = Instance.new("Frame")
    f.Size = UDim2.new(1, 0, 1, 0)
    f.BackgroundColor3 = config.color
    f.Parent = bgui
    
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(1, 0)
    c.Parent = f
    
    bgui.Parent = target
end

local function clearAllEspForBlock(nameLower)
    trackedBlocks[nameLower].enabled = false
    local blocksFolder = workspace:FindFirstChild("Blocks")
    if blocksFolder then
        for _, b in ipairs(blocksFolder:GetChildren()) do
            if b.Name:lower() == nameLower then
                removeEspFromBlock(b)
            end
        end
    end
end

local function applyAllEspForBlock(nameLower)
    local config = trackedBlocks[nameLower]
    if not config or not config.enabled then return end
    local blocksFolder = workspace:FindFirstChild("Blocks")
    if blocksFolder then
        for _, b in ipairs(blocksFolder:GetChildren()) do
            if b.Name:lower() == nameLower then
                applyEspToBlock(b, nameLower, config)
            end
        end
    end
end

local function updateDisplayWindow(nameLower)
    for _, c in ipairs(DisplayFrame:GetChildren()) do
        if not c:IsA("UIStroke") and not c:IsA("UICorner") then c:Destroy() end
    end
    
    local data = oreToWorldMap[nameLower]
    local pName = (data and data[1] and data[1].prettyName) or nameLower:sub(1,1):upper()..nameLower:sub(2)
    
    local CloseDisp = Instance.new("TextButton")
    CloseDisp.Size = UDim2.new(0, 20, 0, 20)
    CloseDisp.Position = UDim2.new(1, -25, 0, 5)
    CloseDisp.Text = "X"
    CloseDisp.TextColor3 = Color3.fromRGB(255, 100, 100)
    CloseDisp.BackgroundTransparency = 1
    CloseDisp.Font = Enum.Font.GothamBold
    CloseDisp.TextSize = 14
    CloseDisp.Parent = DisplayFrame
    CloseDisp.MouseButton1Click:Connect(function() DisplayFrame.Visible = false end)
    
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, -30, 0, 30)
    TitleLabel.Position = UDim2.new(0, 10, 0, 10)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextSize = 16
    TitleLabel.Text = pName
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = DisplayFrame

    if currentMode == "ESP" then
        if not trackedBlocks[nameLower] then
            trackedBlocks[nameLower] = {enabled = false, color = Color3.fromRGB(255, 0, 0)}
        end
        local config = trackedBlocks[nameLower]
        
        local StatusBtn = MakeButton(config.enabled and "Отслеживание: ВКЛ" or "Отслеживание: ВЫКЛ", 10, 50, DisplayFrame, 260, 30)
        StatusBtn.BackgroundColor3 = config.enabled and Color3.fromRGB(0, 180, 100) or Color3.fromRGB(180, 50, 50)
        
        StatusBtn.MouseButton1Click:Connect(function()
            config.enabled = not config.enabled
            if config.enabled then
                StatusBtn.Text = "Отслеживание: ВКЛ"
                StatusBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 100)
                applyAllEspForBlock(nameLower)
            else
                StatusBtn.Text = "Отслеживание: ВЫКЛ"
                StatusBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
                clearAllEspForBlock(nameLower)
            end
        end)
        
        local ColorLabel = Instance.new("TextLabel")
        ColorLabel.Size = UDim2.new(1, -20, 0, 25)
        ColorLabel.Position = UDim2.new(0, 10, 0, 95)
        ColorLabel.BackgroundTransparency = 1
        ColorLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
        ColorLabel.Font = Enum.Font.Gotham
        ColorLabel.TextSize = 14
        ColorLabel.Text = "Настройка цвета (RGB от 0 до 255):"
        ColorLabel.TextXAlignment = Enum.TextXAlignment.Left
        ColorLabel.Parent = DisplayFrame
        
        local function makeRgbBox(xPos, colorVal, labelTxt)
            local box = Instance.new("TextBox")
            box.Size = UDim2.new(0, 70, 0, 30)
            box.Position = UDim2.new(0, xPos, 0, 125)
            box.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            box.TextColor3 = Color3.fromRGB(255, 255, 255)
            box.Text = tostring(math.floor(colorVal * 255))
            box.Font = Enum.Font.Gotham
            box.TextSize = 14
            box.Parent = DisplayFrame
            
            local c = Instance.new("UICorner")
            c.CornerRadius = UDim.new(0, 6)
            c.Parent = box
            
            local l = Instance.new("TextLabel")
            l.Size = UDim2.new(0, 15, 0, 30)
            l.Position = UDim2.new(0, xPos - 18, 0, 125)
            l.BackgroundTransparency = 1
            l.TextColor3 = Color3.fromRGB(255, 255, 255)
            l.Text = labelTxt
            l.Font = Enum.Font.GothamBold
            l.TextSize = 12
            l.Parent = DisplayFrame
            
            return box
        end
        
        local rBox = makeRgbBox(28, config.color.R, "R")
        local gBox = makeRgbBox(116, config.color.G, "G")
        local bBox = makeRgbBox(204, config.color.B, "B")
        
        local SaveColorBtn = MakeButton("Применить Цвет", 10, 170, DisplayFrame, 260, 30)
        SaveColorBtn.MouseButton1Click:Connect(function()
            local r = tonumber(rBox.Text) or 255
            local g = tonumber(gBox.Text) or 0
            local b = tonumber(bBox.Text) or 0
            config.color = Color3.fromRGB(math.clamp(r, 0, 255), math.clamp(g, 0, 255), math.clamp(b, 0, 255))
            if config.enabled then
                applyAllEspForBlock(nameLower)
            end
        end)
    elseif currentMode == "WIKI" then
        local InfoScroll = Instance.new("ScrollingFrame")
        InfoScroll.Size = UDim2.new(1, -20, 1, -50)
        InfoScroll.Position = UDim2.new(0, 10, 0, 45)
        InfoScroll.BackgroundTransparency = 1
        InfoScroll.ScrollBarThickness = 3
        InfoScroll.Parent = DisplayFrame
        
        local scrollLayout = Instance.new("UIListLayout")
        scrollLayout.Padding = UDim.new(0, 5)
        scrollLayout.Parent = InfoScroll
        
        if data then
            for _, info in ipairs(data) do
                local ItemLabel = Instance.new("TextLabel")
-- ====================================================================
-- ЧАСТЬ 3: ЗАВЕРШЕНИЕ РЕНДЕРИНГА WIKI И ЛОГИКА ОТСЛЕЖИВАНИЯ БЛОКОВ
-- ====================================================================
                local ItemLabel = Instance.new("TextLabel")
                ItemLabel.Size = UDim2.new(1, 0, 0, 40)
                ItemLabel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                ItemLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                ItemLabel.Font = Enum.Font.Gotham
                ItemLabel.TextSize = 13
                ItemLabel.Text = string.format("Мир: %s\nСлой: %d", info.world, info.layer)
                ItemLabel.Parent = InfoScroll
                
                local ic = Instance.new("UICorner")
                ic.CornerRadius = UDim.new(0, 6)
                ic.Parent = ItemLabel
            end
            InfoScroll.CanvasSize = UDim2.new(0, 0, 0, #data * 45)
        else
            local NoData = Instance.new("TextLabel")
            NoData.Size = UDim2.new(1, 0, 0, 30)
            NoData.BackgroundTransparency = 1
            NoData.TextColor3 = Color3.fromRGB(150, 150, 150)
            NoData.Font = Enum.Font.Gotham
            NoData.TextSize = 13
            NoData.Text = "Данные о мире отсутствуют."
            NoData.Parent = InfoScroll
        end
    end
    DisplayFrame.Visible = true
end

local function populateList()
    for _, item in ipairs(ScrollingList:GetChildren()) do
        if not item:IsA("UIListLayout") then item:Destroy() end
    end
    
    local counts = {}
    local blocksFolder = workspace:FindFirstChild("Blocks")
    if blocksFolder then
        for _, b in ipairs(blocksFolder:GetChildren()) do
            local nameL = b.Name:lower()
            counts[nameL] = (counts[nameL] or 0) + 1
        end
    end
    
    local sortedList = {}
    for nameLower, info in pairs(oreToWorldMap) do
        table.insert(sortedList, nameLower)
    end
    table.sort(sortedList)
    
    local filter = SearchBox.Text:lower()
    local index = 0
    
    for _, nameL in ipairs(sortedList) do
        local data = oreToWorldMap[nameL]
        local prettyName = (data and data[1] and data[1].prettyName) or nameL:sub(1,1):upper()..nameL:sub(2)
        local count = counts[nameL] or 0
        
        if filter == "" or prettyName:lower():find(filter) or nameL:find(filter) then
            index = index + 1
            
            local ItemBtn = Instance.new("TextButton")
            ItemBtn.Size = UDim2.new(1, -5, 0, 30)
            ItemBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            ItemBtn.TextColor3 = count > 0 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(120, 120, 120)
            ItemBtn.Font = Enum.Font.Gotham
            ItemBtn.TextSize = 13
            ItemBtn.Text = string.format("  %s (%d)", prettyName, count)
            ItemBtn.TextXAlignment = Enum.TextXAlignment.Left
            ItemBtn.Parent = ScrollingList
            
            local ic = Instance.new("UICorner")
            ic.CornerRadius = UDim.new(0, 6)
            ic.Parent = ItemBtn
            
            ItemBtn.MouseButton1Click:Connect(function()
                updateDisplayWindow(nameL)
            end)
        end
    end
    ScrollingList.CanvasSize = UDim2.new(0, 0, 0, index * 35)
end

SearchBox:GetPropertyChangedSignal("Text"):Connect(populateList)

task.spawn(function()
    while task.wait(3) do
        if ListFrame.Visible then
            populateList()
        end
    end
end)

local bFolder = workspace:WaitForChild("Blocks")
bFolder.ChildAdded:Connect(function(child)
    task.wait()
    local nLower = child.Name:lower()
    local config = trackedBlocks[nLower]
    if config and config.enabled then
        applyEspToBlock(child, nLower, config)
    end
end)

EspListBtn.MouseButton1Click:Connect(function()
    currentMode = "ESP"
    ListFrame.Visible = true
    populateList()
end)

WikiListBtn.MouseButton1Click:Connect(function()
    currentMode = "WIKI"
    ListFrame.Visible = true
    populateList()
end)

SidebarToggleBtn.MouseButton1Click:Connect(function()
    if SidebarToggleBtn.Text == "<<" then
        SidebarToggleBtn.Text = ">>"
        DisplayFrame.Visible = false
        ListFrame.Visible = false
        SidebarToggleBtn.Position = UDim2.new(1, -30, 0, 5)
    else
        SidebarToggleBtn.Text = "<<"
        SidebarToggleBtn.Position = UDim2.new(1, 5, 0, 5)
    end
end)

CloseButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    OpenButton.Visible = true
end)

OpenButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    OpenButton.Visible = false
end)
