
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local function onInputBegan(input)
	if input.UserInputType == Enum.UserInputType.Keyboard then
		if input.KeyCode == Enum.KeyCode.Space then
			humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end
end

game:GetService("UserInputService").InputBegan:Connect(onInputBegan)
