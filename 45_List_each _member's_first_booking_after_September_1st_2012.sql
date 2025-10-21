SELECT mems.surname, mems.firstname, mems.memid, min(bks.starttime) AS starttime
	FROM cd.bookings bks
	INNER JOIN cd.members mems ON
		mems.memid = bks.memid
	WHERE starttime >= '2012-09-01'
	GROUP BY mems.surname, mems.firstname, mems.memid
ORDER BY mems.memid;    
