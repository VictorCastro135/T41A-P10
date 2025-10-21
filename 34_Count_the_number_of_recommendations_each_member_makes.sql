SELECT recommendedby, COUNT(*) 
	FROM cd.members
	WHERE recommendedby IS NOT null
	GROUP BY recommendedby
ORDER BY recommendedby;
