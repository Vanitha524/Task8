create database Task8;

CREATE TABLE employee2 (
  emp_id INT AUTO_INCREMENT PRIMARY KEY,
  emp_name VARCHAR(50),
  department VARCHAR(50),
  salary DECIMAL(10,2)
);

INSERT INTO employee2 (emp_name, department, salary) VALUES
('John', 'HR', 45000),
('Alice', 'IT', 60000),
('Bob', 'Finance', 55000),
('David', 'IT', 70000);

DELIMITER //

CREATE PROCEDURE GetEmployees2ByDept(IN dept_name VARCHAR(50))
BEGIN
    SELECT emp_id, emp_name, salary
    FROM employee
    WHERE department = dept_name;
END //

DELIMITER ;

CALL GetEmployeesByDept('IT');

DELIMITER //

CREATE FUNCTION CalculateBonus(sal DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
   DECLARE bonus DECIMAL(10,2);
   SET bonus = sal * 0.10;
   RETURN bonus;
END //

DELIMITER ;

SELECT emp_name, salary, CalculateBonus(salary) AS bonus
FROM employee2;

