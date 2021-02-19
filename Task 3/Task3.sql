/*Compare the average salary of female versus male employees in the entire company 
until year 2002, and add a filter allowing you to see that per each department. */


select e.gender, d.dept_name, Round(avg(s.salary), 2) as salary, year(s.from_date) as calendar_year
from t_salaries s
	join 
	t_employees e on s.emp_no = e.emp_no
    join
    t_dept_emp de on de.emp_no = e.emp_no
    join 
    t_departments d on d.dept_no = de.dept_no
    group by d.dept_no , e.gender, calendar_year
    having calendar_year <= 2002
    order by d.dept_no;
    
    
    


    
    
    
    
    
    
    
    

