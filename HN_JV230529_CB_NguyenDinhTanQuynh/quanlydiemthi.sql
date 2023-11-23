# Tạo cơ sở dữ liệu
CREATE DATABASE QUANLYDIEMTHI;
USE QUANLYDIEMTHI;
CREATE TABLE STUDENT
(
    studentId   VARCHAR(4) PRIMARY KEY NOT NULL,
    studentName VARCHAR(100)           NOT NULL,
    birthday    DATE                   NOT NULL,
    gender      BIT(1)                 NOT NULL,
    address     TEXT                   NOT NULL,
    phoneNumber VARCHAR(45) UNIQUE
);

CREATE TABLE SUBJECT
(
    subjectId   VARCHAR(4) PRIMARY KEY NOT NULL,
    subjectName VARCHAR(45)            NOT NULL,
    priority    INT(11)                NOT NULL
);

CREATE TABLE  MARK
(
    subjectId VARCHAR(4) NOT NULL,
    CONSTRAINT fk_sbid_mark FOREIGN KEY (subjectId) REFERENCES SUBJECT (subjectId),
    studentId VARCHAR(4) NOT NULL,
    CONSTRAINT fk_stid_mark FOREIGN KEY (studentId) REFERENCES STUDENT (studentId),
    point     DOUBLE
);

INSERT INTO STUDENT
VALUES ('S001', 'Nguyễn Thế Anh', '1999/1/11', 1, 'Hà Nội', 984678082),
       ('S002', 'Đặng Bảo Trâm', '1998/12/22', 0, 'Lào Cai', 904982654),
       ('S003', 'Trần Hà Phương', '2000/5/5', 0, 'Nghệ An', 947645363),
       ('S004', 'Đỗ Tiến Mạnh', '1999/3/26', 1, 'Hà Nội', 983665353),
       ('S005', 'Phạm Duy Nhất', '1998/10/4', 1, 'Tuyên Quang', 978242678),
       ('S006', 'Mai Văn Thái', '2002/6/22', 1, 'Nam Định', 982654268),
       ('S007', 'Giang Gia Hân', '1996/11/10', 0, 'Phú Thọ', 982364753),
       ('S008', 'Nguyễn Ngọc Bảo My', '1999/1/22', 0, 'Hà Nam', 927867453),
       ('S009', 'Nguyễn Tiến Đạt', '1998/8/7', 1, 'Tuyên Quang', 989274673),
       ('S010', 'Nguyễn Thiều Quang', '2000/9/18', 1, 'Hà Nội', 984378291);
       
INSERT INTO SUBJECT
VALUES ('MH01', 'Toán', 2),
       ('MH02', 'Vật Lý', 2),
       ('MH03', 'Hóa Học', 1),
       ('MH04', 'Ngữ Văn', 1),
       ('MH05', 'Tiếng Anh', 2);

INSERT INTO MARK
VALUES ('MH01', 'S001', 8.5),
       ('MH02', 'S001', 7),
       ('MH03', 'S001', 9),
       ('MH04', 'S001', 9),
       ('MH05', 'S001', 5),

       ('MH01', 'S002', 9),
       ('MH02', 'S002', 8),
       ('MH03', 'S002', 6.5),
       ('MH04', 'S002', 8),
       ('MH05', 'S002', 6),

       ('MH01', 'S003', 7.5),
       ('MH02', 'S003', 6.5),
       ('MH03', 'S003', 8),
       ('MH04', 'S003', 7),
       ('MH05', 'S003', 7),

       ('MH01', 'S004', 6),
       ('MH02', 'S004', 7),
       ('MH03', 'S004', 5),
       ('MH04', 'S004', 6.5),
       ('MH05', 'S004', 8),

       ('MH01', 'S005', 5.5),
       ('MH02', 'S005', 8),
       ('MH03', 'S005', 7.5),
       ('MH04', 'S005', 8.5),
       ('MH05', 'S005', 9),

       ('MH01', 'S006', 8),
       ('MH02', 'S006', 10),
       ('MH03', 'S006', 9),
       ('MH04', 'S006', 7.5),
       ('MH05', 'S006', 6.5),

       ('MH01', 'S007', 9.5),
       ('MH02', 'S007', 9),
       ('MH03', 'S007', 6),
       ('MH04', 'S007', 9),
       ('MH05', 'S007', 4),

       ('MH01', 'S008', 10),
       ('MH02', 'S008', 8.5),
       ('MH03', 'S008', 8.5),
       ('MH04', 'S008', 6),
       ('MH05', 'S008', 9.5),

       ('MH01', 'S009', 7.5),
       ('MH02', 'S009', 7),
       ('MH03', 'S009', 9),
       ('MH04', 'S009', 5),
       ('MH05', 'S009', 10),

       ('MH01', 'S010', 6.5),
       ('MH02', 'S010', 8),
       ('MH03', 'S010', 5.5),
       ('MH04', 'S010', 4),
       ('MH05', 'S010', 7);
--  2. Cập nhật giữ liệu     
-- .Sửa tên sinh viên có mã 'S004' thành 'Đỗ Đức Mạnh'
UPDATE STUDENT
SET studentName = 'Đỗ Đức Mạnh'
WHERE studentId = 'S004';
--   ktra 
-- SELECT * FROM STUDENT WHERE studentId = 'S004'

  --  Sửa tên và hệ số môn học có mã `MH05` thành “NgoạiNgữ” và hệ số là 1
   UPDATE SUBJECT
SET subjectName = 'Ngoại Ngữ'
WHERE subjectId = 'MH05';   
--   ktra 
-- SELECT * FROM SUBJECT WHERE subjectId = 'MH05'

--  Cập nhật lại điểm của học sinh có mã `S009` thành (MH01 : 8.5, MH02 : 7,MH03 : 5.5, MH04 : 6, MH05 : 9).
UPDATE MARK
SET point = 8.5
WHERE subjectId = 'MH01'
  AND studentId = 'S009';
UPDATE MARK
SET point = 7
where subjectId = 'MH02'
  AND studentId = 'S009';
UPDATE MARK
SET point = 5.5
WHERE subjectId = 'MH03'
  AND studentId = 'S009';
UPDATE MARK
SET point = 6
WHERE subjectId = 'MH04'
  AND studentId = 'S009';
UPDATE MARK
SET point = 9
WHERE subjectId = 'MH05'
  AND studentId = 'S009';
  --   ktra 
-- SELECT * FROM MARK 

  # 3. Xoá dữ liệu
--   Xoá toàn bộ thông tin của học sinh có mã `S010` bao gồm điểm thi ở bảng MARK và thông tin học sinh này ở bảng STUDENT.
  DELETE
FROM MARK
WHERE studentId = 'S010';
DELETE
FROM STUDENT
WHERE studentId = 'S010';
  --   ktra 
-- SELECT * FROM STUDENT 

-- Bài 3: Truy vấn dữ liệu
-- 1. Lấy ra tất cả thông tin của sinh viên trong bảng Student-- 
  SELECT * FROM STUDENT;

-- 2. Hiển thị tên và mã môn học của những môn có hệ số bằng 1.
SELECT subjectName AS 'Tên môn học', subjectId AS 'Mã môn học'
FROM SUBJECT
WHERE priority = 1;
-- 3. Hiển thị thông tin học sinh bào gồm: mã học sinh, tên học sinh, tuổi (bằng năm hiện tại trừ
-- năm sinh) , giới tính (hiển thị nam hoặc nữ) và quê quán của tất cả học sinh.
SELECT studentId                                       AS 'Mã học sinh',
       studentName                                     AS 'Tên học sinh',
       (timestampdiff(YEAR, birthday, current_date))   AS 'Tuổi',
       (CASE WHEN gender = 0 THEN 'Nữ' ELSE 'Nam' END) AS 'Giới tính',
       address                                         AS 'Quê quán'
FROM STUDENT;

-- 4. Hiển thị thông tin bao gồm: tên học sinh, tên môn học , điểm thi của tất cả học sinh của môn Toán và sắp xếp theo điểm giảm dần.

SELECT STUDENT.studentName AS 'Tên học sinh', SUBJECT.subjectName AS 'Tên môn học', MARK.point AS 'Điểm'
FROM STUDENT
         JOIN MARK ON STUDENT.studentId = MARK.studentId
         JOIN SUBJECT ON MARK.subjectId = SUBJECT.subjectId
WHERE SUBJECT.subjectId = 'MH01'
ORDER BY MARK.point DESC;

-- 5. Thống kê số lượng học sinh theo giới tính ở trong bảng (Gồm 2 cột: giới tính và số lượng).
SELECT (CASE WHEN gender = 0 THEN 'Nữ' ELSE 'Nam' END) AS 'Giới tính', count(*) AS 'Số lượng'
FROM STUDENT
GROUP BY gender;

--  6.Tính tổng điểm và điểm trung bình của các môn học theo từng học sinh (yêu cầu sử dụng hàm để tính toán) , bảng gồm mã học sinh, tên hoc sinh, tổng điểm và điểm trung bình. 

SELECT STUDENT.studentId                                                     AS 'Mã học sinh',
       STUDENT.studentName                                                   AS 'Tên học sinh',
       sum(MARK.point * SUBJECT.priority)                                    AS 'Tổng điểm',
       FORMAT(sum(MARK.point * SUBJECT.priority) / sum(SUBJECT.priority), 2) AS 'Điểm trung bình'
FROM STUDENT
         JOIN MARK ON STUDENT.studentId = MARK.studentId
         JOIN SUBJECT ON MARK.subjectId = SUBJECT.subjectId
GROUP BY STUDENT.studentId;

-- Bài 4: Tạo View, Index, Procedure
-- 1.Tạo VIEW có tên STUDENT_VIEW lấy thông tin sinh viên bao gồm : mã học sinh, tên học sinh, giới tính , quê quán
CREATE VIEW STUDENT_VIEW AS
SELECT studentId                                       AS 'Mã học sinh',
       studentName                                     AS 'Tên học sinh',
       (CASE WHEN gender = 0 THEN 'Nữ' ELSE 'Nam' END) AS 'Giới tính',
       address                                         AS 'Quê quán'
FROM STUDENT;
-- ktra
-- SELECT * FROM STUDENT_VIEW

-- 2. Tạo VIEW có tên AVERAGE_MARK_VIEW lấy thông tin gồm:mã học sinh, tên học sinh, điểm trung bình các môn học
CREATE VIEW AVERAGE_MARK_VIEW AS
SELECT STUDENT.studentId                                                     AS 'Mã học sinh',
       STUDENT.studentName                                                   AS 'Tên học sinh',
       FORMAT(sum(MARK.point * SUBJECT.priority) / sum(SUBJECT.priority), 2) AS 'Điểm trung bình'
FROM STUDENT
         JOIN MARK ON STUDENT.studentId = MARK.studentId
         JOIN SUBJECT ON MARK.subjectId = SUBJECT.subjectId
GROUP BY STUDENT.studentId;
-- ktra
-- SELECT * FROM AVERAGE_MARK_VIEW

-- 3. Đánh Index cho trường `phoneNumber` của bảng STUDENT. 
CREATE INDEX idx_phoneNumber ON STUDENT (phoneNumber);

-- 4. Tạo các PROCEDURE sau:
-- - Tạo PROC_INSERTSTUDENT dùng để thêm mới 1 học sinh bao gồm tất cả thông tin học sinh đó
DELIMITER //
CREATE PROCEDURE PROC_INSERTSTUDENT(IN sId VARCHAR(4), IN sName VARCHAR(100), IN bd DATE, IN gen BIT(1), IN addr TEXT,
                                    IN phone VARCHAR(45))
BEGIN
    INSERT INTO STUDENT
    VALUES (sId, sName, bd, gen, addr, phone);
END;
//
DELIMITER ;
-- ktra
--  CALL PROC_INSERTSTUDENT ('S011', 'Tan QUynh', '2000/01/01', 0, 'Hà Nội', 787656397)
-- SELECT * FROM STUDENT

-- - Tạo PROC_UPDATESUBJECT dùng để cập nhật tên môn học theo mã môn học.
DELIMITER //
CREATE PROCEDURE PROC_UPDATESUBJECT(IN sId VARCHAR(4), IN sName VARCHAR(45))
BEGIN
    UPDATE SUBJECT
    SET subjectName = sName
    WHERE subjectId = sId;
END;
//
DELIMITER ;
-- ktra
-- CALL PROC_UPDATESUBJECT('MH02', 'Lịch sử')
-- SELECT * FROM SUBJECT


-- - Tạo PROC_DELETEMARK dùng để xoá toàn bộ điểm các môn học theo mã họC sinh và trả về số bản ghi đã xóa.
DELIMITER //
CREATE PROCEDURE PROC_DELETEMARK(IN sId VARCHAR(4), OUT deletedRow INT)
BEGIN
    SELECT count(*) INTO deletedRow FROM MARK WHERE studentId = sId;
    DELETE FROM MARK WHERE studentId = sId;
END; //
DELIMITER ;
# KTRA 
-- CALL PROC_DELETEMARK( 'S001', @deletedRowsCount)
-- SELECT @deletedRowsCount as 'Số bản ghi đã xóa'

