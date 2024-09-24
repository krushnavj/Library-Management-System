SELECT
	br.branch_no,
	br.branch_address,
	i.issue_date,
	i.issue_time,
	i.ISBN,
	i.book_code,
	i.issued_customer,
	c.customer_address,
	b.rental_price,
	r.return_date,
	r.return_time,
	r.return_id
FROM
	issue_status$ i
		LEFT JOIN
	branches$ br ON i.branch_no = br.branch_no
		LEFT JOIN
	books$ b ON b.ISBN = i.ISBN
		LEFT JOIN
	customers$ c ON c.customer_Id = i.issued_customer
		LEFT JOIN
	return_status$ r ON i.issue_id = r.issue_id