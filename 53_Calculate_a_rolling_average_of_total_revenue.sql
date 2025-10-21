SELECT 	dategen.date,
	(
		SELECT SUM(CASE
			WHEN memid = 0 THEN SLOTS * facs.guestcost
			ELSE SLOTS * membercost
		END) AS rev

		FROM cd.bookings bks
		INNER JOIN cd.facilities facs
			ON bks.facid = facs.facid
		WHERE bks.starttime > dategen.date - INTERVAL '14 days'
			AND bks.starttime < dategen.date + INTERVAL '1 day'
	)/15 AS revenue
	FROM
	(
		SELECT 	CAST(generate_series(timestamp '2012-08-01',
			'2012-08-31','1 day') AS date) AS date
	)  AS dategen
ORDER BY dategen.date;   
