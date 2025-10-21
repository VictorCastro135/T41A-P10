SELECT starttime, starttime + slots*(interval '30 minutes') ENDTIME
	FROM cd.bookings
	ORDER BY endtime DESC, starttime DESC
	LIMIT 10          
