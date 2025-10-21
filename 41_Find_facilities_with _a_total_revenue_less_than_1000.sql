SELECT name, revenue FROM (
	SELECT facs.name, SUM(case 
				when memid = 0 then slots * facs.guestcost
				else slots * membercost
			end) as revenue
		FROM cd.bookings bks
		inner JOIN cd.facilities facs
			ON bks.facid = facs.facid
		group BY facs.name
	) AS agg WHERE revenue < 1000
ORDER BY revenue;          
