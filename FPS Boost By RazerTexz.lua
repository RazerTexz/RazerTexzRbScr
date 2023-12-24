for _, v in game:GetDescendants() do
	if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("BasePart") or v:IsA("MeshPart") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then v.Material = Enum.Material.SmoothPlastic
	elseif v:IsA("Model") then v.LevelOfDetail = Enum.ModelLevelOfDetail.StreamingMesh end
end