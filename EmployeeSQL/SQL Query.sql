--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s ON
e.emp_no=s.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
select
    first_name,last_name,hire_date
from employees
where hire_date is between '12/31/1985' and '1/1/1987';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select 
    dp.dept_no, dp.dept_name, dp.emp_no, e.last_name, e.first_name
from dept_manager dp
join departments depart
    on dp.dept_no = depart.dept_no
join employees e
    on dp.emp_no = e.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
select
    e.emp_no, e.last_name, e.first_name, depart.dept_name
from employees e
join dept_manager dp
    on e.emp_no = dp.emp_no
join  departments depart 
    on dp.dept_no = depart.dept_no;
	
--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select 
    first_name,last_name, sex
from employees
where first_name = "Hercules" and last_name like 'B%'

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
select 
    emp_no, last_name, first_name, d.dept_name
from employees e
where emp_no 
    in (select emp_no
    from dept_emp de
    where dept_no  
     in (select dept_no,dept_no
     from departments d
       where dept_name = 'Sales'
        )
    )
);

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select 
    e.emp_no, e.last_name, es.first_name, departments.dept_name
from employees e
join dept_emp de
on e.emp_no = de.emp_no
join departments d
on de.dept_no = d.dept_no 
where d.dept_name = 'Sales' or d.dept_name = 'Development' ;

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(last_name) AS lnc
FROM employees
GROUP BY last_name
ORDER BY lnc desc;