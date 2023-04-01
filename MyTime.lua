function QMPlugin.DateTimeToNumTimes(srcDateTime)
	local Y = string.sub(srcDateTime,1,4)
	local M = string.sub(srcDateTime,5,6)
	local D = string.sub(srcDateTime,7,8)
	local H = string.sub(srcDateTime,9,10)
	local MM = string.sub(srcDateTime,11,12)
	local SS = string.sub(srcDateTime,13,14)
	
	local dt = {year=Y, month=M, day=D, hour=H, min=MM, sec=SS}
	return os.time(dt)
end