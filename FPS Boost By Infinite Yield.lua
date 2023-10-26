local Game = game:GetDescendants()
local workspace = game:GetService("Workspace")
local lighting = game:GetService("Lighting"):GetDescendants()
local runService = game:GetService("RunService")

local terrain = workspace:FindFirstChildOfClass("Terrain")
terrain.WaterWaveSize = 0
terrain.WaterWaveSpeed = 0
terrain.WaterReflectance = 0
terrain.WaterTransparency = 0
lighting.GlobalShadows = false
lighting.FogEnd = 9e9
settings().Rendering.QualityLevel = 1

for _, v in ipairs(Game) do
	if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
		v.Material = "SmoothPlastic"
		v.Reflectance = 0
	elseif v:IsA("Decal") then
		v.Transparency = 1
	elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
		v.Lifetime = NumberRange.new(0)
	elseif v:IsA("Explosion") then
		v.BlastPressure = 1
		v.BlastRadius = 1
	end
end

for _, v in ipairs(lighting) do
	if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
		v.Enabled = false
	end
end

workspace.DescendantAdded:Connect(function(child)
	task.spawn(function()
		if child:IsA("ForceField") or child:IsA("Sparkles") or child:IsA("Smoke") or child:IsA("Fire") then
			runService.Heartbeat:Wait()
			child:Destroy()
		end
	end)
end)