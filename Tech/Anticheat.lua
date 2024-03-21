-- Intended to be used with the RToO Kit. Please refer to the kit in the drive below for full efficiency.
-- https://drive.google.com/drive/u/0/folders/1Gc97cObwaGQEJX6ILS9ahfOxTl49kX5F

local whitelistedGuis = {
	"Chat", -- required
	"Freecam",  -- required
	"BubbleChat",  -- required
	"TextBox", -- new TextService
}

playerGui.ChildAdded:Connect(function(child)
	local safe = false
	for k, i in ipairs(starterGui:GetChildren()) do
		if i.Name == child.Name or table.find(whitelistedGuis, child.Name) then
			safe = true
			break
		end
	end
	if not safe	then
		player:Kick("Exploiting is not permissible; if this is a mistake be sure to contact the owner. Detected:  '" .. child.Name .. "'")
	end
end)


local fps = 0
local flagFps = false
runService.Stepped:Connect(function()
	fps += 1
	if fps > 61 then
		if not flagFps then
			flagFps = true
			for i = 1,180 do -- verifying integrity of the fps skip if just a coincidence for native 60
				runService.Stepped:Wait()
				if fps < 61 then
					flagFps = false
					break
				end
			end
			if flagFps then
				uncapped.Value = true
			end
		end
	end
	wait(1)
	fps -= 1
end)
