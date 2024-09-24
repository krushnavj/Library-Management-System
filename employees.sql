SELECT
	e.employee_id,
	e.employee_name,
	e.shift_start,
	e.shift_end,
	e.[salary (per hour)],
	a.date,
	i.issue_date,
	i.issue_time,
	DATEDIFF(HOUR, e.shift_start, e.shift_end) AS no_of_hours_per_shift,
	DATEDIFF(HOUR, e.shift_start, e.shift_end) * [salary (per hour)] AS staff_cost
FROM 
	Attendance$ a
		FULL JOIN
	employees$ e ON a.employee_id = e.employee_id
		FULL JOIN
	issue_status$ i ON i.issue_date = a.Date
GROUP BY
	e.employee_id,
	e.employee_name,
	e.shift_start,
	e.shift_end,
	e.[salary (per hour)],
	a.Date,
	i.issue_date,
	i.issue_time