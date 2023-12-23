local getParts = game.GetDescendants
for _, v in getParts() do
	if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("BasePart") or v:IsA("MeshPart") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
		v.Material = Enum.Material.SmoothPlastic
	end
end