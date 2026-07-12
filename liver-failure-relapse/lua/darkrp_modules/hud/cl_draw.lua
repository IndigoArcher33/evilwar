bgradient = Material("placenta/ui/bg_gradient.png")

function draw.DrawTextShadow(text, font, x, y, col1, col2, align, thick, bar)
   thick = thick or 2;

   if (align ~= 0) then
      surface.SetFont(font);

      if (bar) then
	 local tW, tH = surface.GetTextSize(text);
	 surface.SetDrawColor(25 + (5 * math.sin(CurTime())), 25 + (5 * math.sin(CurTime())), 25 + (5 * math.sin(CurTime())), col1.a);
	 surface.SetMaterial(bgradient);
	 surface.DrawTexturedRect(x - tW / 2, y, tW * 1, tH * 1);
      end

      draw.DrawText(text, font, x + math.sin(CurTime() * 0.8) * thick, y + math.sin(CurTime()) * thick, col2, align); -- Less efficient than surface, so we only use this if we need special alignment stuff.
      draw.DrawText(text, font, x, y, col1, align);
   else
      surface.SetFont(font);
      surface.SetTextColor(col2);
      surface.SetTextPos(x + math.sin(CurTime() * 0.8) * thick, y + math.sin(CurTime()) * thick);
      surface.DrawText(text);
      surface.SetTextColor(col1);
      surface.SetTextPos(x, y);
      surface.DrawText(text);

      if (bar) then
	 local tW, tH = surface.GetTextSize(text);
	 surface.SetDrawColor(100 + (50 * math.sin(CurTime())), 100 + (50 * math.sin(CurTime())), 100 + (50 * math.sin(CurTime())), 200);
	 surface.SetMaterial(bgradient);
	 surface.DrawTexturedRect(x, y, tW, tH);
      end
   end
end

function draw.Circle(x, y, radius, seg)
   local cir = { };

   table.insert(cir, {
		   x = x,
		   y = y,
		   u = 0.5,
		   v = 0.5
   });

   for i = 0, seg do
      local a = math.rad((i / seg) * -360);

      table.insert(cir, {
		      x = x + math.sin(a) * radius,
		      y = y + math.cos(a) * radius,
		      u = math.sin(a) / 2 + 0.5,
		      v = math.cos(a) / 2 + 0.5
      });
   end

   local a = math.rad(0); -- This is needed for non absolute segment counts

   table.insert(cir, {
		   x = x + math.sin(a) * radius,
		   y = y + math.cos(a) * radius,
		   u = math.sin(a) / 2 + 0.5,
		   v = math.cos(a) / 2 + 0.5
   });

   surface.DrawPoly(cir);
end

local matBlurScreen = Material("pp/videoscale");

function draw.DrawBackgroundBlur(frac)
   DisableClipping(true);
   surface.SetMaterial(matBlurScreen);
   surface.SetDrawColor(255, 255, 255, 255);
   matBlurScreen:SetFloat("$scale", math.max(0, frac * 7 + (6 * math.sin(CurTime()))));
   matBlurScreen:SetFloat("$multiply", 1 - (0.2 * frac));
   matBlurScreen:Recompute();
   render.UpdateScreenEffectTexture();
   surface.DrawTexturedRect(0, 0, ScrW(), ScrH());
   DisableClipping(false);
end

function draw.CustomCursor(panel, material)
   -- Paint the custom cursor
   local cursorX, cursorY = panel:LocalCursorPos()

   surface.SetDrawColor(255, 255, 255, 240)
   surface.SetMaterial(material)
   surface.DrawTexturedRect(cursorX, cursorY, 32, 32)
end
