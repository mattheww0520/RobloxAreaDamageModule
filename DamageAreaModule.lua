local Damage = {}

Damage.Area = function(Properties)

	local Object = Properties.Object or nil
	local Position = Properties.Position or Vector3.new(0,0,0)
	local Orientation = Properties.Orientation or Vector3.new(0,0,0)
	local Size = Properties.Size or Vector3.new(5,5,5)
	local CFrameValue = Properties.CFrameValue or nil
	local IgnoreList = Properties.IgnoreList or {}

	if typeof(Position) == "Instance" then
		if Position:IsA("Part") or Position:IsA("MeshPart") then
			Position = Position.Position
		end
	end

	if typeof(Orientation) == "Instance" then
		if Orientation:IsA("Part") or Orientation:IsA("MeshPart") then
			Orientation = Orientation.Orientation
		end
	end

	if typeof(Size) == "Instance" then
		if Size:IsA("Part") or Size:IsA("MeshPart") then
			Size = Size.Size
		end
	end


	local part = Instance.new("Part")
	--part.Anchored = true
	--part.CanCollide = false
	--part.Parent = workspace.gameArea.MaterialObjects
	--print(part.Parent)
	--print(part)
	
	if Object ~= nil then
		part.Position = Object.Position
		part.Orientation = Object.Orientation
		part.Size = Object.Size
	elseif CFrameValue ~= nil then
		part.Position = CFrameValue.Position
		local rx,ry,rz = CFrameValue:ToOrientation()
		part.Orientation = Vector3.new(rx * 180/math.pi, ry * 180/math.pi, rz * 180/math.pi)
		part.Size = Size
	else
		part.Position = Position
		part.Orientation = Orientation
		part.Size = Size
	end

	local filter = OverlapParams.new()
	filter.FilterType = Enum.RaycastFilterType.Blacklist 
	filter.FilterDescendantsInstances = {}
	local getTouchingParts = workspace:GetPartsInPart(part, filter)
	local UniqueTouchingPart = {}

	for i,v in pairs(getTouchingParts) do 
		if table.find(UniqueTouchingPart, v) == nil then

			if IgnoreList ~= nil then
				if table.find(IgnoreList, v) == nil then
					table.insert(UniqueTouchingPart, v)
				end
			else
				table.insert(UniqueTouchingPart, v)
			end

		end 
	end 
	--print(UniqueTouchingPart)
	return UniqueTouchingPart

end

Damage.AreaModels = function(Properties)

	local Object = Properties.Object or nil
	local Position = Properties.Position or Vector3.new(0,0,0)
	local Orientation = Properties.Orientation or Vector3.new(0,0,0)
	local Size = Properties.Size or Vector3.new(5,5,5)
	local CFrameValue = Properties.CFrameValue or nil
	local IgnoreList = Properties.IgnoreList or {}

	if typeof(Position) == "Instance" then
		if Position:IsA("Part") or Position:IsA("MeshPart") then
			Position = Position.Position
		end
	end

	if typeof(Orientation) == "Instance" then
		if Orientation:IsA("Part") or Orientation:IsA("MeshPart") then
			Orientation = Orientation.Orientation
		end
	end

	if typeof(Size) == "Instance" then
		if Size:IsA("Part") or Size:IsA("MeshPart") then
			Size = Size.Size
		end
	end


	local part = Instance.new("Part")
	--part.Anchored = true
	--part.CanCollide = false
	--part.Parent = workspace
	--print(part.Parent)
	--print(part)
	
	if Object ~= nil then
		part.Position = Object.Position
		part.Orientation = Object.Orientation
		part.Size = Object.Size
	elseif CFrameValue ~= nil then
		part.Position = CFrameValue.Position
		local rx,ry,rz = CFrameValue:ToOrientation()
		part.Orientation = Vector3.new(rx * 180/math.pi, ry * 180/math.pi, rz * 180/math.pi)
		part.Size = Size
	else
		part.Position = Position
		part.Orientation = Orientation
		part.Size = Size
	end


	local filter = OverlapParams.new()
	filter.FilterType = Enum.RaycastFilterType.Blacklist 
	filter.FilterDescendantsInstances = {}
	local getTouchingParts = workspace:GetPartsInPart(part, filter)
	local UniqueTouchingPart = {}



	for i,v in pairs(getTouchingParts) do 
		if table.find(UniqueTouchingPart, v.Parent) == nil then

			if IgnoreList ~= nil then
				if table.find(IgnoreList, v) == nil then
					table.insert(UniqueTouchingPart, v.Parent)
				end
			else
				table.insert(UniqueTouchingPart, v.Parent)
			end

		end 
	end 
	
	return UniqueTouchingPart

end



Damage.Raycast = function(ignoreList, origin, endPosition)


end



return Damage
