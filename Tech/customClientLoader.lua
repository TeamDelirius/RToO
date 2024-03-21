-- Intended to be used with the RToO Kit. Please refer to the kit in the drive below for full efficiency.
-- https://drive.google.com/drive/u/0/folders/1Gc97cObwaGQEJX6ILS9ahfOxTl49kX5F

local char = script.Parent
local rootPart = char:WaitForChild("HumanoidRootPart")

for k, i in ipairs(char:GetChildren()) do
	if i:IsA("Part") then
		i.Touched:Connect(function(part)
			local hum = char:FindFirstChild("Humanoid")
			if hum then
				if hum.Health > 0 then
					if part.Parent == workspace.Obby["CSO's"].Custom then -- change to Client Object location
						local customScript = part:FindFirstChildWhichIsA("ModuleScript")
						if customScript then
							local scriptFunction = require(customScript)
							scriptFunction.activate(char, part)
						end
					end
				end
			end
		end)
	end
end
