SELECT facs.facid, facs.name,
	TRIM(TO_CHAR(SUM(bks.slots)/2.0, '9999999999999999D99')) AS "Total Hours"

	FROM cd.bookings bks
	INNER JOIN cd.facilities facs
		ON facs.facid = bks.facid
	GROUP BY facs.facid, facs.name
ORDER BY facs.facid;     
