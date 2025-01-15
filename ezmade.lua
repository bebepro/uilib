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
    ui.CurrentPage = nil

    -- Create a frame for the top bar and tab navigation
    ui.TopBar = Instance.new("Frame")
    ui.TopBar.Size = UDim2.new(1, 0, 0, 50)
    ui.TopBar.Position = UDim2.new(0, 0, 0, 0)
    ui.TopBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    ui.TopBar.BorderSizePixel = 0
    ui.TopBar.Parent = ui.ScreenGui

    -- Add the title to the top bar
    local title = Instance.new("TextLabel")
    title.Text = libraryName or "UILibrary"
    title.Size = UDim2.new(0.5, 0, 1, 0)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.BackgroundTransparency = 1
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Font = Enum.Font.SourceSans
    title.TextSize = 30
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = ui.TopBar

    -- Create a frame for the tabs on the left
    ui.TabContainer = Instance.new("Frame")
    ui.TabContainer.Size = UDim2.new(0, 150, 1, 0)
    ui.TabContainer.Position = UDim2.new(0, 0, 0, 50)
    ui.TabContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    ui.TabContainer.BorderSizePixel = 0
    ui.TabContainer.Parent = ui.ScreenGui

    -- Store the buttons for switching between pages
    ui.TabButtons = {}

    -- Add a page
    function ui.AddPage(pageName)
        local page = {}

        -- Create a frame for the page
        page.Frame = Instance.new("Frame")
        page.Frame.Name = pageName or "Page"
        page.Frame.Size = UDim2.new(1, -150, 1, -50)  -- Adjust size for tab and top bar
        page.Frame.Position = UDim2.new(0, 150, 0, 50)
        page.Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        page.Frame.BorderSizePixel = 0
        page.Frame.Visible = #ui.Pages == 0  -- Only the first page is visible by default
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

        -- Add the page to the library
        table.insert(ui.Pages, page)

        -- Create a tab button for the page
        local tabButton = Instance.new("TextButton")
        tabButton.Text = pageName or "Page"
        tabButton.Size = UDim2.new(1, 0, 0, 50)
        tabButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        tabButton.Font = Enum.Font.SourceSans
        tabButton.TextSize = 20
        tabButton.Parent = ui.TabContainer

        -- Handle tab button click
        tabButton.MouseButton1Click:Connect(function()
            if ui.CurrentPage then
                ui.CurrentPage.Frame.Visible = false
            end
            page.Frame.Visible = true
            ui.CurrentPage = page
        end)

        -- Add the tab button to the list
        table.insert(ui.TabButtons, tabButton)

        -- Return the page for adding more elements
        return page
    end

    -- Set the first page to be the default visible page
    if #ui.Pages > 0 then
        ui.CurrentPage = ui.Pages[1]
    end

    return ui
end

return UILibrary
