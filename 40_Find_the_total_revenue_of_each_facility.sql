SELECT facs.name, SUM(slots * case
			WHEN memid = 0 then facs.guestcost
			ELSE facs.membercost
		END) AS revenue
	FROM cd.bookings bks
	INNER JOIN cd.facilities facs
		ON bks.facid = facs.facid
	GROUP BY facs.name
ORDER BY revenue;
