-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/computers/sh_computers.yue
gterm = gterm or { } -- 2
GT_COL_NIL = 0 -- 4
GT_COL_MSG = 1 -- 5
GT_COL_WRN = 2 -- 6
GT_COL_ERR = 3 -- 7
GT_COL_INFO = 4 -- 8
GT_COL_INTL = 5 -- 9
GT_COL_CMD = 6 -- 10
GT_COL_SUCC = 7 -- 11
gterm.ColorFromIndex = function(self, code) -- 13
	local col -- 14
	if GT_COL_MSG == code then -- 15
		col = Color(255, 255, 255) -- 16
	elseif GT_COL_WRN == code then -- 17
		col = Color(255, 250, 50) -- 18
	elseif GT_COL_ERR == code then -- 19
		col = Color(255, 50, 50) -- 20
	elseif GT_COL_INFO == code then -- 21
		col = Color(250, 0, 150) -- 22
	elseif GT_COL_INTL == code then -- 23
		col = Color(60, 250, 250) -- 24
	elseif GT_COL_CMD == code then -- 25
		col = Color(175, 175, 175) -- 26
	elseif GT_COL_SUCC == code then -- 27
		col = Color(75, 255, 80) -- 28
	else -- 30
		col = Color(50, 50, 50) -- 30
	end -- 30
	return col -- 31
end -- 13
