-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no)
	emp_no, first_name, last_name, title
INTO unique_titles
FROM retired_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no ASC, 
		to_date DESC;
		
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retired_titles
FROM employees AS e
INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT COUNT(title) AS title_count, title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY title_count DESC;

--Mentorship Checking
SELECT DISTINCT ON(e.emp_no) 
	e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
INTO mentorship_eligibility
FROM employees as e
	INNER JOIN dept_emp as de 
	ON (e.emp_no = de.emp_no)
	INNER JOIN titles as t
	ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;

--Deliverable 3 checks
SELECT COUNT(*)
FROM mentorship_eligibility;

