local tweenService = game:GetService("TweenService")
local marketPlaceService = game:GetService("MarketplaceService")
local runService = game:GetService("RunService")
local players = game:GetService("Players")
local replicatedService = game:GetService("ReplicatedStorage")

-- If any additional services are needed, please include them above.

local module = {}

module.test = function()
	-- A quick way to check if Rson is working
	
	print("Hello World")
end

-- Insert your functions below, please keep them in alphabetical order.

module.movePart = function(MovePart : Part, EndPart : Part, Time : number)
	-- Moves a part from one place to another.
	
	local goodAction = true
	if MovePart == nil then
		goodAction = false
		warn("You need a initial part to move!")
	elseif EndPart == nil then
		goodAction = false
		warn("You need a end part!")
	elseif Time == nil then
		warn("No Time given, set to 1.")
		Time = 1
	end
	if goodAction then
		tweenService:Create(MovePart, TweenInfo.new(Time, Enum.EasingStyle.Linear), {CFrame = EndPart.CFrame}):Play()
	end
end

module.movePartAdvanced = function(MovePart : Part, EndPart : Part, GivenTweenInfo : TweenInfo)
	-- Moves a part from one place to another, with the ability to manipulate tweens.
	
	local goodAction = true
	if MovePart == nil then
		goodAction = false
		warn("You need a initial part to move!")
	elseif EndPart == nil then
		goodAction = false
		warn("You need a end part!")
	elseif GivenTweenInfo == nil then
		goodAction = false
		warn("No Tween Info given!")
	end
	if goodAction then
		tweenService:Create(MovePart, GivenTweenInfo, {CFrame = EndPart.CFrame}):Play()
	end
end

module.morphPart = function(ChangedPart : Part, GoalPart : Part, Time : number)
	-- Morphs a part from one place to another, ignores transparency.
	
	local goodAction = true
	if ChangedPart == nil then
		goodAction = false
		warn("You need a initial part to move!")
	elseif GoalPart == nil then
		goodAction = false
		warn("You need a goal part!")
	elseif Time == nil then
		warn("No Time given, set to 1.")
		Time = 1
	end
	if goodAction then
		local tween = tweenService:Create(ChangedPart, TweenInfo.new(Time, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = GoalPart.CFrame, Size = GoalPart.Size, Color = GoalPart.Color, Reflectance = GoalPart.Reflectance})
		ChangedPart.Material = GoalPart.Material
		ChangedPart.Shape = GoalPart.Shape
		tween:Play()
	end
end

module.morphPartAdvanced = function(ChangedPart : Part, GoalPart : Part, GivenTweenInfo : TweenInfo, ShapeMaterialChangeAtStart : boolean)
	-- Morphs a part from one place to another, ignores transparency. Allows the ability to manipulate the tween and whether to initially change the shape.
	
	local goodAction = true
	if ChangedPart == nil then
		goodAction = false
		warn("You need a initial part to move!")
	elseif GoalPart == nil then
		goodAction = false
		warn("You need a goal part!")
	elseif GivenTweenInfo == nil then
		goodAction = false
		warn("No Tween Info given!")
	elseif ShapeMaterialChangeAtStart == nil then
		goodAction = false
		warn("No ShapeMaterialChangeAtStart value given (True/False)!")
	end
	if goodAction then
		local tween = tweenService:Create(ChangedPart, GivenTweenInfo, {CFrame = GoalPart.CFrame, Size = GoalPart.Size, Color = GoalPart.Color, Reflectance = GoalPart.Reflectance})
		if ShapeMaterialChangeAtStart then
			ChangedPart.Material = GoalPart.Material
			ChangedPart.Shape = GoalPart.Shape
		else
			tween.Completed:Connect(function()
				ChangedPart.Material = GoalPart.Material
				ChangedPart.Shape = GoalPart.Shape
			end)
		end
		tween:Play()
	end
end

return module
