local workspace = game:GetService("Workspace")
local lighting = game:GetService("Lighting")
local getLighting = lighting.GetDescendants
local getParts = game.GetDescendants
local numberRangeNew = NumberRange.new
local noLifetime = numberRangeNew(0)

local terrain = workspace:FindFirstChildOfClass("Terrain")
terrain.WaterWaveSize = 0
terrain.WaterWaveSpeed = 0
terrain.WaterReflectance = 0
terrain.WaterTransparency = 0
lighting.GlobalShadows = false
lighting.FogEnd = 9e9
settings().Rendering.QualityLevel = 1

for _, v in getParts() do
	if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("BasePart") or v:IsA("MeshPart") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
		v.Material = "SmoothPlastic"
		v.Reflectance = 0
	elseif v:IsA("Decal") then
		v.Transparency = 1
	elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
		v.Lifetime = noLifetime
	elseif v:IsA("Explosion") then
		v.BlastPressure = 1
		v.BlastRadius = 1
	end
end

for _, v in getLighting() do
	if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
		v.Enabled = false
	end
end

workspace.DescendantAdded:Connect(function(descendant)
	if descendant:IsA("ForceField") or descendant:IsA("Sparkles") or descendant:IsA("Smoke") or descendant:IsA("Fire") then
		descendant:Destroy()
	end
end)