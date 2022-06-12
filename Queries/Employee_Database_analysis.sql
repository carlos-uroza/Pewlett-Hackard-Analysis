-- Utilities
SELECT * FROM all_emp;
DROP TABLE all_emp;

-- Question 1
-- Create new table for retiring employees' titles (wave 1 - 1952 employees)
SELECT emp.emp_no,
    emp.first_name,
    emp.last_name,
    tt.title,
    tt.from_date,
    tt.to_date
INTO retirement_wave_1
FROM employees AS emp
INNER JOIN titles AS tt
ON emp.emp_no = tt.emp_no
WHERE (emp.birth_date BETWEEN '1952-01-01' AND '1952-12-31');

-- Use Dictinct with Orderby to remove duplicate rows (wave 1 - 1952 employees)
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles_wave1
FROM retirement_wave_1
WHERE to_date = ('9999-01-01')
ORDER BY emp_no, to_date DESC;

-- Retrieve the number of employees by their most recent job title who are about to retire. (wave 1 - 1952 employees)
SELECT COUNT(title), title
INTO retiring_titles_wave1
FROM unique_titles_wave1
GROUP BY title
ORDER BY count DESC;



-- Question 2
-- Create new table for all employees' titles not between 1952-1955
SELECT emp.emp_no,
    emp.first_name,
    emp.last_name,
    tt.title,
    tt.from_date,
    tt.to_date
INTO all_emp
FROM employees AS emp
INNER JOIN titles AS tt
ON emp.emp_no = tt.emp_no
WHERE (emp.birth_date NOT BETWEEN '1952-01-01' AND '1955-12-31')

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_non_retirement
FROM all_emp
WHERE to_date = ('9999-01-01')
ORDER BY emp_no, to_date DESC;

-- Retrieve the number of employees by their most recent job title who are not about to retire.
SELECT COUNT(title), title
INTO available_titles
FROM all_emp
GROUP BY title
ORDER BY count DESC;
