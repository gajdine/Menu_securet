--[[
  Mod Menu Ilha bela Legit - INTERFACE COMPLETA
  Versão para inserir scripts externos via loadstring.
  ESP NAME funcional incluso, com suporte a ligar/desligar, cor conforme time
  e tamanho do nome ajustando automaticamente conforme a distância.
  VERSAO FACIL
  - Suporte para lembrar posição da barra minimizada!
  - HITBOX LEGIT removido para evitar banimento!
--]] 

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui") 

-- Proporção do menu na tela
local WIDTH_RATIO, HEIGHT_RATIO = 0.62, 0.72
local menuWidth = math.floor(1920 * WIDTH_RATIO * (workspace.CurrentCamera.ViewportSize.X/1920))
local menuHeight = math.floor(1080 * HEIGHT_RATIO * (workspace.CurrentCamera.ViewportSize.Y/1080))
local sidebarWidth = math.floor(menuWidth * 0.18)
local titleBarHeight = math.floor(menuHeight * 0.1)
local buttonWidth = math.floor(menuWidth * 0.3)
local buttonHeight = math.floor(menuHeight * 0.09) 

-- Cores e fontes
local colorSidebar = Color3.fromRGB(25, 23, 24)
local colorSidebarText = Color3.fromRGB(180, 85, 85)
local colorSidebarTextActive = Color3.fromRGB(255, 255, 255)
local colorTitleBar = Color3.fromRGB(180, 85, 85)
local colorBackground = Color3.fromRGB(75, 75, 75)
local colorSectionTitle = Color3.fromRGB(255, 255, 255)
local colorButton = Color3.fromRGB(35,35,35)
local colorToggleOn = Color3.fromRGB(180, 85, 85)
local colorToggleOff = Color3.fromRGB(20,20,20)
local fontTitle = Enum.Font.GothamBlack
local fontSidebar = Enum.Font.GothamBold
local fontSection = Enum.Font.GothamBold
local fontButton = Enum.Font.Gotham 

if playerGui:FindFirstChild("ModMenuIlhaBelaLegit") then
    playerGui.ModMenuIlhaBelaLegit:Destroy()
end 

local gui = Instance.new("ScreenGui")
gui.Name = "ModMenuIlhaBelaLegit"
gui.Parent = playerGui
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling 

local menu = Instance.new("Frame")
menu.Name = "Menu"
menu.AnchorPoint = Vector2.new(0.5,0.5)
menu.Size = UDim2.new(0, menuWidth, 0, menuHeight)
menu.Position = UDim2.new(0.5,0,0.5,0)
menu.BackgroundColor3 = colorBackground
menu.BorderSizePixel = 0
menu.ClipsDescendants = true
menu.Parent = gui 

local menuCorner = Instance.new("UICorner")
menuCorner.CornerRadius = UDim.new(0,12)
menuCorner.Parent = menu 

-- Title Bar
local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1,0,0,titleBarHeight)
titleBar.BackgroundColor3 = colorTitleBar
titleBar.BorderSizePixel = 0
titleBar.Parent = menu 

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0,12)
titleCorner.Parent = titleBar 

local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "Title"
titleLabel.Text = "Mod Menu Ilha bela Legit"
titleLabel.Size = UDim2.new(1, -80, 1, 0)
titleLabel.Position = UDim2.new(0.5, -((menuWidth-80)/2), 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.TextXAlignment = Enum.TextXAlignment.Center
titleLabel.TextColor3 = Color3.fromRGB(40, 17, 17)
titleLabel.Font = fontTitle
titleLabel.TextSize = math.floor(titleBarHeight * 0.5)
titleLabel.Parent = titleBar 

local minimizeButton = Instance.new("TextButton")
minimizeButton.Name = "MinimizeButton"
minimizeButton.Size = UDim2.new(0,titleBarHeight-8,0,titleBarHeight-8)
minimizeButton.Position = UDim2.new(1, -(titleBarHeight-4), 0, 4)
minimizeButton.BackgroundColor3 = Color3.fromRGB(20,20,20)
minimizeButton.Text = "≡"
minimizeButton.TextColor3 = colorTitleBar
minimizeButton.Font = fontTitle
minimizeButton.TextSize = math.floor(titleBarHeight * 0.65)
minimizeButton.AutoButtonColor = true
minimizeButton.Parent = titleBar 

local minCorner = Instance.new("UICorner")
minCorner.CornerRadius = UDim.new(1,0)
minCorner.Parent = minimizeButton 

-- Sidebar
local sidebar = Instance.new("Frame")
sidebar.Name = "Sidebar"
sidebar.Size = UDim2.new(0,sidebarWidth,1, -0)
sidebar.Position = UDim2.new(0,0,0,0)
sidebar.BackgroundColor3 = colorSidebar
sidebar.BorderSizePixel = 0
sidebar.Parent = menu 

local sidebarCorner = Instance.new("UICorner")
sidebarCorner.CornerRadius = UDim.new(0,12)
sidebarCorner.Parent = sidebar 

local tabs = {"PLAYER", "VISUAL", "PVP", "AUTO FARME", "MORE"}
local sidebarButtons = {}
local sidebarBtnHeight = math.floor(menuHeight * 0.085) 

for i,tabName in ipairs(tabs) do
    local btn = Instance.new("TextButton")
    btn.Name = tabName.."Btn"
    btn.Text = tabName
    btn.Font = fontSidebar
    btn.TextSize = math.floor(sidebarBtnHeight * 0.6)
    btn.Size = UDim2.new(1, 0, 0, sidebarBtnHeight)
    btn.Position = UDim2.new(0,0,0, (i-1)*sidebarBtnHeight + sidebarBtnHeight)
    btn.BackgroundTransparency = 1
    btn.TextColor3 = colorSidebarText
    btn.AutoButtonColor = true
    btn.Parent = sidebar
    sidebarButtons[tabName] = btn
end 

local playerNameLabel = Instance.new("TextLabel")
playerNameLabel.Name = "PlayerName"
playerNameLabel.Text = player and player.Name or "Nome do player"
playerNameLabel.Font = fontButton
playerNameLabel.TextSize = math.floor(menuHeight * 0.034)
playerNameLabel.TextColor3 = Color3.fromRGB(210,210,210)
playerNameLabel.BackgroundTransparency = 1
playerNameLabel.Size = UDim2.new(1, -16, 0, sidebarBtnHeight-12)
playerNameLabel.Position = UDim2.new(0, 8, 1, -(sidebarBtnHeight-8))
playerNameLabel.TextXAlignment = Enum.TextXAlignment.Center
playerNameLabel.Parent = sidebar 

local tabContainer = Instance.new("Frame")
tabContainer.Name = "TabContainer"
tabContainer.Position = UDim2.new(0, sidebarWidth, 0, titleBarHeight)
tabContainer.Size = UDim2.new(1, -sidebarWidth, 1, -titleBarHeight)
tabContainer.BackgroundTransparency = 1
tabContainer.Parent = menu 

local tabContents = {
["PLAYER"] = {
    {
        section="SELF",
        buttons={
            {type="toggle", label="FLY", key="fly"},
            {type="toggle", label="NOCLIP", key="noclip"},
            {type="toggle", label="SPEED PLAYER", key="speedplayer", hint="..."},
            {type="toggle", label="GHOST MOD", key="ghostmod"},
            {type="toggle", label="SPEED CAR", key="speedcar"},
            {type="toggle", label="REVIVE", key="revive"},
        }
    },
    {
        section="Player",
        buttons={
            {type="toggle", label="SPECTADOR", key="spectador"},
            {type="toggle", label="Marque", key="marque"},
        }
    }
},
["VISUAL"] = {
    {section="ESP",buttons={
        {type="toggle",label="ESP NAME", key="espname"},
        {type="toggle",label="ESP TRACE", key="esptrace"},
        {type="toggle",label="ESP BOX", key="espbox"},
        {type="toggle",label="ESP CORPO", key="espcorpo"},
        {type="toggle",label="ESP HEAD", key="esphead"},
        {type="toggle",label="ESP LIFE", key="esplife"}
    }},
    {section="Segurança", buttons={
        {type="toggle",label="STAFF LIST", key="stafflist"},
        {type="toggle",label="STAFF LINE", key="staffline"},
        {type="toggle",label="STAFF NAME", key="staffname"}
    }}
},
["PVP"] = {
    {section="PVP", buttons={
        {type="toggle",label="AIMLOCK", key="aimlock"}
    }}
},
["AUTO FARME"] = {
    {
        section = "AUTO FARME",
        buttons = {
            {type="row", buttons={
                {type="toggle", label="AUTO IFOOD", key="autoifood"},
                {type="toggle", label="AUTO ROTA", key="autorota"}
            }},
            {type="toggle", label="AUTO POSTE",         key="autoposte"},
            {type="toggle", label="AUTO MINA",          key="automina"}, -- Alterado aqui!
            {type="toggle", label="AUTO ELETRICA",      key="autoelet"},
            {type="toggle", label="AUTO IMPILHADEIRA",  key="autoimpilhadeira"},
            {type="toggle", label="AUTO LENHADOR",      key="autolenhador"},
        }
    }
},
["MORE"] = {
    {section="MORE", buttons={
        {type="button", label="FPS BOOST", key="fpsboost"},
        {type="toggle", label="Night Vision", key="nightvision"}
    }}
}
} 

local toggleStates = {} 

local function createToggle(parent, labelText, toggleKey)
    local button = Instance.new("Frame")
    button.Name = "ToggleButton"
    button.Size = UDim2.new(0, buttonWidth, 0, buttonHeight)
    button.BackgroundColor3 = colorButton
    button.Parent = parent 

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0,math.floor(buttonHeight*0.45))
    corner.Parent = button 

    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Text = labelText
    label.Font = fontButton
    label.TextSize = math.floor(buttonHeight*0.36)
    label.TextColor3 = Color3.fromRGB(255,255,255)
    label.BackgroundTransparency = 1
    label.Size = UDim2.new(0.65, 0, 1, 0)
    label.Position = UDim2.new(0,math.floor(buttonHeight*0.32),0,0)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = button 

    local toggle = Instance.new("TextButton")
    toggle.Name = "Switch"
    toggle.BackgroundColor3 = colorToggleOff
    toggle.Size = UDim2.new(0,math.floor(buttonHeight*1.1),0,math.floor(buttonHeight*0.57))
    toggle.Position = UDim2.new(1, -math.floor(buttonHeight*1.4), 0.5, -math.floor(buttonHeight*0.285))
    toggle.Text = ""
    toggle.Parent = button 

    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(1,0)
    toggleCorner.Parent = toggle 

    local circle = Instance.new("Frame")
    circle.Name = "Circle"
    circle.Size = UDim2.new(0,math.floor(buttonHeight*0.5),0,math.floor(buttonHeight*0.5))
    circle.Position = UDim2.new(0, 2, 0.5, -math.floor(buttonHeight*0.25))
    circle.BackgroundColor3 = Color3.fromRGB(10,10,10)
    circle.Parent = toggle 

    local circleCorner = Instance.new("UICorner")
    circleCorner.CornerRadius = UDim.new(1,0)
    circleCorner.Parent = circle 

    local toggled = toggleStates[toggleKey] or false
    local function updateToggle()
        if toggled then
            toggle.BackgroundColor3 = colorToggleOn
            circle.Position = UDim2.new(1, -math.floor(buttonHeight*0.5)-2, 0.5, -math.floor(buttonHeight*0.25))
        else
            toggle.BackgroundColor3 = colorToggleOff
            circle.Position = UDim2.new(0, 2, 0.5, -math.floor(buttonHeight*0.25))
        end
    end 

    toggle.MouseButton1Click:Connect(function()
        toggled = not toggled
        toggleStates[toggleKey] = toggled
        updateToggle()
        button:FindFirstChild("OnToggle",true):Fire(toggled)
    end) 

    local bindable = Instance.new("BindableEvent")
    bindable.Name = "OnToggle"
    bindable.Parent = button 

    bindable.Event:Connect(function(state)
        if toggleKey == "espname" then
            if state then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Gabs07802/Scripts-/main/Esp_name_on.lua"))()
            else
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Gabs07802/Scripts-/main/Esp_name_off.lua"))()
            end
        end
        if toggleKey == "esptrace" then
            if state then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Gabs07802/Scripts-/main/Esp_trace_on.lua"))()
            else
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Gabs07802/Scripts-/main/Esp_trace_off.lua"))()
            end
        end
        if toggleKey == "espbox" then
            if state then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Gabs07802/Scripts-/main/Esp_box_on.lua"))()
            else
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Gabs07802/Scripts-/main/Esp_box_off.lua"))()
            end
        end
        if toggleKey == "espcorpo" then
            if state then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Gabs07802/Scripts-/main/Esp_corpo_on.lua"))()
            else
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Gabs07802/Scripts-/main/Esp_corpo_off.lua"))()
            end
        end
        if toggleKey == "esphead" then
            if state then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Gabs07802/Scripts-/main/Esp_head_on.lua"))()
            else
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Gabs07802/Scripts-/main/Esp_head_off.lua"))()
            end
        end
        if toggleKey == "esplife" then
            if state then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Gabs07802/Scripts-/main/Esp_life_on.lua"))()
            else
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Gabs07802/Scripts-/main/Esp_life_off.lua"))()
            end
        end
        if toggleKey == "stafflist" then
            if state then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Gabs07802/Scripts-/main/STAFF_LIST_ON.lua"))()
            else
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Gabs07802/Scripts-/main/STAFF_LIST_OFF.lua"))()
            end
        end
        if toggleKey == "staffline" then
            if state then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Gabs07802/Scripts-/main/STAFF_LINE_ON.lua"))()
            else
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Gabs07802/Scripts-/main/STAFF_LINE_OFF.lua"))()
            end
        end
        if toggleKey == "staffname" then
            if state then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Gabs07802/Scripts-/main/STAFF_NAME_ON.lua"))()
            else
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Gabs07802/Scripts-/main/STAFF_NAME_OFF.lua"))()
            end
        end
        if toggleKey == "fly" then
            if state then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Gabs07802/Scripts-/main/FLY_ON.lua"))()
            else
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Gabs07802/Scripts-/main/Fly_off.lua"))()
            end
        end
        if toggleKey == "noclip" then
            if state then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Gabs07802/Scripts-/main/No_clip_on.lua"))()
            else
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Gabs07802/Scripts-/main/No_clip_off.lua"))()
            end
        end
        if toggleKey == "speedplayer" then
            if state then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Gabs07802/Scripts-/main/Speedcar_on.lia"))()
            else
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Gabs07802/Scripts-/main/Speedcar_off.lua"))()
            end
        end
        if toggleKey == "ghostmod" then
            if state then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Gabs07802/Scripts-/main/Ghost_on.lua"))()
            else
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Gabs07802/Scripts-/main/Ghost_off.lua"))()
            end
        end
        if toggleKey == "speedcar" then
            if state then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Gabs07802/Scripts-/main/Speedcar_on.lia"))()
            else
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Gabs07802/Scripts-/main/Speedcar_off.lua"))()
            end
        end
        if toggleKey == "revive" then
            if state then
                loadstring(game:HttpGet("LINK_DO_REVIVE_ON.lua"))()
            else
                loadstring(game:HttpGet("LINK_DO_REVIVE_OFF.lua"))()
            end
        end
        if toggleKey == "spectador" then
            if state then
                loadstring(game:HttpGet("LINK_DO_SPECTADOR_ON.lua"))()
            else
                loadstring(game:HttpGet("LINK_DO_SPECTADOR_OFF.lua"))()
            end
        end
        if toggleKey == "marque" then
            if state then
                loadstring(game:HttpGet("LINK_DO_MARQUE_ON.lua"))()
            else
                loadstring(game:HttpGet("LINK_DO_MARQUE_OFF.lua"))()
            end
        end
        if toggleKey == "aimlock" then
            if state then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Gabs07802/Scripts-/main/Aimlock_on.lua"))()
            else
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Gabs07802/Scripts-/main/Aimlock_off.lua"))()
            end
        end
        if toggleKey == "nightvision" then
            if state then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Gabs07802/Scripts-/main/Brilhomaximo_on.lua"))()
            else
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Gabs07802/Scripts-/main/Brilhomaximo_off.lua"))()
            end
        end 
        if toggleKey == "autoifood" then
            if state then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Gabs07802/AUTO-FARMS/main/AUTOFARME_FOOD_ON.lua"))()
            else
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Gabs07802/AUTO-FARMS/main/AUTOFARME_FOOD_OFF.lua"))()
            end
        end
        if toggleKey == "autoposte" then
            if state then
                loadstring(game:HttpGet("LINK_DO_farme_poste_ON.lua"))()
            else
                loadstring(game:HttpGet("LINK_DO_farme_poste_OFF.lua"))()
            end
        end
        if toggleKey == "automina" then -- Alterado aqui!
            if state then
                loadstring(game:HttpGet("LINK_DO_farme_mina_ON.lua"))()
            else
                loadstring(game:HttpGet("LINK_DO_farme_mina_OFF.lua"))()
            end
        end
        if toggleKey == "autoelet" then
            if state then
                loadstring(game:HttpGet("LINK_DO_farme_elet_ON.lua"))()
            else
                loadstring(game:HttpGet("LINK_DO_farme_elet_OFF.lua"))()
            end
        end
        if toggleKey == "autoimpilhadeira" then
            if state then
                loadstring(game:HttpGet("LINK_DO_farme_impilhadeira_ON.lua"))()
            else
                loadstring(game:HttpGet("LINK_DO_farme_impilhadeira_OFF.lua"))()
            end
        end
        if toggleKey == "autolenhador" then
            if state then
                loadstring(game:HttpGet("LINK_DO_farme_lenhador_ON.lua"))()
            else
                loadstring(game:HttpGet("LINK_DO_farme_lenhador_OFF.lua"))()
            end
        end
        if toggleKey == "autorota" then
            if state then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Gabs07802/AUTO-FARMS/main/AutoErva_on.lua"))() -- Coloque o link correto aqui
            else
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Gabs07802/AUTO-FARMS/main/AutoErva_off.lua"))() -- Coloque o link correto aqui
            end
        end
    end) 

    updateToggle()
    return button
end 

local function createButton(parent, labelText, key, hint)
    local button = Instance.new("TextButton")
    button.Name = "FunctionButton"
    button.Size = UDim2.new(0, buttonWidth, 0, buttonHeight)
    button.BackgroundColor3 = colorButton
    button.Text = ""
    button.AutoButtonColor = true
    button.Parent = parent 

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0,math.floor(buttonHeight*0.45))
    corner.Parent = button 

    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Text = labelText
    label.Font = fontButton
    label.TextSize = math.floor(buttonHeight*0.32)
    label.TextColor3 = Color3.fromRGB(255,255,255)
    label.BackgroundTransparency = 1
    label.Size = UDim2.new(0.77, 0, 1, 0)
    label.Position = UDim2.new(0,math.floor(buttonHeight*0.32),0,0)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = button 

    if hint then
        local hintBtn = Instance.new("TextButton")
        hintBtn.Name = "Hint"
        hintBtn.Size = UDim2.new(0,math.floor(buttonHeight*0.68),0,math.floor(buttonHeight*0.68))
        hintBtn.Position = UDim2.new(1,-math.floor(buttonHeight*0.88),0.5,-math.floor(buttonHeight*0.34))
        hintBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)
        hintBtn.Text = hint
        hintBtn.TextColor3 = Color3.fromRGB(200,200,200)
        hintBtn.Font = fontButton
        hintBtn.TextSize = math.floor(buttonHeight*0.32)
        hintBtn.AutoButtonColor = true
        hintBtn.Parent = button 

        local hintCorner = Instance.new("UICorner")
        hintCorner.CornerRadius = UDim.new(1,0)
        hintCorner.Parent = hintBtn
    end 

    local bindable = Instance.new("BindableEvent")
    bindable.Name = "OnClick"
    bindable.Parent = button 

    if key == "fpsboost" then
        local activated = false
        button.MouseButton1Click:Connect(function()
            if not activated then
                activated = true
                button.BackgroundColor3 = colorToggleOn
                 loadstring(game:HttpGet("https://raw.githubusercontent.com/Gabs07802/Scripts-/main/FPSBOOST.lua"))()
            end
        end)
    else
        button.MouseButton1Click:Connect(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Gabs07802/Scripts-/main/FPSBOOST.lua"))()
            bindable:Fire()
        end)
    end 

    return button
end 

local function clearTabs()
    for _,tab in ipairs(tabContainer:GetChildren()) do
        tab:Destroy()
    end
end 

local function showTab(tabName)
    clearTabs()
    local contentList = tabContents[tabName]
    if not contentList then return end 

    local nSections = #contentList
    local totalMargin = 20 * (nSections + 1)
    local sectionWidth = math.floor((tabContainer.AbsoluteSize.X - totalMargin)/math.max(nSections,1))
    local sectionMargin = 20 

    for s,section in ipairs(contentList) do
        local sectionFrame = Instance.new("Frame")
        sectionFrame.Name = "Section"..s
        sectionFrame.Size = UDim2.new(0,sectionWidth,1,-40)
        sectionFrame.Position = UDim2.new(0,sectionMargin + (s-1)*(sectionWidth+sectionMargin),0,20)
        sectionFrame.BackgroundTransparency = 0.2
        sectionFrame.BackgroundColor3 = Color3.fromRGB(60,60,60)
        sectionFrame.Parent = tabContainer 

        local sectionCorner = Instance.new("UICorner")
        sectionCorner.CornerRadius = UDim.new(0,math.floor(buttonHeight*0.45))
        sectionCorner.Parent = sectionFrame 

        local sectionLabel = Instance.new("TextLabel")
        sectionLabel.Name = "SectionLabel"
        sectionLabel.Text = section.section
        sectionLabel.Font = fontSection
        sectionLabel.TextSize = math.floor(buttonHeight*0.55)
        sectionLabel.TextColor3 = colorSectionTitle
        sectionLabel.BackgroundTransparency = 1
        sectionLabel.Position = UDim2.new(0, 0, 0, 0)
        sectionLabel.Size = UDim2.new(1, 0, 0, math.floor(buttonHeight*0.75))
        sectionLabel.Parent = sectionFrame 

        if tabName == "AUTO FARME" and section.buttons[1] and section.buttons[1].type == "row" then
            local layout = Instance.new("UIListLayout")
            layout.Padding = UDim.new(0,math.floor(buttonHeight*0.27))
            layout.FillDirection = Enum.FillDirection.Vertical
            layout.HorizontalAlignment = Enum.HorizontalAlignment.Left
            layout.SortOrder = Enum.SortOrder.LayoutOrder
            layout.Parent = sectionFrame

            local moderateSpace = math.floor(buttonWidth * 0.22)

            local rowFrame = Instance.new("Frame")
            rowFrame.BackgroundTransparency = 1
            rowFrame.Size = UDim2.new(1, 0, 0, buttonHeight)
            rowFrame.Parent = sectionFrame

            local btn1 = createToggle(rowFrame, section.buttons[1].buttons[1].label, section.buttons[1].buttons[1].key)
            btn1.Position = UDim2.new(0, 0, 0, 0)
            btn1.Size = UDim2.new(0, buttonWidth, 1, 0)

            local spacer = Instance.new("Frame")
            spacer.BackgroundTransparency = 1
            spacer.Size = UDim2.new(0, moderateSpace, 1, 0)
            spacer.Position = UDim2.new(0, buttonWidth+5, 0, 0)
            spacer.Parent = rowFrame

            local btn2 = createToggle(rowFrame, section.buttons[1].buttons[2].label, section.buttons[1].buttons[2].key)
            btn2.Position = UDim2.new(0, buttonWidth + moderateSpace + 10, 0, 0)
            btn2.Size = UDim2.new(0, buttonWidth, 1, 0)

            for i=2,#section.buttons do
                local btnData = section.buttons[i]
                if btnData.type == "toggle" then
                    local toggle = createToggle(sectionFrame, btnData.label, btnData.key)
                    toggle.LayoutOrder = i+1
                elseif btnData.type == "button" then
                    local btn = createButton(sectionFrame, btnData.label, btnData.key, btnData.hint)
                    btn.LayoutOrder = i+1
                end
            end
        else
            local layout = Instance.new("UIListLayout")
            layout.Padding = UDim.new(0,math.floor(buttonHeight*0.27))
            layout.FillDirection = Enum.FillDirection.Vertical
            layout.HorizontalAlignment = Enum.HorizontalAlignment.Left
            layout.SortOrder = Enum.SortOrder.LayoutOrder
            layout.Parent = sectionFrame 

            for i,btnData in ipairs(section.buttons) do
                if btnData.type == "toggle" then
                    local toggle = createToggle(sectionFrame, btnData.label, btnData.key)
                    toggle.LayoutOrder = i+1
                elseif btnData.type == "button" then
                    local btn = createButton(sectionFrame, btnData.label, btnData.key, btnData.hint)
                    btn.LayoutOrder = i+1
                end
            end
        end
    end
end

showTab("PLAYER") 

for tab,btn in pairs(sidebarButtons) do
    btn.MouseButton1Click:Connect(function()
        showTab(tab)
        for _,b in pairs(sidebarButtons) do
            b.TextColor3 = colorSidebarText
            b.Font = fontSidebar
        end
        btn.TextColor3 = colorSidebarTextActive
        btn.Font = Enum.Font.GothamBlack
    end)
end
sidebarButtons["PLAYER"].TextColor3 = colorSidebarTextActive
sidebarButtons["PLAYER"].Font = Enum.Font.GothamBlack 

local minimized = false
local minimizedPosition = nil
local normalPosition = menu.Position 

minimizeButton.MouseButton1Click:Connect(function()
    minimized = not minimized
    tabContainer.Visible = not minimized
    sidebar.Visible = not minimized
    titleLabel.Visible = not minimized 

    if minimized then
        normalPosition = menu.Position
        menu.Size = UDim2.new(0,math.floor(menuWidth*0.34),0,math.floor(menuHeight*0.15))
        if minimizedPosition then
            menu.Position = minimizedPosition
        else
            menu.Position = UDim2.new(0.04,0,0.16,0)
        end
        minimizeButton.Text = "+"
    else
        minimizedPosition = menu.Position
        menu.Size = UDim2.new(0,menuWidth,0,menuHeight)
        menu.Position = normalPosition
        minimizeButton.Text = "≡"
    end
end) 

local dragging = false
local dragStart, startPos 

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = menu.Position 

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
                if minimized then
                    minimizedPosition = menu.Position
                else
                    normalPosition = menu.Position
                end
            end
        end)
    end
end) 

titleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end) 

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        menu.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)
