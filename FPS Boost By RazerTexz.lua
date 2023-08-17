local parts = game:GetDescendants()
for _, v in ipairs(parts) do
    local success, error = pcall(function()
        if v:IsA("MeshPart") or v:IsA("BasePart") or v:IsA("Part") then
	    v.Material = Enum.Material.SmoothPlastic
		
	end
    end)
end
