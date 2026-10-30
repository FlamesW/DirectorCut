-- // [A Bizzare Village]
local Game: DataModel, typeof = game, typeof
if not (Game:IsLoaded()) then Game.Loaded:Wait() end

if typeof(_IsLoadedFM) == "function" and _IsLoadedFM() then return warn("[FLAMES]: Script Already loaded!") end

local os_clock, loadstring, tostring, match, warn = os.clock, loadstring, tostring, match, warn
local write_file, read_file, is_file, make_folder, is_folder = writefile, readfile, isfile, makefolder, isfolder

local getgenv = getgenv or function()
    return shared
end

local function Load_FM()
    local Source = "https://github.com/FlamesW/FunctionManager/releases/latest/download/Module.luau"
    local Repo = "https://raw.githubusercontent.com/FlamesW/FunctionManager"

    if not is_folder("@File_Caches") then
        make_folder("@File_Caches")
    end

    local File = "@File_Caches/Module.luau"

    local function Execute(Content)
        local Chunk, Error = loadstring(Content)

        if not Chunk then
            warn("[FunctionManager]: Failed to compile module:\n" .. tostring(Error))
            return nil
        end

        local Result = Chunk()

        return Result
    end

    if is_file(File) then
        local Content = read_file(File)

        if Content then
            local Current_Version = Content:match('Build%s*=%s*"@([%d%.]+)"')
            local Latest_Version

            local Response = Game:HttpGet(Repo .. "/home/%40Version.cfg?nocache=" .. tostring(os_clock()))

            if Response then
                Latest_Version = Response:match("@([%d%.]+)")
            end

            if Latest_Version and Current_Version and Latest_Version ~= Current_Version then
                local FreshContent = Game:HttpGet(Source .. "?nocache=" .. tostring(os_clock()))
                write_file(File, FreshContent)

                return Execute(FreshContent)
            end

            return Execute(Content)
        end
    end

    local Content = Game:HttpGet(Source .. "?nocache=" .. tostring(os_clock()))

    write_file(File, Content)
    return Execute(Content)
end

-- // @Module.Luau
local Script = Load_FM().Launch({})

local ReplicatedStorage = Script.ReplicatedStorage 
local SpawnedTools = Workspace:FindFirstChild("SpawnedTools")

--[[
local StandMappings = {
    [1] = "Standless",
    [2] = "Star Platinum (SP)",
    [3] = "Star Platinum The World (SPTW)",
    [34] = "Star Platinum The World: Stone Ocean Skin (SPTW:SO)",
    [729] = "Ban Hammer (Indigo Custom)",
    [33333] = "Awakening Star Platinum The World (AwakeningSPTW)",
    [4] = "The World (TW)",
    [4252] = "Greatest High The World (GHTW)",
    [221] = "Silver Chariot (SC)",
    [6789] = "DIO's The World (DTW)",
    [13333] = "XNOTE",
    [210] = "Wind Sword (Teusi Custom)",
    [72982] = "Shadow Pot Devil (Indigo Custom)",
    [72989] = "Pot Devil Stand (Indigo Custom)",
    [33133] = "KPPlatinum (Killop Custom)",
    [726] = "Devil Of Chainsaw (Admin)",
    [5252] = "Harder Better Faster Stronger (Comming Soon)",
    [33233] = "KPPlatinumOverHeaven (Killop Custom)",
    [1220] = "Admin DIO's The World (Admin)",
    [500] = "Sonic",
    [59592] = "BDG (Alpha)",
    [88888] = "JHI POT (Just Custom)",
    [723] = "MUI",
    [58774485] = "C(irno)-Moon (Cake Custom)",
    [6969] = "SUS (Official NickName Custom)",
    [12251] = "Rudolph Pot Stand (RPS) (Work In Progress)",
    [222] = "Silver Chariot Requiem (SCR) (Work In Progress)",
    [10089759] = "Fallen (Dast Custom)",
    [842] = "Sakuya Izayoi",
    [1009869] = "Retro Reaper (Dast Custom)",
    [1031] = "Hierophant Pumpkin (버려)",
    [464] = "The World Requiem (TWR)",
    [95666] = "Genocide (Davinch Custom)",
    [8234] = "no",
    [12252] = "Santa Diamond (SD)",
    [5050] = "SuGom Stand (SuGom Custom)",
    [80209] = "Exel",
    [70607] = "Time Leaper (TL)",
    [70707] = "Time Leaper: Ghosdeeri (TLG)",
    [552] = "Noob Platinum (Admin)",
    [5522] = "Noob Sword (Admin)",
    [2523] = "traveler",
    [10312] = "Tusk Act4: Tank Zombie (TZ)",
    [55385] = "Tusk Act4 (TA4)",
    [22382] = "Tusk Act1 (TA1)",
    [33383] = "Tusk Act2 (TA2)",
    [44384] = "Tusk Act3 (TA3)",
    [72] = "The Hand (TH)",
    [72333] = "The Hand: Triple T (TTT)",
    [88889] = "JHI Stand (Just Custom)",
    [60606] = "ThePartyDevil (Work In Progress)",
    [666666] = "Error Error Error (EEE) (Work In Progress)",
    [88888888] = "ErrorErrorError (EEE)",
    [12200] = "SaiTaMa (Iru Custom)",
    [122] = "Guardian (Iru Custom)",
    [8585] = "PQ Platinum (PQ Custom)",
    [72988] = "Ice Blade (Admin)",
    [5678] = "Jotaro's Star Platinum (JSP)",
    [5679] = "Retro Jotaro's Star Platinum (RJSP)",
    [10090] = "The DUBU World (Dubu Custom)",
    [67676] = "Lightning Pot (LP) (Work In Progress)",
    [68686] = "Pot Tyrant EX (PTEX) (Work In Progress)",
    [69696] = "TheXXDevil (TXXD (Work In Progress))",
    [61616] = "Pot Stand (PS) (Work In Progress)",
    [10311] = "Pot Stand: Zombie (PSZ) (Work In Progress)",
    [515] = "Librarian",
    [72977] = "RPP",
    [88999] = "The Waifu (Admin)",
    [89999] = "Shadow The Waifu (Admin)",
    [52222] = "The Road Roller World (TRRW)",
    [66066] = "Scary Monsters (SM)",
    [99499] = "Shadow The World (STW)",
    [6644] = "Shadow The World Requiem (STWR)",
    [6464] = "Shadow The World Requiem OVA (STWROVA)",
    [64646] = "Devil Pot VX (DPVX) (Work In Progress)",
    [65656] = "Ice Pot Golem (IPG)",
    [8765] = "Silvro's Shadow The World Requiem (Silvro Custom)",
    [6768] = "DKC",
    [2543] = "Nishinoya (Fowl Custom)",
    [5] = "Crazy Diamond (CD)",
    [12253] = "Crazy Diamond: Steve (Steve)",
    [6] = "Killer Queen (KQ)",
    [66] = "Killer Queen: Bites The Dust (KQBTD)",
    [7] = "Gold Experience (GE)",
    [1234567890] = "Star Glitcher",
    [715] = "Hutao (Con tsusi Custom)",
    [91235] = "Standless But Something Wrong",
    [8888888888] = "CrossHead",
    [1229] = "Kisaragi Saya",
    [8] = "Gold Experience Requiem (GER)",
    [9] = "King Crimson (KC)",
    [999] = "Doppio",
    [11] = "The World: High Voltage (TWHV)",
    [11111] = "Diego's The World: High Voltage (DTWHV)",
    [12] = "Star Platinum Over Heaven (SPOH)",
    [13] = "The World Over Heaven (TWOH)",
    [15] = "Sword",
    [72998] = "Rice Farmer",
    [270] = "Black/White Made In Heaven (BWMIH)",
    [7890] = "Samurai",
    [18] = "Anubis",
    [1188] = "Anubis",
    [1199] = "Anubis: Roland",
    [19] = "Hierophant Green (HG)",
    [10313] = "Hierophant Green: Pumpkin (HGP)",
    [20] = "Hamon",
    [200] = "Goku",
    [21] = "Vampire",
    [22] = "Vampiric The World",
    [23] = "Spin",
    [2000200] = "DJ_Spec",
    [4414] = "Tohno Shiki (Teusi Custom)",
    [24] = "C-Moon (Work In Progress)",
    [25] = "Doppio King Crimson (Doppio)",
    [27] = "Made In Heaven (MIH)",
    [30] = "White Snake (WS)",
    [31] = "Kars",
    [72984] = "POT",
    [32] = "Pillar man",
    [33] = "The Emperor Stand",
    [1001] = "FOTPS",
    [1002] = "BlackPlatinum",
    [10004] = "Retro The World (RTW)",
    [10005] = "Retro The World Over Heaven (RTWOH)",
    [10006] = "King Crimson Requiem (KCR)",
    [10007] = "Shiny Sword",
    [709] = "Dark Admin (Admin)",
    [7090] = "DK",
    [77777] = "Shooting Star Platinum (SSP)",
    [10008] = "Creeper Queen (CQ)",
    [100088] = "Creeper Queen: Bites The Dust (CQBTD)",
    [10010] = "Retro Star Platinum (RSP)",
    [10011] = "Steve Platinum (Steve)",
    [10012] = "Doppio Two King Crimson",
    [10013] = "Retro Star Platinum Over Heaven (RSPOH)",
    [10014] = "Shiny Gold Experience (SGE)",
    [10015] = "Shiny Gold Experience Requiem (SGER)",
    [10016] = "Hierophant Emerald Green",
    [10017] = "Enderman Crimson",
    [10018] = "Neo  TheWorld Alternate Universe",
    [10019] = "Shadow The World",
    [10020] = "Made On Hallows Eve",
    [5521] = "Noob PLTN (Admin)",
    [151937] = "TheEldritchHorrorStand",
    [1000000] = "TestStarPlatinum",
    [1000001] = "Gold Experience Test",
    [202] = "Star Platinum: Retro Skin (SP:RETRO)",
    [212] = "Star Platinum Over Heaven: Retro Skin (SPOH:RETRO)",
    [404] = "The World: Retro Skin (TW:RETRO)",
    [414] = "The World Over Heaven: Retro Skin (TWOH:RETRO)",
    [8888] = "Sans",
    [1111] = "Gun Fiend"
}
--]]

local ItemsPriority = {
    ["time leaper's clock"] = 21,
    ["x orb"] = 20,
    ["broken byte"] = 19,
    ["esper energy"] = 18,
    ["eye of the saints corpse"] = 17,
    ["true requiem arrow"] = 16,
    ["vampire mask"] = 15,
    ["green baby"] = 14,
    ["jotaro diary"] = 13,
    ["bible"] = 12,
    ["golden spin ball"] = 11,
    ["electric orb"] = 10,
    ["left arm of the saints corpse"] = 9,
    ["devil diary"] = 8,
    ["dio's diary"] = 7,
    ["frost sword"] = 6,
    ["requiem arrow"] = 5,
    ["pot"] = 4,
    ["banknote"] = 3,
    ["rokakaka fruit"] = 2,
    ["stand arrow"] = 1,
}

function Script:GetItemPriority(Name)
    local N = (Name or ""):lower()
    for Key, Prio in pairs(ItemsPriority) do
        if N:find(Key, 1, true) then
            return Prio
        end
    end
    return 22
end

function Script:HighValueItem(MinPriority)
    MinPriority = MinPriority or 4

    local Root = self:GetRoot()
    if not Root or not SpawnedTools then return false end

    for _, Tool in ipairs(SpawnedTools:GetChildren()) do
        local FakeHandle = Tool:FindFirstChild("FakeHandle")
        if not FakeHandle then continue end

        local Part = Tool:FindFirstChildWhichIsA("BasePart")
            or FakeHandle:FindFirstChildWhichIsA("BasePart")
        if not Part then continue end
        if (Part.Position - Root.Position).Magnitude > 4000 then continue end

        local P = self:GetItemPriority(Tool.Name)
        if P >= MinPriority then
            return true
        end
    end

    return false
end

function Script:Attack(State)
    if not State then
        self.KillAura = false
        self:ForceStop("@Attack")
        return false
    end

    if self.KillAura then return true end
    self.KillAura = true

    local Variants = { "Barrage", "LMB", "StrongPunch", "ComboPunches1", "ComboPunches2" }

    self:SmartLoop(0.1, function(self)
        if not self.KillAura then return end

        local GetNearest = self:GetClasses(Workspace, "Model", true)
        local Char = self:GetCharacter()
        if not Char or not Char.PrimaryPart then return end

        local CurrentPos = Char.PrimaryPart.Position
        local NearestDist, NearestHumanoid, NearestCFrame, NearestLook = math.huge, nil, nil, nil

        for i = 1, #GetNearest do
            local Model = GetNearest[i]

            if Model == Char then continue end

            if self.Is_BossFarming then
                local IsNPC = self:IsNPC(Model)
                if not IsNPC then continue end
            end

            local Humanoid = Model:FindFirstChildOfClass("Humanoid")
            local Root = Model:FindFirstChild("HumanoidRootPart")

            if Humanoid and Root then
                local Dist = (Root.Position - CurrentPos).Magnitude
                if Dist <= 50 and Dist < NearestDist then
                    NearestDist = Dist
                    NearestHumanoid = Humanoid
                    NearestCFrame = Root.CFrame
                    NearestLook = Root.CFrame.LookVector
                end
            end
        end

        if NearestHumanoid and NearestCFrame then
            for _, Variant in ipairs(Variants) do
                ReplicatedStorage:WaitForChild("Damage"):FireServer(
                    NearestHumanoid,
                    NearestCFrame,
                    Variant,
                    5,
                    Vector3.new(NearestLook.X, NearestLook.Y, NearestLook.Z),
                    0.075,
                    1,
                    0.15
                )
            end
        end
    end, "@Attack")

    return true
end

function Script:ItemFarm(State)
    if not State then
        self.Is_ItemFarming, self.ItemFarming = false, false
        self:ForceStop("@ItemFarm")
        return false
    end

    if self.ItemFarming then return true end
    self.ItemFarming = true

    self:SmartLoop(0.0000015, function(self)
        if not self.ItemFarming then return end

        local Root = self:GetRoot()
        if not Root then return end

        task.spawn(function()
            self:Noclip() self:AntiFling()
        end)

        local Priority, Best = -1, nil

        for _, Tool in ipairs(SpawnedTools:GetChildren()) do
            if not Tool:FindFirstChild("FakeHandle") then continue end

            local Part = Tool:FindFirstChildWhichIsA("BasePart")
                or Tool.FakeHandle:FindFirstChildWhichIsA("BasePart")
            if not Part then continue end
            if (Part.Position - Root.Position).Magnitude > 4000 then continue end

            local P = self:GetItemPriority(Tool.Name)
            if self.Is_BossFarming and P < 4 then continue end

            if P > Priority then
                Priority = P
                Best = Tool
            end
        end

        local Tool = Best
        if not Tool then
            self.Is_ItemFarming = false
            return
        end

        local Interaction = Tool:FindFirstChild("FakeHandle")
        Interaction = Interaction and Interaction:FindFirstChild("ToolInteract")
        if not Interaction then
            self.Is_ItemFarming = false
            return
        end

        local Part = Interaction:FindFirstChildWhichIsA("BasePart")
            or (Interaction.Parent and Interaction.Parent:FindFirstChildWhichIsA("BasePart"))
            or Tool:FindFirstChildWhichIsA("BasePart")
        if not Part then
            self.Is_ItemFarming = false
            return
        end

        self.Is_ItemFarming = true

        Root.CFrame = Part.CFrame + Vector3.new(0, -11, 0)

        if Interaction:IsA("ProximityPrompt") then
            fireproximityprompt(Interaction)
        end
    end, "@ItemFarm", false, function(self)
        local Root = self:GetRoot()
        Root.CFrame = Root.CFrame + Vector3.new(0, 12, 0)

        self:StopFling(); self:StopClip()
    end)

    return true
end

function Script:BossFarm(State)
    if not State then
        self.Is_BossFarming, self.BossFarming = false, false
        self:ForceStop("@BossFarm")
        return false
    end

    if self.BossFarming then return true end
    self.BossFarming = true

    self:SmartLoop(0.0000015, function(self)
        if not self.BossFarming then return end

        if self.ItemFarming and self:HighValueItem(4) then
            self.Is_BossFarming = false
            return
        end

        local Root = self:GetRoot()
        if not Root then return end

        task.spawn(function()
            self:Noclip() self:AntiFling()
        end)

        local Char = self:GetCharacter()
        if not Char then return end

        local GetClasses = self:GetClasses(Workspace, "Model", true)

        self.Is_BossFarming = false

        for i = 1, #GetClasses do
            local Model = GetClasses[i]
            if Model == Char then continue end

            local N = Model.Name:lower()
            if N:find("dum") or N:find("corrupt") then continue end

            local IsNPC = self:IsNPC(Model)
            if not IsNPC then continue end

            local Humanoid = Model:FindFirstChildOfClass("Humanoid")
            local RootPart = Model:FindFirstChild("HumanoidRootPart")

            if Humanoid and RootPart then
                self.Is_BossFarming = true
                Root.CFrame = RootPart.CFrame * CFrame.new(0, -15, 0)
                break
            end
        end
    end, "@BossFarm", false, function(self)
        local Root = self:GetRoot()
        Root.CFrame = Root.CFrame + Vector3.new(0, 16, 0)

        self:StopFling(); self:StopClip()
    end)

    return true
end

function Script:AutoBlock(State)
    if not State then
        self:ForceStop("@AutoBlock")
        return false
    end

    if self.AutoBlocking then return true end
    self.AutoBlocking = true

    local BlockEvent, DodgeEvent = ReplicatedStorage.Block, ReplicatedStorage.Dodge

    self:SmartLoop(0.1, function()
        if not self.AutoBlocking then return end

        DodgeEvent:FireServer(); BlockEvent:FireServer(true)
    end, "@AutoBlock", false, function(self)
        self.AutoBlocking = false

        BlockEvent:FireServer(false)
    end)

    return true
end

function Script:GodExperience(State)
    if not State then
        self:ForceStop("@GodExperience")
        return false
    end

    if self.GE_GodMode then return true end
    self.GE_GodMode = true

    local Deflect = ReplicatedStorage.DeflectFrog

    self:SmartLoop(0.35, function()
        if not self.GE_GodMode then return end

        Deflect:FireServer(true)
    end, "@GodExperience", false, function(self)
        self.GE_GodMode = false

        for i = 1, 25 do
            Deflect:FireServer(false)
            task.wait(0.075)
        end
    end)

    return true
end

function Script:EquipBanknotes(State)
    if not State then
        self.UseBanknotes = false
        self:ForceStop("@EquipBanknotes")
        return false
    end

    if self.UseBanknotes then return true end
    self.UseBanknotes = true

    self:SmartLoop(0.1, function(self)
        if not self.Is_ItemFarming then
            self:UseTool("Banknote")
        end
    end, "@EquipBanknotes")

    return true
end

-- // @Library.luau
getgenv().Game, Main_Folder = "A Bizarre Village", "FLAMES";
local Library, Flags = Script:Load_DirectorCut({ Cache = Main_Folder .. "/Storage/Library.luau" })

local Window = Library:CreateWindow({
    Title = 'FLAMES  |  <font color="rgb(60, 200, 100)">Director\'s Cut</font>',
    Blur = true,
    NotifySound = 4590657391,
    NotifyVolume = 2,
    SaveFolder = getgenv().Multi_Support
        and (Main_Folder .. "/" .. tostring(getgenv().Game) .. "/Configurations")
        or (Main_Folder .. "/" .. tostring(getgenv().Game) .. "/" .. Library.LocalPlayer.Name),
    Icon = "129855843582244",
    ToggleKeybind = Enum.KeyCode.V,
})

Script:AntiAFK()
Script:SetCameraOcclusion("Invisicam")

Library.OnUnload = function()
    Script:SetCameraOcclusion("Zoom") Script:Unload()
end

local MainTab = Window:AddTab("Main","file-code-corner", true)

local Combat = MainTab:AddElementSection("• Combat", true)
local Farming = MainTab:AddElementSection("• Farming", true)

Combat:AddToggle({
    Name = "Kill Aura", Flag = "Kill_Aura", 
    Value = false,
    Callback = function(Value) 
        Script:Attack(Value)
    end,
})

Combat:AddToggle({
    Name = "Auto Block", Flag = "Auto_Block", 
    Value = false,
    Callback = function(Value) 
        Script:AutoBlock(Value)
    end,
})

Combat:AddToggle({
    Name = "Gold Experience | GOD", Flag = "GE_GOD", 
    Value = false,
    Callback = function(Value) 
        Script:GodExperience(Value)
    end,
})

Farming:AddToggle({
    Name = "Item Farm", Flag = "Item_Farm",
    Value = false,
    Callback = function(Value)
        Script:ItemFarm(Value)
    end,
})

Farming:AddToggle({
    Name = "Equip Banknotes", Flag = "Equip_Banknotes",
    Value = false,
    Callback = function(Value)
        Script:EquipBanknotes(Value)
    end,
})

Farming:AddDivider()

Farming:AddToggle({
    Name = "Boss Farm", Flag = "Boss_Farm",
    Value = false,
    Callback = function(Value)
        Script:BossFarm(Value)
    end,
})

local PlayerTab = Window:AddTab("Player", "file-user")

local State = {
    SuperWS = false, SuperJP = false, Flight = false,
    WS_Value = 100, JP_Value = 100, FlightSpd = 50,
}

local Movement = PlayerTab:AddElementSection("• Movement", true)

Movement:AddToggle({
    Name = "Super WalkSpeed",
    Flag = "Super_WS",
    Value = false,
    Callback = function(Value)
        State.SuperWS = Value

        if Value then
            Script:SmartLoop(0.1, function()
                local Hum = Script:GetHumanoid()
                if Hum then Hum.WalkSpeed = State.WS_Value end
            end, "@SuperWS")
        else
            Script:ForceStop("@SuperWS")
            Script:SetSpeed(16)
        end
    end,
})

Movement:AddSlider({
    Name = "WalkSpeed Value",
    Flag = "Super_WS_Value",
    Min = 16, Max = 500, Increment = 1, Value = 100,
    Callback = function(Value)
        State.WS_Value = Value
    end,
})

Movement:AddDivider()

Movement:AddToggle({
    Name = "Super Jump",
    Flag = "Super_JP",
    Value = false,
    Callback = function(Value)
        State.SuperJP = Value

        if Value then
            Script:SmartLoop(0.1, function()
                local Hum = Script:GetHumanoid()
                if Hum then Hum.JumpPower = State.JP_Value end
            end, "@SuperJP")
        else
            Script:ForceStop("@SuperJP")
            Script:SetJumpPower(50)
        end
    end,
})

Movement:AddSlider({
    Name = "JumpPower Value",
    Flag = "Super_JP_Value",
    Min = 50, Max = 500, Increment = 1, Value = 100,
    Callback = function(Value)
        State.JP_Value = Value
    end,
})

Movement:AddDivider()

Movement:AddToggle({
    Name = "Flight",
    Flag = "Flight",
    Value = false,
    Callback = function(Value)
        State.Flight = Value
        if Value then
            Script:Flight(true, State.FlightSpd)
        else
            Script:Flight(false)
        end
    end,
})

Movement:AddSlider({
    Name = "Flight Speed",
    Flag = "Flight_Speed",
    Min = 10, Max = 500, Increment = 1, Value = 50,
    Callback = function(Value)
        State.FlightSpd = Value
        if Script:IsFlightActive() then
            Script:SetFlightSpeed(Value)
        end
    end,
})

Movement:AddDivider()

Movement:AddToggle({
    Name = "Noclip",
    Flag = "Noclip",
    Value = false,
    Callback = function(Value)
        if Value then
            if not Script._NoclipLoop then
                Script._NoclipLoop = Script:SmartLoop(0.1, function()
                    Script:Noclip(1)
                end, "@NoclipLoop")
            end
        else
            if Script._NoclipLoop then
                Script:ForceStop("@NoclipLoop")
                Script._NoclipLoop = nil
            end
            Script:StopClip()
        end
    end,
})

local Visuals = PlayerTab:AddElementSection("• Visuals", true)

Visuals:AddToggle({
    Name = "XRay",
    Flag = "XRay",
    Value = false,
    Callback = function(Value)
        Script:XRay(Value)
    end,
})

Visuals:AddToggle({
    Name = "3D Rendering",
    Flag = "3D_Rendering",
    Value = false,
    Callback = function(Value)
        Script:Set3DRendering(Value)
    end,
})

local SettingsTab = Window:AddTab("Settings", "file-cog")
Window:BuildSettingsElement(SettingsTab)

Library:Notify("Good " .. Script:GetTimeOfDay() .. " " .. Library.LocalPlayer.DisplayName, 5)
Library:Notify("Detected: " .. getgenv().Game, 10)

Library:LoadAutoloadConfig()
