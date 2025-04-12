CREATE DATABASE company;
USE company;

CREATE TABLE Department (
    DeptID INT AUTO_INCREMENT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Employees (
    EmpID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE EmployeeSalaryDistribution (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    EmpID INT NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (EmpID) REFERENCES Employees(EmpID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE EmployeeHighSalary (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    EmpID INT NOT NULL,
    HighSalary DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (EmpID) REFERENCES Employees(EmpID) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Department (DeptName)
VALUES
('HR'),
('Engineering'),
('Sales'),
('Marketing');

INSERT INTO Employees (Name, Salary, DeptID)
VALUES
('Muzahid', 120000, 2),
('Hapang', 95000, 3),
('Sazib', 105000, 1),
('Dibbendu', 85000, 4),
('Rinku', 80000, 1);

INSERT INTO EmployeeSalaryDistribution (EmpID, Department, Salary)
VALUES
(1, 'Engineering', 120000),
(2, 'Sales', 95000),
(3, 'HR', 105000),
(4, 'Marketing', 85000);

INSERT INTO EmployeeHighSalary (EmpID, HighSalary)
SELECT EmpID, Salary
FROM EmployeeSalaryDistribution
WHERE Salary > 100000;

SELECT * FROM Employees;

SELECT * FROM Department;

SELECT * FROM EmployeeSalaryDistribution;

SELECT * FROM EmployeeHighSalary;

DESCRIBE EmployeeHighSalary;



