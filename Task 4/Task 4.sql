/*Create an SQL stored procedure that will allow you to obtain the average male 
and female salary per department within a certain salary range. Let this range 
be defined by two values the user can insert when calling the procedure.
Finally, visualize the obtained result-set in Tableau as a double bar chart. */

use employees_mod; 
Drop procedure if exists filter_salary; 

Delimiter $$ 
Create Procedure filter_salary (IN p_min_salary FLOAT, IN p_max_salary FLOAT)
BEGIN
SELECT 
	e.gender, d.dept_name, AVG(s.salary) as avg_salary
FROM
	t_salaries s 
    JOIN
    t_employees e on s.emp_no = e.emp_no
    JOIN
    t_dept_emp de on de.emp_no = e.emp_no 
    JOIN
    t_departments d on d.dept_no = de.dept_no
    
    WHERE s.salary between p_min_salary and p_max_salary
GROUP BY d.dept_no, e.gender; 
End $$

Delimiter ;

CAll filter_salary(50000, 90000); 