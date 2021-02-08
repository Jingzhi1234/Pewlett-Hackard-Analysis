-- Deliverable 1
-- creating Retirement_Titles
SELECT employees.emp_no, employees.first_name, employees.last_name,titles.title,titles.from_date,titles.to_date
INTO retirement_titles
FROM employees
INNER JOIN titles
on (employees.emp_no = titles.emp_no)
WHERE (employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY employees.emp_no ASC;

-- creating unique_titles
SELECT DISTINCT ON (emp_no) emp_no,first_name, last_name,title,from_date,to_date
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date Desc

-- creating retiring_titles
SELECT COUNT(emp_no),title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count(emp_no) Desc


-- Deliverable 2
SELECT DISTINCT ON(employees.emp_no) employees.emp_no,employees.first_name,employees.last_name,employees.birth_date,dept_emp.from_date,dept_emp.to_date,titles.title
INTO Mentorship_Eligibility
FROM employees
INNER JOIN dept_emp
ON (employees.emp_no = dept_emp.emp_no)
INNER JOIN titles
ON (employees.emp_no=titles.emp_no)
WHERE (employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY employees.emp_no
