local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

-- Prompt user for style selection
local selectedStyle = "Kaiser" -- Default style
pcall(function()
    selectedStyle = game:GetService("Players"):FindFirstChildWhichIsA("Player"):RequestStream("Enter Style Name:") or "Kaiser"
end)

-- Function to check and switch style
local function switchToStyle(styleName)
    local styleEvent = ReplicatedStorage:FindFirstChild("ChangeStyle") -- Adjust if the event name is different
    if styleEvent then
        styleEvent:FireServer(styleName) -- Attempt to change style
    end
end

-- Auto-dribble function
local function autoDribble()
    local dribbleEvent = ReplicatedStorage:FindFirstChild("Dribble") -- Adjust if the event name is different
    if dribbleEvent then
        while true do
            wait(0.1) -- Small delay to prevent overload
            if player.Character and player.Character:FindFirstChild("Ball") then -- Checks if player has possession
                dribbleEvent:FireServer(true) -- Activates dribble
            end
        end
    end
end

-- Run the functions automatically
switchToStyle(selectedStyle)
task.spawn(autoDribble)
