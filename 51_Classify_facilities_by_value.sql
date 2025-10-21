SELECT name, CASE WHEN class=1 THEN 'high'
		WHEN class=2 THEN 'average'
		ELSE 'low'
		END REVENUE
	FROM (
		SELECT facs.name AS name, ntile(3) OVER (ORDER BY SUM(CASE
				WHEN memid = 0 THEN SLOTS * facs.guestcost
				ELSE SLOTS * membercost
			END) DESC) AS class
		FROM cd.bookings bks
		INNER JOIN cd.facilities facs
			ON bks.facid = facs.facid
		GROUP BY facs.name
	) AS subq
ORDER BY class, name;    
