
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local function onInputBegan(input)
	if input.UserInputType == Enum.UserInputType.Keyboard then
		if input.KeyCode == Enum.KeyCode.W then
			humanoid:Move(Vector3.new(0, 0, -1), true)
		elseif input.KeyCode == Enum.KeyCode.S then
			humanoid:Move(Vector3.new(0, 0, 1), true)
		elseif input.KeyCode == Enum.KeyCode.A then
			humanoid:Move(Vector3.new(-1, 0, 0), true)
		elseif input.KeyCode == Enum.KeyCode.D then
			humanoid:Move(Vector3.new(1, 0, 0), true)
		end
	end
end

local function onInputEnded(input)
	if input.UserInputType == Enum.UserInputType.Keyboard then
		humanoid:Move(Vector3.new(0, 0, 0), true)
	end
end

game:GetService("UserInputService").InputBegan:Connect(onInputBegan)
game:GetService("UserInputService").InputEnded:Connect(onInputEnded)

