use md3_03_csdlquanlysinhvien;


/*Sử dụng hàm count để hiển thị số lượng sinh viên ở từng nơi */
select Address, count(StudentId)  AS 'Số lượng học viên'
FROM Student
GROUP BY Address;

/*Tính điểm trung bình các môn học của mỗi học viên bằng cách sử dụng hàm AVG*/
SELECT S.StudentId,S.StudentName,avg(Mark)
From Student S
join Mark M on S.StudentId=M.StudentId
group by S.StudentId,S.StudentName;

/*Sử dụng having để xét điều kiện điểm trung bình các môn học phải lớn hơn 15*/
SELECT S.StudentId,S.StudentName,avg(Mark)
From Student S
join Mark M on S.StudentId=M.StudentId
group by S.StudentId,S.StudentName
having avg(Mark)>15;

/* Hiển thị danh sách điểm trung bình của các học viên*/
SELECT S.StudentId,S.StudentName,avg(Mark)
From Student S
join Mark M on S.StudentId=M.StudentId
group by S.StudentId,S.StudentName;

/*Sử dụng Having và All để tìm học viên có điểm trung bình lớn nhất */
SELECT S.StudentId, S.StudentName, AVG(Mark)
FROM Student S join Mark M on S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName
HAVING AVG(Mark) >= ALL (SELECT AVG(Mark) FROM Mark GROUP BY Mark.StudentId);