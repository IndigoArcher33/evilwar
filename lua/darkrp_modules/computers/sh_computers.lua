gterm = gterm or { }
GT_COL_NIL = 0
GT_COL_MSG = 1
GT_COL_WRN = 2
GT_COL_ERR = 3
GT_COL_INFO = 4
GT_COL_INTL = 5
GT_COL_CMD = 6
GT_COL_SUCC = 7
gterm.ColorFromIndex = function(self, code)
	local col
	if GT_COL_MSG == code then
		col = Color(255, 255, 255)
	elseif GT_COL_WRN == code then
		col = Color(255, 250, 50)
	elseif GT_COL_ERR == code then
		col = Color(255, 50, 50)
	elseif GT_COL_INFO == code then
		col = Color(250, 0, 150)
	elseif GT_COL_INTL == code then
		col = Color(60, 250, 250)
	elseif GT_COL_CMD == code then
		col = Color(175, 175, 175)
	elseif GT_COL_SUCC == code then
		col = Color(75, 255, 80)
	else
		col = Color(50, 50, 50)
	end
	return col
end
