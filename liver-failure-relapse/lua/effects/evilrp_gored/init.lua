local bloods = { "particle/particle_noisesphere" };

function EFFECT:Init(data)
	local scale = data:GetScale() or 2;

	for i = 1, (16 * scale) do
		local randomThing = math.random(240, 255);
		local startSize = math.Rand(16 * scale, 32 * scale);
		local position = Vector(math.Rand(-1, 1), math.Rand(-1, 1), math.Rand(-2, 2));
		local blood = bloods[math.random(#bloods)]
		local particle = GAMEMODE.Emitter2D:Add(blood, data:GetOrigin() + position);

		if (particle) then
			particle:SetAirResistance(math.Rand(256, 384));
			particle:SetStartAlpha(255);
			particle:SetStartSize(startSize * 4);
			particle:SetRollDelta(math.Rand(-0.2, 0.2));
			particle:SetEndAlpha(128);
			particle:SetVelocity(Vector(math.random(-4, 4), math.random(-4, 4), math.random(-4, 4)) * math.Rand(32, 64));
			particle:SetLifeTime(0);
			particle:SetLighting(true);
			particle:SetGravity(Vector(math.Rand(-8, 8), math.Rand(-8, 8), math.Rand(16, -16)));
			particle:SetCollide(true);
			particle:SetEndSize(0);
			particle:SetDieTime(math.random(1, 3));
			particle:SetBounce(0.5);
			particle:SetColor(randomThing, 40, 10);
			particle:SetRoll(math.Rand(-180, 180));
		end
	end
end

-- Called when the effect should be rendered.
function EFFECT:Render()
end

-- Called each frame.
function EFFECT:Think()
	return false;
end
