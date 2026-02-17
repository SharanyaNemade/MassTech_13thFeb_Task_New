create database Task;

use Task;

CREATE TABLE Department
(
    DeptId INT IDENTITY PRIMARY KEY,
    DeptName VARCHAR(100),
    Status VARCHAR(20)
);

select * from Department;




CREATE PROCEDURE sp_InsertDepartment
    @DeptName VARCHAR(100),
    @Status VARCHAR(20)
AS
BEGIN
    INSERT INTO Department (DeptName, Status)
    VALUES (@DeptName, @Status)
END




CREATE PROCEDURE sp_GetDepartmentById
    @DeptId INT
AS
BEGIN
    SELECT * FROM Department WHERE DeptId = @DeptId
END




select * from Department;

UPDATE Department
SET DeptName = 'HR'
WHERE DeptId = 1;




DELETE FROM Department
WHERE DeptId IN (4, 5);



create proc sp_deleteDept
@id int
as
begin
     delete from Department where @id=DeptId
end





/*-----------------------  Designation  -----------------------*/






CREATE TABLE Designation
(
    DesignationId INT IDENTITY PRIMARY KEY,
    DeptName VARCHAR(100),
    DesignationName VARCHAR(100),
    Status VARCHAR(20)
);

CREATE PROCEDURE sp_InsertDesignation
    @DeptName VARCHAR(100),
    @DesignationName VARCHAR(100),
    @Status VARCHAR(20)
AS
BEGIN
    INSERT INTO Designation (DeptName, DesignationName, Status)
    VALUES (@DeptName, @DesignationName, @Status)
END


select * from Designation;





/*-----------------------  Approve Leave  -----------------------*/



CREATE TABLE Employee
(
    EmpId INT IDENTITY PRIMARY KEY,
    EmpName VARCHAR(100) NOT NULL
);


INSERT INTO Employee (EmpName)
VALUES ('Rahul'), ('Priya'), ('Amit'), ('Sneha');


select * from Employee;


CREATE TABLE LeaveRequest
(
    LeaveId INT IDENTITY PRIMARY KEY,
    EmpId INT,
    LeaveType VARCHAR(50),
    FromDate DATE,
    ToDate DATE,
    Reason VARCHAR(250),
    Status VARCHAR(20) DEFAULT 'Pending',

    CONSTRAINT FK_Leave_Emp
    FOREIGN KEY (EmpId)
    REFERENCES Employee(EmpId)
);


select * from LeaveRequest;


CREATE PROCEDURE sp_InsertLeave
    @EmpId INT,
    @LeaveType VARCHAR(50),
    @FromDate DATE,
    @ToDate DATE,
    @Reason VARCHAR(250)
AS
BEGIN
    INSERT INTO LeaveRequest (EmpId, LeaveType, FromDate, ToDate, Reason)
    VALUES (@EmpId, @LeaveType, @FromDate, @ToDate, @Reason);
END




CREATE PROCEDURE sp_GetPendingLeaveByEmp
    @EmpId INT
AS
BEGIN
    SELECT TOP 1 L.LeaveId,
                 E.EmpName,
                 L.LeaveType,
                 L.FromDate,
                 L.ToDate,
                 L.Reason,
                 L.Status
    FROM LeaveRequest L
    INNER JOIN Employee E ON L.EmpId = E.EmpId
    WHERE L.EmpId = @EmpId
      AND L.Status = 'Pending'
    ORDER BY L.LeaveId DESC;
END




CREATE PROCEDURE sp_GetEmployeesWithPendingLeave
AS
BEGIN
    SELECT DISTINCT E.EmpId, E.EmpName
    FROM LeaveRequest L
    INNER JOIN Employee E ON L.EmpId = E.EmpId
    WHERE L.Status = 'Pending';
END




CREATE PROCEDURE sp_UpdateLeaveStatus
    @LeaveId INT,
    @Status VARCHAR(20)
AS
BEGIN
    UPDATE LeaveRequest
    SET Status = @Status
    WHERE LeaveId = @LeaveId;
END



/*-----------------------  Events  -----------------------*/


CREATE TABLE Event
(
    EventId INT IDENTITY(1,1) PRIMARY KEY,
    EventName VARCHAR(100) NOT NULL,
    Status VARCHAR(20) NOT NULL,
    Color VARCHAR(20) NOT NULL,
    CreatedDate DATETIME DEFAULT GETDATE()
);




INSERT INTO Event (EventName, Status, Color)
VALUES 
('Republic Day', 'Active', 'Orange'),
('Independence Day', 'Active', 'Green'),
('Diwali', 'Active', 'Yellow');


select * from Event;


INSERT INTO Event (EventName, Status, Color)
VALUES 
('Holi', 'Active', 'Pink'),
('Eid-ul-Fitr', 'Active', 'LightGreen'),
('Good Friday', 'Active', 'LightBlue'),
('Mahatma Gandhi Jayanti', 'Active', 'Khaki'),
('Dussehra', 'Active', 'Red'),
('Guru Nanak Jayanti', 'Active', 'Gold'),
('Christmas', 'Active', 'Crimson');





/*-----------------------  Holiday  -----------------------*/




CREATE TABLE Holiday
(
    HolidayId INT IDENTITY(1,1) PRIMARY KEY,
    EventId INT NOT NULL,
    HolidayName VARCHAR(150) NOT NULL,
    HolidayDate DATE NOT NULL,
    Status VARCHAR(20) NOT NULL,
    CreatedDate DATETIME DEFAULT GETDATE(),

    CONSTRAINT FK_Holiday_Event
    FOREIGN KEY (EventId)
    REFERENCES Event(EventId)
);



select * from Holiday;



CREATE PROCEDURE sp_InsertEvent
    @EventName VARCHAR(100),
    @Status VARCHAR(20),
    @Color VARCHAR(20)
AS
BEGIN
    INSERT INTO Event (EventName, Status, Color)
    VALUES (@EventName, @Status, @Color)
END





CREATE PROCEDURE sp_GetActiveEvents
AS
BEGIN
    SELECT EventId, EventName
    FROM Event
    WHERE Status = 'Active'
END
GO





CREATE PROCEDURE sp_InsertHoliday
    @EventId INT,
    @HolidayName VARCHAR(150),
    @HolidayDate DATE,
    @Status VARCHAR(20)
AS
BEGIN
    INSERT INTO Holiday (EventId, HolidayName, HolidayDate, Status)
    VALUES (@EventId, @HolidayName, @HolidayDate, @Status)
END
GO



CREATE PROCEDURE sp_GetAllHolidays
AS
BEGIN
    SELECT 
        h.HolidayId,
        e.EventName,
        h.HolidayName,
        h.HolidayDate,
        h.Status,
        e.Color
    FROM Holiday h
    INNER JOIN Event e ON h.EventId = e.EventId
    ORDER BY h.HolidayDate DESC
END
GO



/*-----------------------  Role  -----------------------*/



CREATE TABLE Role
(
    RoleId INT IDENTITY(1,1) PRIMARY KEY,
    RoleName VARCHAR(100) NOT NULL,
    Status VARCHAR(20) NOT NULL 
);



INSERT INTO Role (RoleName, Status)
VALUES 
('Admin', 'Active'),
('Manager', 'Active'),
('Employee', 'Active');



select * from role;




CREATE PROCEDURE sp_InsertRole
    @RoleName VARCHAR(100),
    @Status VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO RoleTable (RoleName, Status)
    VALUES (@RoleName, @Status);
END;
GO




CREATE PROCEDURE sp_GetRoles
AS
BEGIN
    SET NOCOUNT ON;

    SELECT RoleId,
           RoleName,
           Status,
           CreatedDate
    FROM RoleTable
    ORDER BY RoleId DESC;
END;
GO




CREATE PROCEDURE sp_UpdateRole
    @RoleId INT,
    @RoleName VARCHAR(100),
    @Status VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE RoleTable
    SET RoleName = @RoleName,
        Status = @Status
    WHERE RoleId = @RoleId;
END;
GO



DROP PROCEDURE IF EXISTS sp_InsertRole;
DROP PROCEDURE IF EXISTS sp_GetRoles;
DROP PROCEDURE IF EXISTS sp_UpdateRole;
GO





CREATE PROCEDURE sp_InsertRole
    @RoleName VARCHAR(100),
    @Status VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Role (RoleName, Status)
    VALUES (@RoleName, @Status);
END;
GO





CREATE PROCEDURE sp_GetRoles
AS
BEGIN
    SET NOCOUNT ON;

    SELECT RoleId,
           RoleName,
           Status
    FROM Role
    ORDER BY RoleId DESC;
END;
GO




CREATE PROCEDURE sp_UpdateRole
    @RoleId INT,
    @RoleName VARCHAR(100),
    @Status VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Role
    SET RoleName = @RoleName,
        Status = @Status
    WHERE RoleId = @RoleId;
END;
GO





/*-----------------------  AddEmp  -----------------------*/



use Task;


CREATE TABLE AddEmployees
(
    EmpId INT IDENTITY(1,1) PRIMARY KEY,
    Name Varchar(100) UNIQUE,
    Email Varchar(100) UNIQUE,
    Contact Varchar(20) UNIQUE,
    Address Varchar(200),
    Department Varchar(50),
    Designation Varchar(50),
    Role Varchar(20) ,
    Status Varchar(20),
    ProfilePhoto Varchar(200)
)



ALTER TABLE AddEmployees
ADD Manager VARCHAR(100) NULL



select * from AddEmployees;



CREATE PROCEDURE sp_InsertEmployee  
    @Name VARCHAR(100),  
    @Email VARCHAR(100),  
    @Contact VARCHAR(20),  
    @Address VARCHAR(200),  
    @Department VARCHAR(50),  
    @Designation VARCHAR(50),  
    @Role VARCHAR(20),  
    @Status VARCHAR(20),  
    @ProfilePhoto VARCHAR(200)  
AS  
BEGIN  
    INSERT INTO AddEmployees
    (
        Name,
        Email,
        Contact,
        Address,
        Department,
        Designation,
        Role,
        Status,
        ProfilePhoto
    )
    VALUES
    (
        @Name,
        @Email,
        @Contact,
        @Address,
        @Department,
        @Designation,
        @Role,
        @Status,
        @ProfilePhoto
    )
END
GO






ALTER PROCEDURE sp_InsertEmployee
(
    @Name NVARCHAR(100),
    @Email NVARCHAR(100),
    @Contact NVARCHAR(20),
    @Address NVARCHAR(255),
    @Department NVARCHAR(100) = NULL,
    @Designation NVARCHAR(100) = NULL,
    @Manager NVARCHAR(100) = NULL,
    @Role NVARCHAR(50),
    @Status NVARCHAR(50),
    @ProfilePhoto NVARCHAR(255)
)
AS
BEGIN
    INSERT INTO AddEmployees
    (
        Name,
        Email,
        Contact,
        Address,
        Department,
        Designation,
        Manager,
        Role,
        Status,
        ProfilePhoto
    )
    VALUES
    (
        @Name,
        @Email,
        @Contact,
        @Address,
        @Department,
        @Designation,
        @Manager,
        @Role,
        @Status,
        @ProfilePhoto
    )
END
GO






CREATE PROCEDURE sp_GetAllEmployee
AS
BEGIN
    SELECT * FROM AddEmployees
END





CREATE PROCEDURE sp_GetEmployeeById
    @EmpId INT
AS
BEGIN
    SELECT * FROM Employee WHERE EmpId = @EmpId
END




CREATE PROCEDURE sp_UpdateEmployee
    @EmpId INT,
    @Name VARCHAR(100),
    @Email VARCHAR(100),
    @Contact VARCHAR(20),
    @Address VARCHAR(200),
    @Department VARCHAR(50),
    @Designation VARCHAR(50),
    @Role VARCHAR(20),
    @Status VARCHAR(20),
    @ProfilePhoto VARCHAR(200)
AS
BEGIN
    UPDATE AddEmployees
    SET Name=@Name,
        Email=@Email,
        Contact=@Contact,
        Address=@Address,
        Department=@Department,
        Designation=@Designation,
        Role=@Role,
        Status=@Status,
        ProfilePhoto=@ProfilePhoto
    WHERE EmpId=@EmpId
END





