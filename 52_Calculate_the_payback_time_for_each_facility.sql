SELECT facs.name AS name,
	facs.initialoutlay/((SUM(CASE
			WHEN memid = 0 THEN SLOTS * facs.guestcost
			ELSE SLOTS * membercost
		END)/3) - facs.monthlymaintenance) AS months
	FROM cd.bookings bks
	INNER JOIN cd.facilities facs
	ON bks.facid = facs.facid
	GROUP BY facs.facid
ORDER BY name;   
