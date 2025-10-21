SELECT name, rank FROM (
	SELECT facs.name AS name, rank() over (ORDER BY SUM(CASE
				WHEN memid = 0 THEN SLOTS * facs.guestcost
				ELSE SLOTS * membercost
			END) DESC) AS rank
		FROM cd.bookings bks
		INNER JOIN cd.facilities facs
			ON bks.facid = facs.facid
		GROUP BY facs.name
	) AS subq
	WHERE rank <= 3
ORDER BY rank;   
