SELECT facid, sum(slots) AS "Total Slots"
	FROM cd.bookings
	GROUP BY facid
ORDER BY facid;
