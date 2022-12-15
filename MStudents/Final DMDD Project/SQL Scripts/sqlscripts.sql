
CREATE DATABASE mastersstudents;
use mastersstudents;

SHOW DATABASES; 

ALTER TABLE OnCampusEmployment DROP COLUMN SkillsRequired, DROP COLUMN SalaryInUSD, Drop COLUMN DurationInMonths, DROP COLUMN PostingDate, DROP COLUMN Deadline, DROP COLUMN Vacancy;

CREATE TABLE OnCampusEmploymentStats (ID INT NOT NULL PRIMARY KEY, JobID INT NOT NULL, SkillsRequired VARCHAR(100) NOT NULL, SalaryInUSD INT NOT NULL, 
DurationInMonths VARCHAR(100), PostingDate DATETIME, Deadline DATETIME, Vacancy INT);

select * from OnCampusEmploymentStats; 
show columns from OnCampusEmploymentStats;

ALTER TABLE Student DROP COLUMN IntakeSemester, DROP COLUMN IntakeYear;
ALTER TABLE Student DROP College;
ALTER TABLE Student DROP DeptName; 
select * from Student;

create table Fall (StudentID INT NOT NULL, IntakeYear INT NOT NULL, ID INT NOT NULL PRIMARY KEY);
select * from Fall;
SHOW COLUMNS FROM Spring;

ALTER TABLE Fall ADD CONSTRAINT FOREIGN KEY (StudentID) REFERENCES Student (StudentID);

create table Spring (StudentID INT NOT NULL, IntakeYear INT NOT NULL, ID INT NOT NULL PRIMARY KEY);
select * from Spring;

ALTER TABLE Spring ADD CONSTRAINT FOREIGN KEY (StudentID) REFERENCES Student (StudentID);

ALTER TABLE EventDetails ADD CONSTRAINT FOREIGN KEY (EventHeadID) REFERENCES Student (StudentID);

ALTER TABLE StudentClub ADD CONSTRAINT FOREIGN KEY (StudentID) REFERENCES Student (StudentID);

ALTER TABLE StudentOnCampus ADD CONSTRAINT FOREIGN KEY (StudentID) REFERENCES Student(StudentID);

ALTER TABLE StudentJob ADD CONSTRAINT FOREIGN KEY (StudentID) REFERENCES Student (StudentID);

ALTER TABLE Student ADD CONSTRAINT FOREIGN KEY (DeptID) REFERENCES COLLEGE (DeptID);

ALTER TABLE OnCampusEmploymentStats ADD CONSTRAINT FOREIGN KEY (JobID) REFERENCES OnCampusEmployment (JobID);

show columns from Student;
ALTER TABLE StudentJob ADD CONSTRAINT FOREIGN KEY (StudentID) REFERENCES Student (StudentID);

CREATE TABLE STUDENT (StudentID INT NOT NULL PRIMARY KEY, FirstName VARCHAR(50), LastName VARCHAR(50), Gender VARCHAR(5), DeptName VARCHAR (100), College VARCHAR(70), DeptID INT NOT NULL, FeePayment VARCHAR(5), CreditsEarned INT, IntakeSemester VARCHAR(10), IntakeYear INT);
INSERT INTO STUDENT (StudentID, FirstName, LastName, Gender, DeptName, College, DeptID, FeePayment, CreditsEarned, IntakeSemester, IntakeYear) VALUES(1951, "Joshua", "Lewis","M","Information Systems", "College of engineering", 201, "Yes",8, "Fall", 2022);
select * from student;

INSERT INTO STUDENT (StudentID, FirstName, LastName, Gender, DeptName, College, DeptID, FeePayment, CreditsEarned, IntakeSemester, IntakeYear) 
VALUES(1952, "Darshana", "Roakde","F","Information Systems", "College of engineering", 201, "Yes",8, "Fall", 2022);

CREATE TABLE COLLEGE (CollegeName varchar(100) NOT NULL, DeptName varchar(100) NOT NULL, DeptID INT NOT NULL PRIMARY KEY, DeanName varchar(100)NOT NULL);
SELECT * FROM COLLEGE;
SHOW COLUMNS FROM cOLLEGE;

INSERT INTO COLLEGE (CollegeName, DeptName, DeptID, DeanName) VALUES("College of Engineering", "Mechantronics", 221, "Kevin Pipe");

CREATE TABLE OnCampusEmployment (JobID int NOT NULL PRIMARY KEY, 
Employer VARCHAR(100) NOT NULL, Location VARCHAR(100) NOT NULL, 
SkillsRequired VARCHAR(100) NOT NULL, SalaryInUSD INT NOT NULL, 
DurationInMonths VARCHAR(100), PostingDate DATETIME, Deadline DATETIME, Vacancy INT);
SELECT * from OnCampusEmployment;

show columns from OnCampusEmployment;

INSERT INTO OncampusEmployment (JobID, Employer, Location, SkillsRequired, SalaryinUSD, DurationInMonths, PostingDate, Deadline, Vacancy) 
VALUES(324, "Office of Global Services", "Snell Engineering Center", "Fluency in English", 11, 6, '2022-11-12 20:30:00', '2022-12-23 20:30:00', 8);
 
CREATE TABLE InternshipsAndCoop 
(JobID INT NOT NULL PRIMARY KEY, JobTitle varchar(500), 
SalaryEstimateLower INT, SalaryEstimateUpper INT, JobDescription varchar(1000), 
Rating FLOAT, CompanyName VARCHAR(500), Location VARCHAR(500), HeadQuaters VARCHAR(500), 
Size varchar(100), FoundedYear INT, TypeofOwnership VARCHAR(500), Industry VARCHAR(500), 
Sector VARCHAR(500), Revenue VARCHAR(500), Competitor VARCHAR(100));

SELECT * FROM InternshipsAndCoop;
SHOW COLUMNS FROM iNTERNSHIPSaNDcOOP;

INSERT INTO InternshipsAndCoop(JobID, JobTitle, SalaryEstimateLower, SalaryEstimateUpper, JobDescription, Rating, CompanyName, Location, HeadQuaters, Size, FoundedYear, TypeOfOwnership, Industry, Sector, Revenue, Competitor)
VALUES(1483, "Data Analyst", 41000, 78000, "Job Description
 
 
 Job #: 1076450
 
 Role: Systems Analyst
 
 Location: Philadelphia, PA

 Duties:
 Analyze data from a particular business domain and define how best to organize it in support of Group's cloud data architecture runway
 Work with stakeholders to understand the domain's functional and data requirements
 Work with stakeholders to identify use cases for data consumption
 Support Data Architecture by rationalizing redundant data and developing the approach building out the Group cloud data-warehouse and analytics platforms
 Support broader architecture teams in defining a business domain's master data management approach
 Define and document the Data Lineage for a business domain
 Skills:
 7+ years of experience working in the Data or Systems Analysis field Strong SQL skills and knowledge of various database types and technologies
 Familiarity with relevant data-related AWS services S3, At", 3.8, "Apex Systems", "Philadelphia, PA", "Glen Allen, VA", "1001 to 5000 employees", 1995, "Subsidiary or Business Segment", "Staffing & Outsourcing", "Business Services", "$2 to $5 billion (USD)", "TEKsystems, Insight Global, Accenture");

CREATE TABLE EventDetails (EID Int NOT NULL PRIMARY KEY, EName varchar(100), EventHeadID INT NOT NULL, Location varchar(50), Purpose varchar(1000), Dateandtime datetime, FareinUSD int);
SELECT * FROM EventDetails;
SHOW columns from StudentClub;

INSERT INTO EventDetails(EID, EName, EventHeadID, Location, Purpose, DateandTime, FareinUSD)
VALUES(521, "Skills Bootcamp in Digital - Information Event", 1463, "Snell Eng Center", "Find out more about Northeastern University London, Skills Bootcamp in Data and Service Management; a free-to-the-participant", '2023-03-17 08:30:00', 15);

Create TABLE StudentClub (ClubID int NOT NULL primary KEY, ClubName Varchar(100), StudentID INT NOT NULL, Contacts Varchar(100), Motive varchar(1000));
select * fROM StudentClub;

INSERT INTO StudentClub (ClubID, ClubName, StudentID, Contacts, Motive) VALUES(620, "Institute of Industrial and Systems Engineers", 1212, "m.behroozi@northeastern.edu", "environment that promotes professional and academic development while collaborating with peers and networking with industry leaders.");

CREATE TABLE StudentOnCampus(StudentID INT NOT NULL , JobID INT, ID INT NOT NULL PRIMARY KEY);
SELECT * FROM StudentOnCampus;

INSERT INTO StudentOnCampus(StudentID, JobID) VALUES(108, 324);

CREATE TABLE StudentJob (StudentID INT NOT NULL UNIQUE, JobID int NOT NULL,ID INT NOT NULL PRIMARY KEY);
select * from StudentJob;
show columns from StudentOnCampus;

INSERT INTO StudentJob(StudentID, JobID) VALUES(101, 2084);

# Assignment3 Questions

select * from student order by Studentid desc;

#1 Display count of students in each department
CREATE VIEW StudentCount AS
SELECT c.DeptName, Count(s.StudentID) FROM Student s INNER JOIN College c ON s.DeptID=c.DeptID 
GROUP BY c.DeptID ORDER BY Count(s.StudentID);

SELECT * from StudentCount;

#2 Which college has more number of student head?
CREATE VIEW MaxStudentHead AS
Select c.CollegeName, Count(c.CollegeName) AS MaxStudentHead FROM College c INNER JOIN Student s ON c.DeptID=s.DeptID 
INNER JOIN StudentClub sc ON s.StudentID=sc.StudentID GROUP BY c.CollegeName; 

show full tables where table_type='VIEW';

SELECT * FROM MaxStudentHead;


# Example for question 2
SELECT c.CollegeName, s.StudentID FROM Student s INNER JOIN StudentClub sc ON s.StudentID=sc.StudentID WHERE s.College="School of Law";

#3 Number of students who got coop
CREATE VIEW StudentsOnCoop AS
SELECT sj.JobID, COUNT(s.StudentID) AS NumberOfStudents FROM Student s INNER JOIN StudentJob sj ON s.StudentID=sj.StudentID 
GROUP BY sj.JobID ORDER BY JobID;

SELECT * from StudentsOnCoop;

#4 Which department got maximum placements?
CREATE VIEW MaxPlacements AS
SELECT s.DeptID, c.DeptName, COUNT(sj.JobID) AS NumberOfStudents FROM College c INNER JOIN Student s ON c.DeptID=s.DeptID 
INNER JOIN StudentJob sj ON s.StudentID=sj.StudentID 
GROUP BY s.DeptID ORDER BY COUNT(sj.JobID) DESC;

SELECT * FROM MaxPlacements;

#5 Average salary offered to students in each department
SELECT s.DeptID, AVG(i.SalaryEstimateUpper) AS Average 
FROM Student s INNER JOIN StudentJob sj ON s.StudentID = sj.StudentID 
INNER JOIN InternshipsAndCoop i on sj.JobID = i.JobID GROUP BY s.deptid;

SELECT * FROM AvgSalary;

#6 Maximum number of JobOpenings
CREATE VIEW MaxJobOpening AS
SELECT JobID, JobTitle, MAX(mycount) AS Maximum_Number_Of_Job_Openings FROM
(SELECT COUNT(JobTitle) mycount, JobTitle, JobID FROM InternshipsAndCoop GROUP BY JobTitle) as sample;

SELECT * FROM MaxJobOpening;

#7 Job Count for each intake

-- Count for Fall Intake
CREATE VIEW FallIntakeCount AS 
SELECT COUNT(sj.StudentID) AS CountOfStudents, f.IntakeYear FROM Student s INNER JOIN StudentJob sj ON s.StudentID=sj.StudentID
INNER JOIN Fall f ON s.StudentID=f.StudentID GROUP BY f.IntakeYear; 

SELECT * FROM FallIntakeCount;

-- Count for Spring Intake
CREATE VIEW SpringIntakeCount AS
SELECT COUNT(sj.StudentID) AS CountOfStudents, sp.IntakeYear FROM Student s INNER JOIN StudentJob sj ON s.StudentID=sj.StudentID
INNER JOIN Spring sp ON s.StudentID=sp.StudentID GROUP BY sp.IntakeYear;

SELECT * FROM SpringIntakeCount;

#8 Booming Industry
CREATE VIEW BoomingIndustry AS
SELECT ic.Industry, COUNT(ic.Industry) BoomingIndustry FROM InternshipsAndCoop ic INNER JOIN StudentJob sj ON ic.JobID=sj.JobID 
GROUP BY ic.Industry ORDER BY COUNT(ic.Industry) DESC;

SELECT * FROM BoomingIndustry;

#9 Which Second Highest Salary
CREATE VIEW SecongHighestSalary AS
SELECT MAX(SalaryEstimateUpper) AS Second_Highest_Salary from InternshipsAndCoop  WHERE SalaryEstimateUpper < (SELECT Max(SalaryEstimateUpper) FROM InternshipsAndCoop);

SELECT * FROM SecongHighestSalary;

#10 Students who got internship and oncampus
CREATE VIEW StudentswithOncampusAndCoop AS
SELECT sj.StudentID FROM StudentOnCampus soc INNER JOIN StudentJob sj ON soc.StudentID=sj.StudentID;

SELECT * FROM StudentswithOncampusAndCoop;