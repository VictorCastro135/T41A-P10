SELECT row_number() over(ORDER BY joindate), firstname, surname
	FROM cd.members
ORDER BY joindate    
