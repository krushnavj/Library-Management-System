SELECT
	i.ISBN,
	i.book_code,
	b.category,
	b.rental_price,
	i.issue_id,
	i.issue_date,
	i.issue_time,
	r.return_date,
	r.return_time,
	i.branch_no,
	i.issued_customer,
	c.customer_address,
	b.status,
	DATEDIFF(DAY,i.issue_date, r.return_date) AS time_taken_to_return
FROM
	issue_status$ i
		LEFT JOIN
	books$ b ON i.ISBN = b.ISBN
		LEFT JOIN
	customers$ c ON i.issued_customer = c.customer_Id
		LEFT OUTER JOIN
	return_status$ r ON i.issue_id = r.issue_id

	--SELECT * from customers$