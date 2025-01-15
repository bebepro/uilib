local UILibrary = {}

-- Function to create a ScreenGui
function UILibrary.CreateScreenGui(parent, name)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = name or "ScreenGui"
    screenGui.Parent = parent
    return screenGui
end

-- Function to create a Frame
function UILibrary.CreateFrame(parent, name, size, position, color)
    local frame = Instance.new("Frame")
    frame.Name = name or "NewFrame"
    frame.Size = size or UDim2.new(0, 200, 0, 200)
    frame.Position = position or UDim2.new(0.5, -100, 0.5, -100)
    frame.BackgroundColor3 = color or Color3.fromRGB(255, 255, 255)
    frame.Parent = parent
    return frame
end

-- Function to create a Button
function UILibrary.CreateButton(parent, name, text, size, position, color)
    local button = Instance.new("TextButton")
    button.Name = name or "NewButton"
    button.Text = text or "Click Me"
    button.Size = size or UDim2.new(0, 100, 0, 50)
    button.Position = position or UDim2.new(0.5, -50, 0.5, -25)
    button.BackgroundColor3 = color or Color3.fromRGB(0, 170, 255)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.SourceSans
    button.TextSize = 24
    button.Parent = parent
    return button
end

-- Function to create a TextLabel
function UILibrary.CreateLabel(parent, name, text, size, position, color)
    local label = Instance.new("TextLabel")
    label.Name = name or "NewLabel"
    label.Text = text or "Label"
    label.Size = size or UDim2.new(0, 200, 0, 50)
    label.Position = position or UDim2.new(0.5, -100, 0.5, -25)
    label.BackgroundColor3 = color or Color3.fromRGB(255, 255, 255)
    label.TextColor3 = Color3.fromRGB(0, 0, 0)
    label.Font = Enum.Font.SourceSans
    label.TextSize = 24
    label.Parent = parent
    return label
end

-- Add more functions for other UI elements (ImageButton, ScrollFrame, etc.)

return UILibrary
