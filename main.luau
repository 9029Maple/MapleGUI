
Maple = {
	isInit = false,
	ThemeColor = Color3.fromRGB(29, 66, 153),
	ThemeFont = Enum.Font.Code
}

-- thou can modify the code as ya see fit.
-- may thou question my. thy shall dm me, mapleSyrup#5691. (lol im getting weird pls help!!)

applyTheme = function(Ui, Type)
    Ui.BorderColor3 = Maple.ThemeColor
    Ui.BorderMode = Enum.BorderMode.Outline
    Ui.BorderSizePixel = 1
    
    if Type == "Filled" then
        Ui.BackgroundColor3 = Maple.ThemeColor
    elseif Type == "Normal" then
        Ui.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    end
    
    return Ui.BackgroundColor3
end

Udim = function(x, y)
    return UDim2.new(0, x, 0, y) -- size by pixels, scales no.
end

init = function(Size)
    if Maple.isInit then return end-- initialized already, shall return none.
    
    local ScreenGUI = Instance.new("ScreenGui")
    ScreenGUI.Parent = game.CoreGui
    ScreenGUI.Name = "9029"
    
    local Main = Instance.new("Frame")
    Main.Name = "Main"
    Main.Parent = ScreenGUI
    applyTheme(Main, "Normal")
    Main.Size = Size
    Main.Active = true
    Main.Draggable = true
    
    Maple.isInit = true
    
    return Main
end

newFrame = function(Parent, Size, Position)
    local Frame = Instance.new("Frame")
    Frame.Parent = Parent
    Frame.Size = Size
    Frame.Position = Position
    applyTheme(Frame, "Normal")
    
    return Frame
end

newTextLabel = function(Parent, Size, Position, Text)
    local TextLabel = Instance.new("TextLabel")
    TextLabel.Parent = Parent
    TextLabel.Size = Size
    TextLabel.Position = Position
    TextLabel.Text = Text
    TextLabel.Font = Maple.ThemeFont
    TextLabel.TextSize = 14
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    applyTheme(TextLabel, "Normal")
    
    return TextLabel
end

newTextButton = function(Parent, Size, Position, Text, Function)
    local TextButton = Instance.new("TextButton")
    TextButton.Parent = Parent
    TextButton.Size = Size
    TextButton.Position = Position
    TextButton.Text = Text
    TextButton.Font = Maple.ThemeFont
    TextButton.TextSize = 12
    TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextButton.AutoButtonColor = false
    TextButton.TextXAlignment = Enum.TextXAlignment.Left
    local DefaultColor = applyTheme(TextButton, "Normal")
    
    TextButton.MouseEnter:Connect(function()
        TextButton.BackgroundColor3 = Maple.ThemeColor
    end)
    
    TextButton.MouseLeave:Connect(function()
        TextButton.BackgroundColor3 = DefaultColor
    end)
    
    TextButton.MouseButton1Click:Connect(function() Function() end)
    
    return TextButton
end

newToggleButton = function(Parent, Size, Position, Text, ToggledFunc, NotToggledFunc)
    local TextButton = Instance.new("TextButton")
    TextButton.Parent = Parent
    TextButton.Size = Size
    TextButton.Position = Position
    TextButton.Text = Text
    TextButton.Font = Maple.ThemeFont
    TextButton.TextSize = 12
    TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextButton.AutoButtonColor = false
    TextButton.TextXAlignment = Enum.TextXAlignment.Left
    local DefaultColor = applyTheme(TextButton, "Normal")
    
    local Toggled = false
    
    TextButton.MouseButton1Click:Connect(function()
        if Toggled then
            Toggled = false
            TextButton.BackgroundColor3 = DefaultColor
            NotToggledFunc()
        else
            Toggled = true
            TextButton.BackgroundColor3 = Maple.ThemeColor
            ToggledFunc()
        end
        
    end)
    
    return TextButton
end
