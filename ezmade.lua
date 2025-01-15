local UILibrary = {}

-- Create the main UI (ScreenGui)
function UILibrary.Load(libraryName)
    local ui = {}
    
    -- Create the ScreenGui
    ui.ScreenGui = Instance.new("ScreenGui")
    ui.ScreenGui.Name = libraryName or "UILibrary"
    ui.ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Store pages
    ui.Pages = {}

    -- Add a page
    function ui.AddPage(pageName)
        local page = {}
        
        -- Create a frame for the page
        page.Frame = Instance.new("Frame")
        page.Frame.Name = pageName or "Page"
        page.Frame.Size = UDim2.new(0, 300, 0, 400)
        page.Frame.Position = UDim2.new(0.5, -150, 0.5, -200)
        page.Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        page.Frame.BorderSizePixel = 0
        page.Frame.Visible = #ui.Pages == 0 -- Only the first page is visible by default
        page.Frame.Parent = ui.ScreenGui

        -- Store elements in the page
        page.Elements = {}

        -- UIListLayout for automatic positioning
        local layout = Instance.new("UIListLayout")
        layout.Padding = UDim.new(0, 10)
        layout.FillDirection = Enum.FillDirection.Vertical
        layout.SortOrder = Enum.SortOrder.LayoutOrder
        layout.Parent = page.Frame

        -- Add a label
        function page.AddLabel(labelText)
            local label = Instance.new("TextLabel")
            label.Text = labelText or "Label"
            label.Size = UDim2.new(1, 0, 0, 30)
            label.BackgroundTransparency = 1
            label.TextColor3 = Color3.fromRGB(255, 255, 255)
            label.Font = Enum.Font.SourceSans
            label.TextSize = 20
            label.Parent = page.Frame
            return label
        end

        -- Add a button
        function page.AddButton(buttonText, callback)
            local button = Instance.new("TextButton")
            button.Text = buttonText or "Button"
            button.Size = UDim2.new(1, 0, 0, 40)
            button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.Font = Enum.Font.SourceSans
            button.TextSize = 20
            button.Parent = page.Frame

            button.MouseButton1Click:Connect(function()
                if callback then
                    callback()
                end
            end)

            return button
        end

        -- Add a toggle
        function page.AddToggle(toggleText, defaultValue, callback)
            local toggleFrame = Instance.new("Frame")
            toggleFrame.Size = UDim2.new(1, 0, 0, 40)
            toggleFrame.BackgroundTransparency = 1
            toggleFrame.Parent = page.Frame

            local toggleLabel = Instance.new("TextLabel")
            toggleLabel.Text = toggleText or "Toggle"
            toggleLabel.Size = UDim2.new(0.8, 0, 1, 0)
            toggleLabel.BackgroundTransparency = 1
            toggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            toggleLabel.Font = Enum.Font.SourceSans
            toggleLabel.TextSize = 20
            toggleLabel.Parent = toggleFrame

            local toggleButton = Instance.new("TextButton")
            toggleButton.Text = defaultValue and "ON" or "OFF"
            toggleButton.Size = UDim2.new(0.2, 0, 1, 0)
            toggleButton.Position = UDim2.new(0.8, 0, 0, 0)
            toggleButton.BackgroundColor3 = defaultValue and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
            toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            toggleButton.Font = Enum.Font.SourceSans
            toggleButton.TextSize = 20
            toggleButton.Parent = toggleFrame

            local toggleValue = defaultValue

            toggleButton.MouseButton1Click:Connect(function()
                toggleValue = not toggleValue
                toggleButton.Text = toggleValue and "ON" or "OFF"
                toggleButton.BackgroundColor3 = toggleValue and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)

                if callback then
                    callback(toggleValue)
                end
            end)

            return toggleFrame
        end

        -- Add a slider
        function page.AddSlider(sliderText, options, callback)
            local sliderFrame = Instance.new("Frame")
            sliderFrame.Size = UDim2.new(1, 0, 0, 40)
            sliderFrame.BackgroundTransparency = 1
            sliderFrame.Parent = page.Frame

            local sliderLabel = Instance.new("TextLabel")
            sliderLabel.Text = sliderText or "Slider"
            sliderLabel.Size = UDim2.new(0.8, 0, 1, 0)
            sliderLabel.BackgroundTransparency = 1
            sliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            sliderLabel.Font = Enum.Font.SourceSans
            sliderLabel.TextSize = 20
            sliderLabel.Parent = sliderFrame

            local slider = Instance.new("TextButton")
            slider.Size = UDim2.new(0.2, 0, 1, 0)
            slider.Position = UDim2.new(0.8, 0, 0, 0)
            slider.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
            slider.Text = tostring(options.Def or 0)
            slider.TextColor3 = Color3.fromRGB(255, 255, 255)
            slider.Font = Enum.Font.SourceSans
            slider.TextSize = 20
            slider.Parent = sliderFrame

            slider.MouseButton1Click:Connect(function()
                local newValue = math.random(options.Min or 0, options.Max or 100)
                slider.Text = tostring(newValue)

                if callback then
                    callback(newValue)
                end
            end)

            return sliderFrame
        end

        -- Add the page to the library
        table.insert(ui.Pages, page)
        return page
    end

    return ui
end

return UILibrary
