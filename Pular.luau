
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


local canDoubleJump = false

local function onInputBegan(input)
	if input.UserInputType == Enum.UserInputType.Keyboard then
		if input.KeyCode == Enum.KeyCode.Space then
			if humanoid:GetState() == Enum.HumanoidStateType.Jumping then
				if canDoubleJump then
					humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
					canDoubleJump = false
				end
			else
				humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
				canDoubleJump = true
			end
		end
	end
end
game:GetService("UserInputService").InputBegan:Connect(onInputBegan)
humanoid.StateChanged:Connect(function(oldState, newState)
    if newState == Enum.HumanoidStateType.Landed then
        canDoubleJump = false
    end
end)
