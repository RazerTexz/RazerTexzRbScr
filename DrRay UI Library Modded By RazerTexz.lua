--[[
MIT License

Copyright (c) 2023 Chillz

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
]]

local twServ = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local mouse = game:GetService("Players").LocalPlayer:GetMouse()
local globalColor1 = Color3.fromRGB(39, 44, 61)
local globalColor2 = Color3.fromRGB(0, 255, 38)

-- DrRay
local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
screenGui.Name = tostring(math.random(1, 100))..tostring(math.random(1, 50))..tostring(math.random(1, 100))
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = game:GetService("CoreGui")

-- DrRay.TopBar
local topBar1 = Instance.new("Frame")
topBar1.BorderSizePixel = 0
topBar1.BackgroundColor3 = Color3.fromRGB(42, 42, 58)
topBar1.LayoutOrder = 2
topBar1.Size = UDim2.new(0.5404488444328308, 0, 0.1739015281200409, 0)
topBar1.BorderColor3 = Color3.new(0, 0, 0)
topBar1.Position = UDim2.new(0.23000000417232513, 0, -0.1899999976158142, 0)
topBar1.Name = "TopBar"
topBar1.Parent = screenGui

-- DrRay.TopBar.UICorner
local uiCorner1 = Instance.new("UICorner")
uiCorner1.CornerRadius = UDim.new(0.10000000149011612, 0)
uiCorner1.Parent = topBar1

-- DrRay.TopBar.ScrollingFrame
local scrollingFrame1 = Instance.new("ScrollingFrame")
scrollingFrame1.Active = true
scrollingFrame1.ScrollingDirection = Enum.ScrollingDirection.Y
scrollingFrame1.BorderSizePixel = 0
scrollingFrame1.CanvasSize = UDim2.new(0.10000000149011612, 0, 0, 0)
scrollingFrame1.BackgroundColor3 = Color3.fromRGB(26, 26, 36)
scrollingFrame1.AutomaticCanvasSize = Enum.AutomaticSize.X
scrollingFrame1.BackgroundTransparency = 1
scrollingFrame1.Size = UDim2.new(0.915977954864502, 0, 0.5196850299835205, 0)
scrollingFrame1.ScrollBarImageColor3 = Color3.new(0, 0, 0)
scrollingFrame1.BorderColor3 = Color3.new(0, 0, 0)
scrollingFrame1.ScrollBarThickness = 0
scrollingFrame1.Position = UDim2.new(0, 0, 0.4803149700164795, 0)
scrollingFrame1.Parent = topBar1

-- DrRay.TopBar.ScrollingFrame.UIListLayout
local uiListLayout1 = Instance.new("UIListLayout")
uiListLayout1.VerticalAlignment = Enum.VerticalAlignment.Center
uiListLayout1.FillDirection = Enum.FillDirection.Horizontal
uiListLayout1.Padding = UDim.new(0.009999999776482582, 0)
uiListLayout1.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout1.Parent = scrollingFrame1

-- DrRay.TopBar.ScrollingFrame.UIPadding
local uiPadding1 = Instance.new("UIPadding")
uiPadding1.PaddingLeft = UDim.new(0.014999999664723873, 0)
uiPadding1.Parent = scrollingFrame1

-- DrRay.TopBar.DropShadowHolder
local dropShadowHolder1 = Instance.new("Frame")
dropShadowHolder1.ZIndex = 0
dropShadowHolder1.BorderSizePixel = 0
dropShadowHolder1.BackgroundTransparency = 1
dropShadowHolder1.Size = UDim2.new(1, 0, 1, 0)
dropShadowHolder1.Name = "DropShadowHolder"
dropShadowHolder1.Parent = topBar1

-- DrRay.TopBar.DropShadowHolder.DropShadow
local dropShadow1 = Instance.new("ImageLabel")
dropShadow1.ZIndex = 0
dropShadow1.BorderSizePixel = 0
dropShadow1.SliceCenter = Rect.new(49, 49, 450, 450)
dropShadow1.ScaleType = Enum.ScaleType.Slice
dropShadow1.ImageColor3 = Color3.new(0, 0, 0)
dropShadow1.ImageTransparency = 0.5
dropShadow1.AnchorPoint = Vector2.new(0.5, 0.5)
dropShadow1.Image = "rbxassetid://6014261993"
dropShadow1.Size = UDim2.new(1, 47, 1, 47)
dropShadow1.Name = "DropShadow"
dropShadow1.BackgroundTransparency = 1
dropShadow1.Position = UDim2.new(0.5, 0, 0.5, 0)
dropShadow1.Parent = dropShadowHolder1

-- DrRay.TopBar.UIGradient
local uiGradient1 = Instance.new("UIGradient")
uiGradient1.Rotation = 90
uiGradient1.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(139, 139, 139)), ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))}
uiGradient1.Parent = topBar1

-- DrRay.TopBar.TopBar
local topBar2 = Instance.new("Frame")
topBar2.BorderSizePixel = 0
topBar2.BackgroundColor3 = Color3.fromRGB(42, 42, 58)
topBar2.LayoutOrder = 2
topBar2.Size = UDim2.new(0.9983566999435425, 0, 0.05511785298585892, 0)
topBar2.BorderColor3 = Color3.new(0, 0, 0)
topBar2.Position = UDim2.new(0, 0, 0.4645671844482422, 0)
topBar2.Name = "TopBar"
topBar2.Parent = topBar1

-- DrRay.TopBar.TopBar.UIGradient
local uiGradient2 = Instance.new("UIGradient")
uiGradient2.Rotation = -90
uiGradient2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(139, 139, 139)), ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))}
uiGradient2.Parent = topBar2

-- DrRay.TopBar.TopMenu
local topMenu = Instance.new("Frame")
topMenu.BorderSizePixel = 0
topMenu.BackgroundColor3 = Color3.new(1, 1, 1)
topMenu.BackgroundTransparency = 1
topMenu.Size = UDim2.new(0.9983566999435425, 0, 0.4645672142505646, 0)
topMenu.BorderColor3 = Color3.new(0, 0, 0)
topMenu.Name = "TopMenu"
topMenu.Parent = topBar1

-- DrRay.TopBar.TopMenu.UIListLayout
local uiListLayout2 = Instance.new("UIListLayout")
uiListLayout2.VerticalAlignment = Enum.VerticalAlignment.Center
uiListLayout2.FillDirection = Enum.FillDirection.Horizontal
uiListLayout2.Padding = UDim.new(0.014999999664723873, 0)
uiListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout2.Parent = topMenu

-- DrRay.TopBar.TopMenu.UIPadding
local uiPadding2 = Instance.new("UIPadding")
uiPadding2.PaddingLeft = UDim.new(0.014000000432133675, 0)
uiPadding2.Parent = topMenu

-- DrRay.TopBar.TopMenu.Title
local title1 = Instance.new("ImageButton")
title1.Active = true
title1.BorderSizePixel = 0
title1.AutoButtonColor = false
title1.BackgroundColor3 = Color3.fromRGB(42, 42, 58)
title1.Size = UDim2.new(0.23481373488903046, 0, 0.682426393032074, 0)
title1.Name = "Title"
title1.BorderColor3 = Color3.new(0, 0, 0)
title1.Position = UDim2.new(0.015024710446596146, 0, 0.18421050906181335, 0)
title1.Parent = topMenu

-- DrRay.TopBar.TopMenu.Title.UICorner
local uiCorner2 = Instance.new("UICorner")
uiCorner2.CornerRadius = UDim.new(0.30000001192092896, 0)
uiCorner2.Parent = title1

-- DrRay.TopBar.TopMenu.Title.UIGradient
local uiGradient3 = Instance.new("UIGradient")
uiGradient3.Rotation = 90
uiGradient3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(154, 154, 154)), ColorSequenceKeypoint.new(1, Color3.fromRGB(231, 231, 231))}
uiGradient3.Parent = title1

-- DrRay.TopBar.TopMenu.Title.TextLabel
local textLabel1 = Instance.new("TextLabel")
textLabel1.TextWrapped = true
textLabel1.BorderSizePixel = 0
textLabel1.TextScaled = true
textLabel1.BackgroundColor3 = Color3.new(1, 1, 1)
textLabel1.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
textLabel1.TextSize = 14
textLabel1.TextColor3 = Color3.new(1, 1, 1)
textLabel1.AutomaticSize = Enum.AutomaticSize.X
textLabel1.Size = UDim2.new(0.7192937135696411, 0, 0.41530051827430725, 0)
textLabel1.BorderColor3 = Color3.new(0, 0, 0)
textLabel1.BackgroundTransparency = 1
textLabel1.Position = UDim2.new(0.13402166962623596, 0, 0.27320244908332825, 0)
textLabel1.Parent = title1

-- DrRay.TopBar.TopBarClose
local topBarClose1 = Instance.new("TextButton")
topBarClose1.Active = true
topBarClose1.BorderSizePixel = 0
topBarClose1.AutoButtonColor = false
topBarClose1.BackgroundColor3 = Color3.fromRGB(42, 42, 58)
topBarClose1.Selectable = false
topBarClose1.Size = UDim2.new(0.08402203768491745, 0, 0.4803149402141571, 0)
topBarClose1.Name = "TopBarClose"
topBarClose1.BorderColor3 = Color3.new(0, 0, 0)
topBarClose1.Text = ""
topBarClose1.Position = UDim2.new(0.915977954864502, 0, 0.5196850299835205, 0)
topBarClose1.Parent = topBar1

-- DrRay.TopBar.TopBarClose.UICorner
local uiCorner3 = Instance.new("UICorner")
uiCorner3.CornerRadius = UDim.new(0.20000000298023224, 0)
uiCorner3.Parent = topBarClose1

-- DrRay.TopBar.TopBarClose.UIGradient
local uiGradient4 = Instance.new("UIGradient")
uiGradient4.Rotation = 90
uiGradient4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(117, 117, 117)), ColorSequenceKeypoint.new(1, Color3.fromRGB(218, 218, 218))}
uiGradient4.Parent = topBarClose1

-- DrRay.TopBar.TopBarClose.Frame
local frame1 = Instance.new("Frame")
frame1.BorderSizePixel = 0
frame1.BackgroundColor3 = Color3.fromRGB(42, 42, 58)
frame1.Size = UDim2.new(0.2622910141944885, 0, 1, 0)
frame1.BorderColor3 = Color3.new(0, 0, 0)
frame1.Position = UDim2.new(0.000002001152552111307, 0, 0, 0)
frame1.Name = "Frame"
frame1.Parent = topBarClose1

-- DrRay.TopBar.TopBarClose.Frame.UIGradient
local uiGradient5 = Instance.new("UIGradient")
uiGradient5.Rotation = 90
uiGradient5.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(117, 117, 117)), ColorSequenceKeypoint.new(1, Color3.fromRGB(218, 218, 218))}
uiGradient5.Parent = frame1

-- DrRay.TopBar.TopBarClose.UIAspectRatioConstraint
local uiAspectRatioConstraint1 = Instance.new("UIAspectRatioConstraint", topBarClose1)

-- DrRay.TopBar.TopBarClose.ImageLabel
local imageLabel1 = Instance.new("ImageLabel")
imageLabel1.BorderSizePixel = 0
imageLabel1.BackgroundColor3 = Color3.new(1, 1, 1)
imageLabel1.Image = "rbxassetid://14122651741"
imageLabel1.LayoutOrder = 1
imageLabel1.Size = UDim2.new(0.5081987380981445, 0, 0.5971601009368896, 0)
imageLabel1.BorderColor3 = Color3.new(0, 0, 0)
imageLabel1.BackgroundTransparency = 1
imageLabel1.Position = UDim2.new(0.24589963257312775, 0, 0.23339086771011353, 0)
imageLabel1.Parent = topBarClose1

-- DrRay.TopBar.TopBarClose.ImageLabel.UIAspectRatioConstraint
local uiAspectRatioConstraint2 = Instance.new("UIAspectRatioConstraint")
uiAspectRatioConstraint2.AspectRatio = 0.9836804866790771
uiAspectRatioConstraint2.Parent = imageLabel1

-- DrRay.TopBar.UIAspectRatioConstraint
local uiAspectRatioConstraint3 = Instance.new("UIAspectRatioConstraint")
uiAspectRatioConstraint3.AspectRatio = 5.724700927734375
uiAspectRatioConstraint3.Parent = topBar1

-- DrRay.MainBar
local mainBar = Instance.new("Frame")
mainBar.BorderSizePixel = 0
mainBar.BackgroundColor3 = Color3.fromRGB(42, 42, 58)
mainBar.Size = UDim2.new(0.5404488444328308, 0, 0.5745577812194824, 0)
mainBar.BorderColor3 = Color3.new(0, 0, 0)
mainBar.Position = UDim2.new(0.23000000417232513, 0, -0.6119999885559082, 0)
mainBar.Name = "MainBar"
mainBar.Parent = screenGui

-- DrRay.MainBar.UICorner
local uiCorner4 = Instance.new("UICorner")
uiCorner4.CornerRadius = UDim.new(0.029999999329447746, 0)
uiCorner4.Parent = mainBar

-- DrRay.MainBar.UIGradient
local uiGradient6 = Instance.new("UIGradient")
uiGradient6.Rotation = 90
uiGradient6.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(90, 90, 90)), ColorSequenceKeypoint.new(0.231, Color3.fromRGB(154, 154, 154)),ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))}
uiGradient6.Parent = mainBar

-- DrRay.MainBar.UIAspectRatioConstraint
local uiAspectRatioConstraint4 = Instance.new("UIAspectRatioConstraint")
uiAspectRatioConstraint4.AspectRatio = 1.7326968908309937
uiAspectRatioConstraint4.Parent = mainBar

-- DrRay.MainBar.DropShadowHolder
local dropShadowHolder2 = Instance.new("Frame")
dropShadowHolder2.ZIndex = 0
dropShadowHolder2.BorderSizePixel = 0
dropShadowHolder2.BackgroundTransparency = 1
dropShadowHolder2.LayoutOrder = -1
dropShadowHolder2.Size = UDim2.new(1, 0, 1, 0)
dropShadowHolder2.Name = "DropShadowHolder"
dropShadowHolder2.Parent = mainBar

-- DrRay.MainBar.DropShadowHolder.DropShadow
local dropShadow2 = Instance.new("ImageLabel")
dropShadow2.ZIndex = 0
dropShadow2.BorderSizePixel = 0
dropShadow2.SliceCenter = Rect.new(49, 49, 450, 450)
dropShadow2.ScaleType = Enum.ScaleType.Slice
dropShadow2.ImageColor3 = Color3.new(0, 0, 0)
dropShadow2.ImageTransparency = 0.5
dropShadow2.AnchorPoint = Vector2.new(0.5, 0.5)
dropShadow2.Image = "rbxassetid://6014261993"
dropShadow2.Size = UDim2.new(1, 47, 1, 47)
dropShadow2.Name = "DropShadow"
dropShadow2.BackgroundTransparency = 1
dropShadow2.Position = UDim2.new(0.5, 0, 0.5, 0)
dropShadow2.Parent = dropShadowHolder2

-- DrRay.MainBar.Logo
local logo = Instance.new("ImageLabel")
logo.BorderSizePixel = 0
logo.BackgroundColor3 = Color3.new(1, 1, 1)
logo.Image = "rbxassetid://14133403065"
logo.Size = UDim2.new(0.18741475045681, 0, 0.3247329592704773, 0)
logo.BorderColor3 = Color3.new(0, 0, 0)
logo.Name = "Logo"
logo.BackgroundTransparency = 1
logo.Position = UDim2.new(0.3991934061050415, 0, 0.33447495102882385, 0)
logo.Parent = mainBar

-- DrRay.MainBar.Logo.UIGradient
local uiGradient7 = Instance.new("UIGradient")
uiGradient7.Rotation = 90
uiGradient7.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)), ColorSequenceKeypoint.new(1, Color3.fromRGB(5, 6, 23))}
uiGradient7.Parent = logo

-- DrRay.TabReserved
local tabReserved = Instance.new("ScrollingFrame")
tabReserved.Active = true
tabReserved.BorderSizePixel = 0
tabReserved.CanvasSize = UDim2.new(0, 0, 0, 0)
tabReserved.BackgroundColor3 = Color3.fromRGB(26, 26, 36)
tabReserved.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left
tabReserved.AutomaticCanvasSize = Enum.AutomaticSize.Y
tabReserved.BackgroundTransparency = 1
tabReserved.Size = UDim2.new(1, 0, 0.9599999785423279, 0)
tabReserved.ScrollBarImageColor3 = Color3.new(0, 0, 0)
tabReserved.BorderColor3 = Color3.new(0, 0, 0)
tabReserved.ScrollBarThickness = 0
tabReserved.Position = UDim2.new(0, 0, 0.03999999910593033, 0)
tabReserved.Visible = false

-- DrRay.TabReserved.UIListLayout
local uiListLayout3 = Instance.new("UIListLayout")
uiListLayout3.HorizontalAlignment = Enum.HorizontalAlignment.Center
uiListLayout3.Padding = UDim.new(0.014999999664723873, 0)
uiListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout3.Parent = tabReserved

-- DrRay.TabButtonReserved
local tabButtonReserved = Instance.new("ImageButton")
tabButtonReserved.BorderSizePixel = 0
tabButtonReserved.AutoButtonColor = false
tabButtonReserved.BackgroundColor3 = Color3.fromRGB(42, 42, 58)
tabButtonReserved.Size = UDim2.new(0.19896680116653442, 0, 0.6315789818763733, 0)
tabButtonReserved.BorderColor3 = Color3.new(0, 0, 0)
tabButtonReserved.Visible = true
tabButtonReserved.Position = UDim2.new(0.015000020153820515, 0, 0.18421050906181335, 0)

-- DrRay.TabButtonReserved.UICorner
local uiCorner5 = Instance.new("UICorner")
uiCorner5.CornerRadius = UDim.new(0.30000001192092896, 0)
uiCorner5.Parent = tabButtonReserved

-- DrRay.TabButtonReserved.Frame
local frame2 = Instance.new("Frame")
frame2.BorderSizePixel = 0
frame2.BackgroundColor3 = Color3.new(1, 1, 1)
frame2.BackgroundTransparency = 1
frame2.LayoutOrder = 1
frame2.Size = UDim2.new(0.6113507151603699, 0, 1.0000001192092896, 0)
frame2.BorderColor3 = Color3.new(0, 0, 0)
frame2.Position = UDim2.new(0.26662877202033997, 0, -4.950767973355141e-08, 0)
frame2.AutomaticSize = Enum.AutomaticSize.X
frame2.Parent = tabButtonReserved

-- DrRay.TabButtonReserved.Frame.TextLabel
local textLabel2 = Instance.new("TextLabel")
textLabel2.TextWrapped = true
textLabel2.BorderSizePixel = 0
textLabel2.TextScaled = true
textLabel2.BackgroundColor3 = Color3.new(1, 1, 1)
textLabel2.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
textLabel2.TextSize = 14
textLabel2.TextColor3 = Color3.new(1, 1, 1)
textLabel2.AutomaticSize = Enum.AutomaticSize.X
textLabel2.Size = UDim2.new(-0.145383819937706, 0, 0.415300577878952, 0)
textLabel2.BorderColor3 = Color3.new(0, 0, 0)
textLabel2.BackgroundTransparency = 1
textLabel2.Position = UDim2.new(-1.2657674551010132, 0, 0.37021857500076294, 0)
textLabel2.Parent = frame2

-- DrRay.TabButtonReserved.Frame.UIListLayout
local uiListLayout4 = Instance.new("UIListLayout")
uiListLayout4.VerticalAlignment = Enum.VerticalAlignment.Center
uiListLayout4.FillDirection = Enum.FillDirection.Horizontal
uiListLayout4.HorizontalAlignment = Enum.HorizontalAlignment.Center
uiListLayout4.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout4.Parent = frame2

-- DrRay.TabButtonReserved.UIGradient
local uiGradient8 = Instance.new("UIGradient")
uiGradient8.Rotation = 90
uiGradient8.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(154, 154, 154)), ColorSequenceKeypoint.new(1, Color3.fromRGB(231, 231, 231))}
uiGradient8.Parent = tabButtonReserved

-- DrRay.TabButtonReserved.ImageLabel
local imageLabel2 = Instance.new("ImageLabel")
imageLabel2.BorderSizePixel = 0
imageLabel2.BackgroundColor3 = Color3.new(1, 1, 1)
imageLabel2.Size = UDim2.new(0.19903095066547394, 0, 0.606557309627533, 0)
imageLabel2.BorderColor3 = Color3.new(0, 0, 0)
imageLabel2.BackgroundTransparency = 1
imageLabel2.Position = UDim2.new(0.1134648397564888, 0, 0.19672130048274994, 0)
imageLabel2.Parent = tabButtonReserved

-- DrRay.TabButtonReserved.ImageLabel.UIAspectRatioConstraint
local uiAspectRatioConstraint5 = Instance.new("UIAspectRatioConstraint")
uiAspectRatioConstraint5.AspectRatio = 0.9842342734336853
uiAspectRatioConstraint5.Parent = imageLabel2

-- DrRay.TabButtonReserved.UIListLayout
local uiListLayout5 = Instance.new("UIListLayout")
uiListLayout5.VerticalAlignment = Enum.VerticalAlignment.Center
uiListLayout5.FillDirection = Enum.FillDirection.Horizontal
uiListLayout5.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout5.Parent = tabButtonReserved

-- DrRay.TabButtonReserved.UIPadding
local uiPadding3 = Instance.new("UIPadding")
uiPadding3.PaddingLeft = UDim.new(0.10999999940395355, 0)
uiPadding3.Parent = tabButtonReserved

-- DrRay.Dropdown
local dropDown = Instance.new("Frame")
dropDown.BorderSizePixel = 0
dropDown.BackgroundColor3 = Color3.fromRGB(40, 45, 62)
dropDown.BackgroundTransparency = 0.4000000059604645
dropDown.Size = UDim2.new(0.9614325165748596, 0, 0.2624756097793579, 0)
dropDown.BorderColor3 = Color3.new(0, 0, 0)
dropDown.Position = UDim2.new(0.019283747300505638, 0, 0.12373435497283936, 0)
dropDown.AutomaticSize = Enum.AutomaticSize.Y
dropDown.Visible = true

-- DrRay.Dropdown.UICorner
local uiCorner6 = Instance.new("UICorner")
uiCorner6.CornerRadius = UDim.new(0.03999999910593033, 0)
uiCorner6.Parent = dropDown

-- DrRay.Dropdown.UIGradient
local uiGradient9 = Instance.new("UIGradient")
uiGradient9.Rotation = 90
uiGradient9.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(89, 89, 89)), ColorSequenceKeypoint.new(1, Color3.fromRGB(139, 139, 139))}
uiGradient9.Parent = dropDown

-- DrRay.Dropdown.Title
local title2 = Instance.new("TextLabel")
title2.TextWrapped = true
title2.BorderSizePixel = 0
title2.TextScaled = true
title2.BackgroundColor3 = Color3.new(1, 1, 1)
title2.TextXAlignment = Enum.TextXAlignment.Left
title2.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
title2.TextSize = 14
title2.TextColor3 = Color3.new(1, 1, 1)
title2.Size = UDim2.new(0.9656160473823547, 0, 0.19094853103160858, 0)
title2.BorderColor3 = Color3.new(0, 0, 0)
title2.Name = "Title"
title2.BackgroundTransparency = 1
title2.Position = UDim2.new(0.017191976308822632, 0, 0.10911344736814499, 0)
title2.Parent = dropDown

-- DrRay.Dropdown.Description
local description1 = Instance.new("TextLabel")
description1.TextWrapped = true
description1.BorderSizePixel = 0
description1.TextScaled = true
description1.BackgroundColor3 = Color3.new(1, 1, 1)
description1.TextXAlignment = Enum.TextXAlignment.Left
description1.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Regular, Enum.FontStyle.Italic)
description1.TextSize = 14
description1.TextColor3 = Color3.new(1, 1, 1)
description1.Size = UDim2.new(0.9656160473823547, 0, 0.15457738935947418, 0)
description1.BorderColor3 = Color3.new(0, 0, 0)
description1.Name = "Description"
description1.BackgroundTransparency = 1
description1.Position = UDim2.new(0.011461317539215088, 0, 0.7547013759613037, 0)
description1.Parent = dropDown

-- DrRay.Dropdown.DropdownBar
local dropDownBar = Instance.new("Frame")
dropDownBar.BorderSizePixel = 0
dropDownBar.BackgroundColor3 = Color3.fromRGB(40, 45, 62)
dropDownBar.LayoutOrder = 10
dropDownBar.Size = UDim2.new(0.9684813618659973, 0, 0.29096919298171997, 0)
dropDownBar.BorderColor3 = Color3.new(0, 0, 0)
dropDownBar.Position = UDim2.new(0.014326647855341434, 0, 0.34552592039108276, 0)
dropDownBar.Name = "DropdownBar"
dropDownBar.Parent = dropDown

-- DrRay.Dropdown.DropdownBar.UICorner
local uiCorner7 = Instance.new("UICorner")
uiCorner7.CornerRadius = UDim.new(0.20000000298023224, 0)
uiCorner7.Parent = dropDownBar

-- DrRay.Dropdown.DropdownBar.UIGradient
local uiGradient10 = Instance.new("UIGradient")
uiGradient10.Rotation = 90
uiGradient10.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(117, 117, 117)), ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))}
uiGradient10.Parent = dropDownBar

-- DrRay.Dropdown.DropdownBar.UIStroke
local uiStroke1 = Instance.new("UIStroke")
uiStroke1.Color = Color3.fromRGB(40, 45, 62)
uiStroke1.Parent = dropDownBar

-- DrRay.Dropdown.DropdownBar.Icon
local icon = Instance.new("ImageLabel")
icon.BorderSizePixel = 0
icon.BackgroundColor3 = Color3.new(1, 1, 1)
icon.Image = "rbxassetid://14122651741"
icon.Size = UDim2.new(0.028106508776545525, 0, 0.59375, 0)
icon.BorderColor3 = Color3.new(0, 0, 0)
icon.Name = "Icon"
icon.Rotation = 180
icon.BackgroundTransparency = 1
icon.Position = UDim2.new(0.9589999914169312, 0, 0.21899999678134918, 0)
icon.Parent = dropDownBar

-- DrRay.Dropdown.DropdownBar.Icon.UIAspectRatioConstraint
local uiAspectRatioConstraint6 = Instance.new("UIAspectRatioConstraint", icon)

-- DrRay.Dropdown.DropdownBar.Open
local open = Instance.new("TextLabel")
open.TextWrapped = true
open.BorderSizePixel = 0
open.TextScaled = true
open.BackgroundColor3 = Color3.fromRGB(0, 255, 39)
open.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
open.TextStrokeColor3 = Color3.new(1, 1, 1)
open.TextColor3 = Color3.new(1, 1, 1)
open.Size = UDim2.new(1, 0, 0.59375, 0)
open.BorderColor3 = Color3.new(0, 0, 0)
open.Text = "none"
open.Name = "Open"
open.BackgroundTransparency = 1
open.Position = UDim2.new(0, 0, 0.21875, 0)
open.Parent = dropDownBar

-- DrRay.Dropdown.DropdownBar.Trigger
local trigger1 = Instance.new("TextButton")
trigger1.BorderSizePixel = 0
trigger1.AutoButtonColor = false
trigger1.BackgroundColor3 = Color3.fromRGB(40, 45, 62)
trigger1.Selectable = false
trigger1.Size = UDim2.new(1, 0, 1, 0)
trigger1.LayoutOrder = 10
trigger1.Name = "Trigger"
trigger1.BorderColor3 = Color3.new(0, 0, 0)
trigger1.Text = ""
trigger1.BackgroundTransparency = 1
trigger1.Parent = dropDownBar

-- DrRay.Dropdown.Box
local box = Instance.new("Frame")
box.BorderSizePixel = 0
box.BackgroundColor3 = Color3.fromRGB(40, 45, 62)
box.LayoutOrder = 10
box.Size = UDim2.new(0.9700000286102295, 0, 0, 0)
box.BorderColor3 = Color3.new(0, 0, 0)
box.Position = UDim2.new(0.014326647855341434, 0, 0.6362887620925903, 0)
box.Visible = false
box.Name = "Box"
box.Parent = dropDown

-- DrRay.Dropdown.Box.UIGradient
local uiGradient11 = Instance.new("UIGradient")
uiGradient11.Rotation = 90
uiGradient11.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(117, 117, 117)), ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))}
uiGradient11.Parent = box

-- DrRay.Dropdown.Box.UIStroke
local uiStroke2 = Instance.new("UIStroke")
uiStroke2.Color = Color3.fromRGB(40, 45, 62)
uiStroke2.Parent = box

-- DrRay.Dropdown.Box.UICorner
local uiCorner8 = Instance.new("UICorner")
uiCorner8.CornerRadius = UDim.new(0.05999999865889549, 0)
uiCorner8.Parent = box

-- DrRay.Dropdown.Box.ScrollingFrame
local scrollingFrame2 = Instance.new("ScrollingFrame")
scrollingFrame2.Active = true
scrollingFrame2.ScrollingDirection = Enum.ScrollingDirection.Y
scrollingFrame2.BorderSizePixel = 0
scrollingFrame2.CanvasSize = UDim2.new(0, 0, 0.10000000149011612, 0)
scrollingFrame2.MidImage = ""
scrollingFrame2.BackgroundColor3 = Color3.new(1, 1, 1)
scrollingFrame2.AutomaticCanvasSize = Enum.AutomaticSize.Y
scrollingFrame2.BackgroundTransparency = 1
scrollingFrame2.Size = UDim2.new(1, 0, 1, 0)
scrollingFrame2.ScrollBarImageColor3 = Color3.new(0, 0, 0)
scrollingFrame2.BorderColor3 = Color3.new(0, 0, 0)
scrollingFrame2.ScrollBarThickness = 0
scrollingFrame2.Parent = box

-- DrRay.Dropdown.Box.ScrollingFrame.UIListLayout
local uiListLayout6 = Instance.new("UIListLayout")
uiListLayout6.HorizontalAlignment = Enum.HorizontalAlignment.Center
uiListLayout6.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout6.Parent = scrollingFrame2

-- DrRay.Keybind
local keybind = Instance.new("Frame")
keybind.Active = true
keybind.BorderSizePixel = 0
keybind.BackgroundColor3 = Color3.fromRGB(40, 45, 62)
keybind.BackgroundTransparency = 0.4000000059604645
keybind.Size = UDim2.new(0.9614325165748596, 0, 0.2624756097793579, 0)
keybind.BorderColor3 = Color3.new(0, 0, 0)
keybind.Position = UDim2.new(0.019283747300505638, 0, 0.12373435497283936, 0)
keybind.Visible = true

-- DrRay.Keybind.UICorner
local uiCorner9 = Instance.new("UICorner")
uiCorner9.CornerRadius = UDim.new(0.03999999910593033, 0)
uiCorner9.Parent = keybind

-- DrRay.Keybind.UIGradient
local uiGradient12 = Instance.new("UIGradient")
uiGradient12.Rotation = 90
uiGradient12.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(113, 113, 113)), ColorSequenceKeypoint.new(1, Color3.fromRGB(194, 194, 194))}
uiGradient12.Parent = keybind

-- DrRay.Keybind.Title
local title3 = Instance.new("TextLabel")
title3.TextWrapped = true
title3.BorderSizePixel = 0
title3.TextScaled = true
title3.BackgroundColor3 = Color3.new(1, 1, 1)
title3.TextXAlignment = Enum.TextXAlignment.Left
title3.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
title3.TextSize = 14
title3.TextColor3 = Color3.new(1, 1, 1)
title3.Size = UDim2.new(0.9656160473823547, 0, 0.19094853103160858, 0)
title3.BorderColor3 = Color3.new(0, 0, 0)
title3.Name = "Title"
title3.BackgroundTransparency = 1
title3.Position = UDim2.new(0.017191976308822632, 0, 0.10911344736814499, 0)
title3.Parent = keybind

-- DrRay.Keybind.Description
local description2 = Instance.new("TextLabel")
description2.TextWrapped = true
description2.BorderSizePixel = 0
description2.TextScaled = true
description2.BackgroundColor3 = Color3.new(1, 1, 1)
description2.TextXAlignment = Enum.TextXAlignment.Left
description2.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Regular, Enum.FontStyle.Italic)
description2.TextSize = 14
description2.TextColor3 = Color3.new(1, 1, 1)
description2.Size = UDim2.new(0.9656160473823547, 0, 0.15457738935947418, 0)
description2.BorderColor3 = Color3.new(0, 0, 0)
description2.Name = "Description"
description2.BackgroundTransparency = 1
description2.Position = UDim2.new(0.012893982231616974, 0, 0.7092373967170715, 0)
description2.Parent = keybind

-- DrRay.Keybind.Bind
local bind = Instance.new("Frame")
bind.Active = true
bind.BorderSizePixel = 0
bind.BackgroundColor3 = Color3.fromRGB(40, 45, 62)
bind.Size = UDim2.new(0.14899714291095734, 0, 0.29096919298171997, 0)
bind.BorderColor3 = Color3.new(0, 0, 0)
bind.Position = UDim2.new(0.014326647855341434, 0, 0.34552592039108276, 0)
bind.Name = "Bind"
bind.Parent = keybind

-- DrRay.Keybind.Bind.UICorner
local uiCorner10 = Instance.new("UICorner")
uiCorner10.CornerRadius = UDim.new(0.20000000298023224, 0)
uiCorner10.Parent = bind

-- DrRay.Keybind.Bind.UIGradient
local uiGradient13 = Instance.new("UIGradient")
uiGradient13.Rotation = 90
uiGradient13.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(117, 117, 117)),ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))}
uiGradient13.Parent = bind

-- DrRay.Keybind.Bind.UIStroke
local uiStroke3 = Instance.new("UIStroke")
uiStroke3.Color = Color3.fromRGB(40, 45, 62)
uiStroke3.Parent = bind

-- DrRay.Keybind.Bind.Button
local button1 = Instance.new("TextButton")
button1.TextWrapped = true
button1.ZIndex = 5
button1.BorderSizePixel = 0
button1.TextStrokeColor3 = Color3.new(1, 1, 1)
button1.TextScaled = true
button1.BackgroundColor3 = Color3.fromRGB(0, 255, 39)
button1.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Regular, Enum.FontStyle.Italic)
button1.TextColor3 = Color3.fromRGB(160, 160, 160)
button1.Selectable = false
button1.Size = UDim2.new(1, 0, 0.59375, 0)
button1.Name = "Button"
button1.BorderColor3 = Color3.new(0, 0, 0)
button1.Text = "key"
button1.Position = UDim2.new(0, 0, 0.21875, 0)
button1.BackgroundTransparency = 0.9900000095367432
button1.Parent = bind

-- DrRay.Label
local label1 = Instance.new("Frame")
label1.BorderSizePixel = 0
label1.BackgroundColor3 = Color3.fromRGB(40, 45, 62)
label1.Size = UDim2.new(0.9614325165748596, 0, 0.07873434573411942, 0)
label1.BorderColor3 = Color3.new(0, 0, 0)
label1.Position = UDim2.new(0.019283747300505638, 0, 0.01806684397161007, 0)
label1.AutomaticSize = Enum.AutomaticSize.Y
label1.Visible = true

-- DrRay.Label.UICorner
local uiCorner11 = Instance.new("UICorner")
uiCorner11.CornerRadius = UDim.new(0.33000001311302185, 0)
uiCorner11.Parent = label1

-- DrRay.Label.UIGradient
local uiGradient14 = Instance.new("UIGradient")
uiGradient14.Rotation = 90
uiGradient14.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(166, 166, 166)),ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))}
uiGradient14.Parent = label1

-- DrRay.Label.Title
local title4 = Instance.new("TextLabel")
title4.TextWrapped = true
title4.BorderSizePixel = 0
title4.TextScaled = true
title4.BackgroundColor3 = Color3.new(1, 1, 1)
title4.TextXAlignment = Enum.TextXAlignment.Left
title4.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
title4.TextSize = 14
title4.TextColor3 = Color3.new(1, 1, 1)
title4.Size = UDim2.new(0.9668599367141724, 0, 0.5928126573562622, 0)
title4.BorderColor3 = Color3.new(0, 0, 0)
title4.Name = "Title"
title4.BackgroundTransparency = 1
title4.Position = UDim2.new(0.018000036478042603, 0, 0.22100010514259338, 0)
title4.Parent = label1

-- DrRay.Slider
local slider = Instance.new("Frame")
slider.BorderSizePixel = 0
slider.BackgroundColor3 = Color3.fromRGB(40, 45, 62)
slider.BackgroundTransparency = 0.4000000059604645
slider.Size = UDim2.new(0.9614325165748596, 0, 0.2624756097793579, 0)
slider.BorderColor3 = Color3.new(0, 0, 0)
slider.Position = UDim2.new(0.019283747300505638, 0, 0.12373435497283936, 0)
slider.Visible = false

-- DrRay.Slider.UICorner
local uiCorner12 = Instance.new("UICorner")
uiCorner12.CornerRadius = UDim.new(0.03999999910593033, 0)
uiCorner12.Parent = slider

-- DrRay.Slider.UIGradient
local uiGradient15 = Instance.new("UIGradient")
uiGradient15.Rotation = 90
uiGradient15.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(108, 108, 108)), ColorSequenceKeypoint.new(1, Color3.fromRGB(232, 232, 232))}
uiGradient15.Parent = slider

-- DrRay.Slider.Title
local title5 = Instance.new("TextLabel")
title5.TextWrapped = true
title5.BorderSizePixel = 0
title5.TextScaled = true
title5.BackgroundColor3 = Color3.new(1, 1, 1)
title5.TextXAlignment = Enum.TextXAlignment.Left
title5.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
title5.TextSize = 14
title5.TextColor3 = Color3.new(1, 1, 1)
title5.Size = UDim2.new(0.9656160473823547, 0, 0.19094853103160858, 0)
title5.BorderColor3 = Color3.new(0, 0, 0)
title5.Name = "Title"
title5.BackgroundTransparency = 1
title5.Position = UDim2.new(0.017191976308822632, 0, 0.10911344736814499, 0)
title5.Parent = slider

-- DrRay.Slider.ActualSlider
local actualSlider = Instance.new("Frame")
actualSlider.BorderSizePixel = 0
actualSlider.BackgroundColor3 = Color3.fromRGB(0, 255, 39)
actualSlider.Size = UDim2.new(0.9684813618659973, 0, 0.29096919298171997, 0)
actualSlider.ClipsDescendants = true
actualSlider.BorderColor3 = Color3.new(0, 0, 0)
actualSlider.Position = UDim2.new(0.014326647855341434, 0, 0.34552592039108276, 0)
actualSlider.Name = "ActualSlider"
actualSlider.Parent = slider

-- DrRay.Slider.ActualSlider.UICorner
local uiCorner13 = Instance.new("UICorner")
uiCorner13.CornerRadius = UDim.new(0.20000000298023224, 0)
uiCorner13.Parent = actualSlider

-- DrRay.Slider.ActualSlider.UIGradient
local uiGradient16 = Instance.new("UIGradient")
uiGradient16.Rotation = 90
uiGradient16.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(64, 64, 64)), ColorSequenceKeypoint.new(1, Color3.fromRGB(148, 148, 148))}
uiGradient16.Parent = actualSlider

-- DrRay.Slider.ActualSlider.UIStroke
local uiStroke4 = Instance.new("UIStroke")
uiStroke4.Color = Color3.fromRGB(0, 255, 39)
uiStroke4.Parent = actualSlider

-- DrRay.Slider.ActualSlider.Fill
local fill = Instance.new("Frame")
fill.BorderSizePixel = 0
fill.BackgroundColor3 = Color3.fromRGB(0, 255, 39)
fill.Size = UDim2.new(0, 0, 1, 0)
fill.BorderColor3 = Color3.new(0, 0, 0)
fill.Position = UDim2.new(-0.0010000000474974513, 0, 0.029999999329447746, 0)
fill.Name = "Fill"
fill.Parent = actualSlider

-- DrRay.Slider.ActualSlider.Fill.UICorner
local uiCorner14 = Instance.new("UICorner")
uiCorner14.CornerRadius = UDim.new(0.20000000298023224, 0)
uiCorner14.Parent = fill

-- DrRay.Slider.ActualSlider.Fill.UIGradient
local uiGradient17 = Instance.new("UIGradient")
uiGradient17.Rotation = 90
uiGradient17.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(107, 107, 107)), ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))}
uiGradient17.Parent = fill

-- DrRay.Slider.ActualSlider.Trigger
local trigger2 = Instance.new("TextButton")
trigger2.BorderSizePixel = 0
trigger2.AutoButtonColor = false
trigger2.BackgroundColor3 = Color3.fromRGB(0, 255, 39)
trigger2.Selectable = false
trigger2.Size = UDim2.new(1, 0, 1, 0)
trigger2.LayoutOrder = 5
trigger2.Name = "Trigger"
trigger2.BorderColor3 = Color3.new(0, 0, 0)
trigger2.Text = ""
trigger2.Position = UDim2.new(-0.0010000000474974513, 0, 0.029999999329447746, 0)
trigger2.BackgroundTransparency = 1
trigger2.Parent = actualSlider

-- DrRay.Slider.ActualSlider.Trigger.UICorner
local uiCorner15 = Instance.new("UICorner")
uiCorner15.CornerRadius = UDim.new(0.20000000298023224, 0)
uiCorner15.Parent = trigger2

-- DrRay.Slider.ActualSlider.Trigger.UIGradient
local uiGradient18 = Instance.new("UIGradient")
uiGradient18.Rotation = 90
uiGradient18.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(166, 166, 166)), ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))}
uiGradient18.Parent = trigger2

-- DrRay.Slider.ActualSlider.Title
local title6 = Instance.new("TextLabel")
title6.TextWrapped = true
title6.BorderSizePixel = 0
title6.TextScaled = true
title6.BackgroundColor3 = Color3.new(1, 1, 1)
title6.TextXAlignment = Enum.TextXAlignment.Left
title6.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
title6.TextSize = 14
title6.TextColor3 = Color3.new(1, 1, 1)
title6.LayoutOrder = 3
title6.Size = UDim2.new(0.9582196474075317, 0, 0.5971987247467041, 0)
title6.BorderColor3 = Color3.new(0, 0, 0)
title6.Name = "Title"
title6.BackgroundTransparency = 1
title6.Position = UDim2.new(0.023000000044703484, 0, 0.23100000619888306, 0)
title6.Parent = actualSlider

-- DrRay.Slider.Description
local description3 = Instance.new("TextLabel")
description3.TextWrapped = true
description3.BorderSizePixel = 0
description3.TextScaled = true
description3.BackgroundColor3 = Color3.new(1, 1, 1)
description3.TextXAlignment = Enum.TextXAlignment.Left
description3.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Regular, Enum.FontStyle.Italic)
description3.TextSize = 14
description3.TextColor3 = Color3.new(1, 1, 1)
description3.Size = UDim2.new(0.9656160473823547, 0, 0.15457738935947418, 0)
description3.BorderColor3 = Color3.new(0, 0, 0)
description3.Name = "Description"
description3.BackgroundTransparency = 1
description3.Position = UDim2.new(0.015759311616420746, 0, 0.7274229526519775, 0)
description3.Parent = slider

-- DrRay.Textbox
local textBox = Instance.new("Frame")
textBox.BorderSizePixel = 0
textBox.BackgroundColor3 = Color3.fromRGB(40, 45, 62)
textBox.BackgroundTransparency = 0.4000000059604645
textBox.Size = UDim2.new(0.9614325165748596, 0, 0.2624756097793579, 0)
textBox.BorderColor3 = Color3.new(0, 0, 0)
textBox.Position = UDim2.new(0.019283747300505638, 0, 0.12373435497283936, 0)
textBox.Visible = true

-- DrRay.Textbox.UICorner
local uiCorner16 = Instance.new("UICorner")
uiCorner16.CornerRadius = UDim.new(0.03999999910593033, 0)
uiCorner16.Parent = textBox

-- DrRay.Textbox.UIGradient
local uiGradient19 = Instance.new("UIGradient")
uiGradient19.Rotation = 90
uiGradient19.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(89, 89, 89)), ColorSequenceKeypoint.new(1, Color3.fromRGB(139, 139, 139))}
uiGradient19.Parent = textBox

-- DrRay.Textbox.Title
local title7 = Instance.new("TextLabel")
title7.TextWrapped = true
title7.BorderSizePixel = 0
title7.TextScaled = true
title7.BackgroundColor3 = Color3.new(1, 1, 1)
title7.TextXAlignment = Enum.TextXAlignment.Left
title7.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
title7.TextSize = 14
title7.TextColor3 = Color3.new(1, 1, 1)
title7.Size = UDim2.new(0.9656160473823547, 0, 0.19094853103160858, 0)
title7.BorderColor3 = Color3.new(0, 0, 0)
title7.Name = "Title"
title7.BackgroundTransparency = 1
title7.Position = UDim2.new(0.017191976308822632, 0, 0.10911344736814499, 0)
title7.Parent = textBox

-- DrRay.Textbox.Description
local description4 = Instance.new("TextLabel")
description4.TextWrapped = true
description4.BorderSizePixel = 0
description4.TextScaled = true
description4.BackgroundColor3 = Color3.new(1, 1, 1)
description4.TextXAlignment = Enum.TextXAlignment.Left
description4.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Regular, Enum.FontStyle.Italic)
description4.TextSize = 14
description4.TextColor3 = Color3.new(1, 1, 1)
description4.Size = UDim2.new(0.9656160473823547, 0, 0.15457738935947418, 0)
description4.BorderColor3 = Color3.new(0, 0, 0)
description4.Name = "Description"
description4.BackgroundTransparency = 1
description4.Position = UDim2.new(0.012893982231616974, 0, 0.7092373967170715, 0)
description4.Parent = textBox

-- DrRay.Textbox.TextboxBar
local textBoxBar = Instance.new("Frame")
textBoxBar.BorderSizePixel = 0
textBoxBar.BackgroundColor3 = Color3.fromRGB(40, 45, 62)
textBoxBar.Size = UDim2.new(0.9684813618659973, 0, 0.29096919298171997, 0)
textBoxBar.BorderColor3 = Color3.new(0, 0, 0)
textBoxBar.Position = UDim2.new(0.014326647855341434, 0, 0.34552592039108276, 0)
textBoxBar.Name = "TextboxBar"
textBoxBar.Parent = textBox

-- DrRay.Textbox.TextboxBar.UICorner
local uiCorner17 = Instance.new("UICorner")
uiCorner17.CornerRadius = UDim.new(0.20000000298023224, 0)
uiCorner17.Parent = textBoxBar

-- DrRay.Textbox.TextboxBar.UIGradient
local uiGradient20 = Instance.new("UIGradient")
uiGradient20.Rotation = 90
uiGradient20.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(117, 117, 117)), ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))}
uiGradient20.Parent = textBoxBar

-- DrRay.Textbox.TextboxBar.UIStroke
local uiStroke5 = Instance.new("UIStroke")
uiStroke5.Color = Color3.fromRGB(40, 45, 62)
uiStroke5.Parent = textBoxBar

-- DrRay.Textbox.TextboxBar.ActualTextbox
local actualTextbox = Instance.new("TextBox")
actualTextbox.PlaceholderColor3 = Color3.fromRGB(155, 155, 155)
actualTextbox.BorderSizePixel = 0
actualTextbox.TextWrapped = true
actualTextbox.TextStrokeColor3 = Color3.new(1, 1, 1)
actualTextbox.TextScaled = true
actualTextbox.BackgroundColor3 = Color3.fromRGB(0, 255, 39)
actualTextbox.TextColor3 = Color3.new(1, 1, 1)
actualTextbox.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Regular, Enum.FontStyle.Italic)
actualTextbox.BackgroundTransparency = 1
actualTextbox.PlaceholderText = "Input Here..."
actualTextbox.Size = UDim2.new(1, 0, 0.59375, 0)
actualTextbox.Selectable = false
actualTextbox.BorderColor3 = Color3.new(0, 0, 0)
actualTextbox.Text = ""
actualTextbox.Position = UDim2.new(0, 0, 0.21875, 0)
actualTextbox.Name = "ActualTextbox"
actualTextbox.Parent = textBoxBar

-- DrRay.Toggle
local toggle = Instance.new("Frame")
toggle.Active = true
toggle.BorderSizePixel = 0
toggle.BackgroundColor3 = Color3.fromRGB(40, 45, 62)
toggle.BackgroundTransparency = 0.4000000059604645
toggle.Size = UDim2.new(0.9614325165748596, 0, 0.15495234727859497, 0)
toggle.BorderColor3 = Color3.new(0, 0, 0)
toggle.Position = UDim2.new(0.019283747300505638, 0, 0.6786856055259705, 0)
toggle.Visible = true

-- DrRay.Toggle.UICorner
local uiCorner18 = Instance.new("UICorner")
uiCorner18.CornerRadius = UDim.new(0.03999999910593033, 0)
uiCorner18.Parent = toggle

-- DrRay.Toggle.UIGradient
local uiGradient21 = Instance.new("UIGradient")
uiGradient21.Rotation = 90
uiGradient21.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(109, 109, 109)), ColorSequenceKeypoint.new(0.765, Color3.fromRGB(181, 181, 181)), ColorSequenceKeypoint.new(1, Color3.fromRGB(217, 217, 217))}
uiGradient21.Parent = toggle

-- DrRay.Toggle.Title
local title8 = Instance.new("TextLabel")
title8.TextWrapped = true
title8.BorderSizePixel = 0
title8.RichText = true
title8.TextScaled = true
title8.BackgroundColor3 = Color3.new(1, 1, 1)
title8.TextXAlignment = Enum.TextXAlignment.Left
title8.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
title8.TextSize = 14
title8.TextColor3 = Color3.new(1, 1, 1)
title8.Size = UDim2.new(0.9656160473823547, 0, 0.323449969291687, 0)
title8.BorderColor3 = Color3.new(0, 0, 0)
title8.Name = "Title"
title8.BackgroundTransparency = 1
title8.Position = UDim2.new(0.015759311616420746, 0, 0.18482854962348938, 0)
title8.Parent = toggle

-- DrRay.Toggle.Description
local description5 = Instance.new("TextLabel")
description5.TextWrapped = true
description5.BorderSizePixel = 0
description5.TextScaled = true
description5.BackgroundColor3 = Color3.new(1, 1, 1)
description5.TextXAlignment = Enum.TextXAlignment.Left
description5.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Regular, Enum.FontStyle.Italic)
description5.TextSize = 14
description5.TextColor3 = Color3.new(1, 1, 1)
description5.Size = UDim2.new(0.9656160473823547, 0, 0.26184046268463135, 0)
description5.BorderColor3 = Color3.new(0, 0, 0)
description5.Name = "Description"
description5.BackgroundTransparency = 1
description5.Position = UDim2.new(0.011461318470537663, 0, 0.5852904319763184, 0)
description5.Parent = toggle

-- DrRay.Toggle.Label
local label2 = Instance.new("Frame")
label2.BorderSizePixel = 0
label2.BackgroundColor3 = globalColor1
label2.Size = UDim2.new(0.03868212550878525, 0, 0.42860323190689087, 0)
label2.BorderColor3 = Color3.new(0, 0, 0)
label2.Position = UDim2.new(0.92550128698349, 0, 0.27990657091140747, 0)
label2.AutomaticSize = Enum.AutomaticSize.Y
label2.Name = "Label"
label2.Parent = toggle

-- DrRay.Toggle.Label.UICorner
local uiCorner19 = Instance.new("UICorner")
uiCorner19.CornerRadius = UDim.new(0.33000001311302185, 0)
uiCorner19.Parent = label2

-- DrRay.Toggle.Label.UIGradient
local uiGradient22 = Instance.new("UIGradient")
uiGradient22.Rotation = 90
uiGradient22.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(166, 166, 166)),ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))}
uiGradient22.Parent = label2

-- DrRay.Toggle.Label.UIStroke
local uiStroke6 = Instance.new("UIStroke")
uiStroke6.Color = Color3.fromRGB(40, 45, 62)
uiStroke6.Thickness = 2.4000000953674316
uiStroke6.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uiStroke6.Parent = label2

-- DrRay.Toggle.Label.Label
local label3 = Instance.new("TextButton")
label3.BorderSizePixel = 0
label3.BackgroundColor3 = Color3.fromRGB(40, 45, 62)
label3.Selectable = false
label3.Size = UDim2.new(1, 0, 1, 0)
label3.Name = "Label"
label3.BorderColor3 = Color3.new(0, 0, 0)
label3.Text = ""
label3.AutomaticSize = Enum.AutomaticSize.Y
label3.BackgroundTransparency = 1
label3.Parent = label2

-- DrRay.Toggle.Label.Label.UICorner
local uiCorner20 = Instance.new("UICorner")
uiCorner20.CornerRadius = UDim.new(0.33000001311302185, 0)
uiCorner20.Parent = label3

-- DrRay.Toggle.Label.Label.UIGradient
local uiGradient23 = Instance.new("UIGradient")
uiGradient23.Rotation = 90
uiGradient23.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(166, 166, 166)), ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))}
uiGradient23.Parent = label3

-- DrRay.Button
local button2 = Instance.new("TextButton")
button2.BorderSizePixel = 0
button2.AutoButtonColor = false
button2.BackgroundColor3 = Color3.fromRGB(40, 45, 62)
button2.Selectable = false
button2.Visible = true
button2.Size = UDim2.new(0.9614325165748596, 0, 0.15495234727859497, 0)
button2.Name = "Button"
button2.BorderColor3 = Color3.new(0, 0, 0)
button2.Text = ""
button2.Position = UDim2.new(0.019283747300505638, 0, 0.6786856055259705, 0)
button2.BackgroundTransparency = 0.4000000059604645

-- DrRay.Button.UICorner
local uiCorner21 = Instance.new("UICorner")
uiCorner21.CornerRadius = UDim.new(0.03999999910593033, 0)
uiCorner21.Parent = button2

-- DrRay.Button.UIGradient
local uiGradient24 = Instance.new("UIGradient")
uiGradient24.Rotation = 90
uiGradient24.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(109, 109, 109)), ColorSequenceKeypoint.new(0.765, Color3.fromRGB(181, 181, 181)),ColorSequenceKeypoint.new(1, Color3.fromRGB(217, 217, 217))}
uiGradient24.Parent = button2

-- DrRay.Button.Title
local title9 = Instance.new("TextLabel")
title9.TextWrapped = true
title9.BorderSizePixel = 0
title9.RichText = true
title9.TextScaled = true
title9.BackgroundColor3 = Color3.new(1, 1, 1)
title9.TextXAlignment = Enum.TextXAlignment.Left
title9.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
title9.TextSize = 14
title9.TextColor3 = Color3.new(1, 1, 1)
title9.Size = UDim2.new(0.9656160473823547, 0, 0.323449969291687, 0)
title9.BorderColor3 = Color3.new(0, 0, 0)
title9.Name = "Title"
title9.BackgroundTransparency = 1
title9.Position = UDim2.new(0.015759311616420746, 0, 0.18482854962348938, 0)
title9.Parent = button2

-- DrRay.Button.Description
local description6 = Instance.new("TextLabel")
description6.TextWrapped = true
description6.BorderSizePixel = 0
description6.TextScaled = true
description6.BackgroundColor3 = Color3.new(1, 1, 1)
description6.TextXAlignment = Enum.TextXAlignment.Left
description6.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Regular, Enum.FontStyle.Italic)
description6.TextSize = 14
description6.TextColor3 = Color3.new(1, 1, 1)
description6.Size = UDim2.new(0.9656160473823547, 0, 0.26184046268463135, 0)
description6.BorderColor3 = Color3.new(0, 0, 0)
description6.Name = "Description"
description6.BackgroundTransparency = 1
description6.Position = UDim2.new(0.011461318470537663, 0, 0.5852904319763184, 0)
description6.Parent = button2

-- DrRay.DropdownButton
local dropDownButton = Instance.new("TextButton")
dropDownButton.Active = false
dropDownButton.BorderSizePixel = 0
dropDownButton.BackgroundColor3 = Color3.fromRGB(40, 45, 62)
dropDownButton.Selectable = false
dropDownButton.Visible = true
dropDownButton.Size = UDim2.new(0.9995859265327454, 0, 0.17368526756763458, 0)
dropDownButton.BorderColor3 = Color3.new(0, 0, 0)
dropDownButton.Position = UDim2.new(0.08656254410743713, 0, 0, 0)

-- DrRay.DropdownButton.UICorner
local uiCorner22 = Instance.new("UICorner")
uiCorner22.CornerRadius = UDim.new(0.20000000298023224, 0)
uiCorner22.Parent = dropDownButton

-- DrRay.DropdownButton.UIGradient
local uiGradient25 = Instance.new("UIGradient")
uiGradient25.Rotation = 90
uiGradient25.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(117, 117, 117)), ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))}
uiGradient25.Parent = dropDownButton

-- DrRay.DropdownButton.UIStroke
local uiStroke7 = Instance.new("UIStroke")
uiStroke7.Color = Color3.fromRGB(40, 45, 62)
uiStroke7.Parent = dropDownButton

-- DrRay.DropdownButton.Name
local name = Instance.new("TextLabel")
name.TextWrapped = true
name.BorderSizePixel = 0
name.TextScaled = true
name.BackgroundColor3 = Color3.fromRGB(0, 255, 39)
name.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
name.TextStrokeColor3 = Color3.new(1, 1, 1)
name.TextColor3 = Color3.fromRGB(160, 160, 160)
name.Size = UDim2.new(1, 0, 0.59375, 0)
name.BorderColor3 = Color3.new(0, 0, 0)
name.Name = "Name"
name.BackgroundTransparency = 1
name.Position = UDim2.new(0, 0, 0.21875, 0)
name.Parent = dropDownButton

-- DrRay.Button
local button3 = Instance.new("TextButton")
button3.BorderSizePixel = 0
button3.AutoButtonColor = false
button3.BackgroundColor3 = Color3.fromRGB(40, 45, 62)
button3.Selectable = false
button3.Visible = false
button3.Size = UDim2.new(0.9614325165748596, 0, 0.15495234727859497, 0)
button3.Name = "Button"
button3.BorderColor3 = Color3.new(0, 0, 0)
button3.Text = ""
button3.Position = UDim2.new(0.019283747300505638, 0, 0.6786856055259705, 0)
button3.BackgroundTransparency = 0.4000000059604645
button3.Parent = screenGui

-- DrRay.Button.UICorner
local uiCorner23 = Instance.new("UICorner")
uiCorner23.CornerRadius = UDim.new(0.03999999910593033, 0)
uiCorner23.Parent = button3

-- DrRay.Button.UIGradient
local uiGradient26 = Instance.new("UIGradient")
uiGradient26.Rotation = 90
uiGradient26.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(109, 109, 109)), ColorSequenceKeypoint.new(0.765, Color3.fromRGB(181, 181, 181)), ColorSequenceKeypoint.new(1, Color3.fromRGB(217, 217, 217))}
uiGradient26.Parent = button3

-- DrRay.Button.Title
local title10 = Instance.new("TextLabel")
title10.TextWrapped = true
title10.BorderSizePixel = 0
title10.RichText = true
title10.TextScaled = true
title10.BackgroundColor3 = Color3.new(1, 1, 1)
title10.TextXAlignment = Enum.TextXAlignment.Left
title10.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
title10.TextSize = 14
title10.TextColor3 = Color3.new(1, 1, 1)
title10.Size = UDim2.new(0.9656160473823547, 0, 0.323449969291687, 0)
title10.BorderColor3 = Color3.new(0, 0, 0)
title10.Text = "Button"
title10.Name = "Title"
title10.BackgroundTransparency = 1
title10.Position = UDim2.new(0.015759311616420746, 0, 0.18482854962348938, 0)
title10.Parent = button3

-- DrRay.Button.Description
local description7 = Instance.new("TextLabel")
description7.TextWrapped = true
description7.BorderSizePixel = 0
description7.TextScaled = true
description7.BackgroundColor3 = Color3.new(1, 1, 1)
description7.TextXAlignment = Enum.TextXAlignment.Left
description7.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Regular, Enum.FontStyle.Italic)
description7.TextSize = 14
description7.TextColor3 = Color3.new(1, 1, 1)
description7.Size = UDim2.new(0.9656160473823547, 0, 0.26184046268463135, 0)
description7.BorderColor3 = Color3.new(0, 0, 0)
description7.Name = "Description"
description7.BackgroundTransparency = 1
description7.Position = UDim2.new(0.011461318470537663, 0, 0.5852904319763184, 0)
description7.Parent = button3

local UILIB = {}
UILIB.__index = UILIB

function UILIB:Load(name: string, onDestroyFunc, img: string)
    local closed = false
    local self = setmetatable({}, UILIB)
    local tw = twServ:Create(mainBar, TweenInfo.new(0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Position = UDim2.new(0.23, 0, 0.212, 0)})
	tw:Play()
	tw.Completed:Wait()
	task.wait(0.3)
	twServ:Create(topBar1, TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(0.23, 0, 0.012, 0)}):Play()
	textLabel1.Text = name
	if img then logo.Image = img else logo:Destroy() end

    topBarClose1.MouseButton1Click:Connect(function()
        if not closed then
			closed = true
			local tw = twServ:Create(mainBar, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.23, 0, -0.612, 0)})
			tw:Play()
			tw.Completed:Wait()
			twServ:Create(topBar1, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Position = UDim2.new(0.23, 0, -0.173, 0)}):Play()
			task.wait(0.1)
			twServ:Create(imageLabel1, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Rotation = 180}):Play()
			twServ:Create(topBarClose1, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(0.916, 0, 0.95, 0)}):Play()
        else
            closed = false
            local tw = twServ:Create(mainBar, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.23, 0, 0.212, 0)})
            tw:Play()
            tw.Completed:Wait()
            twServ:Create(topBar1, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Position = UDim2.new(0.23, 0, 0.012, 0)}):Play()
            task.wait(0.1)
            twServ:Create(imageLabel1, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Rotation = 0}):Play()
            twServ:Create(topBarClose1, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(0.916, 0, 0.52, 0)}):Play()
        end
    end)
    title1.MouseButton1Click:Once(function()
        screenGui:Destroy()
        onDestroyFunc()
    end)
    --[[function self:Open()
        local tw = twServ:Create(mainBar, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.23, 0, 0.212, 0)})
        tw:Play()
        tw.Completed:Wait()
        twServ:Create(topBar1, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Position = UDim2.new(0.23, 0, 0.012, 0)}):Play()
        task.wait(0.1)
        twServ:Create(imageLabel1, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Rotation = 0}):Play()
        twServ:Create(topBarClose1, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(0.916, 0, 0.52, 0)}):Play()
    end
    function self:Close()
        local tw = twServ:Create(mainBar, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.23, 0, -0.612, 0)})
        tw:Play()
        tw.Completed:Wait()
        twServ:Create(topBar1, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Position = UDim2.new(0.23, 0, -0.173, 0)}):Play()
        task.wait(0.1)
        twServ:Create(imageLabel1, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Rotation = 180}):Play()
        twServ:Create(topBarClose1, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(0.916, 0, 0.95, 0)}):Play()
    end
    function self:HideCloseButton()
        topBarClose1.Visible = false
    end
    function self:Hide()
        screenGui.Enabled = false
    end
    function self:Show()
        screenGui.Enabled = true
    end
    function self:Toggle()
        if not closed then
            closed = true
            local tw = twServ:Create(mainBar, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.23, 0, -0.612, 0)})
            local tw2 = twServ:Create(topBar1, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Position = UDim2.new(0.23, 0, -0.173, 0)})
            tw:Play()
            tw.Completed:Wait()
            tw2:Play()
            tw2.Completed:Wait()
            twServ:Create(imageLabel1, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Rotation = 180}):Play()
            twServ:Create(topBarClose1, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(0.916, 0, 0.95, 0)}):Play()
        else
            closed = false
            local tw = twServ:Create(mainBar, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.23, 0, 0.212, 0)})
            local tw2 = twServ:Create(topBar1, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Position = UDim2.new(0.23, 0, 0.012, 0)})
            tw:Play()
            tw.Completed:Wait()
            tw2:Play()
            tw2.Completed:Wait()
            twServ:Create(imageLabel1, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Rotation = 0}):Play()
            twServ:Create(topBarClose1, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(0.916, 0, 0.52, 0)}):Play()
        end
    end]]
    function self:SetTheme(color, color2)
        for _, v in parent:GetChildren() do
            if v:IsA("GuiObject") then
                if v.BackgroundColor3 == globalColor then
                    v.BackgroundColor3 = color
                    globalColor1 = color
                elseif v.BackgroundColor3 == globalColor2 then
                    v.BackgroundColor3 = color2
                    globalColor2 = color2
                end
            end
        end
    end
    return self
end
function UILIB.newTab(name: string, img: string)
    local self = setmetatable({}, UILIB)
    local newTab = tabReserved:Clone()
    newTab.Name = name
    newTab.Parent = mainBar

    local newTabBtn = tabButtonReserved:Clone()
    newTabBtn.Name = name
    newTabBtn.Frame.TextLabel.Text = name
    newTabBtn.ImageLabel.Image = img or ""
    newTabBtn.MouseButton1Click:Connect(function()
        for _, v in scrollingFrame1:GetChildren() do
            if v:IsA("ImageButton") then
                mainBar:FindFirstChild(v.Name).Visible = (v.Name == name)
                twServ:Create(v, TweenInfo.new(0.2), {Transparency = if v.Name == name then 0 else 0.75}):Play()
            end
        end
    end)
    newTabBtn.Parent = scrollingFrame1
    function self.newButton(name: string, desc: string, func)
        local newbtn = button2:Clone()
        newbtn.Title.Text = name
        newbtn.Description.Text = desc
        newbtn.Name = name
        newbtn.MouseEnter:Connect(function() twServ:Create(newbtn, TweenInfo.new(0.2), {Transparency = 0}):Play() end)
        newbtn.MouseLeave:Connect(function() twServ:Create(newbtn, TweenInfo.new(0.2), {Transparency = 0.4}):Play() end)
        newbtn.MouseButton1Click:Connect(func)
        newbtn.Parent = newTab
    end
    function self.newLabel(text: string)
        local newLabel = label1:Clone()
        newLabel.Title.Text = text
        newLabel.Parent = newTab
        return newLabel.Title
    end
    function self.newInput(name: string, desc: string, func)
        local newInput = textBox:Clone()
        local textbox = newInput.TextboxBar.ActualTextbox
        newInput.MouseEnter:Connect(function() twServ:Create(newInput, TweenInfo.new(0.2), {Transparency = 0}):Play() end)
        newInput.MouseLeave:Connect(function() twServ:Create(newInput, TweenInfo.new(0.2), {Transparency = 0.4}):Play() end)
        newInput.Title.Text = name
        newInput.Description.Text = desc
        newInput.Name = name
        textbox.FocusLost:Connect(function() func(textbox.Text) end)
        newInput.Parent = newTab
    end
    function self.newKeybind(name: string, desc: string, func)
        local newKey = keybind:Clone()
        newKey.MouseEnter:Connect(function() twServ:Create(newKey, TweenInfo.new(0.2), {Transparency = 0}):Play() end)
        newKey.MouseLeave:Connect(function() twServ:Create(newKey, TweenInfo.new(0.2), {Transparency = 0.4}):Play() end)
        newKey.Title.Text = name
        newKey.Name = name
        newKey.Description.Text = desc
        local bindButton = newKey.Bind.Button
        local a
        bindButton.MouseButton1Click:Connect(function()
            local temp = task.spawn(function()
                bindButton.Text = "."
                task.wait(0.5)
                bindButton.Text = ".."
                task.wait(0.5)
                bindButton.Text = "..."
                task.wait(0.5)
            end)
            a = UIS.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.Keyboard or input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 or input.UserInputType == Enum.UserInputType.MouseButton3 then
                    bindButton.Text = if input.UserInputType == Enum.UserInputType.Keyboard then input.KeyCode.Name else input.UserInputType.Name
                    task.cancel(temp)
                    temp = nil
                    a:Disconnect()
                    a = nil
                    func(input)
                end
            end)
        end)
        newKey.Parent = newTab
    end
    function self.newSlider(name: string, desc: string, min: number, max: number, func)
        local newSlider = slider:Clone()
        newSlider.MouseEnter:Connect(function() twServ:Create(newSlider, TweenInfo.new(0.2), {Transparency = 0}):Play() end)
        newSlider.MouseLeave:Connect(function() twServ:Create(newSlider, TweenInfo.new(0.2), {Transparency = 0.4}):Play() end)
        newSlider.Name = name
        newSlider.Title.Text = name
        newSlider.Description.Text = desc

        local valueLabel = newSlider.ActualSlider.Title
        valueLabel.Text = tostring(min)
        local Fill = newSlider.ActualSlider.Fill
        local Parent = newSlider.ActualSlider

        local mouseDown = false
        local temp
        Parent.Trigger.MouseButton1Down:Connect(function()
            mouseDown = true
            temp = UIS.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    mouseDown = false
                    temp:Disconnect()
                    temp = nil
                end
            end)
            repeat
                task.wait()
                local Percent = math.clamp((mouse.X - Parent.AbsolutePosition.X) / Parent.AbsoluteSize.X, 0, 1)
                local perc = math.round(Percent * (max - min) + min)
                func(perc)
                valueLabel.Text = perc
                twServ:Create(Fill, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.fromScale(Percent, 1)}):Play()
            until not mouseDown
        end)
        newSlider.Parent = newTab
    end
    function self.newToggle(title: string, desc: string, func)
        local realToggle = false
        local newToggle = toggle:Clone()
        newToggle.Name = title
        newToggle.Title.Text = title
        newToggle.Description.Text = desc
        newToggle.MouseEnter:Connect(function() twServ:Create(newToggle, TweenInfo.new(0.2), {Transparency = 0}):Play() end)
        newToggle.MouseLeave:Connect(function() twServ:Create(newToggle, TweenInfo.new(0.2), {Transparency = 0.4}):Play() end)
        newToggle.Label.Label.MouseButton1Click:Connect(function()
            if realToggle then
                realToggle = false
                twServ:Create(newToggle.Label, TweenInfo.new(0.2), {BackgroundColor3 = globalColor1}):Play()
            else
                realToggle = true
                twServ:Create(newToggle.Label, TweenInfo.new(0.2), {BackgroundColor3 = globalColor2}):Play()
            end
            func(realToggle)
        end)
        newToggle.Parent = newTab
    end
    function self.newDropdown(name: string, desc: string, listTable, useCustomFunc: boolean, func)
        local dropDownFunction = {}
        local newdd = dropDown:Clone()
        newdd.Name = name
        newdd.Title.Text = name
        newdd.Description.Text = desc
        newdd.Parent = newTab
        for _, list in listTable do
            local newddbtn = dropDownButton:Clone()
            newddbtn.Name = list
            newddbtn.Name.Text = list
            newddbtn.MouseButton1Click:Connect(function()
                newdd.DropdownBar.Open.Text = list
                local twPos = twServ:Create(newdd.Box, TweenInfo.new(0.15), {Size = UDim2.new(0.97, 0, 0, 0)})
                twPos:Play()
                twPos.Completed:Wait()
                newdd.Box.Visible = false
                if not useCustomFunc then
                    func(list)
                else
                    func(list, dropDownFunction)
                end
            end)
            newddbtn.Parent = newdd.Box.ScrollingFrame
        end

        newdd.DropdownBar.Trigger.MouseButton1Click:Connect(function()
            if not newdd.Box.Visible then
                newdd.Box.Visible = true
                twServ:Create(newdd.Box, TweenInfo.new(0.15), {Size = UDim2.new(0.97, 0, 1.696, 0)}):Play()
            else
                local twPos = twServ:Create(newdd.Box, TweenInfo.new(0.15), {Size = UDim2.new(0.97, 0, 0, 0)})
                twPos:Play()
                twPos.Completed:Wait()
                newdd.Box.Visible = false
            end
        end)
        function dropDownFunction.refresh(newList)
            for _, v in newdd.Box.ScrollingFrame:GetChildren() do
                if v.Name ~= "UIListLayout" then
                    v:Destroy()
                end
            end
            for _, list in newList do
                local newddbtn = dropDownButton:Clone()
                newddbtn.Name = list
                newddbtn.Name.Text = list
                newddbtn.MouseButton1Click:Connect(function()
                    newdd.DropdownBar.Open.Text = list
                    local twPos = twServ:Create(newdd.Box, TweenInfo.new(0.15), {Size = UDim2.new(0.97, 0, 0, 0)})
                    twPos:Play()
                    twPos.Completed:Wait()
                    newdd.Box.Visible = false
                    if not useCustomFunc then
                        func(list)
                    else
                        func(list, dropDownFunction)
                    end
                end)
                newddbtn.Parent = newdd.Box.ScrollingFrame
            end
        end
        return dropDownFunction
    end
    return self
end
return UILIB