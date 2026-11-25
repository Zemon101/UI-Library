local LIB_URL = "https://github.com/PMLOLHUB/Ui-library/raw/refs/heads/main/NierLibrary.lua"

local Library = loadstring(game:HttpGet(LIB_URL))()

Library:SetSoundEnabled(true)
Library:SetSoundVolume(0.8)

local Window = Library:CreateWindow("NIER UI Demo", {
  Theme = "Paper",
  ToggleKey = Enum.KeyCode.RightShift,
  Language = "en",
  ElementTransparency = 0.08,
  OverallScale = 100,
  ToggleButtonScale = 100,
  MobileButtonStyle = "Classic",
  StripAnimation = true,
  BorderEnabled = true,
  ShowSettingsTab = true,
  StartOpen = true,
})

local Basic = Window:CreateCategory("Basic", "lucide-home")

Basic:CreateLabel("Label: Heading", "lucide-info")
Basic:CreateLabel("Red Label", "lucide-alert-triangle", Color3.fromRGB(200, 60, 60))

Basic:CreateButton("Basic Button", function()
  Window:Notify("Button clicked!", 3)
end)

Basic:CreateButton("Button + Icon", "lucide-bell", function()
  Window:Notify("Button with an icon", 3)
end)

Basic:CreateButton("Button + Icon + Text Color", "lucide-flame", Color3.fromRGB(180, 50, 50), function()
  Window:Notify("Custom text color", 3)
end)

local counter = 0
local counterBtn

counterBtn = Basic:CreateButton("Counter: 0", "lucide-plus", function()
  counter += 1
  counterBtn.SetText("Counter: " .. counter)
end)

Basic:CreateToggle("Basic Toggle", false, function(state)
  print("Toggle 1:", state)
end)

Basic:CreateToggle("Toggle + Icon", "lucide-eye", true, function(state)
  print("Toggle 2:", state)
end)

local saveToggle = Basic:CreateToggle("Toggle + Flag (Save Value)", "lucide-save", false, "DemoToggle", function(state)
  print("DemoToggle:", state)
end)

local Inputs = Window:CreateCategory("Inputs", "lucide-keyboard")

Inputs:CreateLabel("Input Fields", "lucide-type")

Inputs:CreateTextbox("Textbox", "lucide-edit", "Enter text...", "DemoText", function(text)
  print("Text:", text)
end)

Inputs:CreateNumberTextbox("Number Textbox", "lucide-hash", 100, "DemoNumber", function(n)
  print("Number:", n)
end)

Inputs:CreateSearchBar("Search...", "lucide-search", function(text)
  print("Search:", text)
end)

Inputs:CreateLabel("Sliders", "lucide-sliders")

local speedSlider = Inputs:CreateSlider("Slider", "lucide-gauge", 0, 100, 50, "DemoSlider", function(value)
  print("Slider:", value)
end)

Inputs:CreateSlider("Slider (No Icon/Flag)", 1, 10, 5, function(value)
  print("Slider 2:", value)
end)

local Pickers = Window:CreateCategory("Pickers", "lucide-palette")

Pickers:CreateLabel("Color Selection", "lucide-paintbrush")

Pickers:CreateColorPicker("Color Picker", "lucide-palette", Color3.fromRGB(255, 120, 60), "DemoColor", function(color)
  print("Color:", color)
end)

Pickers:CreateColorPicker("Color Picker (No Icon)", Color3.fromRGB(60, 160, 255), function(color)
  print("Color 2:", color)
end)

Pickers:CreateLabel("Dropdowns", "lucide-list")

local fruits = { "Apple", "Banana", "Cherry", "Grape", "Mango", "Orange" }

local drop = Pickers:CreateDropdown("Dropdown", "lucide-apple", fruits, "Banana", "DemoDropdown", function(selected)
  print("Dropdown:", selected)
end)

local multi = Pickers:CreateMultiDropdown("Multi Dropdown", "lucide-check-square", fruits, { "Apple", "Cherry" }, "DemoMulti", function(list)
  print("Multi:", table.concat(list, ", "))
end)

local Api = Window:CreateCategory("Window API", "lucide-settings-2")

Api:CreateButton("Notify (Notification Message)", "lucide-bell-ring", function()
  Window:Notify("This is a notification message", 4)
end)

Api:CreateButton("Open Settings", "lucide-settings", function()
  Window:OpenSettings()
end)

Api:CreateButton("Read Flag: DemoSlider", "lucide-search", function()
  Window:Notify("DemoSlider = " .. tostring(Window:GetFlag("DemoSlider")), 3)
end)

Api:CreateButton("Set Flag: DemoSlider = 80", "lucide-edit-3", function()
  Window:SetFlag("DemoSlider", 80)
  speedSlider.Set(80)
end)

Api:CreateButton("Save All Settings (SaveConfiguration)", "lucide-save", function()
  Window:SaveConfiguration()
  Window:Notify("Configuration saved", 2)
end)

Api:CreateButton("Change Team Color (UpdateTeamColor)", "lucide-users", function()
  Window:UpdateTeamColor(Color3.fromRGB(math.random(60, 220), math.random(60, 220), math.random(60, 220)))
end)

Api:CreateButton("Hide Window for 2 Seconds (Hide/Show)", "lucide-eye-off", function()
  Window:Hide()
  task.delay(2, function()
    Window:Show()
  end)
end)

Api:CreateButton("Close and Remove UI (Destroy)", "lucide-trash-2", Color3.fromRGB(180, 50, 50), function()
  Window:Destroy()
end)

Window:Notify("Demo loaded successfully", 4)

