function EFFECT:Init(data)
	local pos = data:GetOrigin();
	local speed = data:GetStart();
	local ang = data:GetNormal();
	local scale = data:GetScale();

	for i = 1, 1 do
		local particle = GAMEMODE.Emitter2D:Add("particle/particle_noisesphere", pos);
		particle:SetVelocity((((ang * 5) * i) * 5) + (speed) + Vector(math.random(-4, 4), math.random(-4, 4), math.random(-4, 4)));
		particle:SetDieTime(10);
		particle:SetStartAlpha(200);
		particle:SetEndAlpha(0);
		particle:SetStartSize(5 * scale);
		particle:SetEndSize(math.random(10, 20) * scale);
		particle:SetRoll(math.Rand(-10, 10));
		particle:SetRollDelta(math.Rand(-0.2, 0.2));
		particle:SetColor(32, 0, 0);
		particle:SetGravity(Vector(0, 0, -50));
		particle:SetCollide(true);
		particle:SetAirResistance(50);
		particle:SetBounce(1);
	end
end

-- Called when the effect should be rendered.
function EFFECT:Render()
end

-- Called each frame.
function EFFECT:Think()
	return false;
end

function EFFECT:StartTouch(cd)
	if (cd.HitPos) then
		util.Decal("Blood", cd.HitPos - cd.HitNormal, cd.HitPos + cd.HitNormal);
	end
end
