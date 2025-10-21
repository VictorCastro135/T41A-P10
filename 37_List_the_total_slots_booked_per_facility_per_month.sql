SELECT facid, extract(month FROM starttime) AS month, sum(slots) AS "Total Slots"
	FROM cd.bookings
	WHERE extract(YEAR FROM starttime) = 2012
	GROUP BY facid, month
ORDER BY facid, month;
