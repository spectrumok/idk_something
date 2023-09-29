local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local lib = {
	GUI = nil,
	CurrentTab = nil,
	CurrentSection = nil,
	Tab_Elements = {}
}

function RippleEffect(object)
	task.spawn(function()
		local Ripple = Instance.new("ImageLabel")

		Ripple.Name = "Ripple"
		Ripple.Parent = object
		Ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Ripple.BackgroundTransparency = 1.000
		Ripple.ZIndex = 8
		Ripple.Image = "rbxassetid://2708891598"
		Ripple.ImageTransparency = 0.800
		Ripple.ScaleType = Enum.ScaleType.Fit

		Ripple.Position = UDim2.new((Mouse.X - Ripple.AbsolutePosition.X) / object.AbsoluteSize.X, 0, (Mouse.Y - Ripple.AbsolutePosition.Y) / object.AbsoluteSize.Y, 0)
		TweenService:Create(Ripple, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Position = UDim2.new(-5.5, 0, -5.5, 0), Size = UDim2.new(12, 0, 12, 0)}):Play()
		task.wait(0.5)
		TweenService:Create(Ripple, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()
		task.wait(1)
		Ripple:Destroy()
	end)
end

function AddDarkStrokes(object, transparency, color, thickness)
	color = color or Color3.fromRGB(30, 30, 30)
	transparency = transparency or 0
	thickness = thickness or 1.8

	local Button_Stroke = Instance.new("UIStroke")

	Button_Stroke.Parent = object
	Button_Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	Button_Stroke.Color = color
	Button_Stroke.LineJoinMode = Enum.LineJoinMode.Round
	Button_Stroke.Thickness = thickness
	Button_Stroke.Transparency = transparency

	return Button_Stroke
end

function findValueIndex(tbl, index)
	for i, v in next, tbl do
		if v["Index"] == index then
			return v
		end 
	end
end

function AddTextStrokes(object)
	local Text_Stroke = Instance.new("UIStroke")

	Text_Stroke.Name = "UIStroke"
	Text_Stroke.Parent = object
	Text_Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
	Text_Stroke.Color = Color3.fromRGB(144, 144, 144)
	Text_Stroke.LineJoinMode = Enum.LineJoinMode.Round
	Text_Stroke.Thickness = 0.2
	Text_Stroke.Transparency = 0

	return Text_Stroke
end

function AddUICorner(object, size)
	size = size or UDim.new(0, 4)

	local UICorner = Instance.new("UICorner")

	UICorner.CornerRadius = size
	UICorner.Parent = object

	return UICorner
end

function lib:CreateWindow(KeyCode)
	KeyCode = KeyCode or Enum.KeyCode.Tab
	if not game:GetService("RunService"):IsStudio() and game:GetService("CoreGui"):FindFirstChild("CodeflowSata") then
		game:GetService("CoreGui").CodeflowSata:Destroy();
	end
	local Window_Library = {}

	local CodeflowSata = Instance.new("ScreenGui")
	local Motherboard = Instance.new("Frame")
	local MainFrame = Instance.new("Frame")
	local Sections = Instance.new("Frame")
	local Tabs = Instance.new("ScrollingFrame")
	local ScrollingFrame = Instance.new("ScrollingFrame")
	local UIListLayout = Instance.new("UIListLayout")
	local UIPadding = Instance.new("UIPadding")
	local UIListLayout_1 = Instance.new("UIListLayout")
	local UIPadding_1 = Instance.new("UIPadding")
	local Container = Instance.new("Frame")
	local Codeflow_Logo = Instance.new("ImageLabel")
	local Codeflow_Text = Instance.new("TextLabel")
	local Lines = Instance.new("Frame")
	local LineTabs = Instance.new("Frame")
	local LineSectors = Instance.new("Frame")
	local Invite = Instance.new("TextLabel")

	CodeflowSata.Name = "CodeflowSata"
	CodeflowSata.Parent = game:GetService("RunService"):IsStudio() and game:GetService("Players").LocalPlayer.PlayerGui or game:GetService("CoreGui")
	lib["GUI"] = CodeflowSata

	Motherboard.Name = "Motherboard"
	Motherboard.Parent = CodeflowSata
	Motherboard.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
	Motherboard.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Motherboard.BorderSizePixel = 0
	Motherboard.AnchorPoint = Vector2.new(0.5, 0.5)
	Motherboard.Position = UDim2.new(0.5, 0, 0.5, 0)
	Motherboard.Size = UDim2.new(0, 683, 0, 576)
	Motherboard.Draggable = true
	Motherboard.Active = true
	Motherboard.Selectable = true

	UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if input.KeyCode == KeyCode then
			Motherboard.Visible = not Motherboard.Visible
		end
	end)

	MainFrame.Name = "MainFrame"
	MainFrame.Parent = Motherboard
	MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MainFrame.BackgroundTransparency = 1.000
	MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MainFrame.BorderSizePixel = 0
	MainFrame.Position = UDim2.new(0.250366032, 0, 0.138888896, 0)
	MainFrame.Size = UDim2.new(0, 512, 0, 496)

	Sections.Name = "Sections"
	Sections.Parent = Motherboard
	Sections.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Sections.BackgroundTransparency = 1.000
	Sections.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Sections.BorderSizePixel = 0
	Sections.Position = UDim2.new(0.250366032, 0, 0, 0)
	Sections.Size = UDim2.new(0, 512, 0, 80)

	ScrollingFrame.Parent = Sections
	ScrollingFrame.Active = true
	ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ScrollingFrame.BackgroundTransparency = 1.000
	ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ScrollingFrame.BorderSizePixel = 0
	ScrollingFrame.Size = UDim2.new(0, 512, 0, 69)
	ScrollingFrame.CanvasSize = UDim2.new(2, 0, 0, 0)
	ScrollingFrame.ScrollBarThickness = 0
    
    ScrollingFrame.CanvasSize = UDim2.new(0, UIListLayout_1.AbsoluteContentSize.X + 30, 0, 0)
    UIListLayout_1:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        ScrollingFrame.CanvasSize = UDim2.new(0, UIListLayout_1.AbsoluteContentSize.X + 30, 0, 0)
    end)

    Tabs.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
    UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        Tabs.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
    end)

	Tabs.Name = "Tabs"
	Tabs.Parent = Motherboard
	Tabs.Active = true
	Tabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Tabs.BackgroundTransparency = 1.000
	Tabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Tabs.BorderSizePixel = 0
	Tabs.Size = UDim2.new(0, 173, 0, 543)
	Tabs.ScrollBarThickness = 0

	UIListLayout.Parent = Tabs
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 10)

	UIPadding.Parent = Tabs
	UIPadding.PaddingLeft = UDim.new(0, 7)
	UIPadding.PaddingTop = UDim.new(0, 10)

	UIListLayout_1.Parent = ScrollingFrame
	UIListLayout_1.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout_1.Padding = UDim.new(0, 15)

	UIPadding_1.Parent = ScrollingFrame
	UIPadding_1.PaddingTop = UDim.new(0, 20)
	UIPadding_1.PaddingLeft = UDim.new(0, 15)


	Container.Name = "Container"
	Container.Parent = Tabs
	Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Container.BackgroundTransparency = 1.000
	Container.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Container.BorderSizePixel = 0
	Container.Size = UDim2.new(0, 161, 0, 54)

	Codeflow_Logo.Name = "Codeflow_Logo"
	Codeflow_Logo.Parent = Container
	Codeflow_Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Codeflow_Logo.BackgroundTransparency = 1.000
	Codeflow_Logo.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Codeflow_Logo.BorderSizePixel = 0
	Codeflow_Logo.Position = UDim2.new(-0.000457195012, 0, -0.0167484991, 0)
	Codeflow_Logo.Size = UDim2.new(0, 50, 0, 50)
	Codeflow_Logo.Image = "http://www.roblox.com/asset/?id=14765374355"

	Codeflow_Text.Name = "Codeflow_Text"
	Codeflow_Text.Parent = Container
	Codeflow_Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Codeflow_Text.BackgroundTransparency = 1.000
	Codeflow_Text.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Codeflow_Text.BorderSizePixel = 0
	Codeflow_Text.Position = UDim2.new(0.353580058, 0, -0.0179398153, 0)
	Codeflow_Text.Size = UDim2.new(0, 99, 0, 50)
	Codeflow_Text.Font = Enum.Font.GothamBlack
	Codeflow_Text.Text = "CODEFLOW"
	Codeflow_Text.TextColor3 = Color3.fromRGB(255, 226, 110)
	Codeflow_Text.TextSize = 16.000
	Codeflow_Text.TextXAlignment = Enum.TextXAlignment.Left

	AddUICorner(Motherboard)

	Lines.Name = "Lines"
	Lines.Parent = Motherboard
	Lines.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Lines.BackgroundTransparency = 1.000
	Lines.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Lines.BorderSizePixel = 0
	Lines.Size = UDim2.new(0, 683, 0, 576)

	LineTabs.Name = "LineTabs"
	LineTabs.Parent = Lines
	LineTabs.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	LineTabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LineTabs.BorderSizePixel = 0
	LineTabs.Position = UDim2.new(0.250366032, 0, 0, 0)
	LineTabs.Size = UDim2.new(0, 1, 0, 576)

	LineSectors.Name = "LineSectors"
	LineSectors.Parent = Lines
	LineSectors.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	LineSectors.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LineSectors.BorderSizePixel = 0
	LineSectors.Position = UDim2.new(1, 0, 0.142041415, 0)
	LineSectors.Size = UDim2.new(0, -512, 0, -1)

	Invite.Name = "Invite"
	Invite.Parent = Motherboard
	Invite.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Invite.BackgroundTransparency = 1.000
	Invite.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Invite.BorderSizePixel = 0
	Invite.Position = UDim2.new(0, 0, 0.954861104, 0)
	Invite.Size = UDim2.new(0, 171, 0, 26)
	Invite.Font = Enum.Font.Gotham
	Invite.Text = "discord.gg/ECCKSzXtcE"
	Invite.TextColor3 = Color3.fromRGB(234, 234, 234)
	Invite.TextSize = 12.000

	function Window_Library:CreateTab(tab_name, asset_id)        
		tab_name = tab_name or "Unnamed"
		asset_id = asset_id  or "rbxassetid://3926305904"

		if not lib.CurrentTab then
			lib.CurrentTab = tab_name
		end

		local TextButton = Instance.new("TextButton")
		local TextLabel = Instance.new("TextLabel")
		local grade = Instance.new("ImageButton")
		local Text_Stroke = Instance.new("UIStroke")

		TextButton.Parent = Tabs

		local Button_Stroke = AddDarkStrokes(TextButton, 1, Color3.fromRGB(74, 74, 74))

		lib["Tab_Elements"][tab_name] = { Tab_Button = TextButton }

		TextButton.Parent = Tabs
		TextButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
		TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextButton.BorderSizePixel = 0
		TextButton.Size = UDim2.new(0, 149, 0, 34)
		TextButton.Font = Enum.Font.Gotham
		TextButton.Text = ""
		TextButton.TextColor3 = Color3.fromRGB(234, 234, 234)
		TextButton.TextSize = 17.000
		TextButton.TextStrokeColor3 = Color3.fromRGB(150, 150, 150)
		TextButton.TextStrokeTransparency = 0.000
		TextButton.AutoButtonColor = false
		TextButton.ClipsDescendants = true

		TextButton.MouseButton1Down:Connect(function()
			RippleEffect(TextButton)
			lib.CurrentTab = tab_name

			for _,v in next, ScrollingFrame:GetChildren() do
				if string.find(v.Name, "Lines") and v.Name ~= "Lines_" .. tab_name then
					v.Visible = false
				elseif string.find(v.Name, "Lines") and v.Name == "Lines_" .. tab_name then
					v.Visible = true
				end
			end

			for _,v in next, lib["Tab_Elements"] do
				local found_Label = v["Tab_Button"]:FindFirstChild("TextLabel")
				local found_Stroke = v["Tab_Button"]:FindFirstChild("UIStroke")

				found_Label.TextColor3 = Color3.fromRGB(168, 168, 168)
				found_Stroke.Transparency = 1
				v["Tab_Button"].BackgroundTransparency = 1
			end

			for Tab_Name, v in next, lib["Tab_Elements"] do
				if Tab_Name ~= lib.CurrentTab then
					for _, Section in next, v["Sections"] do
						Section["Section"].Visible = false
					end
				else
					for _, Section in next, v["Sections"] do
						Section["Section"].Visible = true
						Section["Button"].BackgroundColor3 = Color3.fromRGB(14, 14, 14)
						Section["Button"].TextColor3 = Color3.fromRGB(255, 255, 255)
					end

					for _, Child in next, MainFrame:GetChildren() do
						Child.Visible = false
					end

					local val = findValueIndex(v["Sections"], 1)
					if val then
						val["Button"].BackgroundColor3 = Color3.fromRGB(255, 226, 110)
						val["Button"].TextColor3 = Color3.fromRGB(30, 30, 30)
						MainFrame:FindFirstChild(val["Section"].Name).Visible = true
					end
				end
			end

			TextLabel.TextColor3 = Color3.fromRGB(234, 234, 234)
			TextButton.BackgroundTransparency = 0
			Button_Stroke.Transparency = 0
		end)

		if lib.CurrentTab == tab_name then
			TextLabel.TextColor3 = Color3.fromRGB(234, 234, 234)
			TextButton.BackgroundTransparency = 0
			Button_Stroke.Transparency = 0
		else
			TextLabel.TextColor3 = Color3.fromRGB(168, 168, 168)
			TextButton.BackgroundTransparency = 1
			Button_Stroke.Transparency = 1
		end


		TextLabel.Parent = TextButton
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel.BorderSizePixel = 0
		TextLabel.Position = UDim2.new(0.234899327, 0, 0, 0)
		TextLabel.Size = UDim2.new(0, 113, 0, 34)
		TextLabel.Font = Enum.Font.Gotham
		TextLabel.Text = tab_name
		TextLabel.TextSize = 14.000
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left

		AddUICorner(TextButton)
		AddTextStrokes(TextLabel)

		grade.Name = "grade"
		grade.Parent = TextButton
		grade.BackgroundTransparency = 1.000
		grade.LayoutOrder = 2
		grade.Position = UDim2.new(0.0436241627, 0, 0.235294119, 0)
		grade.Size = UDim2.new(0, 18, 0, 18)
		grade.ZIndex = 2
		grade.Image = asset_id
		grade.ImageRectOffset = Vector2.new(124, 44)
		grade.ImageRectSize = Vector2.new(36, 36)

		local TabElements = {}

		function TabElements:CreateSector(section_name)
			section_name = section_name or "Unnamed Section"

			if not lib["Tab_Elements"][tab_name]["Sections"] then
				lib["Tab_Elements"][tab_name]["Sections"] = {}
			end

			if not lib["Tab_Elements"][tab_name]["Section_Count"] then
				lib["Tab_Elements"][tab_name]["Section_Count"] = 1
			end

			if lib["Tab_Elements"][tab_name]["Section_Count"] >= 2 then
				local Frame = Instance.new("Frame")
				Frame.Name = "Lines_" .. tab_name
				Frame.Parent = ScrollingFrame
				Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
				Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Frame.BorderSizePixel = 0
				Frame.Position = UDim2.new(0.565153718, 0, 0.0329861119, 0)
				Frame.Size = UDim2.new(0, 1, 0, 50)
			end

			for _,v in next, ScrollingFrame:GetChildren() do
				if string.find(v.Name, "Lines") and v.Name ~= "Lines_" .. lib.CurrentTab then
					v.Visible = false
				end
			end

			if not lib.CurrentSection then
				lib.CurrentSection = section_name
			end

			local Section = Instance.new("Frame")
			local Button = Instance.new("TextButton")
			local Features = Instance.new("ScrollingFrame")
			local UIListLayout = Instance.new("UIListLayout")
			local UIPadding = Instance.new("UIPadding")

			-- code mark, for ctrl + f to find here fast
			lib["Tab_Elements"][tab_name]["Sections"][section_name] = {
				Section = Section,
				Button = Button,
				Index = lib["Tab_Elements"][tab_name]["Section_Count"]
			}
			lib["Tab_Elements"][tab_name]["Section_Count"] += 1

			if lib.CurrentTab ~= tab_name then
				Section.Visible = false
				Features.Visible = false
			end

			if lib.CurrentSection ~= section_name then
				Features.Visible = false
			end

			Button.AutoButtonColor = false

			if lib.CurrentSection ~= section_name then
				Button.Name = "Button_" .. section_name
				Button.Parent = Section
				Button.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
				Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Button.BorderSizePixel = 0
				Button.Position = UDim2.new(0.126348168, 0, 0.163265228, 0)
				Button.Text = section_name
				Button.Font = Enum.Font.Gotham
				Button.TextColor3 = Color3.fromRGB(255, 255, 255)
				Button.TextSize = 13.000

				Button.Size = UDim2.new(0, Button.TextBounds.X + 135, 0, 34)

				AddDarkStrokes(Button)
			else
				Button.Name = "Button_" .. section_name
				Button.Parent = Section
				Button.BackgroundColor3 = Color3.fromRGB(255, 226, 110)
				Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Button.BorderSizePixel = 0
				Button.Position = UDim2.new(0.126348168, 0, 0.163265228, 0)
				Button.Font = Enum.Font.Gotham
				Button.Text = section_name
				Button.TextColor3 = Color3.fromRGB(30, 30, 30)
				Button.TextSize = 13.000

				Button.Size = UDim2.new(0, Button.TextBounds.X + 135, 0, 34)

				AddDarkStrokes(Button, 1)
			end

            Section.Name = section_name
			Section.Parent = ScrollingFrame
			Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Section.BackgroundTransparency = 1.000
			Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Section.BorderSizePixel = 0
			Section.Position = UDim2.new(0.1953125, 0, 0.275000006, 0)
			Section.Size = UDim2.new(0, Button.AbsoluteSize.X + 30, 0, 52)

			AddUICorner(Button, UDim.new(1, 0))

			Features.Name = section_name
			Features.Parent = MainFrame
			Features.Active = true
			Features.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Features.BackgroundTransparency = 1.000
			Features.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Features.BorderSizePixel = 0
			Features.Position = UDim2.new(0, 0, 0.0100806449, 0)
			Features.Size = UDim2.new(0, 507, 0, 491)
			Features.ScrollBarThickness = 4
			Features.ScrollBarImageColor3 = Color3.fromRGB(50, 50, 50)

			UIListLayout.Parent = Features
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 8)

			UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
				Features.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)
			end)

			UIPadding.Parent = Features
			UIPadding.PaddingLeft = UDim.new(0, 12)
			UIPadding.PaddingTop = UDim.new(0, 4)

			Button.MouseButton1Down:Connect(function()
				lib.CurrentSection = section_name

				for _,v in next, MainFrame:GetChildren() do
					if v.Name ~= lib.CurrentSection then
						v.Visible = false
					else
						v.Visible = true
					end
				end

				for SectionName, v in next, lib["Tab_Elements"][tab_name]["Sections"] do
					if SectionName ~= lib.CurrentSection then
						v["Button"].BackgroundColor3 = Color3.fromRGB(14, 14, 14)
						v["Button"].TextColor3 = Color3.fromRGB(255, 255, 255)
						v["Button"]:FindFirstChild("UIStroke").Transparency = 0
					else
						v["Button"].BackgroundColor3 = Color3.fromRGB(255, 226, 110)
						v["Button"].TextColor3 = Color3.fromRGB(30, 30, 30)
					end
				end
			end)

			local SectionElements = {}

			function SectionElements:AddLabel(text)
				text = text or "Undefined Label"

				local Label = Instance.new("TextLabel")

				Label.Name = "Label"
				Label.Parent = Features
				Label.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
				Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Label.BorderSizePixel = 0
				Label.Position = UDim2.new(0, 0, 0.975308657, 0)
				Label.Size = UDim2.new(0, 485, 0, 50)
				Label.Font = Enum.Font.Gotham
				Label.Text = text
				Label.TextColor3 = Color3.fromRGB(234, 234, 234)
				Label.TextSize = 14.000

				AddUICorner(Label)
				AddTextStrokes(Label)
				AddDarkStrokes(Label)

				local Label_Options = {}

				function Label_Options:SetText(new_text)
					Label.Text = new_text
				end

				function Label_Options:GetText()
					return Label.Text
				end

				return Label_Options
			end

			function SectionElements:AddButton(text, callback)
				text = text or "Unnamed Button"
				callback = callback or function() print"test" end

				local Button = Instance.new("TextButton")
				local TextLabel = Instance.new("TextLabel")

				Button.Name = "Button"
				Button.Parent = Features
				Button.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
				Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Button.BorderSizePixel = 0
				Button.Position = UDim2.new(0, 0, 0.855967104, 0)
				Button.Size = UDim2.new(0, 485, 0, 50)
				Button.Font = Enum.Font.SourceSans
				Button.Text = ""
				Button.TextColor3 = Color3.fromRGB(0, 0, 0)
				Button.TextSize = 14.000
				Button.AutoButtonColor = false
				Button.ClipsDescendants = true

				TextLabel.Parent = Button
				TextLabel.BackgroundColor3 = Color3.fromRGB(255, 226, 110)
				TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextLabel.BorderSizePixel = 0
				TextLabel.Position = UDim2.new(0.016494846, 0, 0.159999996, 0)
				TextLabel.Size = UDim2.new(0, 468, 0, 34)
				TextLabel.Font = Enum.Font.Gotham
				TextLabel.Text = text
				TextLabel.TextColor3 = Color3.fromRGB(30, 30, 30)
				TextLabel.TextSize = 14.000

				AddUICorner(TextLabel)
				AddUICorner(Button)

				Button.MouseButton1Down:Connect(function()
					RippleEffect(Button)
					callback()
				end)

				AddDarkStrokes(Button, 0, Color3.fromRGB(255, 226, 110))
			end

			function SectionElements:AddTextbox(textbox_name, placeholder, callback)                
				local Textbox_Options = {}

				textbox_name = textbox_name or "Unnamed Textbox"
				placeholder = placeholder or "Placeholder"
				callback = callback or function(value) print(value) end

				local Textbox = Instance.new("TextLabel")
				local TextLabel = Instance.new("TextLabel")
				local Frame = Instance.new("Frame")
				local TextBox = Instance.new("TextBox")

				Textbox.Name = "Textbox"
				Textbox.Parent = Features
				Textbox.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
				Textbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Textbox.BorderSizePixel = 0
				Textbox.Position = UDim2.new(0, 0, 0.358024687, 0)
				Textbox.Size = UDim2.new(0, 485, 0, 78)
				Textbox.Font = Enum.Font.SourceSans
				Textbox.Text = ""
				Textbox.TextColor3 = Color3.fromRGB(0, 0, 0)
				Textbox.TextSize = 14.000

				TextLabel.Parent = Textbox
				TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.BackgroundTransparency = 1.000
				TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextLabel.BorderSizePixel = 0
				TextLabel.Position = UDim2.new(0.018556701, 0, 0, 0)
				TextLabel.Size = UDim2.new(0, 261, 0, 41)
				TextLabel.Font = Enum.Font.Gotham
				TextLabel.Text = textbox_name
				TextLabel.TextColor3 = Color3.fromRGB(234, 234, 234)
				TextLabel.TextSize = 14.000
				TextLabel.TextXAlignment = Enum.TextXAlignment.Left

				Frame.Parent = Textbox
				Frame.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
				Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Frame.BorderSizePixel = 0
				Frame.Position = UDim2.new(0.0189999994, 0, 0.526000023, 0)
				Frame.Size = UDim2.new(0, 467, 0, 31)

				TextBox.Parent = Frame
				TextBox.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
				TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextBox.BorderSizePixel = 0
				TextBox.Position = UDim2.new(0.0399699248, 0, -1.96887595e-06, 0)
				TextBox.Size = UDim2.new(0, 434, 0, 30)
				TextBox.Font = Enum.Font.Gotham
				TextBox.PlaceholderText = placeholder
				TextBox.Text = ""
				TextBox.TextColor3 = Color3.fromRGB(234, 234, 234)
				TextBox.TextSize = 14.000
				TextBox.TextTruncate = Enum.TextTruncate.AtEnd

				TextBox.FocusLost:Connect(function(enterPressed)
					if enterPressed then
						callback(TextBox.Text)
					end
				end)

				AddUICorner(Textbox)
				AddUICorner(Frame)
				AddUICorner(TextBox)

				AddDarkStrokes(TextBox)
				AddDarkStrokes(Textbox)

				function Textbox_Options:GetText()
					return TextBox.Text
				end

				return Textbox_Options
			end

			function SectionElements:AddToggle(toggle_name, state, callback)
				local Toggle_Options = {}

				toggle_name = toggle_name or "Unnamed Toggle"
				state = state or false
				callback = callback or function(value) print(value) end

				local Toggle = Instance.new("TextButton")
				local TextLabel = Instance.new("TextLabel")
				local Frame = Instance.new("Frame")
				local Dot = Instance.new("Frame")

				AddDarkStrokes(Toggle)
				local Frame_Stroke = AddDarkStrokes(Frame, 0, Color3.fromRGB(30, 30, 30), 1.8)
				AddTextStrokes(TextLabel)

				AddUICorner(Toggle)
				AddUICorner(Frame, UDim.new(1, 0))
				AddUICorner(Dot, UDim.new(1, 0))

				Toggle.Name = "Toggle"
				Toggle.Parent = Features
				Toggle.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
				Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Toggle.BorderSizePixel = 0
				Toggle.Position = UDim2.new(0, 0, 0.119341567, 0)
				Toggle.Size = UDim2.new(0, 485, 0, 50)
				Toggle.Font = Enum.Font.SourceSans
				Toggle.Text = ""
				Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
				Toggle.TextSize = 14.000
				Toggle.AutoButtonColor = false

				TextLabel.Parent = Toggle
				TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.BackgroundTransparency = 1.000
				TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextLabel.BorderSizePixel = 0
				TextLabel.Position = UDim2.new(0.018556701, 0, 0, 0)
				TextLabel.Size = UDim2.new(0, 261, 0, 50)
				TextLabel.Font = Enum.Font.Gotham
				TextLabel.Text = toggle_name
				TextLabel.TextColor3 = Color3.fromRGB(234, 234, 234)
				TextLabel.TextSize = 14.000
				TextLabel.TextXAlignment = Enum.TextXAlignment.Left

				Frame.Parent = Toggle
				Frame.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
				Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Frame.BorderSizePixel = 0
				Frame.Position = UDim2.new(0.865979373, 0, 0.239999995, 0)
				Frame.Size = UDim2.new(0, 50, 0, 26)

				Dot.Name = "Dot"
				Dot.Parent = Frame
				Dot.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				Dot.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Dot.BorderSizePixel = 0
				Dot.Position = UDim2.new(0, 3, 0.115000002, 0)
				Dot.Size = UDim2.new(0, 20, 0, 20)

				Toggle.MouseButton1Down:Connect(function()
					state = not state

					if state then
						TweenService:Create(Frame_Stroke, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Color = Color3.fromRGB(255, 226, 110)}):Play()
						TweenService:Create(Dot, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(255, 226, 110)}):Play()
						TweenService:Create(Dot, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Position = UDim2.new(0.516, 0, 0.115, 0)}):Play()
					else
						TweenService:Create(Frame_Stroke, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Color = Color3.fromRGB(30, 30, 30)}):Play()
						TweenService:Create(Dot, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
						TweenService:Create(Dot, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Position = UDim2.new(0.1, 0, 0.115, 0)}):Play()
					end
					callback(state)
				end)

				return Toggle_Options
			end

			function SectionElements:AddKeybind(keybind_name, keybind, callback)
				local Keybind_Options = {}

				keybind_name = keybind_name or "Unnamed Keybind"
				keybind = keybind or { Name = ". . ." }
				callback = callback or function(value) print(value) end

				local Keybind = Instance.new("TextButton")
				local TextLabel = Instance.new("TextLabel")
				local TextLabel_2 = Instance.new("TextLabel")
				local UIPadding = Instance.new("UIPadding")

				Keybind.Name = "Keybind"
				Keybind.Parent = Features
				Keybind.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
				Keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Keybind.BorderSizePixel = 0
				Keybind.Position = UDim2.new(-0.0222222228, 0, -0.100616015, 0)
				Keybind.Size = UDim2.new(0, 485, 0, 50)
				Keybind.Font = Enum.Font.SourceSans
				Keybind.Text = ""
				Keybind.TextColor3 = Color3.fromRGB(0, 0, 0)
				Keybind.TextSize = 14.000
				Keybind.AutoButtonColor = false

				TextLabel.Parent = Keybind
				TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.BackgroundTransparency = 1.000
				TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextLabel.BorderSizePixel = 0
				TextLabel.Position = UDim2.new(0.018556701, 0, 0, 0)
				TextLabel.Size = UDim2.new(0, 261, 0, 50)
				TextLabel.Font = Enum.Font.Gotham
				TextLabel.Text = keybind_name
				TextLabel.TextColor3 = Color3.fromRGB(234, 234, 234)
				TextLabel.TextSize = 14.000
				TextLabel.TextXAlignment = Enum.TextXAlignment.Left

				TextLabel_2.Parent = Keybind
				TextLabel_2.AnchorPoint = Vector2.new(1, 0.5)
				TextLabel_2.AutomaticSize = Enum.AutomaticSize.X
				TextLabel_2.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
				TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextLabel_2.BorderSizePixel = 0
				TextLabel_2.Position = UDim2.new(1, -20, 0.5, 0)
				TextLabel_2.Size = UDim2.new(0, 30, 0, 30)
				TextLabel_2.Font = Enum.Font.Gotham
				TextLabel_2.Text = keybind.Name
				TextLabel_2.TextColor3 = Color3.fromRGB(234, 234, 234)
				TextLabel_2.TextSize = 14.000

				UIPadding.Parent = TextLabel_2
				UIPadding.PaddingLeft = UDim.new(0, 8)
				UIPadding.PaddingRight = UDim.new(0, 8)

				AddUICorner(Keybind)
				AddUICorner(TextLabel_2)
				AddDarkStrokes(Keybind)
				AddDarkStrokes(TextLabel_2)

				Keybind.MouseButton1Down:Connect(function()
					Keybind_Options.AwaitingChange = true
					TextLabel_2.Text = ". . ."
				end)

				UserInputService.InputBegan:Connect(function(input, gameProcessed)
					if gameProcessed then return end
					if input.UserInputType ~= Enum.UserInputType.Keyboard then return end

					if Keybind_Options.AwaitingChange then
						keybind = input.KeyCode
						TextLabel_2.Text = keybind.Name
						Keybind_Options.AwaitingChange = false
					end

					if input.KeyCode == keybind then
						callback(keybind)
					end
				end)

				return Keybind_Options
			end

			function SectionElements:AddSlider(slider_name, min, default, max, decimals, callback)
				local Slider_Options = {}

				slider_name = slider_name or "Unnamed Slider"
				min = tostring(min) or 1
				default = tostring(default) or 50
				max = tostring(max) or 100
				decimals = decimals or 1
				callback = callback or function() return end

				local Slider = Instance.new("TextLabel")
				local TextLabel = Instance.new("TextLabel")
				local TextLabel_2 = Instance.new("TextLabel")
				local SliderIndicator = Instance.new("Frame")
				local FillLine = Instance.new("Frame")
				local Dot = Instance.new("TextButton")

				Slider.Name = "Slider"
				Slider.Parent = Features
				Slider.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
				Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Slider.BorderSizePixel = 0
				Slider.Position = UDim2.new(0, 0, 0.358024687, 0)
				Slider.Size = UDim2.new(0, 485, 0, 78)
				Slider.Font = Enum.Font.SourceSans
				Slider.Text = ""
				Slider.TextColor3 = Color3.fromRGB(0, 0, 0)
				Slider.TextSize = 14.000

				AddDarkStrokes(Slider)
				AddDarkStrokes(SliderIndicator)

				AddTextStrokes(TextLabel)
				AddTextStrokes(TextLabel_2)

				AddUICorner(Slider)
				AddUICorner(SliderIndicator)
				AddUICorner(FillLine, UDim.new(1, 0))
				AddUICorner(Dot, UDim.new(1, 0))

				TextLabel.Parent = Slider
				TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.BackgroundTransparency = 1.000
				TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextLabel.BorderSizePixel = 0
				TextLabel.Position = UDim2.new(0.018556701, 0, 0, 0)
				TextLabel.Size = UDim2.new(0, 261, 0, 50)
				TextLabel.Font = Enum.Font.Gotham
				TextLabel.Text = slider_name
				TextLabel.TextColor3 = Color3.fromRGB(234, 234, 234)
				TextLabel.TextSize = 14.000
				TextLabel.TextXAlignment = Enum.TextXAlignment.Left

				TextLabel_2.Parent = Slider
				TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_2.BackgroundTransparency = 1.000
				TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextLabel_2.BorderSizePixel = 0
				TextLabel_2.Position = UDim2.new(0.422680408, 0, 0, 0)
				TextLabel_2.Size = UDim2.new(0, 261, 0, 50)
				TextLabel_2.Font = Enum.Font.Gotham
				TextLabel_2.Text = default .. " / " .. max
				TextLabel_2.TextColor3 = Color3.fromRGB(234, 234, 234)
				TextLabel_2.TextSize = 14.000
				TextLabel_2.TextXAlignment = Enum.TextXAlignment.Right

				SliderIndicator.Name = "SliderIndicator"
				SliderIndicator.Parent = Slider
				SliderIndicator.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				SliderIndicator.BorderColor3 = Color3.fromRGB(0, 0, 0)
				SliderIndicator.BorderSizePixel = 0
				SliderIndicator.Position = UDim2.new(0.0189999994, 0, 0.75, 0)
				SliderIndicator.Size = UDim2.new(0, 461, 0, 8)
				SliderIndicator.AnchorPoint = Vector2.new(0, 0)

				FillLine.Name = "FillLine"
				FillLine.Parent = SliderIndicator
				FillLine.BackgroundColor3 = Color3.fromRGB(255, 226, 110)
				FillLine.BorderColor3 = Color3.fromRGB(0, 0, 0)
				FillLine.BorderSizePixel = 0
				FillLine.Position = UDim2.new(0, 0, 0, 0)
				FillLine.Size = UDim2.new(0, 0, 0, 0)

				Dot.Name = "Dot"
				Dot.Parent = SliderIndicator
				Dot.AnchorPoint = Vector2.new(0.5, 0.5)
				Dot.BackgroundColor3 = Color3.fromRGB(255, 226, 110)
				Dot.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Dot.BorderSizePixel = 0
				Dot.Position = UDim2.new(0, 0, 0.5, 0)
				Dot.Size = UDim2.new(0, 12, 0, 12)
				Dot.Font = Enum.Font.SourceSans
				Dot.Text = ""
				Dot.TextColor3 = Color3.fromRGB(0, 0, 0)
				Dot.TextSize = 14.000
				Dot.AutoButtonColor = false

				AddDarkStrokes(SliderIndicator)
				AddDarkStrokes(FillLine)
				AddDarkStrokes(Dot)

				local Dragging

				function Slider_Options:Set(val)
					val = math.clamp(math.round(val * decimals) / decimals, min, max)
					TweenService:Create(FillLine, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{Size = UDim2.fromScale((val - min) / (max - min), 1)}):Play()
					TweenService:Create(Dot, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{Position = UDim2.fromScale((val - min) / (max - min), 0.5)}):Play()
					TextLabel_2.Text = tostring(val).." / "..max
					callback(val)
				end

				Slider_Options:Set(default)

				Dot.InputBegan:Connect(function(input, gameProcessed)
					if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
					Dragging = true
				end)

				Dot.InputEnded:Connect(function(input, gameProcessed)
					if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
					Dragging = false
				end)

				UserInputService.InputChanged:Connect(function(input, gameProcessed)
					if input.UserInputType == Enum.UserInputType.MouseMovement then
						if Dragging then
							local SizeScale = math.clamp((input.Position.X - SliderIndicator.AbsolutePosition.X) / SliderIndicator.AbsoluteSize.X, 0, 1)
							Slider_Options:Set(min + ((max - min) * SizeScale))
						end
					end
				end)

				return Slider_Options
			end

			function SectionElements:AddDropdown(dropdown_name, list, default, multi_dropdown, callback)
				dropdown_name = dropdown_name or "Unnamed Dropdown"
				list = list or {}
				default = default or ""
				multi_dropdown = multi_dropdown or false

				local Dropdown_Options = {
					items = list
				}
                local Multi_Selected = {}
				local state = false

				local Dropdown = Instance.new("TextButton")
				local TextLabel = Instance.new("TextLabel")
				local Frame = Instance.new("Frame")
				local ScrollingFrame = Instance.new("ScrollingFrame")
				local UIListLayout = Instance.new("UIListLayout")
				local UIPadding = Instance.new("UIPadding")
				local TextLabel_2 = Instance.new("TextLabel")
				local add = Instance.new("ImageButton")

				Dropdown.Name = "Dropdown"
				Dropdown.Parent = Features
				Dropdown.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
				Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Dropdown.BorderSizePixel = 0
				Dropdown.Position = UDim2.new(0, 0, 0.975308657, 0)
				Dropdown.Size = UDim2.new(0, 485, 0, 50)
				Dropdown.Font = Enum.Font.Gotham
				Dropdown.Text = ""
				Dropdown.TextColor3 = Color3.fromRGB(234, 234, 234)
				Dropdown.TextSize = 14.000
				Dropdown.AutoButtonColor = false
				Dropdown.ZIndex = 1

				add.Name = "add"
				add.Parent = Dropdown
				add.BackgroundTransparency = 1.000
				add.LayoutOrder = 3
				add.Position = UDim2.new(1, -15, 0, 12)
				add.Rotation = 180.000
				add.Size = UDim2.new(0, 25, 0, 25)
				add.ZIndex = 2
				add.Image = "rbxassetid://3926307971"
				add.ImageRectOffset = Vector2.new(324, 364)
				add.ImageRectSize = Vector2.new(36, 36)
				add.ZIndex = 3
				add.AnchorPoint = Vector2.new(1, 0)

				AddDarkStrokes(Dropdown)
				AddDarkStrokes(Frame)

				AddUICorner(Dropdown)
				AddUICorner(Frame)

				AddTextStrokes(TextLabel)
				AddTextStrokes(TextLabel_2)

				TextLabel.Parent = Dropdown
				TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.BackgroundTransparency = 1.000
				TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextLabel.BorderSizePixel = 0
				TextLabel.Position = UDim2.new(1, -50, 0, 3)
				TextLabel.Size = UDim2.new(0, 261, 0, 42)
				TextLabel.Font = Enum.Font.Gotham
				TextLabel.Text = "Selected: None"
				TextLabel.TextColor3 = Color3.fromRGB(234, 234, 234)
				TextLabel.TextSize = 14.000
				TextLabel.TextXAlignment = Enum.TextXAlignment.Right
				TextLabel.ZIndex = 3
				TextLabel.AnchorPoint = Vector2.new(1, 0)

				Frame.AnchorPoint = Vector2.new(0.5, 0)
				Frame.Parent = Dropdown
				Frame.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
				Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Frame.BorderSizePixel = 0
				Frame.Position = UDim2.new(0.5, 0, 0, 50)
				Frame.Size = UDim2.new(1, -22, 1, -60)
				Frame.Visible = false

				ScrollingFrame.Parent = Frame
				ScrollingFrame.AnchorPoint = Vector2.new(0, 0.5)
				ScrollingFrame.Active = true
				ScrollingFrame.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
				ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ScrollingFrame.BorderSizePixel = 0
				ScrollingFrame.Position = UDim2.new(0, 10, 0.5, 0)
				ScrollingFrame.Size = UDim2.new(1, -15, 1, -20)
				ScrollingFrame.ScrollBarThickness = 4
				ScrollingFrame.Visible = false
				ScrollingFrame.ClipsDescendants = true
				ScrollingFrame.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
				ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(30, 30, 30)

				UIListLayout.Parent = ScrollingFrame
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout.Padding = UDim.new(0, 7)

				UIPadding.Parent = ScrollingFrame
				UIPadding.PaddingBottom = UDim.new(0, 1)
				UIPadding.PaddingLeft = UDim.new(0, 1)
				UIPadding.PaddingTop = UDim.new(0, 1)
				UIPadding.PaddingRight = UDim.new(0, 1)

				TextLabel_2.Parent = Dropdown
				TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_2.BackgroundTransparency = 1.000
				TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextLabel_2.BorderSizePixel = 0
				TextLabel_2.Position = UDim2.new(0, 10, 0, 3)
				TextLabel_2.Size = UDim2.new(0, 261, 0, 42)
				TextLabel_2.Font = Enum.Font.Gotham
				TextLabel_2.Text = dropdown_name
				TextLabel_2.TextColor3 = Color3.fromRGB(234, 234, 234)
				TextLabel_2.TextSize = 14.000
				TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left
				TextLabel_2.ZIndex = 3

				for _,v in next, list do
					if not ScrollingFrame:FindFirstChild(tostring(v)) then
						local TextButton = Instance.new("TextButton")
                        
						TextButton.Parent = ScrollingFrame
						TextButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
						TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
						TextButton.BorderSizePixel = 0
						TextButton.Position = UDim2.new(-0.00223713648, 0, 0, 0)
						TextButton.Size = UDim2.new(1, -5, 0, 37)
						TextButton.Font = Enum.Font.Gotham
						TextButton.Text = tostring(v)
						TextButton.TextColor3 = Color3.fromRGB(234, 234, 234)
						TextButton.TextSize = 14.000
						TextButton.Name = tostring(v)
						TextButton.AutoButtonColor = false

						TextButton.MouseButton1Down:Connect(function()
                            if not multi_dropdown then
							    TextLabel.Text = "Selected: " .. tostring(v)

                                ScrollingFrame.Visible = false
                                Frame.Visible = false
                                
                                TweenService:Create(add, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Rotation = -0}):Play()
                                TweenService:Create(Dropdown, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Size = UDim2.new(0, 485, 0, 50)}):Play()
							    callback(tostring(v))
                            else
                                if not table.find(Multi_Selected, tostring(v)) then
                                    table.insert(Multi_Selected, tostring(v))
									if #Multi_Selected > 0 then
                                    	TextLabel.Text = "Selected: " .. table.concat(Multi_Selected, ", ")
									else
										TextLabel.Text = "Selected: None"
									end
                                else
                                    for i, v in next, Multi_Selected do
                                        if v == tostring(v) then
                                            table.remove(Multi_Selected, i)
                                            break
                                        end
                                    end
                                    if #Multi_Selected > 0 then
                                    	TextLabel.Text = "Selected: " .. table.concat(Multi_Selected, ", ")
									else
										TextLabel.Text = "Selected: None"
									end
                                end
							    callback(Multi_Selected)
                            end
                        end)

						AddDarkStrokes(TextButton)
						AddTextStrokes(TextButton)
						AddUICorner(TextButton)
					end
				end

				local extendedSize = math.min(#list * 37 + ((#list - 1) * UIListLayout.Padding.Offset), 185 + (4 * UIListLayout.Padding.Offset)) + 82;

				local frame_size = 0
				Dropdown.MouseButton1Down:Connect(function()
					ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 2);
					state = not state

					if state then
						TweenService:Create(add, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = -45}):Play()
						local x = TweenService:Create(Dropdown, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Size = UDim2.new(0, 485, 0, extendedSize)})
						x.Completed:Connect(function()
							ScrollingFrame.Visible = true
							Frame.Visible = true
						end)
						x:Play()
					else
						ScrollingFrame.Visible = false
						Frame.Visible = false

						TweenService:Create(add, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = -0}):Play()
						TweenService:Create(Dropdown, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Size = UDim2.new(0, 485, 0, 50)}):Play()
					end
				end)

				function Dropdown_Options:RefreshDropdown(list)
                    ScrollingFrame.Visible = false
                    Frame.Visible = false

                    TweenService:Create(add, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = -0}):Play()
                    TweenService:Create(Dropdown, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Size = UDim2.new(0, 485, 0, 50)}):Play()
                    
					for i, v in next, ScrollingFrame:GetChildren() do
                        if v:IsA("TextButton") then
                            v:Destroy()
                        end
                    end

                    extendedSize = math.min(#list * 37 + ((#list - 1) * UIListLayout.Padding.Offset), 185 + (4 * UIListLayout.Padding.Offset)) + 82;
                    for _,v in next, list do
						if not ScrollingFrame:FindFirstChild(tostring(v)) then
							local TextButton = Instance.new("TextButton")

							TextButton.Parent = ScrollingFrame
							TextButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
							TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
							TextButton.BorderSizePixel = 0
							TextButton.Position = UDim2.new(-0.00223713648, 0, 0, 0)
							TextButton.Size = UDim2.new(1, -5, 0, 37)
							TextButton.Font = Enum.Font.Gotham
							TextButton.Text = tostring(v)
							TextButton.TextColor3 = Color3.fromRGB(234, 234, 234)
							TextButton.TextSize = 14.000
							TextButton.Name = tostring(v)
							TextButton.AutoButtonColor = false

							TextButton.MouseButton1Down:Connect(function()
								TextLabel.Text = "Selected: " .. tostring(v)
								ScrollingFrame.Visible = false
								Frame.Visible = false

								TweenService:Create(add, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Rotation = -0}):Play()
								TweenService:Create(Dropdown, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Size = UDim2.new(0, 485, 0, 50)}):Play()
								callback(tostring(v))
							end)

							AddDarkStrokes(TextButton)
							AddTextStrokes(TextButton)
							AddUICorner(TextButton)
						end
                    end
                end

				return Dropdown_Options
			end

			function SectionElements:AddColorpicker(colorpicker_name, default, callback)                
				colorpicker_name = colorpicker_name or "Unnamed Colorpicker"
				default = default or Color3.fromRGB(255, 226, 110)
				callback = callback or function(value) return print(value) end

				local Colorpicker_Options = {}

				local state = false
				local Dragging = false
				local Sidebar_Drag = false

				local H, S, V = default:ToHSV()

				local Colorpicker = Instance.new("TextButton")
				local TextLabel = Instance.new("TextLabel")
				local PreviewColor = Instance.new("Frame")

				local Colorpick = Instance.new("TextButton")
				local SecondF = Instance.new("Frame")
				local UIGradient = Instance.new("UIGradient")
				local UIGradient_2 = Instance.new("UIGradient")
				local Frame = Instance.new("Frame")

				local RainbowBar = Instance.new("TextButton")
				local UIGradient_3 = Instance.new("UIGradient")
				local Frame_2 = Instance.new("Frame")

				local Container_RGB = Instance.new("Frame")
				local R = Instance.new("Frame")
				local TextBox = Instance.new("TextBox")
				local G = Instance.new("Frame")
				local TextBox_2 = Instance.new("TextBox")
				local UIListLayout = Instance.new("UIListLayout")
				local UIPadding = Instance.new("UIPadding")
				local B = Instance.new("Frame")
				local TextBox_3 = Instance.new("TextBox")                

				AddDarkStrokes(Colorpicker)
				AddDarkStrokes(PreviewColor)
				AddTextStrokes(TextLabel)

				AddUICorner(Colorpicker)
				AddUICorner(PreviewColor)

				Colorpicker.Name = "Colorpicker"
				Colorpicker.Parent = Features
				Colorpicker.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
				Colorpicker.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Colorpicker.BorderSizePixel = 0
				Colorpicker.Position = UDim2.new(0, 0, 0.238683134, 0)
				Colorpicker.Size = UDim2.new(0, 485, 0, 50)
				Colorpicker.Text = ""
				Colorpicker.AutoButtonColor = false

				TextLabel.Parent = Colorpicker
				TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.BackgroundTransparency = 1.000
				TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextLabel.BorderSizePixel = 0
				TextLabel.Position = UDim2.new(0, 8, 0, 0)
				TextLabel.Size = UDim2.new(0, 261, 0, 50)
				TextLabel.Font = Enum.Font.Gotham
				TextLabel.Text = colorpicker_name
				TextLabel.TextColor3 = Color3.fromRGB(234, 234, 234)
				TextLabel.TextSize = 14.000
				TextLabel.TextXAlignment = Enum.TextXAlignment.Left

				PreviewColor.Name = "PreviewColor"
				PreviewColor.Parent = Colorpicker
				PreviewColor.BackgroundColor3 = default
				PreviewColor.BorderColor3 = Color3.fromRGB(0, 0, 0)
				PreviewColor.BorderSizePixel = 0
				PreviewColor.Position = UDim2.new(1, -15, 0, 11)
				PreviewColor.Size = UDim2.new(0, 45, 0, 30)
				PreviewColor.AnchorPoint = Vector2.new(1, 0)

				Colorpick.Name = "Colorpick"
				Colorpick.Parent = Colorpicker
				Colorpick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Colorpick.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Colorpick.BorderSizePixel = 0
				Colorpick.Position = UDim2.new(0.018556701, 0, 0.309188068, 0)
				Colorpick.Size = UDim2.new(0, 232, 0, 105)
				Colorpick.Visible = false
				Colorpick.Text = ""
				Colorpick.AutoButtonColor = false

				SecondF.Name = "SecondF"
				SecondF.Parent = Colorpick
				SecondF.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SecondF.BorderColor3 = Color3.fromRGB(0, 0, 0)
				SecondF.BorderSizePixel = 0
				SecondF.Size = UDim2.new(1, 0, 1, 0)

				UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 0))}
				UIGradient.Rotation = 270
				UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(1.00, 1.00)}
				UIGradient.Parent = SecondF

				UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, default)}
				UIGradient_2.Parent = Colorpick

				Frame.Parent = Colorpick
				Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Frame.BackgroundTransparency = 1.000
				Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Frame.BorderSizePixel = 0
				Frame.Position = UDim2.new(0.655172408, 0, 0.27619049, 0)
				Frame.Size = UDim2.new(0, 16, 0, 16)

				RainbowBar.Name = "RainbowBar"
				RainbowBar.Parent = Colorpicker
				RainbowBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				RainbowBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
				RainbowBar.BorderSizePixel = 0
				RainbowBar.Position = UDim2.new(0.504810572, 0, 0.306250006, 0)
				RainbowBar.Size = UDim2.new(0, 12, 0, 103)
				RainbowBar.Visible = false
				RainbowBar.AutoButtonColor = false
				RainbowBar.Text = ""

				UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 0)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))}
				UIGradient_3.Rotation = 270
				UIGradient_3.Parent = RainbowBar

				Frame_2.Parent = RainbowBar
				Frame_2.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
				Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Frame_2.BorderSizePixel = 0
				Frame_2.Position = UDim2.new(-0.583333313, 0, 0.466019422, 0)
				Frame_2.Size = UDim2.new(0, 26, 0, 9)

				Container_RGB.Name = "Container_RGB"
				Container_RGB.Parent = Colorpicker
				Container_RGB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Container_RGB.BackgroundTransparency = 1.000
				Container_RGB.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Container_RGB.BorderSizePixel = 0
				Container_RGB.Position = UDim2.new(0.558762908, 0, 0.308035672, 0)
				Container_RGB.Size = UDim2.new(0, 206, 0, 101)
				Container_RGB.Visible = false

				R.Name = "R"
				R.Parent = Container_RGB
				R.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
				R.BorderColor3 = Color3.fromRGB(0, 0, 0)
				R.BorderSizePixel = 0
				R.Position = UDim2.new(0.567010283, 0, 0.214311868, 0)
				R.Size = UDim2.new(0, 201, 0, 31)

                TextBox_2.Parent = R
				TextBox_2.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
				TextBox_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextBox_2.BorderSizePixel = 0
				TextBox_2.Position = UDim2.new(0, 0, -1.96887595e-06, 0)
				TextBox_2.Size = UDim2.new(0, 200, 0, 30)
				TextBox_2.Font = Enum.Font.Gotham
				TextBox_2.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
				TextBox_2.PlaceholderText = "Green"
				TextBox_2.Text = ""
				TextBox_2.TextColor3 = Color3.fromRGB(178, 178, 178)
				TextBox_2.TextSize = 14.000

				G.Name = "G"
				G.Parent = Container_RGB
				G.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
				G.BorderColor3 = Color3.fromRGB(0, 0, 0)
				G.BorderSizePixel = 0
				G.Position = UDim2.new(0.56494844, 0, 0.441584587, 0)
				G.Size = UDim2.new(0, 201, 0, 31)

				TextBox.Parent = G
				TextBox.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
				TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextBox.BorderSizePixel = 0
				TextBox.Position = UDim2.new(0, 0, -1.96887595e-06, 0)
				TextBox.Size = UDim2.new(0, 200, 0, 30)
				TextBox.Font = Enum.Font.Gotham
				TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
				TextBox.PlaceholderText = "Red"
				TextBox.Text = ""
				TextBox.TextColor3 = Color3.fromRGB(178, 178, 178)
				TextBox.TextSize = 14.000

				UIListLayout.Parent = Container_RGB
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout.Padding = UDim.new(0, 7)

				UIPadding.Parent = Container_RGB
				UIPadding.PaddingLeft = UDim.new(0, 5)

				B.Name = "B"
				B.Parent = Container_RGB
				B.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
				B.BorderColor3 = Color3.fromRGB(0, 0, 0)
				B.BorderSizePixel = 0
				B.Position = UDim2.new(0.56494844, 0, 0.441584587, 0)
				B.Size = UDim2.new(0, 201, 0, 31)

				TextBox_3.Parent = B
				TextBox_3.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
				TextBox_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextBox_3.BorderSizePixel = 0
				TextBox_3.Position = UDim2.new(0, 0, -1.96887595e-06, 0)
				TextBox_3.Size = UDim2.new(0, 200, 0, 30)
				TextBox_3.Font = Enum.Font.Gotham
				TextBox_3.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
				TextBox_3.PlaceholderText = "Blue"
				TextBox_3.Text = ""
				TextBox_3.TextColor3 = Color3.fromRGB(178, 178, 178)
				TextBox_3.TextSize = 14.000                

				AddDarkStrokes(Colorpick)
				AddDarkStrokes(RainbowBar)
				AddDarkStrokes(Frame)
				AddDarkStrokes(Frame_2)
				AddDarkStrokes(R)
				AddDarkStrokes(G)
				AddDarkStrokes(B)


				AddUICorner(R)
				AddUICorner(G)
				AddUICorner(B)
				AddUICorner(SecondF)
				AddUICorner(Colorpick)
				AddUICorner(Frame, UDim.new(1, 0))
				AddUICorner(Frame_2, UDim.new(1, 0))
				AddUICorner(RainbowBar, UDim.new(1, 0))

				function Colorpicker_Options:Set(h, s, v)
					UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromHSV(h, s, v))}
					
					default = Color3.fromRGB(H)
					callback(default)
				end

				function Colorpicker_Options:SetPreview(h, s, v)
					TweenService:Create(PreviewColor, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromHSV(h, s, v) }):Play()
				end

				Colorpicker_Options:Set(default:ToHSV())

				Colorpicker.MouseButton1Down:Connect(function()
					state = not state

					if state then
						TweenService:Create(Colorpicker, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Size = UDim2.new(0, 485, 0, 160)}):Play()
						Colorpick.Visible = true
						RainbowBar.Visible = true
						Container_RGB.Visible = true
					else
						TweenService:Create(Colorpicker, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Size = UDim2.new(0, 485, 0, 50)}):Play()
						Colorpick.Visible = false
						RainbowBar.Visible = false
						Container_RGB.Visible = false
					end
				end)

				Colorpick.InputBegan:Connect(function(input, gameProcessed)
					if not state then return end
					if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
					Dragging = true
				end)

				Colorpick.InputEnded:Connect(function(input, gameProcessed)
					if not state then return end
					if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
					Dragging = false
				end)

				RainbowBar.InputBegan:Connect(function(input, gameProcessed)
					if not state then return end
					if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
					Sidebar_Drag = true
				end)

				RainbowBar.InputEnded:Connect(function(input, gameProcessed)
					if not state then return end
					if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
					Sidebar_Drag = false
				end)

				TextBox.FocusLost:Connect(function()
					--red
					local text = tonumber(TextBox.Text)
					if not text or math.floor(text) ~= text and not text >= 0 and not text <= 255 then return end

					local hsv = Color3.fromHSV(H, S, V)
					local CH, CS, CV = Color3.new(text / 255, hsv.G, hsv.B):ToHSV()

					H = CH
					S = CS
					V = CV

					Colorpicker_Options:Set(CH, CS, CV)
					Colorpicker_Options:SetPreview(CH, CS, CV)
				end)

				TextBox_2.FocusLost:Connect(function()
					--green
					local text = tonumber(TextBox_2.Text)
					if not text or math.floor(text) ~= text and not text >= 0 and not text <= 255 then return end

					local hsv = Color3.fromHSV(H, S, V)
					local CH, CS, CV = Color3.new(hsv.R, text / 255, hsv.B):ToHSV()
					H = CH
					S = CS
					V = CV

					Colorpicker_Options:Set(CH, CS, CV)
					Colorpicker_Options:SetPreview(CH, CS, CV)
				end)

				TextBox_3.FocusLost:Connect(function()
					--blue
					local text = tonumber(TextBox_3.Text)
					if not text or math.floor(text) ~= text and not text >= 0 and not text <= 255 then return end

					local hsv = Color3.fromHSV(H, S, V)
					local CH, CS, CV = Color3.new(hsv.R, hsv.G, text / 255):ToHSV()
					H = CH
					S = CS
					V = CV
					Colorpicker_Options:Set(CH, CS, CV)
					Colorpicker_Options:SetPreview(CH, CS, CV)
				end)

				UserInputService.InputChanged:Connect(function(input, gameProcessed)
					if not state then return end
					if input.UserInputType == Enum.UserInputType.MouseMovement then
						if Dragging then
							local ColorX =
								(math.clamp(input.Position.X - Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X) /
									Colorpick.AbsoluteSize.X)

							local ColorY =
								(math.clamp(input.Position.Y - Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y) /
									Colorpick.AbsoluteSize.Y)

							S = ColorX
							V = 1 - ColorY

							Frame.Position = UDim2.new(ColorX, -7, ColorY, -3)
							Colorpicker_Options:SetPreview(H, S, V)
						end

						if Sidebar_Drag then
							local value = math.clamp((input.Position.Y - RainbowBar.AbsolutePosition.Y) / RainbowBar.AbsoluteSize.Y, 0, 1)
							local NewH = 1 - value

							H = NewH
							S = 1
							V = 1

							TweenService:Create(Frame_2, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), { Position = UDim2.new(-0.583333313, 0, value, 0) }):Play()
							TweenService:Create(Frame_2, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromHSV(NewH, 1, 1) }):Play()
							TweenService:Create(PreviewColor, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromHSV(NewH, 1, 1) }):Play()

							Colorpicker_Options:Set(NewH, 1, 1)
						end
					end
				end)

				return Colorpicker_Options
			end

			function SectionElements:AddSeperator(text)
				text = text or "Unnamed Seperator"
				
				local Seperator = Instance.new("TextLabel")
				local Frame = Instance.new("Frame")
				local Frame_2 = Instance.new("Frame")

				local Seperator_Options = {}
				
				Seperator.Name = "Seperator"
				Seperator.Parent = Features
				Seperator.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
				Seperator.BackgroundTransparency = 1.000
				Seperator.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Seperator.BorderSizePixel = 0
				Seperator.Size = UDim2.new(0, 485, 0, 50)
				Seperator.Font = Enum.Font.Gotham
				Seperator.Text = text
				Seperator.TextColor3 = Color3.fromRGB(234, 234, 234)
				Seperator.TextSize = 14.000
				
				Frame.Parent = Seperator
				Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
				Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Frame.BorderSizePixel = 0
				Frame.Position = UDim2.new(0.732164383, 0, 0.472985834, 0)
				Frame.Size = UDim2.new(0, 120, 0, 2)
				
				Frame_2.Parent = Seperator
				Frame_2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
				Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Frame_2.BorderSizePixel = 0
				Frame_2.Position = UDim2.new(0.0187623333, 0, 0.472985834, 0)
				Frame_2.Size = UDim2.new(0, 120, 0, 2)

				AddTextStrokes(Seperator)

				AddUICorner(Frame)
				AddUICorner(Frame_2)

				function Seperator_Options:SetText(new_text)
					Seperator.Text = new_text
				end

				return Seperator_Options
			end

			return SectionElements 
		end

		return TabElements
	end

	return Window_Library
end

return lib
