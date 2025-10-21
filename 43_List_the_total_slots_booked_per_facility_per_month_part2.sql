SELECT facid, extract(month FROM starttime) AS month, SUM(slots) AS slots
	FROM cd.bookings
	WHERE
		starttime >= '2012-01-01'
		AND starttime < '2013-01-01'
	GROUP BY rollup(facid, month)
ORDER BY facid, month;  
