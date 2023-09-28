
--!!�������!!



--1 ���������� �������������� ������� "Software Development":
SELECT COUNT(*) AS NumberOfTeachers
FROM Teachers
WHERE Id IN (SELECT TeacherId
             FROM Departments
             JOIN Groups ON Departments.Id = Groups.DepartmentId
             JOIN Lectures ON Groups.Id = Lectures.GroupId
             JOIN Teachers ON Lectures.TeacherId = Teachers.Id
             WHERE Departments.Name = 'Software Development');

--2 ���������� ������, ������� ������ ������������� �Dave McQueen�:
SELECT COUNT(*) AS NumberOfLectures
FROM Lectures
WHERE TeacherId = (SELECT Id
                   FROM Teachers
                   WHERE Name = 'Dave McQueen');

--3 ���������� �������, ���������� � ��������� �D201�:
SELECT COUNT(*) AS NumberOfLectures
FROM Lectures
WHERE LectureRoom = 'D201';

--4 �������� ��������� � ���������� ������, ���������� � ���:
SELECT LectureRoom, COUNT(*) AS NumberOfLectures
FROM Lectures
GROUP BY LectureRoom;

--5 ���������� ���������, ���������� ������ ������������� �Jack Underhill�:
SELECT COUNT(DISTINCT Groups.Id) AS NumberOfStudents
FROM Lectures
JOIN Teachers ON Lectures.TeacherId = Teachers.Id
JOIN Subjects ON Lectures.SubjectId = Subjects.Id
JOIN GroupsLectures ON Lectures.Id = GroupsLectures.LectureId
JOIN Groups ON GroupsLectures.GroupId = Groups.Id
WHERE Teachers.Name = 'Jack Underhill';

--6 ������� ������ �������������� ���������� �Computer Science�:
SELECT AVG(Salary) AS AverageSalary
FROM Teachers
WHERE Id IN (SELECT DISTINCT TeacherId
             FROM Lectures
             JOIN Subjects ON Lectures.SubjectId = Subjects.Id
             JOIN Departments ON Subjects.Id = Departments.Id
             JOIN Faculties ON Departments.FacultyId = Faculties.Id
             WHERE Faculties.Name = 'Computer Science');

--7 ����������� � ������������ ���������� ��������� ����� ���� �����:
SELECT MIN(StudentsCount) AS MinStudentsCount, MAX(StudentsCount) AS MaxStudentsCount
FROM (SELECT Groups.Id, COUNT(*) AS StudentsCount
      FROM Groups
      JOIN Students ON Groups.Id = Students.GroupId
      GROUP BY Groups.Id) AS StudentCounts;

--8 ������� ���� �������������� ������:
SELECT AVG(Financing) AS AverageFinancing
FROM Departments;

--9 ������ ����� �������������� � ���������� �������� ��� ���������:
SELECT CONCAT(Name, ' ', Surname) AS FullName, COUNT(DISTINCT Subjects.Id) AS NumberOfSubjects
FROM Teachers
JOIN Lectures ON Teachers.Id = Lectures.TeacherId
JOIN Subjects ON Lectures.SubjectId = Subjects.Id
GROUP BY Teachers.Id, Name, Surname;

--10 ���������� ������ � ������ ���� ������:
SELECT DayOfWeek, COUNT(*) AS NumberOfLectures
FROM Lectures
GROUP BY DayOfWeek;

--11 ������ ��������� � ���������� ������, ��� ������ � ��� ��������:
SELECT LectureRoom, COUNT(DISTINCT Departments.Id) AS NumberOfDepartments
FROM Lectures
JOIN Subjects ON Lectures.SubjectId = Subjects.Id
JOIN Departments ON Subjects.Id = Departments.Id
GROUP BY LectureRoom;

--12 �������� ����������� � ���������� ���������, ������� �� ��� ��������:
SELECT Faculties.Name, COUNT(DISTINCT Subjects.Id) AS NumberOfSubjects
FROM Departments
JOIN Subjects ON Departments.Id = Subjects.Id
JOIN Faculties ON Departments.FacultyId = Faculties.Id
GROUP BY Faculties.Name;

--13 ���������� ������ ��� ������ ���� �������������-���������:
SELECT CONCAT(Teachers.Name, ' ', Teachers.Surname) AS TeacherName, LectureRoom, COUNT(*) AS NumberOfLectures
FROM Lectures
JOIN Teachers ON Lectures.TeacherId = Teachers.Id
GROUP BY TeacherName, LectureRoom;
