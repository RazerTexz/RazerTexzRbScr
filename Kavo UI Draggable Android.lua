local Kavo = {}
local cons = {}

local ms = localPlayer:GetMouse()
local tween = game:GetService("TweenService")
local input = game:GetService("UserInputService")
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local coreGui = game:GetService("CoreGui")
local globalColor = Color3.fromRGB(255, 255, 255)
local globalColor2 = Color3.fromRGB(0, 0, 0)

local Objects = {}
function Kavo:DraggingEnabled(frame, parent)
    parent = parent or frame

    local dragging = false
    local dragInput, mousePos, framePos
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            mousePos = input.Position
            framePos = parent.Position
            table.insert(cons, input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end))
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end
    end)

    table.insert(cons, input.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - mousePos
            parent.Position = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
        end
    end))
end

local function tweenObject(obj, properties, duration, ...)
    tween:Create(obj, TweenInfo.new(duration, ...), properties):Play()
end

local themes = {
    SchemeColor = Color3.fromRGB(74, 99, 135),
    Background = Color3.fromRGB(36, 37, 43),
    Header = Color3.fromRGB(28, 29, 34),
    TextColor = globalColor,
    ElementColor = Color3.fromRGB(32, 32, 38)
}
local themeStyles = {
    DarkTheme = {
        SchemeColor = Color3.fromRGB(64, 64, 64),
        Background = globalColor2,
        Header = globalColor2,
        TextColor = globalColor,
        ElementColor = Color3.fromRGB(20, 20, 20)
    },
    LightTheme = {
        SchemeColor = Color3.fromRGB(150, 150, 150),
        Background = globalColor,
        Header = Color3.fromRGB(200, 200, 200),
        TextColor = globalColor2,
        ElementColor = Color3.fromRGB(224, 224, 224)
    },
    BloodTheme = {
        SchemeColor = Color3.fromRGB(227, 27, 27),
        Background = Color3.fromRGB(10, 10, 10),
        Header = Color3.fromRGB(5, 5, 5),
        TextColor = globalColor,
        ElementColor = Color3.fromRGB(20, 20, 20)
    },
    GrapeTheme = {
        SchemeColor = Color3.fromRGB(166, 71, 214),
        Background = Color3.fromRGB(64, 50, 71),
        Header = Color3.fromRGB(36, 28, 41),
        TextColor = globalColor,
        ElementColor = Color3.fromRGB(74, 58, 84)
    },
    Ocean = {
        SchemeColor = Color3.fromRGB(86, 76, 251),
        Background = Color3.fromRGB(26, 32, 58),
        Header = Color3.fromRGB(38, 45, 71),
        TextColor = Color3.fromRGB(200, 200, 200),
        ElementColor = Color3.fromRGB(38, 45, 71)
    },
    Midnight = {
        SchemeColor = Color3.fromRGB(26, 189, 158),
        Background = Color3.fromRGB(44, 62, 82),
        Header = Color3.fromRGB(57, 81, 105),
        TextColor = globalColor,
        ElementColor = Color3.fromRGB(52, 74, 95)
    },
    Sentinel = {
        SchemeColor = Color3.fromRGB(230, 35, 69),
        Background = Color3.fromRGB(32, 32, 32),
        Header = Color3.fromRGB(24, 24, 24),
        TextColor = Color3.fromRGB(119, 209, 138),
        ElementColor = Color3.fromRGB(24, 24, 24)
    },
    Synapse = {
        SchemeColor = Color3.fromRGB(46, 48, 43),
        Background = Color3.fromRGB(13, 15, 12),
        Header = Color3.fromRGB(36, 38, 35),
        TextColor = Color3.fromRGB(152, 99, 53),
        ElementColor = Color3.fromRGB(24, 24, 24)
    },
    Serpent = {
        SchemeColor = Color3.fromRGB(0, 166, 58),
        Background = Color3.fromRGB(31, 41, 43),
        Header = Color3.fromRGB(22, 29, 31),
        TextColor = globalColor,
        ElementColor = Color3.fromRGB(22, 29, 31)
    }
}
local oldTheme

local SettingsT = {}

local Name = "KavoConfig.JSON"
pcall(function()
    if not readfile(Name) then writefile(Name, game:GetService("HttpService"):JSONEncode(SettingsT)) end
    Settings = game:GetService("HttpService"):JSONEncode(readfile(Name))
end)

local LibName = tostring(math.random(1, 100))..tostring(math.random(1,50))..tostring(math.random(1, 100))
function Kavo:ToggleUI()
    coreGui[LibName].Enabled = not coreGui[LibName].Enabled
end

function Kavo.CreateLib(kavName, themeList)
    if not themeList then themeList = themes end
    if themeList == "DarkTheme" then themeList = themeStyles.DarkTheme
    elseif themeList == "LightTheme" then themeList = themeStyles.LightTheme
    elseif themeList == "BloodTheme" then themeList = themeStyles.BloodTheme
    elseif themeList == "GrapeTheme" then themeList = themeStyles.GrapeTheme
    elseif themeList == "Ocean" then themeList = themeStyles.Ocean
    elseif themeList == "Midnight" then themeList = themeStyles.Midnight
    elseif themeList == "Sentinel" then themeList = themeStyles.Sentinel
    elseif themeList == "Synapse" then themeList = themeStyles.Synapse
    elseif themeList == "Serpent" then themeList = themeStyles.Serpent
    else
        if not themeList.SchemeColor then themeList.SchemeColor = Color3.fromRGB(74, 99, 135)
        elseif not themeList.Background then themeList.Background = Color3.fromRGB(36, 37, 43)
        elseif not themeList.Header then themeList.Header = Color3.fromRGB(28, 29, 34)
        elseif not themeList.TextColor then themeList.TextColor = globalColor
        elseif not themeList.ElementColor then themeList.ElementColor = Color3.fromRGB(32, 32, 38)
        end
    end
    local themeList = themeList or {}
    local selectedTab 
    table.insert(Kavo, kavName)
    for _, v in coreGui:GetChildren() do
        if v.Name == kavName then v:Destroy() end
    end
    local ScreenGui = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local MainCorner = Instance.new("UICorner")
    local MainHeader = Instance.new("Frame")
    local headerCover = Instance.new("UICorner")
    local coverup = Instance.new("Frame")
    local title = Instance.new("TextLabel")
    local close = Instance.new("ImageButton")
    local MainSide = Instance.new("Frame")
    local sideCorner = Instance.new("UICorner")
    local coverup_2 = Instance.new("Frame")
    local tabFrames = Instance.new("Frame")
    local tabListing = Instance.new("UIListLayout")
    local pages = Instance.new("Frame")
    local Pages = Instance.new("Folder")
    local infoContainer = Instance.new("Frame")
    local blurFrame = Instance.new("Frame")

    Kavo:DraggingEnabled(MainHeader, Main)

    blurFrame.Name = "blurFrame"
    blurFrame.BackgroundColor3 = globalColor2
    blurFrame.BackgroundTransparency = 1
    blurFrame.BorderSizePixel = 0
    blurFrame.Position = UDim2.new(-0.0222222228, 0, -0.0371747203, 0)
    blurFrame.Size = UDim2.new(0, 376, 0, 289)
    blurFrame.ZIndex = 999
    blurFrame.Parent = pages

    ScreenGui.Name = LibName
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = coreGui

    Main.Name = "Main"
    Main.BackgroundColor3 = themeList.Background
    Main.ClipsDescendants = true
    Main.Position = UDim2.new(0.336503863, 0, 0.275485456, 0)
    Main.Size = UDim2.new(0, 525, 0, 318)
    Main.Parent = ScreenGui

    MainCorner.CornerRadius = UDim.new(0, 4)
    MainCorner.Name = "MainCorner"
    MainCorner.Parent = Main

    MainHeader.Name = "MainHeader"
    MainHeader.BackgroundColor3 = themeList.Header
    Objects[MainHeader] = "BackgroundColor3"
    MainHeader.Size = UDim2.new(0, 525, 0, 29)
    MainHeader.Parent = Main

    headerCover.CornerRadius = UDim.new(0, 4)
    headerCover.Name = "headerCover"
    headerCover.Parent = MainHeader

    coverup.Name = "coverup"
    coverup.BackgroundColor3 = themeList.Header
    Objects[coverup] = "BackgroundColor3"
    coverup.BorderSizePixel = 0
    coverup.Position = UDim2.new(0, 0, 0.758620679, 0)
    coverup.Size = UDim2.new(0, 525, 0, 7)
    coverup.Parent = MainHeader

    title.Name = "title"
    title.BackgroundColor3 = globalColor
    title.BackgroundTransparency = 1.000
    title.BorderSizePixel = 0
    title.Position = UDim2.new(0.0171428565, 0, 0.344827592, 0)
    title.Size = UDim2.new(0, 204, 0, 8)
    title.Font = Enum.Font.Gotham
    title.RichText = true
    title.Text = kavName
    title.TextColor3 = Color3.fromRGB(245, 245, 245)
    title.TextSize = 16.000
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = MainHeader

    close.Name = "close"
    close.BackgroundTransparency = 1.000
    close.Position = UDim2.new(0.949999988, 0, 0.137999997, 0)
    close.Size = UDim2.new(0, 21, 0, 21)
    close.ZIndex = 2
    close.Image = "rbxassetid://3926305904"
    close.ImageRectOffset = Vector2.new(284, 4)
    close.ImageRectSize = Vector2.new(24, 24)
    close.Parent = MainHeader
    close.MouseButton1Click:Connect(function()
        tween:Create(close, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {ImageTransparency = 1}):Play()
        task.wait()
        tween:Create(Main, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0, Main.AbsolutePosition.X + (Main.AbsoluteSize.X / 2), 0, Main.AbsolutePosition.Y + (Main.AbsoluteSize.Y / 2))}):Play()
        task.wait(1)
        for i, v in cons do
            v:Disconnect()
        	cons[i] = nil
        end
        cons = nil
        ScreenGui:Destroy()
    end)

    MainSide.Name = "MainSide"
    MainSide.BackgroundColor3 = themeList.Header
    Objects[MainSide] = "Header"
    MainSide.Position = UDim2.new(-7.4505806e-09, 0, 0.0911949649, 0)
    MainSide.Size = UDim2.new(0, 149, 0, 289)
    MainSide.Parent = Main

    sideCorner.CornerRadius = UDim.new(0, 4)
    sideCorner.Name = "sideCorner"
    sideCorner.Parent = MainSide

    coverup_2.Name = "coverup"
    coverup_2.BackgroundColor3 = themeList.Header
    Objects[coverup_2] = "Header"
    coverup_2.BorderSizePixel = 0
    coverup_2.Position = UDim2.new(0.949939311, 0, 0, 0)
    coverup_2.Size = UDim2.new(0, 7, 0, 289)
    coverup_2.Parent = MainSide

    tabFrames.Name = "tabFrames"
    tabFrames.BackgroundColor3 = globalColor
    tabFrames.BackgroundTransparency = 1.000
    tabFrames.Position = UDim2.new(0.0438990258, 0, -0.00066378375, 0)
    tabFrames.Size = UDim2.new(0, 135, 0, 283)
    tabFrames.Parent = MainSide

    tabListing.Name = "tabListing"
    tabListing.SortOrder = Enum.SortOrder.LayoutOrder
    tabListing.Parent = tabFrames

    pages.Name = "pages"
    pages.BackgroundColor3 = globalColor
    pages.BackgroundTransparency = 1.000
    pages.BorderSizePixel = 0
    pages.Position = UDim2.new(0.299047589, 0, 0.122641519, 0)
    pages.Size = UDim2.new(0, 360, 0, 269)
    pages.Parent = Main

    Pages.Name = "Pages"
    Pages.Parent = pages

    infoContainer.Name = "infoContainer"
    infoContainer.BackgroundColor3 = globalColor
    infoContainer.BackgroundTransparency = 1.000
    infoContainer.BorderColor3 = Color3.fromRGB(27, 42, 53)
    infoContainer.ClipsDescendants = true
    infoContainer.Position = UDim2.new(0.299047619, 0, 0.874213815, 0)
    infoContainer.Size = UDim2.new(0, 368, 0, 33)
    infoContainer.Parent = Main

    function Kavo:ChangeColor(prope,color)
        if prope == "Background" then 
            themeList.Background = color
            Main.BackgroundColor3 = themeList.Background
        elseif prope == "SchemeColor" then
            themeList.SchemeColor = color
        elseif prope == "Header" then
            MainHeader.BackgroundColor3 = color
            MainSide.BackgroundColor3 = color
            coverup_2.BackgroundColor3 = color
            coverup.BackgroundColor3 = color
        elseif prope == "TextColor" then
            themeList.TextColor = color
        elseif prope == "ElementColor" then
            themeList.ElementColor = color
        end
    end

    local Tabs = {}
    local first = true
    function Tabs:NewTab(tabName)
        local tabButton = Instance.new("TextButton")
        local UICorner = Instance.new("UICorner")
        local page = Instance.new("ScrollingFrame")
        local pageListing = Instance.new("UIListLayout")
        local function UpdateSize()
            local cS = pageListing.AbsoluteContentSize
            tween:Create(page, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {CanvasSize = UDim2.new(0, cS.X, 0, cS.Y)}):Play()
        end
        page.Name = "Page"
        page.Active = true
        page.BackgroundColor3 = themeList.Background
        page.BorderSizePixel = 0
        page.Position = UDim2.new(0, 0, -0.00371747208, 0)
        page.Size = UDim2.new(1, 0, 1, 0)
        page.ScrollBarThickness = 5
        page.Visible = false
        page.ScrollBarImageColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 16, themeList.SchemeColor.g * 255 - 15, themeList.SchemeColor.b * 255 - 28)
        page.Parent = Pages

        pageListing.Name = "pageListing"
        pageListing.SortOrder = Enum.SortOrder.LayoutOrder
        pageListing.Padding = UDim.new(0, 5)
        pageListing.Parent = page

        tabButton.Name = tabName.."TabButton"
        tabButton.BackgroundColor3 = themeList.SchemeColor
        Objects[tabButton] = "SchemeColor"
        tabButton.Size = UDim2.new(0, 135, 0, 28)
        tabButton.AutoButtonColor = false
        tabButton.Font = Enum.Font.Gotham
        tabButton.Text = tabName
        tabButton.TextColor3 = themeList.TextColor
        Objects[tabButton] = "TextColor3"
        tabButton.TextSize = 14.000
        tabButton.BackgroundTransparency = 1
        tabButton.Parent = tabFrames

        if first then
            first = false
            page.Visible = true
            tabButton.BackgroundTransparency = 0
            UpdateSize()
        else
            page.Visible = false
            tabButton.BackgroundTransparency = 1
        end

        UICorner.CornerRadius = UDim.new(0, 5)
        UICorner.Parent = tabButton
        
        table.insert(Tabs, tabName)

        UpdateSize()
        page.ChildAdded:Connect(UpdateSize)
        page.ChildRemoved:Connect(UpdateSize)

        tabButton.MouseButton1Click:Connect(function()
            UpdateSize()
            for _, v in Pages:GetChildren() do
                v.Visible = false
            end
            page.Visible = true
            for _, v in tabFrames:GetChildren() do
                if v:IsA("TextButton") then
                    tweenObject(v, {BackgroundTransparency = 1}, 0.2)
                end
            end
            tweenObject(tabButton, {BackgroundTransparency = 0}, 0.2)
        end)
        local Sections = {}
        local focusing = false
        local viewDe = false

        task.spawn(function()
            while task.wait(30) do
                page.BackgroundColor3 = themeList.Background
                page.ScrollBarImageColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 16, themeList.SchemeColor.g * 255 - 15, themeList.SchemeColor.b * 255 - 28)
                tabButton.TextColor3 = themeList.TextColor
                tabButton.BackgroundColor3 = themeList.SchemeColor
            end
        end)
        function Sections:NewSection(secName, hidden)
            local sectionFunctions = {}
            local modules = {}
            local sectionFrame = Instance.new("Frame")
            local sectionlistoknvm = Instance.new("UIListLayout")
            local sectionHead = Instance.new("Frame")
            local sHeadCorner = Instance.new("UICorner")
            local sectionName = Instance.new("TextLabel")
            local sectionInners = Instance.new("Frame")
            local sectionElListing = Instance.new("UIListLayout")

            sectionHead.Visible = not hidden

            sectionFrame.Name = "sectionFrame"
            sectionFrame.BackgroundColor3 = themeList.Background--36, 37, 43
            sectionFrame.BorderSizePixel = 0
            sectionFrame.Parent = page

            sectionlistoknvm.Name = "sectionlistoknvm"
            sectionlistoknvm.SortOrder = Enum.SortOrder.LayoutOrder
            sectionlistoknvm.Padding = UDim.new(0, 5)
            sectionlistoknvm.Parent = sectionFrame

            for _, v in sectionInners:GetChildren() do
                if v:IsA("Frame") or v:IsA("TextButton") then
                    v.Changed:Connect(function(pro)
                        if pro == "Size" then
                            UpdateSize()
                            updateSectionFrame()
                        end
                    end)
                end
            end

            sectionHead.Name = "sectionHead"
            sectionHead.BackgroundColor3 = themeList.SchemeColor
            Objects[sectionHead] = "BackgroundColor3"
            sectionHead.Size = UDim2.new(0, 352, 0, 33)
            sectionHead.Parent = sectionFrame

            sHeadCorner.CornerRadius = UDim.new(0, 4)
            sHeadCorner.Name = "sHeadCorner"
            sHeadCorner.Parent = sectionHead

            sectionName.Name = "sectionName"
            sectionName.BackgroundColor3 = globalColor
            sectionName.BackgroundTransparency = 1.000
            sectionName.BorderColor3 = Color3.fromRGB(27, 42, 53)
            sectionName.Position = UDim2.new(0.0198863633, 0, 0, 0)
            sectionName.Size = UDim2.new(0.980113626, 0, 1, 0)
            sectionName.Font = Enum.Font.Gotham
            sectionName.Text = secName
            sectionName.RichText = true
            sectionName.TextColor3 = themeList.TextColor
            Objects[sectionName] = "TextColor3"
            sectionName.TextSize = 14.000
            sectionName.TextXAlignment = Enum.TextXAlignment.Left
            sectionName.Parent = sectionHead

            sectionInners.Name = "sectionInners"
            sectionInners.BackgroundColor3 = globalColor
            sectionInners.BackgroundTransparency = 1.000
            sectionInners.Position = UDim2.new(0, 0, 0.190751448, 0)
            sectionInners.Parent = sectionFrame

            sectionElListing.Name = "sectionElListing"
            sectionElListing.SortOrder = Enum.SortOrder.LayoutOrder
            sectionElListing.Padding = UDim.new(0, 3)
            sectionElListing.Parent = sectionInners

            task.spawn(function()
                while task.wait(30) do
                    sectionFrame.BackgroundColor3 = themeList.Background
                    sectionHead.BackgroundColor3 = themeList.SchemeColor
                    tabButton.TextColor3 = themeList.TextColor
                    tabButton.BackgroundColor3 = themeList.SchemeColor
                    sectionName.TextColor3 = themeList.TextColor
                end
            end)
            local function updateSectionFrame()
                sectionInners.Size = UDim2.new(1, 0, 0, sectionElListing.AbsoluteContentSize.Y)
                sectionFrame.Size = UDim2.new(0, 352, 0, sectionlistoknvm.AbsoluteContentSize.Y)
            end
            updateSectionFrame()
            UpdateSize()
            local Elements = {}
            function Elements:NewButton(bname, tipINf, callback)
                --local showLogo = showLogo or true
                local ButtonFunction = {}

                local buttonElement = Instance.new("TextButton")
                local UICorner = Instance.new("UICorner")
                local btnInfo = Instance.new("TextLabel")
                local viewInfo = Instance.new("ImageButton")
                local touch = Instance.new("ImageLabel")
                local Sample = Instance.new("ImageLabel")

                table.insert(modules, bname)

                buttonElement.Name = bname
                buttonElement.BackgroundColor3 = themeList.ElementColor
                buttonElement.ClipsDescendants = true
                buttonElement.Size = UDim2.new(0, 352, 0, 33)
                buttonElement.AutoButtonColor = false
                buttonElement.Font = Enum.Font.SourceSans
                buttonElement.Text = ""
                buttonElement.TextColor3 = globalColor2
                buttonElement.TextSize = 14.000
                Objects[buttonElement] = "BackgroundColor3"
                buttonElement.Parent = sectionInners

                UICorner.CornerRadius = UDim.new(0, 4)
                UICorner.Parent = buttonElement

                viewInfo.Name = "viewInfo"
                viewInfo.BackgroundTransparency = 1.000
                viewInfo.LayoutOrder = 9
                viewInfo.Position = UDim2.new(0.930000007, 0, 0.151999995, 0)
                viewInfo.Size = UDim2.new(0, 23, 0, 23)
                viewInfo.ZIndex = 2
                viewInfo.Image = "rbxassetid://3926305904"
                viewInfo.ImageColor3 = themeList.SchemeColor
                Objects[viewInfo] = "ImageColor3"
                viewInfo.ImageRectOffset = Vector2.new(764, 764)
                viewInfo.ImageRectSize = Vector2.new(36, 36)
                viewInfo.Parent = buttonElement

                Sample.Name = "Sample"
                Sample.BackgroundColor3 = globalColor
                Sample.BackgroundTransparency = 1.000
                Sample.Image = "http://www.roblox.com/asset/?id=4560909609"
                Sample.ImageColor3 = themeList.SchemeColor
                Objects[Sample] = "ImageColor3"
                Sample.ImageTransparency = 0.600
                Sample.Parent = buttonElement

                local moreInfo = Instance.new("TextLabel")
                local UICorner = Instance.new("UICorner")
                moreInfo.Name = "TipMore"
                moreInfo.BackgroundColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 14, themeList.SchemeColor.g * 255 - 17, themeList.SchemeColor.b * 255 - 13)
                moreInfo.Position = UDim2.new(0, 0, 2, 0)
                moreInfo.Size = UDim2.new(0, 353, 0, 33)
                moreInfo.ZIndex = 9
                moreInfo.Font = Enum.Font.GothamSemibold
                moreInfo.Text = "  "..tipINf
                moreInfo.RichText = true
                moreInfo.TextColor3 = themeList.TextColor
                Objects[moreInfo] = "TextColor3"
                moreInfo.TextSize = 14.000
                moreInfo.TextXAlignment = Enum.TextXAlignment.Left
                Objects[moreInfo] = "BackgroundColor3"
                moreInfo.Parent = infoContainer

                UICorner.CornerRadius = UDim.new(0, 4)
                UICorner.Parent = moreInfo

                touch.Name = "touch"
                touch.BackgroundColor3 = globalColor
                touch.BackgroundTransparency = 1.000
                touch.BorderColor3 = Color3.fromRGB(27, 42, 53)
                touch.Position = UDim2.new(0.0199999996, 0, 0.180000007, 0)
                touch.Size = UDim2.new(0, 21, 0, 21)
                touch.Image = "rbxassetid://3926305904"
                touch.ImageColor3 = themeList.SchemeColor
                Objects[touch] = "SchemeColor"
                touch.ImageRectOffset = Vector2.new(84, 204)
                touch.ImageRectSize = Vector2.new(36, 36)
                touch.ImageTransparency = 0
                touch.Parent = buttonElement

                btnInfo.Name = "btnInfo"
                btnInfo.BackgroundColor3 = globalColor
                btnInfo.BackgroundTransparency = 1.000
                btnInfo.Position = UDim2.new(0.096704483, 0, 0.272727281, 0)
                btnInfo.Size = UDim2.new(0, 314, 0, 14)
                btnInfo.Font = Enum.Font.GothamSemibold
                btnInfo.Text = bname
                btnInfo.RichText = true
                btnInfo.TextColor3 = themeList.TextColor
                Objects[btnInfo] = "TextColor3"
                btnInfo.TextSize = 14.000
                btnInfo.TextXAlignment = Enum.TextXAlignment.Left
                btnInfo.Parent = buttonElement

                updateSectionFrame()
                UpdateSize()

                local btn = buttonElement
                btn.MouseButton1Click:Connect(function()
                    if not focusing then
                        callback()
                        local c = Sample:Clone()
                        local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
                        c.Position = UDim2.new(0, x, 0, y)
                        c.Parent = btn
                        local size = if btn.AbsoluteSize.X >= btn.AbsoluteSize.Y then btn.AbsoluteSize.X * 1.5 else btn.AbsoluteSize.Y * 1.5
                        c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', 0.35, true, nil)
                        for i = 1, 10 do
                            c.ImageTransparency += 0.05
                            task.wait(0.35 / 12)
                        end
                        c:Destroy()
                    else
                        for _, v in infoContainer:GetChildren() do
                            tweenObject(v, {Position = UDim2.new(0, 0, 2, 0)}, 0.2)
                            focusing = false
                        end
                        tweenObject(blurFrame, {BackgroundTransparency = 1}, 0.2)
                    end
                end)
                local hovering = false
                btn.MouseEnter:Connect(function()
                    if not focusing then
                        tween:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {BackgroundColor3 = Color3.fromRGB(themeList.ElementColor.r * 255 + 8, themeList.ElementColor.g * 255 + 9, themeList.ElementColor.b * 255 + 10)}):Play()
                        hovering = true
                    end
                end)
                btn.MouseLeave:Connect(function()
                    if not focusing then 
                        tween:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {BackgroundColor3 = themeList.ElementColor}):Play()
                        hovering = false
                    end
                end)
                viewInfo.MouseButton1Click:Connect(function()
                    if not viewDe then
                        viewDe = true
                        focusing = true
                        for _, v in infoContainer:GetChildren() do
                            if v ~= moreInfo then tweenObject(v, {Position = UDim2.new(0, 0, 2, 0)}, 0.2) end
                        end
                        tweenObject(moreInfo, {Position = UDim2.new(0, 0, 0, 0)}, 0.2)
                        tweenObject(blurFrame, {BackgroundTransparency = 0.5}, 0.2)
                        tweenObject(btn, {BackgroundColor3 = themeList.ElementColor}, 0.2)
                        task.wait(1.5)
                        focusing = false
                        tweenObject(moreInfo, {Position = UDim2.new(0, 0, 2, 0)}, 0.2)
                        tweenObject(blurFrame, {BackgroundTransparency = 1}, 0.2)
                        task.wait(0)
                        viewDe = false
                    end
                end)
                task.spawn(function()
                    while task.wait(30) do
                        if not hovering then buttonElement.BackgroundColor3 = themeList.ElementColor end
                        viewInfo.ImageColor3 = themeList.SchemeColor
                        Sample.ImageColor3 = themeList.SchemeColor
                        moreInfo.BackgroundColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 14, themeList.SchemeColor.g * 255 - 17, themeList.SchemeColor.b * 255 - 13)
                        moreInfo.TextColor3 = themeList.TextColor
                        touch.ImageColor3 = themeList.SchemeColor
                        btnInfo.TextColor3 = themeList.TextColor
                    end
                end)
                function ButtonFunction:UpdateButton(newTitle)
                    btnInfo.Text = newTitle
                end
                return ButtonFunction
            end
            function Elements:NewTextBox(tname, tTip, callback)
                local textboxElement = Instance.new("TextButton")
                local UICorner = Instance.new("UICorner")
                local viewInfo = Instance.new("ImageButton")
                local write = Instance.new("ImageLabel")
                local TextBox = Instance.new("TextBox")
                local UICorner_2 = Instance.new("UICorner")
                local togName = Instance.new("TextLabel")

                textboxElement.Name = "textboxElement"
                textboxElement.BackgroundColor3 = themeList.ElementColor
                textboxElement.ClipsDescendants = true
                textboxElement.Size = UDim2.new(0, 352, 0, 33)
                textboxElement.AutoButtonColor = false
                textboxElement.Font = Enum.Font.SourceSans
                textboxElement.Text = ""
                textboxElement.TextColor3 = globalColor2
                textboxElement.TextSize = 14.000
                textboxElement.Parent = sectionInners

                UICorner.CornerRadius = UDim.new(0, 4)
                UICorner.Parent = textboxElement

                viewInfo.Name = "viewInfo"
                viewInfo.BackgroundTransparency = 1.000
                viewInfo.LayoutOrder = 9
                viewInfo.Position = UDim2.new(0.930000007, 0, 0.151999995, 0)
                viewInfo.Size = UDim2.new(0, 23, 0, 23)
                viewInfo.ZIndex = 2
                viewInfo.Image = "rbxassetid://3926305904"
                viewInfo.ImageColor3 = themeList.SchemeColor
                viewInfo.ImageRectOffset = Vector2.new(764, 764)
                viewInfo.ImageRectSize = Vector2.new(36, 36)
                viewInfo.Parent = textboxElement

                write.Name = "write"
                write.BackgroundColor3 = globalColor
                write.BackgroundTransparency = 1.000
                write.BorderColor3 = Color3.fromRGB(27, 42, 53)
                write.Position = UDim2.new(0.0199999996, 0, 0.180000007, 0)
                write.Size = UDim2.new(0, 21, 0, 21)
                write.Image = "rbxassetid://3926305904"
                write.ImageColor3 = themeList.SchemeColor
                write.ImageRectOffset = Vector2.new(324, 604)
                write.ImageRectSize = Vector2.new(36, 36)
                write.Parent = textboxElement

                TextBox.BackgroundColor3 = Color3.fromRGB(themeList.ElementColor.r * 255 - 6, themeList.ElementColor.g * 255 - 6, themeList.ElementColor.b * 255 - 7)
                TextBox.BorderSizePixel = 0
                TextBox.ClipsDescendants = true
                TextBox.Position = UDim2.new(0.488749921, 0, 0.212121218, 0)
                TextBox.Size = UDim2.new(0, 150, 0, 18)
                TextBox.ZIndex = 99
                TextBox.ClearTextOnFocus = false
                TextBox.Font = Enum.Font.Gotham
                TextBox.PlaceholderColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 19, themeList.SchemeColor.g * 255 - 26, themeList.SchemeColor.b * 255 - 35)
                TextBox.PlaceholderText = "Type here!"
                TextBox.Text = ""
                TextBox.TextColor3 = themeList.SchemeColor
                TextBox.TextSize = 12.000
                TextBox.Parent = textboxElement

                UICorner_2.CornerRadius = UDim.new(0, 4)
                UICorner_2.Parent = TextBox

                togName.Name = "togName"
                togName.BackgroundColor3 = globalColor
                togName.BackgroundTransparency = 1.000
                togName.Position = UDim2.new(0.096704483, 0, 0.272727281, 0)
                togName.Size = UDim2.new(0, 138, 0, 14)
                togName.Font = Enum.Font.GothamSemibold
                togName.Text = tname
                togName.RichText = true
                togName.TextColor3 = themeList.TextColor
                togName.TextSize = 14.000
                togName.TextXAlignment = Enum.TextXAlignment.Left
                togName.Parent = textboxElement

                local moreInfo = Instance.new("TextLabel")
                local UICorner = Instance.new("UICorner")

                moreInfo.Name = "TipMore"
                moreInfo.BackgroundColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 14, themeList.SchemeColor.g * 255 - 17, themeList.SchemeColor.b * 255 - 13)
                moreInfo.Position = UDim2.new(0, 0, 2, 0)
                moreInfo.Size = UDim2.new(0, 353, 0, 33)
                moreInfo.ZIndex = 9
                moreInfo.Font = Enum.Font.GothamSemibold
                moreInfo.RichText = true
                moreInfo.Text = "  "..tTip
                moreInfo.TextColor3 = globalColor
                moreInfo.TextSize = 14.000
                moreInfo.TextXAlignment = Enum.TextXAlignment.Left
                moreInfo.Parent = infoContainer

                UICorner.CornerRadius = UDim.new(0, 4)
                UICorner.Parent = moreInfo

                updateSectionFrame()
                UpdateSize()
            
                local btn = textboxElement
                btn.MouseButton1Click:Connect(function()
                    if focusing then
                        for _, v in infoContainer:GetChildren() do
                            tweenObject(v, {Position = UDim2.new(0, 0, 2, 0)}, 0.2)
                            focusing = false
                        end
                        tweenObject(blurFrame, {BackgroundTransparency = 1}, 0.2)
                    end
                end)
                local hovering = false
                btn.MouseEnter:Connect(function()
                    if not focusing then
                        tween:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {BackgroundColor3 = Color3.fromRGB(themeList.ElementColor.r * 255 + 8, themeList.ElementColor.g * 255 + 9, themeList.ElementColor.b * 255 + 10)}):Play()
                        hovering = true
                    end 
                end)

                btn.MouseLeave:Connect(function()
                    if not focusing then
                        tween:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {BackgroundColor3 = themeList.ElementColor}):Play()
                        hovering = false
                    end
                end)

                TextBox.FocusLost:Connect(function(EnterPressed)
                    if focusing then
                        for _, v in infoContainer:GetChildren() do
                            tweenObject(v, {Position = UDim2.new(0, 0, 2, 0)}, 0.2)
                            focusing = false
                        end
                        tweenObject(blurFrame, {BackgroundTransparency = 1}, 0.2)
                    end
                    if not EnterPressed then 
                        return
                    else
                        callback(TextBox.Text)
                        task.wait(0.18)
                        TextBox.Text = ""  
                    end
                end)

                viewInfo.MouseButton1Click:Connect(function()
                    if not viewDe then
                        viewDe = true
                        focusing = true
                        for _, v in infoContainer:GetChildren() do
                            if v ~= moreInfo then tweenObject(v, {Position = UDim2.new(0, 0, 2, 0)}, 0.2) end
                        end
                        tweenObject(moreInfo, {Position = UDim2.new(0, 0, 0, 0)}, 0.2)
                        tweenObject(blurFrame, {BackgroundTransparency = 0.5}, 0.2)
                        tweenObject(btn, {BackgroundColor3 = themeList.ElementColor}, 0.2)
                        task.wait(1.5)
                        focusing = false
                        tweenObject(moreInfo, {Position = UDim2.new(0, 0, 2, 0)}, 0.2)
                        tweenObject(blurFrame, {BackgroundTransparency = 1}, 0.2)
                        task.wait(0)
                        viewDe = false
                    end
                end)
                task.spawn(function()
                    while task.wait(30) do
                        if not hovering then textboxElement.BackgroundColor3 = themeList.ElementColor end
                        TextBox.BackgroundColor3 = Color3.fromRGB(themeList.ElementColor.r * 255 - 6, themeList.ElementColor.g * 255 - 6, themeList.ElementColor.b * 255 - 7)
                        viewInfo.ImageColor3 = themeList.SchemeColor
                        moreInfo.BackgroundColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 14, themeList.SchemeColor.g * 255 - 17, themeList.SchemeColor.b * 255 - 13)
                        moreInfo.TextColor3 = themeList.TextColor
                        write.ImageColor3 = themeList.SchemeColor
                        togName.TextColor3 = themeList.TextColor
                        TextBox.PlaceholderColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 19, themeList.SchemeColor.g * 255 - 26, themeList.SchemeColor.b * 255 - 35)
                        TextBox.TextColor3 = themeList.SchemeColor
                    end
                end)
            end
            function Elements:NewToggle(tname, nTip, callback)
                local TogFunction = {}
                local toggled = false
                table.insert(SettingsT, tname)

                local toggleElement = Instance.new("TextButton")
                local UICorner = Instance.new("UICorner")
                local toggleDisabled = Instance.new("ImageLabel")
                local toggleEnabled = Instance.new("ImageLabel")
                local togName = Instance.new("TextLabel")
                local viewInfo = Instance.new("ImageButton")
                local Sample = Instance.new("ImageLabel")

                toggleElement.Name = "toggleElement"
                toggleElement.BackgroundColor3 = themeList.ElementColor
                toggleElement.ClipsDescendants = true
                toggleElement.Size = UDim2.new(0, 352, 0, 33)
                toggleElement.AutoButtonColor = false
                toggleElement.Font = Enum.Font.SourceSans
                toggleElement.Text = ""
                toggleElement.TextColor3 = globalColor2
                toggleElement.TextSize = 14.000
                toggleElement.Parent = sectionInners

                UICorner.CornerRadius = UDim.new(0, 4)
                UICorner.Parent = toggleElement

                toggleDisabled.Name = "toggleDisabled"
                toggleDisabled.BackgroundColor3 = globalColor
                toggleDisabled.BackgroundTransparency = 1.000
                toggleDisabled.Position = UDim2.new(0.0199999996, 0, 0.180000007, 0)
                toggleDisabled.Size = UDim2.new(0, 21, 0, 21)
                toggleDisabled.Image = "rbxassetid://3926309567"
                toggleDisabled.ImageColor3 = themeList.SchemeColor
                toggleDisabled.ImageRectOffset = Vector2.new(628, 420)
                toggleDisabled.ImageRectSize = Vector2.new(48, 48)
                toggleDisabled.Parent = toggleElement

                toggleEnabled.Name = "toggleEnabled"
                toggleEnabled.BackgroundColor3 = globalColor
                toggleEnabled.BackgroundTransparency = 1.000
                toggleEnabled.Position = UDim2.new(0.0199999996, 0, 0.180000007, 0)
                toggleEnabled.Size = UDim2.new(0, 21, 0, 21)
                toggleEnabled.Image = "rbxassetid://3926309567"
                toggleEnabled.ImageColor3 = themeList.SchemeColor
                toggleEnabled.ImageRectOffset = Vector2.new(784, 420)
                toggleEnabled.ImageRectSize = Vector2.new(48, 48)
                toggleEnabled.ImageTransparency = 1.000
                toggleEnabled.Parent = toggleElement

                togName.Name = "togName"
                togName.BackgroundColor3 = globalColor
                togName.BackgroundTransparency = 1.000
                togName.Position = UDim2.new(0.096704483, 0, 0.272727281, 0)
                togName.Size = UDim2.new(0, 288, 0, 14)
                togName.Font = Enum.Font.GothamSemibold
                togName.Text = tname
                togName.RichText = true
                togName.TextColor3 = themeList.TextColor
                togName.TextSize = 14.000
                togName.TextXAlignment = Enum.TextXAlignment.Left
                togName.Parent = toggleElement

                viewInfo.Name = "viewInfo"
                viewInfo.BackgroundTransparency = 1.000
                viewInfo.LayoutOrder = 9
                viewInfo.Position = UDim2.new(0.930000007, 0, 0.151999995, 0)
                viewInfo.Size = UDim2.new(0, 23, 0, 23)
                viewInfo.ZIndex = 2
                viewInfo.Image = "rbxassetid://3926305904"
                viewInfo.ImageColor3 = themeList.SchemeColor
                viewInfo.ImageRectOffset = Vector2.new(764, 764)
                viewInfo.ImageRectSize = Vector2.new(36, 36)
                viewInfo.Parent = toggleElement

                Sample.Name = "Sample"
                Sample.BackgroundColor3 = globalColor
                Sample.BackgroundTransparency = 1.000
                Sample.Image = "http://www.roblox.com/asset/?id=4560909609"
                Sample.ImageColor3 = themeList.SchemeColor
                Sample.ImageTransparency = 0.600
                Sample.Parent = toggleElement

                local moreInfo = Instance.new("TextLabel")
                local UICorner = Instance.new("UICorner")

                moreInfo.Name = "TipMore"
                moreInfo.BackgroundColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 14, themeList.SchemeColor.g * 255 - 17, themeList.SchemeColor.b * 255 - 13)
                moreInfo.Position = UDim2.new(0, 0, 2, 0)
                moreInfo.Size = UDim2.new(0, 353, 0, 33)
                moreInfo.ZIndex = 9
                moreInfo.Font = Enum.Font.GothamSemibold
                moreInfo.RichText = true
                moreInfo.Text = "  "..nTip
                moreInfo.TextColor3 = themeList.TextColor
                moreInfo.TextSize = 14.000
                moreInfo.TextXAlignment = Enum.TextXAlignment.Left
                moreInfo.Parent = infoContainer

                UICorner.CornerRadius = UDim.new(0, 4)
                UICorner.Parent = moreInfo

                local btn = toggleElement

                updateSectionFrame()
                UpdateSize()

                btn.MouseButton1Click:Connect(function()
                    if not focusing then
                        if not toggled then
                            tween:Create(toggleEnabled, TweenInfo.new(0.11, Enum.EasingStyle.Linear,Enum.EasingDirection.In), {ImageTransparency = 0}):Play()
                            local c = Sample:Clone()
                            local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
                            c.Position = UDim2.new(0, x, 0, y)
                            c.Parent = btn
                            local size = if btn.AbsoluteSize.X >= btn.AbsoluteSize.Y then btn.AbsoluteSize.X * 1.5 else btn.AbsoluteSize.Y * 1.5
                            c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', 0.35, true, nil)
                            for i = 1, 10 do
                                c.ImageTransparency += 0.05
                                task.wait(0.35 / 12)
                            end
                            c:Destroy()
                        else
                            tween:Create(toggleEnabled, TweenInfo.new(0.11, Enum.EasingStyle.Linear,Enum.EasingDirection.In), {ImageTransparency = 1}):Play()
                            local c = Sample:Clone()
                            local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
                            c.Position = UDim2.new(0, x, 0, y)
                            c.Parent = btn
                            local size = if btn.AbsoluteSize.X >= btn.AbsoluteSize.Y then btn.AbsoluteSize.X * 1.5 else btn.AbsoluteSize.Y * 1.5
                            c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', 0.35, true, nil)
                            for i = 1, 10 do
                                c.ImageTransparency += 0.05
                                task.wait(0.35 / 12)
                            end
                            c:Destroy()
                        end
                        toggled = not toggled
                        callback(toggled)
                    else
                        for _, v in infoContainer:GetChildren() do
                            tweenObject(v, {Position = UDim2.new(0, 0, 2, 0)}, 0.2)
                            focusing = false
                        end
                        tweenObject(blurFrame, {BackgroundTransparency = 1}, 0.2)
                    end
                end)
                local hovering = false
                btn.MouseEnter:Connect(function()
                    if not focusing then
                        tween:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {BackgroundColor3 = Color3.fromRGB(themeList.ElementColor.r * 255 + 8, themeList.ElementColor.g * 255 + 9, themeList.ElementColor.b * 255 + 10)}):Play()
                        hovering = true
                    end 
                end)
                btn.MouseLeave:Connect(function()
                    if not focusing then
                        tween:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {BackgroundColor3 = themeList.ElementColor}):Play()
                        hovering = false
                    end
                end)

                task.spawn(function()
                    while task.wait(30) do
                        if not hovering then toggleElement.BackgroundColor3 = themeList.ElementColor end
                        toggleDisabled.ImageColor3 = themeList.SchemeColor
                        toggleEnabled.ImageColor3 = themeList.SchemeColor
                        togName.TextColor3 = themeList.TextColor
                        viewInfo.ImageColor3 = themeList.SchemeColor
                        Sample.ImageColor3 = themeList.SchemeColor
                        moreInfo.BackgroundColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 14, themeList.SchemeColor.g * 255 - 17, themeList.SchemeColor.b * 255 - 13)
                        moreInfo.TextColor3 = themeList.TextColor
                    end
                end)
                viewInfo.MouseButton1Click:Connect(function()
                    if not viewDe then
                        viewDe = true
                        focusing = true
                        for _, v in infoContainer:GetChildren() do
                            if v ~= moreInfo then tweenObject(v, {Position = UDim2.new(0, 0, 2, 0)}, 0.2) end
                        end
                        tweenObject(moreInfo, {Position = UDim2.new(0, 0, 0, 0)}, 0.2)
                        tweenObject(blurFrame, {BackgroundTransparency = 0.5}, 0.2)
                        tweenObject(btn, {BackgroundColor3 = themeList.ElementColor}, 0.2)
                        task.wait(1.5)
                        focusing = false
                        tweenObject(moreInfo, {Position = UDim2.new(0, 0, 2, 0)}, 0.2)
                        tweenObject(blurFrame, {BackgroundTransparency = 1}, 0.2)
                        task.wait(0)
                        viewDe = false
                    end
                end)
                function TogFunction:UpdateToggle(newText, isTogOn)
                    isTogOn = isTogOn or toggle
                    togName.Text = newText
                    if isTogOn then
                        toggled = true
                        tween:Create(toggleEnabled, TweenInfo.new(0.11, Enum.EasingStyle.Linear,Enum.EasingDirection.In), {ImageTransparency = 0}):Play()
                        callback(toggled)
                    else
                        toggled = false
                        tween:Create(toggleEnabled, TweenInfo.new(0.11, Enum.EasingStyle.Linear,Enum.EasingDirection.In), {ImageTransparency = 1}):Play()
                        callback(toggled)
                    end
                end
                return TogFunction
            end
            function Elements:NewSlider(slidInf, slidTip, maxvalue, minvalue, callback)
                --local startVal = startVal or 0

                local sliderElement = Instance.new("TextButton")
                local UICorner = Instance.new("UICorner")
                local togName = Instance.new("TextLabel")
                local viewInfo = Instance.new("ImageButton")
                local sliderBtn = Instance.new("TextButton")
                local UICorner_2 = Instance.new("UICorner")
                local UIListLayout = Instance.new("UIListLayout")
                local sliderDrag = Instance.new("Frame")
                local UICorner_3 = Instance.new("UICorner")
                local write = Instance.new("ImageLabel")
                local val = Instance.new("TextLabel")

                sliderElement.Name = "sliderElement"
                sliderElement.BackgroundColor3 = themeList.ElementColor
                sliderElement.ClipsDescendants = true
                sliderElement.Size = UDim2.new(0, 352, 0, 33)
                sliderElement.AutoButtonColor = false
                sliderElement.Font = Enum.Font.SourceSans
                sliderElement.Text = ""
                sliderElement.TextColor3 = globalColor2
                sliderElement.TextSize = 14.000
                sliderElement.Parent = sectionInners

                UICorner.CornerRadius = UDim.new(0, 4)
                UICorner.Parent = sliderElement

                togName.Name = "togName"
                togName.BackgroundColor3 = globalColor
                togName.BackgroundTransparency = 1.000
                togName.Position = UDim2.new(0.096704483, 0, 0.272727281, 0)
                togName.Size = UDim2.new(0, 138, 0, 14)
                togName.Font = Enum.Font.GothamSemibold
                togName.Text = slidInf
                togName.RichText = true
                togName.TextColor3 = themeList.TextColor
                togName.TextSize = 14.000
                togName.TextXAlignment = Enum.TextXAlignment.Left
                togName.Parent = sliderElement

                viewInfo.Name = "viewInfo"
                viewInfo.BackgroundTransparency = 1.000
                viewInfo.LayoutOrder = 9
                viewInfo.Position = UDim2.new(0.930000007, 0, 0.151999995, 0)
                viewInfo.Size = UDim2.new(0, 23, 0, 23)
                viewInfo.ZIndex = 2
                viewInfo.Image = "rbxassetid://3926305904"
                viewInfo.ImageColor3 = themeList.SchemeColor
                viewInfo.ImageRectOffset = Vector2.new(764, 764)
                viewInfo.ImageRectSize = Vector2.new(36, 36)
                viewInfo.Parent = sliderElement

                sliderBtn.Name = "sliderBtn"
                sliderBtn.BackgroundColor3 = Color3.fromRGB(themeList.ElementColor.r * 255 + 5, themeList.ElementColor.g * 255 + 5, themeList.ElementColor.b * 255  + 5)
                sliderBtn.BorderSizePixel = 0
                sliderBtn.Position = UDim2.new(0.488749951, 0, 0.393939406, 0)
                sliderBtn.Size = UDim2.new(0, 149, 0, 6)
                sliderBtn.AutoButtonColor = false
                sliderBtn.Font = Enum.Font.SourceSans
                sliderBtn.Text = ""
                sliderBtn.TextColor3 = globalColor2
                sliderBtn.TextSize = 14.000
                sliderBtn.Parent = sliderElement

                UICorner_2.Parent = sliderBtn

                UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
                UIListLayout.Parent = sliderBtn

                sliderDrag.Name = "sliderDrag"
                sliderDrag.BackgroundColor3 = themeList.SchemeColor
                sliderDrag.BorderColor3 = Color3.fromRGB(74, 99, 135)
                sliderDrag.BorderSizePixel = 0
                sliderDrag.Size = UDim2.new(-0.671140969, 100,1,0)
                sliderDrag.Parent = sliderBtn

                UICorner_3.Parent = sliderDrag

                write.Name = "write"
                write.BackgroundColor3 = globalColor
                write.BackgroundTransparency = 1.000
                write.BorderColor3 = Color3.fromRGB(27, 42, 53)
                write.Position = UDim2.new(0.0199999996, 0, 0.180000007, 0)
                write.Size = UDim2.new(0, 21, 0, 21)
                write.Image = "rbxassetid://3926307971"
                write.ImageColor3 = themeList.SchemeColor
                write.ImageRectOffset = Vector2.new(404, 164)
                write.ImageRectSize = Vector2.new(36, 36)
                write.Parent = sliderElement

                val.Name = "val"
                val.BackgroundColor3 = globalColor
                val.BackgroundTransparency = 1.000
                val.Position = UDim2.new(0.352386296, 0, 0.272727281, 0)
                val.Size = UDim2.new(0, 41, 0, 14)
                val.Font = Enum.Font.GothamSemibold
                val.Text = minvalue
                val.TextColor3 = themeList.TextColor
                val.TextSize = 14.000
                val.TextTransparency = 1.000
                val.TextXAlignment = Enum.TextXAlignment.Right
                val.Parent = sliderElement

                local moreInfo = Instance.new("TextLabel")
                local UICorner = Instance.new("UICorner")

                moreInfo.Name = "TipMore"
                moreInfo.BackgroundColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 14, themeList.SchemeColor.g * 255 - 17, themeList.SchemeColor.b * 255 - 13)
                moreInfo.Position = UDim2.new(0, 0, 2, 0)
                moreInfo.Size = UDim2.new(0, 353, 0, 33)
                moreInfo.ZIndex = 9
                moreInfo.Font = Enum.Font.GothamSemibold
                moreInfo.Text = "  "..slidTip
                moreInfo.TextColor3 = themeList.TextColor
                moreInfo.TextSize = 14.000
                moreInfo.RichText = true
                moreInfo.TextXAlignment = Enum.TextXAlignment.Left
                moreInfo.Parent = infoContainer

                UICorner.CornerRadius = UDim.new(0, 4)
                UICorner.Parent = moreInfo

                updateSectionFrame()
                UpdateSize()

                local btn = sliderElement
                local hovering = false
                btn.MouseEnter:Connect(function()
                    if not focusing then
                        tween:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {BackgroundColor3 = Color3.fromRGB(themeList.ElementColor.r * 255 + 8, themeList.ElementColor.g * 255 + 9, themeList.ElementColor.b * 255 + 10)}):Play()
                        hovering = true
                    end 
                end)
                btn.MouseLeave:Connect(function()
                    if not focusing then
                        tween:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {BackgroundColor3 = themeList.ElementColor}):Play()
                        hovering = false
                    end
                end)        

                task.spawn(function()
                    while task.wait(30) do
                        if not hovering then sliderElement.BackgroundColor3 = themeList.ElementColor end
                        moreInfo.TextColor3 = themeList.TextColor
                        moreInfo.BackgroundColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 14, themeList.SchemeColor.g * 255 - 17, themeList.SchemeColor.b * 255 - 13)
                        val.TextColor3 = themeList.TextColor
                        write.ImageColor3 = themeList.SchemeColor
                        togName.TextColor3 = themeList.TextColor
                        viewInfo.ImageColor3 = themeList.SchemeColor
                        sliderBtn.BackgroundColor3 = Color3.fromRGB(themeList.ElementColor.r * 255 + 5, themeList.ElementColor.g * 255 + 5, themeList.ElementColor.b * 255  + 5)
                        sliderDrag.BackgroundColor3 = themeList.SchemeColor
                    end
                end)

                local Value
                local moveConnection
                local releaseConnection
                sliderBtn.MouseButton1Down:Connect(function()
                    if not focusing then
                        tween:Create(val, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {TextTransparency = 0}):Play()
                        Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 149) * sliderDrag.AbsoluteSize.X) + tonumber(minvalue)) or 0
                        callback(Value)
                        sliderDrag:TweenSize(UDim2.new(0, math.clamp(ms.X - sliderDrag.AbsolutePosition.X, 0, 149), 0, 6), "InOut", "Linear", 0.05, true)
                        moveConnection = ms.Move:Connect(function()
                            val.Text = Value
                            Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 149) * sliderDrag.AbsoluteSize.X) + tonumber(minvalue))
                            callback(Value)
                            sliderDrag:TweenSize(UDim2.new(0, math.clamp(ms.X - sliderDrag.AbsolutePosition.X, 0, 149), 0, 6), "InOut", "Linear", 0.05, true)
                        end)
                        releaseConnection = input.InputEnded:Connect(function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                                Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 149) * sliderDrag.AbsoluteSize.X) + tonumber(minvalue))
                                callback(Value)
                                val.Text = Value
                                tween:Create(val, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {TextTransparency = 1}):Play()
                                sliderDrag:TweenSize(UDim2.new(0, math.clamp(ms.X - sliderDrag.AbsolutePosition.X, 0, 149), 0, 6), "InOut", "Linear", 0.05, true)
                                moveConnection:Disconnect()
                                releaseConnection:Disconnect()
                                moveConnection = nil
                                releaseConnection = nil
                            end
                        end)
                    else
                        for _, v in infoContainer:GetChildren() do
                            tweenObject(v, {Position = UDim2.new(0, 0, 2, 0)}, 0.2)
                            focusing = false
                        end
                        tweenObject(blurFrame, {BackgroundTransparency = 1}, 0.2)
                    end
                end)
                viewInfo.MouseButton1Click:Connect(function()
                    if not viewDe then
                        viewDe = true
                        focusing = true
                        for _, v in infoContainer:GetChildren() do
                            if v ~= moreInfo then tweenObject(v, {Position = UDim2.new(0, 0, 2, 0)}, 0.2) end
                        end
                        tweenObject(moreInfo, {Position = UDim2.new(0, 0, 0, 0)}, 0.2)
                        tweenObject(blurFrame, {BackgroundTransparency = 0.5}, 0.2)
                        tweenObject(btn, {BackgroundColor3 = themeList.ElementColor}, 0.2)
                        task.wait(1.5)
                        focusing = false
                        tweenObject(moreInfo, {Position = UDim2.new(0, 0, 2, 0)}, 0.2)
                        tweenObject(blurFrame, {BackgroundTransparency = 1}, 0.2)
                        task.wait(0)
                        viewDe = false
                    end
                end)        
            end
            function Elements:NewDropdown(dropname, dropinf, list, callback)
                local DropFunction = {}

                local opened = false
                local DropYSize = 33

                local dropFrame = Instance.new("Frame")
                local dropOpen = Instance.new("TextButton")
                local listImg = Instance.new("ImageLabel")
                local itemTextbox = Instance.new("TextLabel")
                local viewInfo = Instance.new("ImageButton")
                local UICorner = Instance.new("UICorner")
                local UIListLayout = Instance.new("UIListLayout")
                local Sample = Instance.new("ImageLabel")

                Sample.Name = "Sample"
                Sample.BackgroundColor3 = globalColor
                Sample.BackgroundTransparency = 1.000
                Sample.Image = "http://www.roblox.com/asset/?id=4560909609"
                Sample.ImageColor3 = themeList.SchemeColor
                Sample.ImageTransparency = 0.600
                Sample.Parent = dropOpen
                
                dropFrame.Name = "dropFrame"
                dropFrame.BackgroundColor3 = themeList.Background
                dropFrame.BorderSizePixel = 0
                dropFrame.Position = UDim2.new(0, 0, 1.23571432, 0)
                dropFrame.Size = UDim2.new(0, 352, 0, 33)
                dropFrame.ClipsDescendants = true
                dropFrame.Parent = sectionInners

                local btn = dropOpen
                dropOpen.Name = "dropOpen"
                dropOpen.BackgroundColor3 = themeList.ElementColor
                dropOpen.Size = UDim2.new(0, 352, 0, 33)
                dropOpen.AutoButtonColor = false
                dropOpen.Font = Enum.Font.SourceSans
                dropOpen.Text = ""
                dropOpen.TextColor3 = globalColor2
                dropOpen.TextSize = 14.000
                dropOpen.ClipsDescendants = true
                dropOpen.Parent = dropFrame

                dropOpen.MouseButton1Click:Connect(function()
                    if not focusing then
                        if opened then
                            opened = false
                            dropFrame:TweenSize(UDim2.new(0, 352, 0, 33), "InOut", "Linear", 0.08)
                            task.wait(0.1)
                            updateSectionFrame()
                            UpdateSize()
                            local c = Sample:Clone()
                            local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
                            c.Position = UDim2.new(0, x, 0, y)
                            c.Parent = btn
                            local size = if btn.AbsoluteSize.X >= btn.AbsoluteSize.Y then btn.AbsoluteSize.X * 1.5 else btn.AbsoluteSize.Y * 1.5
                            c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', 0.35, true, nil)
                            for i = 1, 10 do
                                c.ImageTransparency += 0.05
                                task.wait(0.35 / 12)
                            end
                            c:Destroy()
                        else
                            opened = true
                            dropFrame:TweenSize(UDim2.new(0, 352, 0, UIListLayout.AbsoluteContentSize.Y), "InOut", "Linear", 0.08, true)
                            task.wait(0.1)
                            updateSectionFrame()
                            UpdateSize()
                            local c = Sample:Clone()
                            local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
                            c.Position = UDim2.new(0, x, 0, y)
                            c.Parent = btn
                            local size = if btn.AbsoluteSize.X >= btn.AbsoluteSize.Y then btn.AbsoluteSize.X * 1.5 else btn.AbsoluteSize.Y * 1.5
                            c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', 0.35, true, nil)
                            for i = 1, 10 do
                                c.ImageTransparency += 0.05
                                task.wait(0.35 / 12)
                            end
                            c:Destroy()
                        end
                    else
                        for _, v in infoContainer:GetChildren() do
                            tweenObject(v, {Position = UDim2.new(0, 0, 2, 0)}, 0.2)
                            focusing = false
                        end
                        tweenObject(blurFrame, {BackgroundTransparency = 1}, 0.2)
                    end
                end)

                listImg.Name = "listImg"
                listImg.BackgroundColor3 = globalColor
                listImg.BackgroundTransparency = 1.000
                listImg.BorderColor3 = Color3.fromRGB(27, 42, 53)
                listImg.Position = UDim2.new(0.0199999996, 0, 0.180000007, 0)
                listImg.Size = UDim2.new(0, 21, 0, 21)
                listImg.Image = "rbxassetid://3926305904"
                listImg.ImageColor3 = themeList.SchemeColor
                listImg.ImageRectOffset = Vector2.new(644, 364)
                listImg.ImageRectSize = Vector2.new(36, 36)
                listImg.Parent = dropOpen

                itemTextbox.Name = "itemTextbox"
                itemTextbox.BackgroundColor3 = globalColor
                itemTextbox.BackgroundTransparency = 1.000
                itemTextbox.Position = UDim2.new(0.0970000029, 0, 0.273000002, 0)
                itemTextbox.Size = UDim2.new(0, 138, 0, 14)
                itemTextbox.Font = Enum.Font.GothamSemibold
                itemTextbox.Text = dropname
                itemTextbox.RichText = true
                itemTextbox.TextColor3 = themeList.TextColor
                itemTextbox.TextSize = 14.000
                itemTextbox.TextXAlignment = Enum.TextXAlignment.Left
                itemTextbox.Parent = dropOpen

                viewInfo.Name = "viewInfo"
                viewInfo.BackgroundTransparency = 1.000
                viewInfo.LayoutOrder = 9
                viewInfo.Position = UDim2.new(0.930000007, 0, 0.151999995, 0)
                viewInfo.Size = UDim2.new(0, 23, 0, 23)
                viewInfo.ZIndex = 2
                viewInfo.Image = "rbxassetid://3926305904"
                viewInfo.ImageColor3 = themeList.SchemeColor
                viewInfo.ImageRectOffset = Vector2.new(764, 764)
                viewInfo.ImageRectSize = Vector2.new(36, 36)
                viewInfo.Parent = dropOpen

                UICorner.CornerRadius = UDim.new(0, 4)
                UICorner.Parent = dropOpen

                local Sample = Instance.new("ImageLabel")

                Sample.Name = "Sample"
                Sample.BackgroundColor3 = globalColor
                Sample.BackgroundTransparency = 1.000
                Sample.Image = "http://www.roblox.com/asset/?id=4560909609"
                Sample.ImageColor3 = themeList.SchemeColor
                Sample.ImageTransparency = 0.600
                Sample.Parent = dropOpen

                UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout.Padding = UDim.new(0, 3)
                UIListLayout.Parent = dropFrame

                updateSectionFrame() 
                UpdateSize()

                local moreInfo = Instance.new("TextLabel")
                local UICorner = Instance.new("UICorner")

                moreInfo.Name = "TipMore"
                moreInfo.BackgroundColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 14, themeList.SchemeColor.g * 255 - 17, themeList.SchemeColor.b * 255 - 13)
                moreInfo.Position = UDim2.new(0, 0, 2, 0)
                moreInfo.Size = UDim2.new(0, 353, 0, 33)
                moreInfo.ZIndex = 9
                moreInfo.RichText = true
                moreInfo.Font = Enum.Font.GothamSemibold
                moreInfo.Text = "  "..dropinf
                moreInfo.TextColor3 = themeList.TextColor
                moreInfo.TextSize = 14.000
                moreInfo.TextXAlignment = Enum.TextXAlignment.Left
                moreInfo.Parent = infoContainer

                local hovering = false
                btn.MouseEnter:Connect(function()
                    if not focusing then
                        tween:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {BackgroundColor3 = Color3.fromRGB(themeList.ElementColor.r * 255 + 8, themeList.ElementColor.g * 255 + 9, themeList.ElementColor.b * 255 + 10)}):Play()
                        hovering = true
                    end 
                end)
                btn.MouseLeave:Connect(function()
                    if not focusing then
                        tween:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {BackgroundColor3 = themeList.ElementColor}):Play()
                        hovering = false
                    end
                end)        
                task.spawn(function()
                    while task.wait(30) do
                        if not hovering then dropOpen.BackgroundColor3 = themeList.ElementColor end
                        Sample.ImageColor3 = themeList.SchemeColor
                        dropFrame.BackgroundColor3 = themeList.Background
                        listImg.ImageColor3 = themeList.SchemeColor
                        itemTextbox.TextColor3 = themeList.TextColor
                        viewInfo.ImageColor3 = themeList.SchemeColor
                        moreInfo.BackgroundColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 14, themeList.SchemeColor.g * 255 - 17, themeList.SchemeColor.b * 255 - 13)
                        moreInfo.TextColor3 = themeList.TextColor
                    end
                end)
                UICorner.CornerRadius = UDim.new(0, 4)
                UICorner.Parent = moreInfo

                viewInfo.MouseButton1Click:Connect(function()
                    if not viewDe then
                        viewDe = true
                        focusing = true
                        for _, v in infoContainer:GetChildren() do
                            if v ~= moreInfo then tweenObject(v, {Position = UDim2.new(0, 0, 2, 0)}, 0.2) end
                        end
                        tweenObject(moreInfo, {Position = UDim2.new(0, 0, 0, 0)}, 0.2)
                        tweenObject(blurFrame, {BackgroundTransparency = 0.5}, 0.2)
                        tweenObject(btn, {BackgroundColor3 = themeList.ElementColor}, 0.2)
                        task.wait(1.5)
                        focusing = false
                        tweenObject(moreInfo, {Position = UDim2.new(0, 0, 2, 0)}, 0.2)
                        tweenObject(blurFrame, {BackgroundTransparency = 1}, 0.2)
                        task.wait(0)
                        viewDe = false
                    end
                end)     

                for _, v in list do
                    local optionSelect = Instance.new("TextButton")
                    local UICorner_2 = Instance.new("UICorner")
                    local Sample1 = Instance.new("ImageLabel")

                    Sample1.Name = "Sample1"
                    Sample1.BackgroundColor3 = globalColor
                    Sample1.BackgroundTransparency = 1.000
                    Sample1.Image = "http://www.roblox.com/asset/?id=4560909609"
                    Sample1.ImageColor3 = themeList.SchemeColor
                    Sample1.ImageTransparency = 0.600
                    Sample1.Parent = optionSelect

                    DropYSize += 33
                    optionSelect.Name = "optionSelect"
                    optionSelect.BackgroundColor3 = themeList.ElementColor
                    optionSelect.Position = UDim2.new(0, 0, 0.235294119, 0)
                    optionSelect.Size = UDim2.new(0, 352, 0, 33)
                    optionSelect.AutoButtonColor = false
                    optionSelect.Font = Enum.Font.GothamSemibold
                    optionSelect.Text = "  "..v
                    optionSelect.TextColor3 = Color3.fromRGB(themeList.TextColor.r * 255 - 6, themeList.TextColor.g * 255 - 6, themeList.TextColor.b * 255 - 6)
                    optionSelect.TextSize = 14.000
                    optionSelect.TextXAlignment = Enum.TextXAlignment.Left
                    optionSelect.ClipsDescendants = true
                    optionSelect.Parent = dropFrame

                    optionSelect.MouseButton1Click:Connect(function()
                        if not focusing then
                            opened = false
                            callback(v)
                            itemTextbox.Text = v
                            dropFrame:TweenSize(UDim2.new(0, 352, 0, 33), 'InOut', 'Linear', 0.08)
                            task.wait(0.1)
                            updateSectionFrame()
                            UpdateSize()
                            local c = Sample1:Clone()
                            local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
                            c.Position = UDim2.new(0, x, 0, y)
                            c.Parent = optionSelect
                            local size = if optionSelect.AbsoluteSize.X >= optionSelect.AbsoluteSize.Y then optionSelect.AbsoluteSize.X * 1.5 else optionSelect.AbsoluteSize.Y * 1.5
                            c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', 0.35, true, nil)
                            for i = 1, 10 do
                                c.ImageTransparency += 0.05
                                task.wait(0.35 / 12)
                            end
                            c:Destroy()         
                        else
                            for _, v in infoContainer:GetChildren() do
                                tweenObject(v, {Position = UDim2.new(0, 0, 2, 0)}, 0.2)
                                focusing = false
                            end
                            tweenObject(blurFrame, {BackgroundTransparency = 1}, 0.2)
                        end
                    end)
    
                    UICorner_2.CornerRadius = UDim.new(0, 4)
                    UICorner_2.Parent = optionSelect

                    local oHover = false
                    optionSelect.MouseEnter:Connect(function()
                        if not focusing then
                            tween:Create(optionSelect, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {BackgroundColor3 = Color3.fromRGB(themeList.ElementColor.r * 255 + 8, themeList.ElementColor.g * 255 + 9, themeList.ElementColor.b * 255 + 10)}):Play()
                            oHover = true
                        end 
                    end)
                    optionSelect.MouseLeave:Connect(function()
                        if not focusing then
                            tween:Create(optionSelect, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {BackgroundColor3 = themeList.ElementColor}):Play()
                            oHover = false
                        end
                    end)   
                    task.spawn(function()
                        while task.wait(30) do
                            if not oHover then optionSelect.BackgroundColor3 = themeList.ElementColor end
                            optionSelect.TextColor3 = Color3.fromRGB(themeList.TextColor.r * 255 - 6, themeList.TextColor.g * 255 - 6, themeList.TextColor.b * 255 - 6)
                            Sample1.ImageColor3 = themeList.SchemeColor
                        end
                    end)
                end
                function DropFunction:Refresh(newList)
                    local newList = newList or {}
                    for _, v in dropFrame:GetChildren() do
                        if v.Name == "optionSelect" then v:Destroy() end
                    end
                    for _, v in newList do
                        local optionSelect = Instance.new("TextButton")
                        local UICorner_2 = Instance.new("UICorner")
                        local Sample11 = Instance.new("ImageLabel")
                        Sample11.Name = "Sample11"
                        Sample11.BackgroundColor3 = globalColor
                        Sample11.BackgroundTransparency = 1.000
                        Sample11.Image = "http://www.roblox.com/asset/?id=4560909609"
                        Sample11.ImageColor3 = themeList.SchemeColor
                        Sample11.ImageTransparency = 0.600
                        Sample11.Parent = optionSelect
    
                        DropYSize += 33
                        optionSelect.Name = "optionSelect"
                        optionSelect.BackgroundColor3 = themeList.ElementColor
                        optionSelect.Position = UDim2.new(0, 0, 0.235294119, 0)
                        optionSelect.Size = UDim2.new(0, 352, 0, 33)
                        optionSelect.AutoButtonColor = false
                        optionSelect.Font = Enum.Font.GothamSemibold
                        optionSelect.Text = "  "..v
                        optionSelect.TextColor3 = Color3.fromRGB(themeList.TextColor.r * 255 - 6, themeList.TextColor.g * 255 - 6, themeList.TextColor.b * 255 - 6)
                        optionSelect.TextSize = 14.000
                        optionSelect.TextXAlignment = Enum.TextXAlignment.Left
                        optionSelect.ClipsDescendants = true
                        optionSelect.Parent = dropFrame

                        UICorner_2.CornerRadius = UDim.new(0, 4)
                        UICorner_2.Parent = optionSelect

                        optionSelect.MouseButton1Click:Connect(function()
                            if not focusing then
                                opened = false
                                callback(v)
                                itemTextbox.Text = v
                                dropFrame:TweenSize(UDim2.new(0, 352, 0, 33), 'InOut', 'Linear', 0.08)
                                task.wait(0.1)
                                updateSectionFrame()
                                UpdateSize()
                                local c = Sample11:Clone()
                                local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
                                c.Position = UDim2.new(0, x, 0, y)
                                c.Parent = optionSelect
                                local size = if optionSelect.AbsoluteSize.X >= optionSelect.AbsoluteSize.Y then optionSelect.AbsoluteSize.X * 1.5 else optionSelect.AbsoluteSize.Y * 1.5
                                c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', 0.35, true, nil)
                                for i = 1, 10 do
                                    c.ImageTransparency += 0.05
                                    task.wait(0.35 / 12)
                                end
                                c:Destroy()         
                            else
                                for _, v in infoContainer:GetChildren() do
                                    tweenObject(v, {Position = UDim2.new(0, 0, 2, 0)}, 0.2)
                                    focusing = false
                                end
                                tweenObject(blurFrame, {BackgroundTransparency = 1}, 0.2)
                            end
                        end)

                        updateSectionFrame()
                        UpdateSize()

                        local hov = false
                        optionSelect.MouseEnter:Connect(function()
                            if not focusing then
                                tween:Create(optionSelect, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {BackgroundColor3 = Color3.fromRGB(themeList.ElementColor.r * 255 + 8, themeList.ElementColor.g * 255 + 9, themeList.ElementColor.b * 255 + 10)}):Play()
                                hov = true
                            end 
                        end)
                        optionSelect.MouseLeave:Connect(function()
                            if not focusing then
                                tween:Create(optionSelect, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {BackgroundColor3 = themeList.ElementColor}):Play()
                                hov = false
                            end
                        end)   
                        task.spawn(function()
                            while task.wait(30) do
                                if not oHover then optionSelect.BackgroundColor3 = themeList.ElementColor end
                                optionSelect.TextColor3 = Color3.fromRGB(themeList.TextColor.r * 255 - 6, themeList.TextColor.g * 255 - 6, themeList.TextColor.b * 255 - 6)
                                Sample11.ImageColor3 = themeList.SchemeColor
                            end
                        end)
                    end
                    if opened then 
                        dropFrame:TweenSize(UDim2.new(0, 352, 0, UIListLayout.AbsoluteContentSize.Y), "InOut", "Linear", 0.08, true)
                        task.wait(0.1)
                        updateSectionFrame()
                        UpdateSize()
                    else
                        dropFrame:TweenSize(UDim2.new(0, 352, 0, 33), "InOut", "Linear", 0.08)
                        task.wait(0.1)
                        updateSectionFrame()
                        UpdateSize()
                    end
                end
                return DropFunction
            end
            function Elements:NewKeybind(keytext, keyinf, first, callback)
                local oldKey = first.Name
                local keybindElement = Instance.new("TextButton")
                local UICorner = Instance.new("UICorner")
                local togName = Instance.new("TextLabel")
                local viewInfo = Instance.new("ImageButton")
                local touch = Instance.new("ImageLabel")
                local Sample = Instance.new("ImageLabel")
                local togName_2 = Instance.new("TextLabel")

                local moreInfo = Instance.new("TextLabel")
                local UICorner1 = Instance.new("UICorner")

                keybindElement.Name = "keybindElement"
                keybindElement.BackgroundColor3 = themeList.ElementColor
                keybindElement.ClipsDescendants = true
                keybindElement.Size = UDim2.new(0, 352, 0, 33)
                keybindElement.AutoButtonColor = false
                keybindElement.Font = Enum.Font.SourceSans
                keybindElement.Text = ""
                keybindElement.TextColor3 = globalColor2
                keybindElement.TextSize = 14.000
                keybindElement.Parent = sectionInners

                keybindElement.MouseButton1Click:Connect(function(e) 
                    if not focusing then
                        togName_2.Text = ". . ."
                        local a, b = game:GetService('UserInputService').InputBegan:wait();
                        if a.KeyCode.Name ~= "Unknown" then
                            togName_2.Text = a.KeyCode.Name
                            oldKey = a.KeyCode.Name;
                        end
                        local c = Sample:Clone()
                        local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
                        c.Position = UDim2.new(0, x, 0, y)
                        c.Parent = keybindElement
                        local size = if keybindElement.AbsoluteSize.X >= keybindElement.AbsoluteSize.Y then keybindElement.AbsoluteSize.X * 1.5 else keybindElement.AbsoluteSize.Y * 1.5
                        c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', 0.35, true, nil)
                        for i = 1, 10 do
                            c.ImageTransparency += 0.05
                            task.wait(0.35 / 12)
                        end
                    else
                        for _, v in infoContainer:GetChildren() do
                            tweenObject(v, {Position = UDim2.new(0, 0, 2, 0)}, 0.2)
                            focusing = false
                        end
                        tweenObject(blurFrame, {BackgroundTransparency = 1}, 0.2)
                    end
                end)
        
                table.insert(cons, input.InputBegan:Connect(function(current, ok) 
                    if not ok then 
                        if current.KeyCode.Name == oldKey then callback() end
                    end
                end))

                moreInfo.Name = "TipMore"
                moreInfo.BackgroundColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 14, themeList.SchemeColor.g * 255 - 17, themeList.SchemeColor.b * 255 - 13)
                moreInfo.Position = UDim2.new(0, 0, 2, 0)
                moreInfo.Size = UDim2.new(0, 353, 0, 33)
                moreInfo.ZIndex = 9
                moreInfo.RichText = true
                moreInfo.Font = Enum.Font.GothamSemibold
                moreInfo.Text = "  "..keyinf
                moreInfo.TextColor3 = themeList.TextColor
                moreInfo.TextSize = 14.000
                moreInfo.TextXAlignment = Enum.TextXAlignment.Left
                moreInfo.Parent = infoContainer

                Sample.Name = "Sample"
                Sample.BackgroundColor3 = globalColor
                Sample.BackgroundTransparency = 1.000
                Sample.Image = "http://www.roblox.com/asset/?id=4560909609"
                Sample.ImageColor3 = themeList.SchemeColor
                Sample.ImageTransparency = 0.600
                Sample.Parent = keybindElement

                togName.Name = "togName"
                togName.BackgroundColor3 = themeList.TextColor
                togName.BackgroundTransparency = 1.000
                togName.Position = UDim2.new(0.096704483, 0, 0.272727281, 0)
                togName.Size = UDim2.new(0, 222, 0, 14)
                togName.Font = Enum.Font.GothamSemibold
                togName.Text = keytext
                togName.RichText = true
                togName.TextColor3 = themeList.TextColor
                togName.TextSize = 14.000
                togName.TextXAlignment = Enum.TextXAlignment.Left
                togName.Parent = keybindElement

                viewInfo.Name = "viewInfo"
                viewInfo.BackgroundTransparency = 1.000
                viewInfo.LayoutOrder = 9
                viewInfo.Position = UDim2.new(0.930000007, 0, 0.151999995, 0)
                viewInfo.Size = UDim2.new(0, 23, 0, 23)
                viewInfo.ZIndex = 2
                viewInfo.Image = "rbxassetid://3926305904"
                viewInfo.ImageColor3 = themeList.SchemeColor
                viewInfo.ImageRectOffset = Vector2.new(764, 764)
                viewInfo.ImageRectSize = Vector2.new(36, 36)
                viewInfo.Parent = keybindElement
                viewInfo.MouseButton1Click:Connect(function()
                    if not viewDe then
                        viewDe = true
                        focusing = true
                        for _, v in infoContainer:GetChildren() do
                            if v ~= moreInfo then tweenObject(v, {Position = UDim2.new(0, 0, 2, 0)}, 0.2) end
                        end
                        tweenObject(moreInfo, {Position = UDim2.new(0, 0, 0, 0)}, 0.2)
                        tweenObject(blurFrame, {BackgroundTransparency = 0.5}, 0.2)
                        tweenObject(keybindElement, {BackgroundColor3 = themeList.ElementColor}, 0.2)
                        task.wait(1.5)
                        focusing = false
                        tweenObject(moreInfo, {Position = UDim2.new(0, 0, 2, 0)}, 0.2)
                        tweenObject(blurFrame, {BackgroundTransparency = 1}, 0.2)
                        task.wait(0)
                        viewDe = false
                    end
                end)

                updateSectionFrame()
                UpdateSize()

                local oHover = false
                keybindElement.MouseEnter:Connect(function()
                    if not focusing then
                        tween:Create(keybindElement, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {BackgroundColor3 = Color3.fromRGB(themeList.ElementColor.r * 255 + 8, themeList.ElementColor.g * 255 + 9, themeList.ElementColor.b * 255 + 10)}):Play()
                        oHover = true
                    end 
                end)
                keybindElement.MouseLeave:Connect(function()
                    if not focusing then
                        tween:Create(keybindElement, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {BackgroundColor3 = themeList.ElementColor}):Play()
                        oHover = false
                    end
                end)

                UICorner1.CornerRadius = UDim.new(0, 4)
                UICorner1.Parent = moreInfo

                UICorner.CornerRadius = UDim.new(0, 4)
                UICorner.Parent = keybindElement

                touch.Name = "touch"
                touch.BackgroundColor3 = globalColor
                touch.BackgroundTransparency = 1.000
                touch.BorderColor3 = Color3.fromRGB(27, 42, 53)
                touch.Position = UDim2.new(0.0199999996, 0, 0.180000007, 0)
                touch.Size = UDim2.new(0, 21, 0, 21)
                touch.Image = "rbxassetid://3926305904"
                touch.ImageColor3 = themeList.SchemeColor
                touch.ImageRectOffset = Vector2.new(364, 284)
                touch.ImageRectSize = Vector2.new(36, 36)
                touch.Parent = keybindElement

                togName_2.Name = "togName"
                togName_2.BackgroundColor3 = globalColor
                togName_2.BackgroundTransparency = 1.000
                togName_2.Position = UDim2.new(0.727386296, 0, 0.272727281, 0)
                togName_2.Size = UDim2.new(0, 70, 0, 14)
                togName_2.Font = Enum.Font.GothamSemibold
                togName_2.Text = oldKey
                togName_2.TextColor3 = themeList.SchemeColor
                togName_2.TextSize = 14.000
                togName_2.TextXAlignment = Enum.TextXAlignment.Right
                togName_2.Parent = keybindElement

                task.spawn(function()
                    while task.wait(30) do
                        if not oHover then keybindElement.BackgroundColor3 = themeList.ElementColor end
                        togName_2.TextColor3 = themeList.SchemeColor
                        touch.ImageColor3 = themeList.SchemeColor
                        viewInfo.ImageColor3 = themeList.SchemeColor
                        togName.BackgroundColor3 = themeList.TextColor
                        togName.TextColor3 = themeList.TextColor
                        Sample.ImageColor3 = themeList.SchemeColor
                        moreInfo.TextColor3 = themeList.TextColor
                        moreInfo.BackgroundColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 14, themeList.SchemeColor.g * 255 - 17, themeList.SchemeColor.b * 255 - 13)
                    end
                end)
            end
            function Elements:NewColorPicker(colText, colInf, defcolor, callback)
                local h, s, v = Color3.toHSV(defcolor)
                local colorOpened = false
                local colorElement = Instance.new("TextButton")
                local UICorner = Instance.new("UICorner")
                local colorHeader = Instance.new("Frame")
                local UICorner_2 = Instance.new("UICorner")
                local touch = Instance.new("ImageLabel")
                local togName = Instance.new("TextLabel")
                local viewInfo = Instance.new("ImageButton")
                local colorCurrent = Instance.new("Frame")
                local UICorner_3 = Instance.new("UICorner")
                local UIListLayout = Instance.new("UIListLayout")
                local colorInners = Instance.new("Frame")
                local UICorner_4 = Instance.new("UICorner")
                local rgb = Instance.new("ImageButton")
                local UICorner_5 = Instance.new("UICorner")
                local rbgcircle = Instance.new("ImageLabel")
                local darkness = Instance.new("ImageButton")
                local UICorner_6 = Instance.new("UICorner")
                local darkcircle = Instance.new("ImageLabel")
                local toggleDisabled = Instance.new("ImageLabel")
                local toggleEnabled = Instance.new("ImageLabel")
                local onrainbow = Instance.new("TextButton")
                local togName_2 = Instance.new("TextLabel")

                --Properties:
                local Sample = Instance.new("ImageLabel")
                Sample.Name = "Sample"
                Sample.BackgroundColor3 = globalColor
                Sample.BackgroundTransparency = 1.000
                Sample.Image = "http://www.roblox.com/asset/?id=4560909609"
                Sample.ImageColor3 = themeList.SchemeColor
                Sample.ImageTransparency = 0.600
                Sample.Parent = colorHeader

                local btn = colorHeader

                colorElement.Name = "colorElement"
                colorElement.BackgroundColor3 = themeList.ElementColor
                colorElement.BackgroundTransparency = 1.000
                colorElement.ClipsDescendants = true
                colorElement.Position = UDim2.new(0, 0, 0.566834569, 0)
                colorElement.Size = UDim2.new(0, 352, 0, 33)
                colorElement.AutoButtonColor = false
                colorElement.Font = Enum.Font.SourceSans
                colorElement.Text = ""
                colorElement.TextColor3 = globalColor2
                colorElement.TextSize = 14.000
                colorElement.Parent = sectionInners

                colorElement.MouseButton1Click:Connect(function()
                    if not focusing then
                        if colorOpened then
                            colorOpened = false
                            colorElement:TweenSize(UDim2.new(0, 352, 0, 33), "InOut", "Linear", 0.08)
                            task.wait(0.1)
                            updateSectionFrame()
                            UpdateSize()
                            local c = Sample:Clone()
                            local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
                            c.Position = UDim2.new(0, x, 0, y)
                            c.Parent = btn
                            local size = if btn.AbsoluteSize.X >= btn.AbsoluteSize.Y then btn.AbsoluteSize.X * 1.5 else btn.AbsoluteSize.Y * 1.5
                            c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', 0.35, true, nil)
                            for i = 1, 10 do
                                c.ImageTransparency += 0.05
                                task.wait(0.35 / 12)
                            end
                            c:Destroy()
                        else
                            colorOpened = true
                            colorElement:TweenSize(UDim2.new(0, 352, 0, 141), "InOut", "Linear", 0.08, true)
                            task.wait(0.1)
                            updateSectionFrame()
                            UpdateSize()
                            local c = Sample:Clone()
                            local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
                            c.Position = UDim2.new(0, x, 0, y)
                            c.Parent = btn
                            local size = if btn.AbsoluteSize.X >= btn.AbsoluteSize.Y then btn.AbsoluteSize.X * 1.5 else btn.AbsoluteSize.Y * 1.5
                            c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', 0.35, true, nil)
                            for i = 1, 10 do
                                c.ImageTransparency += 0.05
                                task.wait(0.35 / 12)
                            end
                            c:Destroy()
                        end
                    else
                        for _, v in infoContainer:GetChildren() do
                            tweenObject(v, {Position = UDim2.new(0, 0, 2, 0)}, 0.2)
                            focusing = false
                        end
                        tweenObject(blurFrame, {BackgroundTransparency = 1}, 0.2)
                    end
                end)
                UICorner.CornerRadius = UDim.new(0, 4)
                UICorner.Parent = colorElement

                colorHeader.Name = "colorHeader"
                colorHeader.BackgroundColor3 = themeList.ElementColor
                colorHeader.Size = UDim2.new(0, 352, 0, 33)
                colorHeader.ClipsDescendants = true
                colorHeader.Parent = colorElement

                UICorner_2.CornerRadius = UDim.new(0, 4)
                UICorner_2.Parent = colorHeader
                
                touch.Name = "touch"
                touch.BackgroundColor3 = globalColor
                touch.BackgroundTransparency = 1.000
                touch.BorderColor3 = Color3.fromRGB(27, 42, 53)
                touch.Position = UDim2.new(0.0199999996, 0, 0.180000007, 0)
                touch.Size = UDim2.new(0, 21, 0, 21)
                touch.Image = "rbxassetid://3926305904"
                touch.ImageColor3 = themeList.SchemeColor
                touch.ImageRectOffset = Vector2.new(44, 964)
                touch.ImageRectSize = Vector2.new(36, 36)
                touch.Parent = colorHeader

                togName.Name = "togName"
                togName.BackgroundColor3 = globalColor
                togName.BackgroundTransparency = 1.000
                togName.Position = UDim2.new(0.096704483, 0, 0.272727281, 0)
                togName.Size = UDim2.new(0, 288, 0, 14)
                togName.Font = Enum.Font.GothamSemibold
                togName.Text = colText
                togName.TextColor3 = themeList.TextColor
                togName.TextSize = 14.000
                togName.RichText = true
                togName.TextXAlignment = Enum.TextXAlignment.Left
                togName.Parent = colorHeader

                local moreInfo = Instance.new("TextLabel")
                local UICorner = Instance.new("UICorner")

                moreInfo.Name = "TipMore"
                moreInfo.BackgroundColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 14, themeList.SchemeColor.g * 255 - 17, themeList.SchemeColor.b * 255 - 13)
                moreInfo.Position = UDim2.new(0, 0, 2, 0)
                moreInfo.Size = UDim2.new(0, 353, 0, 33)
                moreInfo.ZIndex = 9
                moreInfo.Font = Enum.Font.GothamSemibold
                moreInfo.Text = "  "..colInf
                moreInfo.TextColor3 = themeList.TextColor
                moreInfo.TextSize = 14.000
                moreInfo.RichText = true
                moreInfo.TextXAlignment = Enum.TextXAlignment.Left
                moreInfo.Parent = infoContainer

                UICorner.CornerRadius = UDim.new(0, 4)
                UICorner.Parent = moreInfo

                viewInfo.Name = "viewInfo"
                viewInfo.BackgroundTransparency = 1.000
                viewInfo.LayoutOrder = 9
                viewInfo.Position = UDim2.new(0.930000007, 0, 0.151999995, 0)
                viewInfo.Size = UDim2.new(0, 23, 0, 23)
                viewInfo.ZIndex = 2
                viewInfo.Image = "rbxassetid://3926305904"
                viewInfo.ImageColor3 = themeList.SchemeColor
                viewInfo.ImageRectOffset = Vector2.new(764, 764)
                viewInfo.ImageRectSize = Vector2.new(36, 36)
                viewInfo.Parent = colorHeader
                viewInfo.MouseButton1Click:Connect(function()
                    if not viewDe then
                        viewDe = true
                        focusing = true
                        for _, v in infoContainer:GetChildren() do
                            if v ~= moreInfo then tweenObject(v, {Position = UDim2.new(0, 0, 2, 0)}, 0.2) end
                        end
                        tweenObject(moreInfo, {Position = UDim2.new(0, 0, 0, 0)}, 0.2)
                        tweenObject(blurFrame, {BackgroundTransparency = 0.5}, 0.2)
                        tweenObject(colorElement, {BackgroundColor3 = themeList.ElementColor}, 0.2)
                        task.wait(1.5)
                        focusing = false
                        tweenObject(moreInfo, {Position = UDim2.new(0, 0, 2, 0)}, 0.2)
                        tweenObject(blurFrame, {BackgroundTransparency = 1}, 0.2)
                        task.wait(0)
                        viewDe = false
                    end
                end)
                colorCurrent.Name = "colorCurrent"
                colorCurrent.BackgroundColor3 = defcolor
                colorCurrent.Position = UDim2.new(0.792613626, 0, 0.212121218, 0)
                colorCurrent.Size = UDim2.new(0, 42, 0, 18)
                colorCurrent.Parent = colorHeader

                UICorner_3.CornerRadius = UDim.new(0, 4)
                UICorner_3.Parent = colorCurrent

                UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout.Padding = UDim.new(0, 3)
                UIListLayout.Parent = colorElement

                colorInners.Name = "colorInners"
                colorInners.BackgroundColor3 = themeList.ElementColor
                colorInners.Position = UDim2.new(0, 0, 0.255319148, 0)
                colorInners.Size = UDim2.new(0, 352, 0, 105)
                colorInners.Parent = colorElement

                UICorner_4.CornerRadius = UDim.new(0, 4)
                UICorner_4.Parent = colorInners

                rgb.Name = "rgb"
                rgb.BackgroundColor3 = globalColor
                rgb.BackgroundTransparency = 1.000
                rgb.Position = UDim2.new(0.0198863633, 0, 0.0476190485, 0)
                rgb.Size = UDim2.new(0, 211, 0, 93)
                rgb.Image = "http://www.roblox.com/asset/?id=6523286724"
                rgb.Parent = colorInners

                UICorner_5.CornerRadius = UDim.new(0, 4)
                UICorner_5.Parent = rgb

                rbgcircle.Name = "rbgcircle"
                rbgcircle.BackgroundColor3 = globalColor
                rbgcircle.BackgroundTransparency = 1.000
                rbgcircle.Size = UDim2.new(0, 14, 0, 14)
                rbgcircle.Image = "rbxassetid://3926309567"
                rbgcircle.ImageColor3 = globalColor2
                rbgcircle.ImageRectOffset = Vector2.new(628, 420)
                rbgcircle.ImageRectSize = Vector2.new(48, 48)
                rbgcircle.Parent = rgb

                darkness.Name = "darkness"
                darkness.BackgroundColor3 = globalColor
                darkness.BackgroundTransparency = 1.000
                darkness.Position = UDim2.new(0.636363626, 0, 0.0476190485, 0)
                darkness.Size = UDim2.new(0, 18, 0, 93)
                darkness.Image = "http://www.roblox.com/asset/?id=6523291212"
                darkness.Parent = colorInners

                UICorner_6.CornerRadius = UDim.new(0, 4)
                UICorner_6.Parent = darkness

                darkcircle.Name = "darkcircle"
                darkcircle.AnchorPoint = Vector2.new(0.5, 0)
                darkcircle.BackgroundColor3 = globalColor
                darkcircle.BackgroundTransparency = 1.000
                darkcircle.Size = UDim2.new(0, 14, 0, 14)
                darkcircle.Image = "rbxassetid://3926309567"
                darkcircle.ImageColor3 = globalColor2
                darkcircle.ImageRectOffset = Vector2.new(628, 420)
                darkcircle.ImageRectSize = Vector2.new(48, 48)
                darkcircle.Parent = darkness

                toggleDisabled.Name = "toggleDisabled"
                toggleDisabled.BackgroundColor3 = globalColor
                toggleDisabled.BackgroundTransparency = 1.000
                toggleDisabled.Position = UDim2.new(0.704659104, 0, 0.0657142699, 0)
                toggleDisabled.Size = UDim2.new(0, 21, 0, 21)
                toggleDisabled.Image = "rbxassetid://3926309567"
                toggleDisabled.ImageColor3 = themeList.SchemeColor
                toggleDisabled.ImageRectOffset = Vector2.new(628, 420)
                toggleDisabled.ImageRectSize = Vector2.new(48, 48)
                toggleDisabled.Parent = colorInners

                toggleEnabled.Name = "toggleEnabled"
                toggleEnabled.BackgroundColor3 = globalColor
                toggleEnabled.BackgroundTransparency = 1.000
                toggleEnabled.Position = UDim2.new(0.704999983, 0, 0.0659999996, 0)
                toggleEnabled.Size = UDim2.new(0, 21, 0, 21)
                toggleEnabled.Image = "rbxassetid://3926309567"
                toggleEnabled.ImageColor3 = themeList.SchemeColor
                toggleEnabled.ImageRectOffset = Vector2.new(784, 420)
                toggleEnabled.ImageRectSize = Vector2.new(48, 48)
                toggleEnabled.ImageTransparency = 1.000
                toggleEnabled.Parent = colorInners

                onrainbow.Name = "onrainbow"
                onrainbow.BackgroundColor3 = globalColor
                onrainbow.BackgroundTransparency = 1.000
                onrainbow.Position = UDim2.new(2.90643607e-06, 0, 0, 0)
                onrainbow.Size = UDim2.new(1, 0, 1, 0)
                onrainbow.Font = Enum.Font.SourceSans
                onrainbow.Text = ""
                onrainbow.TextColor3 = globalColor2
                onrainbow.TextSize = 14.000
                onrainbow.Parent = toggleEnabled

                togName_2.Name = "togName"
                togName_2.BackgroundColor3 = globalColor
                togName_2.BackgroundTransparency = 1.000
                togName_2.Position = UDim2.new(0.779999971, 0, 0.100000001, 0)
                togName_2.Size = UDim2.new(0, 278, 0, 14)
                togName_2.Font = Enum.Font.GothamSemibold
                togName_2.Text = "Rainbow"
                togName_2.TextColor3 = themeList.TextColor
                togName_2.TextSize = 14.000
                togName_2.TextXAlignment = Enum.TextXAlignment.Left
                togName_2.Parent = colorInners

                local hovering = false
                colorElement.MouseEnter:Connect(function()
                    if not focusing then
                        tween:Create(colorElement, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {BackgroundColor3 = Color3.fromRGB(themeList.ElementColor.r * 255 + 8, themeList.ElementColor.g * 255 + 9, themeList.ElementColor.b * 255 + 10)}):Play()
                        hovering = true
                    end 
                end)
                colorElement.MouseLeave:Connect(function()
                    if not focusing then
                        tween:Create(colorElement, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {BackgroundColor3 = themeList.ElementColor}):Play()
                        hovering = false
                    end
                end)

                task.spawn(function()
                    while task.wait(30) do
                        if not hovering then colorElement.BackgroundColor3 = themeList.ElementColor end
                        touch.ImageColor3 = themeList.SchemeColor
                        colorHeader.BackgroundColor3 = themeList.ElementColor
                        togName.TextColor3 = themeList.TextColor
                        moreInfo.BackgroundColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 14, themeList.SchemeColor.g * 255 - 17, themeList.SchemeColor.b * 255 - 13)
                        moreInfo.TextColor3 = themeList.TextColor
                        viewInfo.ImageColor3 = themeList.SchemeColor
                        colorInners.BackgroundColor3 = themeList.ElementColor
                        toggleDisabled.ImageColor3 = themeList.SchemeColor
                        toggleEnabled.ImageColor3 = themeList.SchemeColor
                        togName_2.TextColor3 = themeList.TextColor
                        Sample.ImageColor3 = themeList.SchemeColor
                    end
                end)
                updateSectionFrame()
                UpdateSize()
                local colorpicker = false
                local darknesss = false
                local color = {1, 1, 1}
                local rainbow = false
                local rainbowConnection
                local counter = 0

                local function zigzag(X) return math.acos(math.cos(X * math.pi)) / math.pi end
                local function setcolor(tbl)
                    local cx = rbgcircle.AbsoluteSize.X / 2
                    local cy = rbgcircle.AbsoluteSize.Y / 2
                    color = {tbl[1], tbl[2], tbl[3]}
                    rbgcircle.Position = UDim2.new(color[1], -cx ,color[2] - 1, -cy)
                    darkcircle.Position = UDim2.new(0.5, 0, color[3] - 1, -cy)
                    local realcolor = Color3.fromHSV(color[1], color[2], color[3])
                    colorCurrent.BackgroundColor3 = realcolor
                end
                local function setrgbcolor(tbl)
                    local cx = rbgcircle.AbsoluteSize.X / 2
                    local cy = rbgcircle.AbsoluteSize.Y / 2
                    color = {tbl[1], tbl[2], color[3]}
                    rbgcircle.Position = UDim2.new(color[1], -cx, color[2] - 1, -cy)
                    local realcolor = Color3.fromHSV(color[1], color[2], color[3])
                    colorCurrent.BackgroundColor3 = realcolor
                    callback(realcolor)
                end

                onrainbow.MouseButton1Click:Connect(function()
                    if rainbow then
                        tween:Create(toggleEnabled, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {ImageTransparency = 1}):Play()
                        rainbow = false
                        rainbowConnection:Disconnect()
                        rainbowConnection = nil
                    else
                        tween:Create(toggleEnabled, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {ImageTransparency = 0}):Play()
                        rainbow = true
                        rainbowConnection = game:GetService("RunService").Heartbeat:Connect(function()
                            setrgbcolor({zigzag(counter), 1, 1})
                            counter += 0.01
                        end)
                    end
                end)

                table.insert(cons, ms.Move:Connect(function()
                    if colorpicker then
                        local x, y = ms.X - rgb.AbsolutePosition.X, ms.Y - rgb.AbsolutePosition.Y
                        local maxX, maxY = rgb.AbsoluteSize.X, rgb.AbsoluteSize.Y
                        if x < 0 then x = 0 end
                        if x > maxX then x = maxX end
                        if y < 0 then y = 0 end
                        if y > maxY then y = maxY end
                        x = x / maxX
                        y = y / maxY
                        local cx = rbgcircle.AbsoluteSize.X / 2
                        local cy = rbgcircle.AbsoluteSize.Y / 2
                        rbgcircle.Position = UDim2.new(x, -cx, y, -cy)
                        color = {1 - x, 1 - y, color[3]}
                        local realcolor = Color3.fromHSV(color[1], color[2], color[3])
                        colorCurrent.BackgroundColor3 = realcolor
                        callback(realcolor)
                    end
                    if darknesss then
                        local y = ms.Y - darkness.AbsolutePosition.Y
                        local maxY = darkness.AbsoluteSize.Y
                        if y < 0 then y = 0 end
                        if y > maxY then y = maxY end
                        y = y / maxY
                        local cy = darkcircle.AbsoluteSize.Y / 2
                        darkcircle.Position = UDim2.new(0.5, 0, y, -cy)
                        darkcircle.ImageColor3 = Color3.fromHSV(0, 0, y)
                        color = {color[1], color[2], 1 - y}
                        local realcolor = Color3.fromHSV(color[1], color[2], color[3])
                        colorCurrent.BackgroundColor3 = realcolor
                        callback(realcolor)
                    end
                end))
                rgb.MouseButton1Down:Connect(function() colorpicker = true end)
                darkness.MouseButton1Down:Connect(function() darknesss = true end)
                table.insert(cons, input.InputEnded:Connect(function(input)
                    if input.UserInputType.Name == "MouseButton1" then
                        if darknesss then darknesss = false end
                        if colorpicker then colorpicker = false end
                    end
                end))
                setcolor({h, s, v})
            end
            function Elements:NewLabel(title)
            	local labelFunctions = {}
            	local label = Instance.new("TextLabel")
            	local UICorner = Instance.new("UICorner")
            	label.Name = "label"
            	label.BackgroundColor3 = themeList.SchemeColor
            	label.BorderSizePixel = 0
				label.ClipsDescendants = true
            	label.Text = title
           		label.Size = UDim2.new(0, 352, 0, 33)
	            label.Font = Enum.Font.Gotham
	            label.Text = "  "..title
	            label.RichText = true
	            label.TextColor3 = themeList.TextColor
	            Objects[label] = "TextColor3"
	            label.TextSize = 14.000
	            label.TextXAlignment = Enum.TextXAlignment.Left
	            label.Parent = sectionInners

	           	UICorner.CornerRadius = UDim.new(0, 4)
                UICorner.Parent = label

		        task.spawn(function()
		            while task.wait(30) do
		                label.BackgroundColor3 = themeList.SchemeColor
		                label.TextColor3 = themeList.TextColor
		            end
		        end)
                updateSectionFrame()
                UpdateSize()
                function labelFunctions:UpdateLabel(newText: string)
                	label.Text = "  "..newText
                end	
                return labelFunctions
            end	
            return Elements
        end
        return Sections
    end  
    return Tabs
end
return Kavo