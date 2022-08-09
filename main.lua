Maple = {
	ThemeColor = Color3.fromRGB(100, 100, 255),
	ThemeColor2 = Color3.fromRGB(60, 60, 180),
	ThemeFont = Enum.Font.Code
}

local Maple.ApplyTheme = function(UI, type = "Filled")
    UI.BorderColor3 = Maple.ThemeColor
    UI.BorderMode = Enum.BorderMode.Inset
    UI.BorderSizePixel = 1
    if type == "Filled" then
        UI.BackgroundColor3 = Maple.ThemeColor
    elseif type == "Normal" then
        UI.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    end
    
    return UI.BackgroundColor3
end

local Maple.Init = function(Size)
    local ScreenGUI = Instance.new("ScreenGui")
    ScreenGUI.Parent = game.CoreGui
    ScreenGUI.Name = "9029"
    
    local Main = Instance.new("Frame")
    Main.Name = "Main"
    Main.Parent = ScreenGUI
    Maple.ApplyTheme(Main, "Normal")
    Main.Size = Size
    Main.Active = true
    Main.Draggable = true
    
    return Main
end

local Maple.NewFrame = function(Parent, Size, Position)
    local Frame = Instance.new("Frame")
    Frame.Parent = Parent
    Frame.Size = Size
    Frame.Position = Position
    Maple.ApplyTheme(UI, "Normal")
    
    return Frame
end

local Maple.NewTextLabel = function(Parent, Size, Position, Text)
    local TextLabel = Instance.new("TextLabel")
    TextLabel.Parent = Parent
    TextLabel.Size = Size
    TextLabel.Position = Position
    TextLabel.Text = Text
    TextLabel.Font = Maple.ThemeFont
    TextLabel.TextSize = 12
    TextLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
    Maple.ApplyTheme(UI, "Normal")
    
    return TextLabel
end

local Maple.NewTextButton = function(Parent, Size, Position, Text)
    local TextButton = Instance.new("TextButton")
    TextButton.Parent = Parent
    TextButton.Size = Size
    TextButton.Position = Position
    TextButton.Text = Text
    TextButton.Font = Maple.ThemeFont
    TextButton.TextSize = 12
    TextButton.TextColor3 = Color3.fromRGB(220, 220, 220)
    local DefaultColor = Maple.ApplyTheme(UI, "Normal")
    
    TextButton.MouseEnter:Connect(function()
        TextButton.BackgroundColor3 = Maple.ThemeColor
        
    end)
    
    TextButton.MouseLeave:Connect(function()
        TextButton.BackgroundColor3 = DefaultColor
        
    end)
    
    
    
    return TextButton
end

return Maple

