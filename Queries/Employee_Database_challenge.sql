-- Utilities
SELECT * FROM retirement_titles;
DROP TABLE retirement_titles;

-- Create new table for retiring employees' titles
SELECT emp.emp_no,
    emp.first_name,
    emp.last_name,
    tt.title,
    tt.from_date,
    tt.to_date
INTO retirement_titles
FROM employees AS emp
INNER JOIN titles AS tt
ON emp.emp_no = tt.emp_no
WHERE (emp.birth_date BETWEEN '1952-01-01' AND '1955-12-31');

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date = ('9999-01-01')
ORDER BY emp_no, to_date DESC;

-- Retrieve the number of employees by their most recent job title who are about to retire.
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

-- Create a Mentorship Eligibility table
SELECT DISTINCT ON (emp.emp_no) emp.emp_no,
    emp.first_name,
    emp.last_name,
    emp.birth_date,
    de.from_date,
    de.to_date,
    tt.title
INTO mentorship_eligibilty
FROM employees AS emp
INNER JOIN dept_emp AS de
ON emp.emp_no = de.emp_no
INNER JOIN titles AS tt
ON emp.emp_no = tt.emp_no
WHERE de.to_date = ('9999-01-01')
    AND (emp.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp.emp_no;