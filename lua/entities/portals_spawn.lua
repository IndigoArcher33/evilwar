AddCSLuaFile()

ENT.Base = "portals_base"
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

ENT.PrintName = "Spawnpoint"
ENT.Category = "Portals"

ENT.Spawnable = true
ENT.AdminOnly = true

ENT.Interesting = true

ENT.Mins = Vector(-40, -40, -50)
ENT.Maxs = Vector(40, 40, 40)

function ENT:SetupDataTables()
   self:NetworkVar("Int", 0, "Fate")
end

if CLIENT then
   function ENT:OnRemove()
      if self.Sound then
	 self.Sound:Stop()
      end
   end

   function ENT:GetCustomColor()
      return Color(255, 80, 80)
   end

   local matrix = Matrix()

   matrix:SetScale(Vector(2, 2, 2))

   function ENT:HUDRender()
      local ply = LocalPlayer()
      if ply:Team() ~= TEAM_GHOST then return false end
      local ct = {}
      table.insert(ct, {
		      text = RPExtraTeams[self:GetFate()].name,
      })
      table.insert(ct, {
		      text = RPExtraTeams[self:GetFate()].description,
		      font = "Spleen_Label_Small",
      })
      return ct
   end
   function ENT:Think()
      if LocalPlayer():Team() ~= TEAM_GHOST then
	 if self.Sound and self.Sound:IsPlaying() then
	    self.Sound:Stop()
	 end
	 return
      end
      local light = DynamicLight(self:EntIndex())
      local color = self:GetCustomColor()

      if self:GetColor() != color then
	 self:SetColor(color)
      end

      if light then
	 light.pos = self:GetPos()
	 light.r = 255
	 light.g = 32
	 light.b = 32
	 light.brightness = 2
	 light.Decay = 1000
	 light.Size = 256
	 light.DieTime = CurTime() + 1
      end

      if not self.Sound then
	 self.Sound = CreateSound(self, "ambient/levels/citadel/citadel_drone_loop2.wav")
	 self.Sound:ChangePitch(0.2)
	 self.Sound:SetSoundLevel(75)
      end

      if not self.Sound:IsPlaying() then
	 self.Sound:Play()
      end

      self:EnableMatrix("RenderMultiply", matrix)
   end

   local developer = GetConVar("developer")

   local sprite = Material("sprites/light_glow02_add")
   local mat = CreateMaterial("portal_death", "UnlitTwoTexture", {
				 ["$basetexture"] = "models/effects/vortshield_color",
				 ["$texture2"] = "models/effects/vortshield_base",
				 ["$model"] = 1,
				 ["$nocull"] = 1,
				 ["$additive"] = 1,
				 ["Proxies"] = {
				    ["TextureScroll"] = {
				       ["texturescrollvar"] = "$texture2transform",
				       ["texturescrollrate"] = -0.1,
				       ["texturescrollangle"] = 0
				    }
				 }
   })

   function ENT:DrawTranslucent()
      if developer:GetBool() then
	 local mins = self.Mins - Vector(0.1, 0.1, 0.1)
	 local maxs = self.Maxs + Vector(0.1, 0.1, 0.1)

	 local color = ColorAlpha(self:GetCustomColor(), 50)

	 render.SetColorMaterial()
	 render.DrawBox(self:GetPos(), self:GetNetworkAngles(), mins, maxs, color, true)
	 render.DrawWireframeBox(self:GetPos(), self:GetNetworkAngles(), mins, maxs, color, true)
      end

      local size = 250

      -- render.OverrideBlend(true, BLEND_ZERO, BLEND_ONE_MINUS_SRC_COLOR, BLENDFUNC_ADD)
      -- render.SetMaterial(sprite)
      -- render.DrawSprite(self:GetPos(), size, size)
      -- render.DrawSprite(self:GetPos(), size, size)
      -- render.OverrideBlend(false)

      local ang = (EyePos() - self:GetPos()):Angle()

      render.MaterialOverride(mat)

      self:SetRenderAngles(ang)
      self:SetupBones()
      
      if LocalPlayer():Team() == TEAM_GHOST then
	 self:DrawModel()
      end

      render.MaterialOverride()
   end
else
   function ENT:IsValidEntity(ent)
      if ent:IsPlayer() and ent:Team() == TEAM_GHOST then
	 return true
      end
   end
   function ENT:Use(ply)
      if not self:IsValidEntity(ply) then
	 return
      end

      ply:ForcePlayerDrop()

      if ply:IsPlayer() then
	 -- ply:SetPos(self:WorldSpaceCplyer())
	 ply:changeTeam(self:GetFate())
	 ply:ScreenFade(SCREENFADE.IN, Color(255, 0, 0), 2.5, 0)
	 local sounds_list = table.Random(RPExtraTeams[self:GetFate()].become_sounds)
	 ply:EmitSound(sounds_list)

	 ply:EmitSound("npc/stalker/go_alert2.wav", 140, 40, 0.2)
	 net.Start("evilrp_receive_stocks")
	 net.WriteTable(GAMEMODE.Stocks)
	 net.Send(ply)
      else
	 ply:Remove()
      end

      self:TeleportEffect()
   end
end
