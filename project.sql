create database project;

use project;
create table employee(
emp_id int not null auto_increment,
emp_name varchar(30) not null,
gender varchar(3),
check (gender = 'nam' or gender = 'nữ'),
dob datetime,
emp_address varchar(100),
emp_phone varchar(12),
email varchar(30),
join_date date,
primary key (emp_id)
);


create table department(
dept_id char(4) not null,
dept_name varchar(30) not null,
dept_address varchar(20),
dept_phone char(10),
primary key (dept_id)
);


create table titles(
emp_id int not null,
title varchar(50) not null,
start_date datetime not null,
end_date datetime,
primary key (emp_id, title, start_date),
constraint fk_id_of_emp foreign key (emp_id) references employee(emp_id)
on delete cascade
on update cascade
); 


create table training(
course_id char(4) not null,
course_name varchar(200) not null,
primary key (course_id)
);


create table train_emp (
course_id char(4) not null,
emp_id int not null,
duration varchar(10),
primary key (emp_id, course_id),
constraint fk_emp foreign key(emp_id) references employee(emp_id)
on delete cascade
on update cascade,
constraint fk_course foreign key(course_id) references training(course_id)
);


create table salary (
emp_id int not null,
start_date date not null,
end_date date,
basic_salary float,
primary key (emp_id, start_date),
constraint fk_empid foreign key (emp_id) references employee(emp_id)
on delete cascade
on update cascade
);


create table education (
emp_id int not null,
institution varchar(40),
education_level varchar(30),
major varchar(30),
primary key (emp_id),
constraint fk_emp_id foreign key (emp_id) references employee(emp_id)
on delete cascade
on update cascade
);


create table contract (
contract_id char(10) not null,
contract_name varchar(20) not null,
primary key (contract_id)
);


create table contract_of_emp (
contract_id char(10) not null,
emp_id int not null,
start_date datetime not null,
end_date datetime,
primary key (contract_id, emp_id, start_date),
foreign key (contract_id) references contract(contract_id),
foreign key (emp_id) references employee(emp_id)
on delete cascade
on update cascade
);



create table judgement (
emp_id int not null,
period datetime not null,
performance varchar(50),
recommendation varchar(200),
primary key (emp_id, period),
foreign key(emp_id) references employee(emp_id)
on delete cascade
on update cascade
);



create table day_off (
emp_id int not null,
category varchar(30) not null,
start_dayoff_date datetime not null,
end_dayoff_date datetime,
primary key (emp_id, category, start_dayoff_date),
foreign key(emp_id) references employee(emp_id)
on delete cascade
on update cascade
); 


create table dept_emp (
emp_id int not null,
dept_id char(4) not null,
start_date datetime,
end_date datetime,
primary key (emp_id, dept_id),
foreign key (emp_id) references employee(emp_id)
on delete cascade
on update cascade,
foreign key (dept_id) references department(dept_id)
);

create table dept_manager (
dept_id char(4) not null,
emp_id int not null,
start_date date, 
end_date date,
primary key (dept_id, emp_id),
foreign key (dept_id) references department(dept_id),
foreign key (emp_id) references employee(emp_id)
on delete cascade
on update cascade
);

INSERT INTO department (dept_id, dept_name, dept_address, dept_phone) VALUES
('MG01', 'Phòng Quản lý', 'P101', '0912000001'),
('HR02', 'Phòng Nhân sự', 'P102', '0912000002'),
('AC03', 'Phòng Kế toán','P103','0912000003'),
('MK04','Phòng Marketing','P104','0912000004'),
('CS05','Phòng Chăm sóc Khách hàng','P105','0912000005'),
('RD06','Phòng Nghiên cứu và Phát triển','P106','0912000006'),
('QA07','Phòng Kiểm thử (QA/QC)','P107','0912000007'),
('LC08','Phòng Pháp chế','P108','0912000008');

INSERT INTO training (course_id, course_name) VALUES
('CR01','Lập trình Web Nâng cao'),
('CR02','Thiết kế UX/UI'),
('CR03','Quản lý thời gian'),
('CR04','Bảo mật Thông tin'),
('CR05','Phát triển Ứng dụng Di động'),
('CR06','Chứng chỉ Kiểm toán viên nội bộ (CIA)'),
('CR07', 'Quản lý kỹ năng xã hội'),
('CR08', 'Chuyên Ngành Tiếp Thị Số'),
('CR09','Những Nền Tảng tất yếu của Chiến Lược Kinh Doanh');


INSERT INTO contract (contract_id, contract_name) VALUES
('CT1','Hợp đồng chính thức'),
('CT2','Hợp đồng thử việc'),
('CT3','Hợp đồng thực tập');

INSERT INTO employee (emp_name, gender, dob, emp_address, emp_phone, email, join_date) VALUES
('Nguyễn Văn An','Nam','1970-01-15','119 Hoàng Mai, Hà Nội','0912000001','nguyenvanan@example.com','2023-03-01'),
('Trần Thị Bình','Nữ','1975-05-20','Hàng Bài Hoàn Kiếm, Hà Nội','0912000002','tranthibinh@gmail.com','2023-03-01'),
('Lê Văn Châu','Nam','1980-09-30','Yên Hòa, Cầu Giấy, Hà Nội','0912000003','levanchau@gmail.com','2023-03-01'),
('Nguyễn Thị Diễm','Nữ','2000-03-14','Nguyễn An Ninh, Hoàng Mai, Hà Nội','0956781647','nguyenthidiem@gmail.com','2023-05-01'),
('Vũ Văn Em','Nam','2001-03-26','Lê Thanh Nghị, Hai Bà Trưng, Hà Nội','09518846159','vuvanem@gmail.com','2023-07-01'),
('Trần Minh Phước','Nam','1999-05-26','Bạch Mai, Hai Bà Trưng, Hà Nội','05146466897','tranminhphuoc@gmail.com','2023-09-01'),
('Nguyễn Trung Giang','Nam','2001-01-26','Đại La, Hai Bà Trưng, Hà Nội','06148594264','nguyentrunggiang@gmail.com','2023-09-01'),
('Lê Thị Hồng','Nữ','1998-01-19','Minh Khai, Hai Bà Trưng, Hà Nội','0918468957','lethihong@gmail.com','2023-03-01'),
('Nguyễn Thu In','Nữ','2001-09-15','Thụy Khê, Tây Hồ, Hà Nội','09516284159','nguyenthuin@gmail.com','2023-12-01'),
('Nguyễn Thị Minh Khánh','Nữ','2000-06-06','Láng Thượng, Đống Đa, Hà Nội','09152689647','nguyenthiminhkhánh@gmail.com','2024-02-01'),
('Nguyễn Vũ Linh','Nữ','2001-01-29','Yên Hòa, Cầu Giấy, Hà Nội','09532891537','nguyenvulinh@gmail.com','2024-02-01'),
('Nguyễn Lê Mạnh','Nam','2000-02-22','Đồng Tâm, Hai Bà Trưng, Hà Nội','02485162489','nguyenlemanh@gmail.com','2023-10-01'),
('Nguyễn Thị Nhung','Nữ','1998-03-29','Phương Liệt, Thanh Xuân, Hà Nội','05893354876','nguyenthinhung@gmail.com','2023-11-01'),
('Lê Quang Ông','Nam','1999-05-26','Định Công, Thanh Xuân, Hà Nội','0911139585','lequangong@gmail.com','2023-12-01'),
('Hàn Mạc Phong','Nữ','2000-06-13','Cự Khôi, Long Biên, Hà Nội','09948256813','hanmacphong@gmail.com','2024-01-01'),
('Vũ Hán Quân','Nam','2001-08-16','Xuân Tảo, Từ Liêm, Hà Nội','0965898989','vuhanquan@gmail.com','2024-02-01' ),
('Tống Duy Thái','Nam','2001-10-06','Phạm Đình Hổ, Hai Bà Trưng, Hà Nội','0455754658','tongduyThai@gmail.com','2024-03-01' ),
('Hoàng Mai Lan', 'Nữ', '1995-06-23', 'Đại Mỗ, Bắc Từ Liêm, Hà Nội', '0912345695', 'hoangmailan@gmail.com', '2023-06-03'),
('Phan Minh Tuấn', 'Nam', '1995-07-02', 'Bình Hiên, Hải Châu, Đà Nẵng', '0912345696', 'phanminhtuan@gmail.com', '2023-07-04'),
('Trần Phương Nga', 'Nữ', '1989-08-11', 'Hòa An, Cẩm Lệ, Đà Nẵng', '0912345697', 'tranphuongnga@gmail.com', '2023-04-01'),
('Lê Anh Đức', 'Nam', '1993-09-10', 'Bình An, Dĩ An, Bình Dương', '0912345698', 'leanhduc@gmail.com', '2023-09-02'),
('Nguyễn Thị Hảo', 'Nữ', '1991-10-29', 'Phú Trung, Tân Phú, Hồ Chí Minh', '0912345699', 'nguyenthihao@gmail.com', '2023-10-09'),
('Đặng Minh Hùng', 'Nam', '1989-11-18', 'Lạc Long, Kinh Môn, Hải Dương', '0912345700', 'dangminhhung@gmail.com', '2023-11-04'),
('Hoàng Thị Thơ', 'Nữ', '1997-12-07', 'Long Hòa, Bình Thủy, Cần Thơ', '0912345701', 'hoangthitho@gmail.com', '2023-12-09'),
('Phan Văn Tiến', 'Nam', '1995-01-26', 'Đông Khê, Ngô Quyền, Hải Phòng', '0912345702', 'phanvantien@gmail.com', '2024-01-04'),
('Nguyễn Thị Hiền', 'Nữ', '1993-02-14', 'Trung Hà, Thủy Nguyên, Hải Phòng', '0912345703', 'nguyenthihien@gmail.com', '2024-02-04'),
('Trần Văn Đăng', 'Nam', '1991-03-03', 'Nam Dương, Hải Châu, Đà Nẵng', '0912345704', 'tranvandang@gmail.com', '2023-03-07'),
('Đỗ Thị Lương', 'Nữ', '1988-04-22', 'Lê Lợi, Hạ Long, Quảng Ninh', '0912345705', 'dothiluong@gmail.com', '2023-04-08'),
('Lê Văn An', 'Nam', '1994-05-31', 'Đồng Tiến, Phổ Yên, Thái Nguyên', '0912345706', 'levanan@gmail.com', '2023-05-03'),
('Hoàng Thị Huệ', 'Nữ', '1996-06-20', 'Nghĩa Điền, Tư Nghĩa, Quảng Ngãi', '0912345707', 'hoangthihue@gmail.com', '2023-06-01'),
('Nguyễn Văn Hải', 'Nam', '1990-07-09', 'Bảo Hòa, Xuân Lộc, Đồng Nai', '0912345708', 'nguyenvanhai@gmail.com', '2023-03-05'),
('Trần Thanh Thu', 'Nữ', '1988-08-18', 'Mỹ Phú, Cao Lãnh, Đồng Tháp', '0912345709', 'tranthanhthu@gmail.com', '2023-04-01'),
('Đào Văn Tuấn', 'Nam', '1993-09-27', 'Phước Thái, Long Thành, Đồng Nai', '0912345710', 'daovantuan@gmail.com', '2023-06-05'),
('Phạm Thị Hà', 'Nữ', '1991-10-06', 'Hòa Hải, Hương Khê, Hà Tĩnh', '0912345711', 'phamthiha@gmail.com', '2023-03-09'),
('Lê Văn Tùng', 'Nam', '1989-11-15', 'Tam Hiệp, Thanh Trì, Hà Nội', '0912345712', 'levantung@gmail.com', '2023-11-04'),
('Nguyễn Thị Nga', 'Nữ', '1992-12-24', 'Hưng Đạo, Dương Kinh, Hải Phòng', '0912345713', 'nguyenthinga@gmail.com', '2023-11-01'),
('Hoàng Hải Phú', 'Nam', '1990-01-02', 'Minh Trí, Sóc Sơn, Hà Nội', '0912345714', 'hoanghaiphu@gmail.com', '2023-04-01'),
('Phạm Thị Hợp', 'Nữ', '1988-02-11', 'Phú Đô, Phú Lương, Thái Nguyên', '0912345715', 'phamthihop@gmail.com', '2023-03-01'),
('Trần Minh Hải', 'Nam', '1993-03-22', 'Đông Sơn, Thủy Nguyên, Hải Phòng', '0912345716', 'tranminhhai@gmail.com', '2023-04-01'),
('Đỗ Hương Lan', 'Nữ', '1991-04-11', 'Bạch Hà, Yên Bình, Yên Bái', '0912345717', 'dohuonglan@gmail.com', '2023-04-05'),
('Nguyễn Văn Thành', 'Nam', '1989-05-30', 'Anh Dũng, Dương Kinh, Hải Phòng', '0912345718', 'nguyenvanthanh@gmail.com', '2023-05-04'),
('Trần Thanh Hằng', 'Nữ', '1991-06-08', 'Ngọc Hồi, Thanh Trì, Hà Nội', '0912345719', 'tranthanhhang@gmail.com', '2023-06-08'),
('Lê Văn Đạo', 'Nam', '1993-07-17', 'Bình Minh, Thăng Bình, Quảng Nam', '0912345720', 'levandao@gmail.com', '2023-07-09'),
('Hoàng Thị Hạnh', 'Nữ', '1987-08-26', 'Mỹ Thới, Long Xuyên, An Giang', '0912345721', 'hoangthihanh@gmail.com', '2023-08-01'),
('Phạm Văn Mạnh', 'Nam', '1995-09-04', 'Phú Lương, Hà Đông, Hà Nội', '0912345722', 'phamvanmanh@gmail.com', '2023-08-01'),
('Nguyễn Thị Huyền', 'Nữ', '1993-10-13', 'An Bình, Châu Thành, Tây Ninh', '0912345723', 'nguyenthihuyen@gmail.com', '2023-10-01'),
('Vũ Văn Hòa', 'Nam', '1991-11-22', 'Cổ Bi, Gia Lâm, Hà Nội', '0912345724', 'vuvanhoa@gmail.com', '2023-11-01'),
('Lê Thị Liên', 'Nữ', '1989-12-31', 'Đặng Xá, Gia Lâm, Hà Nội', '0912345725', 'lethilien@gmail.com', '2023-11-01'),
('Phan Văn Thế', 'Nam', '1994-01-10', 'Trâu Quỳ, Gia Lâm, Hà Nội', '0912345726', 'phanvanthe@gmail.com', '2023-12-01'),
('Trần Thị Tuyết', 'Nữ', '1992-02-19', 'Hương Xuân, Nha Trang, Khánh Hòa', '0912345727', 'tranthituyet@gmail.com', '2023-12-02');

INSERT INTO titles (emp_id, title, start_date, end_date) VALUES
(1,'Tổng Giám đốc','2023-03-01', NULL),
(2,'Giám đốc','2023-03-01', NULL),
(3,'Phó Giám đốc','2023-03-01', NULL),
(4,'Nhân viên nhân sự','2023-05-01','2024-05-01'),
(4,'Trưởng phòng nhân sự','2024-05-01', NULL),
(5,'Nhân viên nhân sự','2023-07-01',NULL),
(6,'Nhân viên nhân sự','2023-09-01',NULL),
(7,'Nhân viên nhân sự','2023-09-01',NULL),
(8,'Nhân viên kế toán thời vụ','2023-03-01','2023-05-01'),
(8,'Nhân viên kế toán','2023-05-01','2024-05-01'),
(8,'Trưởng phòng kế toán','2024-05-01',NULL),
(9,'Nhân viên kế toán','2023-12-01',NULL),
(10,'Nhân viên kế toán','2024-02-01',NULL),
(11,'Nhân viên kế toán','2024-02-01',NULL),
(12,'Nhân viên Marketing','2023-10-01','2024-02-01'),
(12,'Trưởng phòng Marketing','2024-02-01',NULL),
(13,'Thực tập Marketing','2023-11-01','2024-02-01'),
(13,'Nhân viên Marketing','2024-02-01',NULL),
(14,'Thực tập Marketing','2023-11-01','2024-02-01'),
(14,'Nhân viên Marketing','2024-02-01',NULL),
(15,'Nhân viên Marketing','2024-01-01',NULL),
(16,'Nhân viên Marketing','2024-02-01',NULL),
(17,'Nhân viên Marketing','2024-03-01',NULL),
(18, 'Nhân viên Chăm sóc khách hàng', '2023-06-03', NULL),
(19, 'Nhân viên Chăm sóc khách hàng', '2023-07-04', NULL),
(20, 'Nhân viên Chăm sóc khách hàng', '2023-04-01', NULL),
(21, 'Nhân viên Chăm sóc khách hàng', '2023-09-02', NULL),
(22, 'Thực tấp sinh Chăm sóc khách hàng', '2023-10-09', '2023-12-09'),
(22, 'Nhân viên Chăm sóc khách hàng', '2023-12-10', NULL),
(23, 'Nhân viên Chăm sóc khách hàng', '2023-11-04', NULL),
(24, 'Nhân viên Chăm sóc khách hàng', '2023-12-09', NULL),
(25, 'Nhân viên Chăm sóc khách hàng', '2024-01-04', '2024-03-04'),
(25, 'Trưởng phòng Chăm sóc khách hàng', '2024-03-05', NULL),
(26, 'Nhân viên Kiểm thử', '2024-02-04', NULL),
(27, 'Nhân viên Kiểm thử', '2023-03-07', NULL),
(28, 'Nhân viên Kiểm thử', '2023-04-08', NULL),
(29, 'Nhân viên Kiểm thử', '2023-05-03', NULL),
(30, 'Thực tập sinh Kiểm thử', '2023-06-01', '2023-08-01'),
(30, 'Nhân viên Kiểm thử', '2023-08-02', NULL),
(31, 'Nhân viên Kiểm thử', '2023-03-05', NULL),
(32, 'Trưởng phòng Kiểm thử', '2023-04-01', NULL),
(33, 'Nhân viên Pháp chế', '2023-06-05', NULL),
(34, 'Nhân viên Pháp chế', '2023-03-09', NULL),
(35, 'Trưởng phòng Pháp chế', '2023-11-04', NULL),
(36, 'Nhân viên nghiên cứu và phát triển','2023-11-01',NULL),
(37, 'Nhân viên nghiên cứu và phát triển','2023-04-01',NULL),
(38, 'Nhân viên nghiên cứu và phát triển','2023-03-01','2023-09-01'),
(38, 'Trưởng phòng nghiên cứu và phát triển','2023-09-01',NULL),
(39, 'Nhân viên nghiên cứu và phát triển','2023-04-01',NULL),
(40, 'Nhân viên nghiên cứu và phát triển','2023-04-05',NULL),
(41, 'Nhân viên nghiên cứu và phát triển','2023-05-04',NULL),
(42, 'Nhân viên nghiên cứu và phát triển','2023-06-08',NULL),
(43, 'Nhân viên nghiên cứu và phát triển','2023-07-09',NULL),
(44, 'Nhân viên nghiên cứu và phát triển','2023-08-01',NULL),
(45, 'Nhân viên nghiên cứu và phát triển','2023-08-01',NULL),
(46, 'Nhân viên nghiên cứu và phát triển','2023-10-01',NULL),
(47, 'Nhân viên nghiên cứu và phát triển','2023-11-01',NULL),
(48, 'Nhân viên nghiên cứu và phát triển','2023-11-01',NULL),
(49, 'Nhân viên nghiên cứu và phát triển','2023-12-01',NULL),
(50, 'Nhân viên nghiên cứu và phát triển','2023-12-02',NULL)
;

INSERT INTO salary (emp_id, start_date,end_date, basic_salary) VALUES
(1,'2023-03-01','2024-03-01', 80000000),
(1,'2024-03-01',null, 85000000),
(2,'2023-03-01','2024-02-01', 60000000),
(2,'2024-03-01',null, 65000000),
(3,'2023-03-01','2024-02-01', 50000000),
(3,'2024-03-01',null, 55000000),
(4,'2023-05-01','2024-04-01',30000000),
(4,'2024-05-01',null,35000000),
(5,'2023-07-01',null,30000000),
(6,'2023-09-01',null,30000000),
(7,'2023-09-01',null,30000000),
(8,'2023-03-01','2023-04-01',15000000),
(8,'2023-05-01','2024-04-01',30000000),
(8,'2024-05-01',null,35000000),
(9,'2023-12-01',null,25000000),
(10,'2024-02-01',null,25000000),
(11,'2024-02-01',null,25000000),
(12,'2023-10-01','2024-01-01',25000000),
(12,'2024-02-01',null,35000000),
(13,'2023-11-01','2024-01-01',5000000),
(13,'2024-02-01',null,25000000),
(14,'2023-11-01','2024-01-01',5000000),
(14,'2024-02-01',null,25000000),
(15,'2024-01-01',null,20000000),
(16,'2024-02-01',null,20000000),
(17,'2024-03-01',null,20000000),
(18, '2023-06-03', NULL, 20000000),
(19, '2023-07-04', NULL, 18000000),
(20, '2023-04-01', NULL, 20000000),
(21, '2023-09-02', NULL, 20000000),
(22, '2023-10-09', '2023-12-09', 5000000),
(22, '2023-12-10', NULL, 15000000),
(23, '2023-11-04', NULL, 18000000),
(24, '2023-12-09', NULL, 1900000),
(25, '2024-01-04', '2024-03-04', 22000000),
(25, '2024-03-05', NULL, 30000000),
(26, '2024-02-04', NULL, 26000000),
(27, '2023-03-07', NULL, 26000000),
(28, '2023-04-08', NULL, 28000000),
(29, '2023-05-03', NULL, 25000000),
(30, '2023-06-01', '2023-08-01', 5000000),
(30, '2023-08-02', NULL, 25000000),
(31, '2023-03-05', NULL, 20000000),
(32, '2023-04-01', NULL, 25000000),
(33, '2023-06-05', NULL, 20000000),
(34, '2023-03-09', NULL, 20000000),
(35, '2023-11-04', NULL, 25000000)
;
insert into salary (emp_id, basic_salary, start_date, end_date) values
('36', '25000000', '2023-11-01',NULL),
('37', '22000000', '2023-04-01',NULL),    
('38', '23500000', '2023-03-01', '2023-09-01'),
('38', '23500000', '2023-09-01',NULL),
('39', '21000000', '2023-04-01',NULL),
('40', '24000000', '2023-04-05','2023-10-01'),
('40', '25000000','2023-10-01',NULL),
('41', '20500000', '2023-05-04','2023-10-01'),
('41', '20500000','2023-10-01', NULL),
('42', '26000000', '2023-06-08',NULL),
('43', '27000000', '2023-07-09',NULL),
('44', '28000000', '2023-08-01',NULL),
('45', '29000000', '2023-08-01',NULL),
('46', '30000000', '2023-10-01',NULL),
('47', '21500000', '2023-11-01',NULL),
('48', '22000000', '2023-11-01',NULL),
('49', '23000000', '2023-12-01',NULL),
('50', '24000000', '2023-12-02',NULL);
INSERT INTO education (emp_id, education_level,institution, major) VALUES
(1, 'Tiến sĩ','ĐH Bách Khoa Hà Nội', 'Công nghệ thông tin'),
(2, 'Kỹ sư','ĐH Thương mại', 'Quản trị Nhân sự'),
(3, 'Thạc sĩ','ĐH Kinh tế Quốc dân', 'Quản trị kinh doanh'),
(4, 'Cử nhân','ĐH Kinh tế quốc dân','Quản trị nhân sự '),
(5, 'Cử nhân','ĐH Ngoại Thương','Quản trị nhân sự '),
(6, 'Cử nhân','ĐH Ngoại Thương','Quản trị nhân sự '),
(7, 'Cử nhân','ĐH Quốc gia Hà Nội','Quản trị nhân sự '),
(8, 'Kỹ sư','ĐH Bách Khoa Hà Nội','Quản trị kinh doanh'),
(9, 'Cử nhân','ĐH FPT','Kế toán'),
(10, 'Kỹ sư','ĐH Ngoại Thương','Quản trị kinh doanh'),
(11, 'Cử nhân','ĐH Thương mại','Tài chính'),
(12,'Cử nhân','ĐH Kinh tế Quốc dân', 'Quản trị Marketing'),
(13,'Cử nhân','ĐH Ngoại thương', 'Kinh doanh quốc tế'),
(14,'Cử nhân','ĐH Khoa học Xã hội và Nhân văn', 'Truyền thông'),
(15,'Cử nhân','ĐH FPT', 'Digital Marketing'),
(16,'Cử nhân','ĐH RMIT', 'Quản trị Kinh doanh'),
(17,'Cử nhân','ĐH Tôn Đức Thắng', 'Thương mại điện tử'),
(18, 'Cử nhân', 'Đại học Kinh tế Quốc Dân', 'Quan hệ công chúng'),
(19, 'Thạc sĩ', 'Đại học Kinh tế Quốc Dân', 'Quan hệ công chúng'),
(20, 'Cử nhân', 'Đại học Kinh tế Quốc Dân', 'Quản trị nhân lực'),
(21, 'Cử nhân', 'Đại học Ngoại Thương', 'Kinh tế quốc tế'),
(22, 'Thạc sĩ', 'Học viện Ngân hàng', 'Quản trị kinh doanh'),
(23, 'Cử nhân', 'Đại học Kinh tế Quốc Dân', 'Quản trị nhân lực'),
(24, 'Thạc sĩ', 'Đại học Kinh tế Quốc Dân', 'Quan hệ công chúng'),
(25, 'Cử nhân', 'Đại học Kinh tế Quốc Dân', 'Quan hệ công chúng'),
(26, 'Cử nhân', 'Học viện Ngân hàng', 'Hệ thống thông tin quản lý'),
(27, 'Thạc sĩ', 'Đại học Kinh tế Quốc Dân', 'Phân tích kinh doanh'),
(28, 'Cử nhân', 'Đại học Ngoại Thương', 'Kinh tế quốc tế'),
(29, 'Thạc sĩ', 'Đại học Bách Khoa Hà Nội', 'Công nghệ thông tin'),
(30, 'Cử nhân', 'Học viện Ngân hàng', 'Hệ thống thông tin quản lý'),
(31, 'Cử nhân', 'Học viện Ngân hàng', 'Hệ thống thông tin quản lý'),
(32, 'Thạc sĩ', 'Đại học Bách Khoa Hà Nội','Công nghệ Thông tin'),
(33, 'Cử nhân', 'Đại học Luật', 'Luật'),
(34, 'Thạc sĩ', 'Đại học Luật', 'Luật'),
(35, 'Cử nhân', 'Đại học Luật', 'Luật Kinh tế')
;
insert into education (emp_id, education_level, major, institution) values
('36', 'Cử nhân', 'Khoa học máy tính', 'Đại học Bách khoa Hà Nội'),
('37', 'Thạc sĩ', 'Kinh tế quốc tế', 'Đại học Ngoại thương Hà Nội'),
('38', 'Tiến sĩ', 'Phân tích kinh doanh', 'Đại học Kinh tế Quốc dân'),
('39', 'Cử nhân', 'Khoa học máy tính', 'Đại học FPT Hà Nội'),
('40', 'Thạc sĩ', 'Kinh tế quốc tế', 'Đại học RMIT Việt Nam'),
('41', 'Tiến sĩ', 'Phân tích kinh doanh', 'Đại học Fulbright Việt Nam'),
('42', 'Cử nhân', 'Kỹ thuật phần mềm', 'Đại học Quốc gia Hà Nội'),
('43', 'Thạc sĩ', 'Kinh tế quốc tế', 'Đại học Kinh tế TP. Hồ Chí Minh'),
('44', 'Tiến sĩ', 'Phân tích kinh doanh', 'Đại học Quốc gia Hà Nội'),
('45', 'Cử nhân', 'Khoa học máy tính', 'Đại học Sư phạm TP. Hồ Chí Minh'),
('46', 'Thạc sĩ', 'Kinh tế quốc tế', 'Đại học Duy Tân'),
('47', 'Tiến sĩ', 'Phân tích kinh doanh', 'Đại học Đà Nẵng'),
('48', 'Cử nhân', 'Kỹ thuật phần mềm', 'Đại học Bách khoa Hà Nội'),
('49', 'Thạc sĩ', 'Kinh tế quốc tế', 'Đại học Quốc gia Hà Nội'),
('50', 'Tiến sĩ', 'Phân tích kinh doanh', 'Đại học Bách khoa Hà Nội');


INSERT INTO contract_of_emp (contract_id, emp_id, start_date, end_date) VALUES
('CT1',1,'2023-03-01','2025-02-28'),
('CT1',2,'2023-03-01','2025-02-28'),
('CT1',3,'2023-03-01','2025-02-28'),
('CT1',4,'2023-05-01','2025-04-30'),
('CT1',5,'2023-07-01','2025-06-30'),
('CT1',6,'2023-09-01','2025-08-31'),
('CT1',7,'2023-09-01','2025-08-31'),
('CT2',8,'2023-03-01','2025-04-30'),
('CT1',8,'2023-05-01','2025-04-30'),
('CT1',9,'2023-12-01','2024-11-30'),
('CT1',10,'2024-02-01','2025-01-31'),
('CT1',11,'2024-02-01','2025-01-31'),
('CT1',12,'2023-10-01','2025-02-01'),
('CT3',13,'2023-11-01','2024-01-01'),
('CT1',13,'2024-02-01','2025-02-01'),
('CT3',14,'2023-11-01','2024-02-01'),
('CT1',14,'2024-02-01','2025-02-01'),
('CT1',15,'2024-01-01','2025-01-01'),
('CT1',16,'2024-02-01','2025-02-01'),
('CT1',17,'2024-03-01','2025-03-01'),

('CT1', 18, '2023-06-03', '2025-06-03'),
('CT1', 19, '2023-07-04', '2025-07-04'),
('CT1', 20, '2023-04-01', '2025-04-01'),
('CT1', 21, '2023-09-02', '2025-09-02'),
('CT3', 22, '2023-10-09', '2023-12-09'),
('CT1', 22, '2023-12-10', '2025-12-10'),
('CT1', 23, '2023-11-04', '2025-11-04'),
('CT1', 24, '2023-12-09', '2025-12-09'),
('CT2', 25, '2024-01-04', '2024-03-04'),
('CT1', 25, '2024-03-05', '2026-03-05'),
('CT1', 26, '2024-02-04', '2026-02-04'),
('CT1', 27, '2023-03-07', '2025-03-07'),
('CT1', 28, '2023-04-08', '2025-04-08'),
('CT1', 29, '2023-05-03', '2025-05-03'),
('CT3', 30, '2023-06-01', '2023-08-01'),
('CT1', 30, '2023-08-02', '2025-08-02'),
('CT1', 31, '2023-03-05', '2025-03-05'),
('CT1', 32, '2023-04-01', '2025-04-01'),
('CT1', 33, '2023-06-05', '2025-06-05'),
('CT1', 34, '2023-03-09', '2025-03-09'),
('CT1', 35, '2023-11-04', '2025-11-04'),
('CT1', '36', '2023-11-01','2024-11-01'),
('CT1', '37', '2023-04-01','2025-04-01'),
('CT1', '38', '2023-03-01','2026-03-01'),
('CT1', '39', '2023-04-01','2027-04-01'),
('CT1', '40', '2023-04-05','2026-04-05'),
('CT1', '41', '2023-05-04','2025-05-04'),
('CT1', '42', '2023-06-08','2024-06-08'),
('CT1', '43', '2023-07-09','2028-07-09'),
('CT1', '44', '2023-08-01','2025-08-01'),
('CT1', '45', '2023-08-01','2027-08-01'),
('CT1', '46', '2023-10-01','2024-10-01'),
('CT1', '47', '2023-11-01','2028-11-01'),
('CT1', '48', '2023-11-01','2029-11-01'),
('CT1', '49', '2023-12-01','2025-12-01'),
('CT1', '50', '2023-12-02','2026-12-02')
;

INSERT INTO judgement (emp_id, period, performance, recommendation) VALUES
(1, '2023-07-01', 'Tốt', 'Cần cải thiện khả năng tự quản lý công việc.'),
(1, '2023-12-31', 'Xuất sắc', 'Đạt được các mục tiêu công ty'),
(2, '2023-07-01', 'Xuất sắc', 'Khả năng sáng tạo đáng khen ngợi'),
(2, '2023-12-31', 'Xuất sắc', 'Khả năng làm việc tốt'),
(3, '2023-07-01', 'Xuất sắc', 'Làm việc hiệu quả và hỗ trợ đồng nghiệp tốt.'),
(3, '2023-12-31', 'Xuất sắc', 'Hiệu suất làm việc đáng khen ngợi.'),
(4, '2023-07-01', 'Xuất sắc', 'Đề xuất tham gia các khóa học nâng cao kỹ năng.'),
(4, '2023-12-31', 'Xuất sắc', 'Hiệu suất làm việc đáng khen ngợi.'),
(5, '2023-12-31', 'Tốt', 'Kỹ năng tốt'),
(6, '2023-12-31', 'Tốt', 'Tập trung vào kỹ năng làm việc nhóm'),
(7, '2023-12-31', 'Tốt', 'Hoàn thành tốt nhiệm vụ được giao'),
(8, '2023-07-01', 'Xuất sắc', 'Hiệu suất làm việc đáng khen ngợi.'),
(8, '2023-12-31', 'Xuất sắc', 'Hiệu suất làm việc đáng khen ngợi.'),
(9, '2023-12-31', 'Xuất sắc', 'Hiệu suất làm việc đáng khen ngợi.'),
(12,'2023-12-31', 'Xuất sắc', 'Hiệu suất làm việc đáng khen ngợi.'),
(13, '2023-12-31', 'Xuất sắc', 'Hiệu suất làm việc tốt'),
(14, '2023-12-31', 'Xuất sắc', 'Hiệu suất làm việc đáng khen ngợi.'),
(18, '2023-07-01', 'Tốt', 'Cần cải thiện kỹ năng làm việc nhóm'),
(18, '2023-12-31', 'Khá', 'Cần cải thiện kỹ năng quản lý thời gian'),
(19, '2023-12-31', 'Tốt', 'Kỹ năng tốt'),
(20, '2023-07-01', 'Tốt', 'Cần cải thiện kỹ năng Tin học văn phòng'),
(20, '2023-12-31', 'Xuất sắc', 'Hoàn thành tốt công việc'),
(21, '2023-12-31', 'Tốt', 'Hiệu suất làm việc tốt'),
(22, '2023-12-31', 'Khá', 'Cần cải thiện kỹ năng quản lý thời gian'),
(23, '2023-12-31', 'Tốt', 'Hoàn thành tốt công việc được giao'),
(24, '2023-12-31', 'Tốt', 'Cần cải thiện kỹ năng làm việc nhóm'),
(27, '2023-07-01', 'Tốt', 'Cần cải thiện kỹ năng làm việc nhóm'),
(27, '2023-12-31', 'Xuất sắc', 'Hoàn thành xuất sắc chỉ tiêu công việc'),
(28, '2023-07-01', 'Tốt', 'Hoàn thành tốt nhiệm vụ'),
(28, '2023-12-31', 'Khá', 'Cần cải thiện kỹ năng làm việc nhóm'),
(29, '2023-07-01', 'Tốt', 'Hoàn thành tốt công việc'),
(29, '2023-12-31', 'Tốt', 'Hoàn thành tốt công việc'),
(30, '2023-07-01', 'Tốt', 'Hoàn thành tốt công việc'),
(30, '2023-12-31', 'Tốt', 'Hoàn thành tốt công việc'),
(31, '2023-07-01', 'Tốt', 'Hoàn thành tốt công việc'),
(31, '2023-12-31', 'Khá', 'Cần cải thiện hiệu suất công việc'),
(32, '2023-07-01', 'Tốt', 'Hoàn thành tốt công việc'),
(32, '2023-12-31', 'Tốt', 'Hoàn thành tốt công việc'),
(33, '2023-07-01', 'Tốt', 'Hoàn thành tốt công việc'),
(33, '2023-12-31', 'Xuất sắc', 'Hoàn thành xuất sắc công việc'),
(34, '2023-07-01', 'Tốt', 'Hoàn thành tốt công việc'),
(34, '2023-12-31', 'Tốt', 'Hoàn thành tốt công việc'),
(35, '2023-12-31', 'Khá', 'Cần cải thiện kỹ năng quản lý thời gian'),
('36', '2023-07-01', 'Xuất sắc', 'Hoàn thành xuất sắc công việc'),
('37', '2023-07-01', 'Khá', 'Hoàn thành tốt công việc'),
('38', '2023-07-01', 'Tốt', 'Cần nỗ lực hơn'),
('39', '2023-07-01', 'Xuất sắc', 'Hoàn thành xuất sắc dự án X'),
('40', '2023-07-01', 'Khá', 'Cần trau dồi kỹ năng giao tiếp'),
('41', '2023-07-01', 'Tốt', 'Hoàn thành đúng tiến độ công việc'),
('42', '2023-07-01', 'Xuất sắc', 'Có tinh thần trách nhiệm cao'),
('43', '2023-07-01', 'Khá', 'Cần phát huy khả năng sáng tạo'),
('44', '2023-07-01', 'Tốt', 'Hoàn thành tốt nhiệm vụ được giao'),
('45', '2023-07-01', 'Xuất sắc', 'Có khả năng lãnh đạo tốt'),
('46', '2023-07-01', 'Khá', 'Cần trau dồi kỹ năng chuyên môn'),
('47', '2023-07-01', 'Tốt', 'Hoàn thành đúng thời hạn công việc'),
('48', '2023-07-01', 'Xuất sắc', 'Có ý thức học hỏi cao'),
('49', '2023-07-01', 'Khá', 'Cần chủ động hơn trong công việc'),
('50', '2023-07-01', 'Tốt', 'Hoàn thành tốt các yêu cầu đề ra'),
('36', '2023-12-31', 'Xuất sắc', 'Hoàn thành xuất sắc nhiệm vụ được giao, góp phần nâng cao hiệu quả hoạt động của công ty'),
('37', '2023-12-31', 'Khá', 'Cần nỗ lực hoàn thiện kỹ năng chuyên môn, đặc biệt trong lĩnh vực X'),
('38', '2023-12-31', 'Tốt', 'Hoàn thành tốt công việc, tuy nhiên cần chủ động hơn trong việc đề xuất giải pháp'),
('39', '2023-12-31', 'Xuất sắc', 'Có tinh thần trách nhiệm cao, luôn hoàn thành xuất sắc các công việc được giao'),
('40', '2023-12-31', 'Khá', 'Cần trau dồi kỹ năng giao tiếp, thuyết trình để nâng cao hiệu quả công việc'),
('41', '2023-12-31', 'Tốt', 'Hoàn thành đúng tiến độ công việc, đảm bảo chất lượng'),
('42', '2023-12-31', 'Xuất sắc', 'Có khả năng sáng tạo và tư duy độc lập, góp phần đưa ra nhiều giải pháp hiệu quả'),
('43', '2023-12-31', 'Khá', 'Cần phát huy tinh thần làm việc nhóm và hỗ trợ đồng nghiệp'),
('44', '2023-12-31', 'Tốt', 'Hoàn thành tốt nhiệm vụ được giao, luôn giữ thái độ tốt'),
('45', '2023-12-31', 'Xuất sắc', 'Có khả năng lãnh đạo tốt, truyền cảm hứng cho đồng nghiệp'),
('46', '2023-12-31', 'Khá', 'Cần cập nhật kiến thức chuyên môn liên tục để đáp ứng yêu cầu công việc'),
('47', '2023-12-31', 'Tốt', 'Hoàn thành đúng thời hạn công việc, đảm bảo an toàn lao động'),
('48', '2023-12-31', 'Xuất sắc', 'Có ý thức học hỏi cao, luôn cầu tiến và hoàn thiện bản thân'),
('49', '2023-12-31', 'Khá', 'Cần chủ động hơn trong việc đề xuất ý tưởng và giải pháp sáng tạo'),
('50', '2023-12-31', 'Tốt', 'Hoàn thành tốt các yêu cầu đề ra, tinh thần làm việc hăng say');


INSERT INTO day_off (emp_id, category, start_dayoff_date, end_dayoff_date)
VALUES 
(1, 'Nghỉ có lương', '2023-07-01', '2023-07-15'),
(1, 'Nghỉ không lương', '2024-07-01', '2024-07-15'),
(2, 'Nghỉ có lương', '2023-07-01', '2023-07-15'),
(2, 'Nghỉ không lương', '2023-04-18', '2023-04-20'),
(3, 'Nghỉ có lương', '2024-05-05', '2024-05-06'),
(5, 'Nghỉ có lương', '2023-11-05', '2023-11-06'),
(7, 'Nghỉ có lương', '2023-12-09', '2023-12-12'),
(7, 'Nghỉ không lương', '2024-03-05', '2024-03-11'),
(8, 'Nghỉ không lương', '2024-04-18', '2024-04-20'),
(10, 'Nghỉ có lương', '2024-05-18', '2024-05-20'),
(11, 'Nghỉ thai sản', '2024-03-15', '2024-06-16'),
(12, 'Nghỉ có lương', '2024-01-26', '2024-01-28'),
(13, 'Nghỉ có lương', '2024-04-17', '2024-04-20'),
(14, 'Nghỉ có lương', '2024-05-18', '2024-05-19'),
(14, 'Nghỉ không lương', '2024-06-01', '2024-06-02'),
(16, 'Nghỉ có lương', '2024-02-09', '2024-02-12'),
(19, 'Nghỉ có lương', '2024-01-10', '2024-01-12'),
(22, 'Nghỉ thai sản', '2024-01-03', '2024-04-06'),
(23, 'Nghỉ có lương', '2024-04-21', '2024-04-25'),
(23, 'Nghỉ không lương', '2024-05-25', '2024-05-28'),
(25, 'Nghỉ có lương', '2024-03-15', '2024-03-18'),
(27, 'Nghỉ có lương', '2024-01-01', '2024-01-05'),
(29, 'Nghỉ không lương', '2024-06-05', '2024-06-09'),
(31, 'Nghỉ có lương', '2024-02-20', '2024-02-23'),
(33, 'Nghỉ có lương', '2024-01-13', '2024-01-17'),
(35, 'Nghỉ có lương', '2024-02-03', '2024-02-07'),
('36', 'nghỉ có lương', '2023-10-01', '2023-10-05'),
('36', 'nghỉ thai sản', '2023-11-15', '2024-02-15'),
('37', 'nghỉ không lương', '2023-05-10', '2023-05-20'),
('38', 'nghỉ có lương', '2024-04-05', '2024-04-10'),
('39', 'nghỉ có lương', '2024-06-01', '2024-06-02'),
('40', 'nghỉ không lương', '2023-05-15', '2023-05-16'),
('41', 'nghỉ có lương', '2023-06-20', '2023-06-25'),
('42', 'nghỉ thai sản', '2023-08-01', '2024-01-01'),
('43', 'nghỉ không lương', '2023-09-10', '2023-09-11'),
('44', 'nghỉ có lương', '2024-01-01', '2024-01-05'),
('44', 'nghỉ không lương', '2024-03-01', '2024-03-05'),
('44', 'nghỉ không lương', '2024-04-01', '2024-04-05'),
('45', 'nghỉ có lương', '2023-11-15', '2023-11-18'),
('46', 'nghỉ không lương', '2023-12-10', '2023-12-20'),
('47', 'nghỉ có lương', '2023-11-01', '2023-11-05'),
('48', 'nghỉ thai sản', '2024-12-01', '2024-12-03'),
('49', 'nghỉ không lương', '2024-01-10', '2024-01-20'),
('50', 'nghỉ có lương', '2023-12-01', '2023-12-05');


INSERT INTO dept_emp (emp_id, dept_id, start_date, end_date)
VALUES (1, 'MG01', '2023-03-01', NULL),
(2, 'MG01', '2023-03-01', NULL),
(3, 'MG01', '2023-03-01', NULL),
(4, 'HR02', '2023-05-01', NULL),
(5, 'HR02', '2023-07-01', NULL),
(6, 'HR02', '2023-09-01', NULL),
(7, 'HR02', '2023-09-01', NULL),
(8, 'AC03', '2023-03-01', NULL),
(9, 'AC03', '2023-12-01', NULL),
(10, 'AC03', '2024-02-01', NULL),
(11, 'AC03', '2024-02-01', NULL),
(12, 'MK04', '2023-10-01', NULL),
(13, 'MK04', '2023-11-01', NULL),
(14, 'MK04', '2023-11-01', NULL),
(15, 'MK04', '2024-01-01', NULL),
(16, 'MK04', '2024-02-01', NULL),
(17, 'MK04', '2024-03-01', NULL),
(18, 'CS05', '2023-06-03', NULL),
(19, 'CS05', '2023-07-04', NULL),
(20, 'CS05', '2023-04-01', NULL),
(21, 'CS05', '2023-09-02', NULL),
(22, 'CS05', '2023-10-09', NULL),
(23, 'CS05', '2023-11-04', NULL),
(24, 'CS05', '2023-12-09', NULL),
(25, 'CS05', '2024-01-04', NULL),
(26, 'QA07', '2024-02-04', NULL),
(27, 'QA07', '2023-03-07', NULL),
(28, 'QA07', '2023-04-08', NULL),
(29, 'QA07', '2023-05-03', NULL),
(30, 'QA07', '2023-06-01', NULL),
(31, 'QA07', '2023-03-05', NULL),
(32, 'QA07', '2023-04-01', NULL),
(33, 'LC08', '2023-06-05', NULL),
(34, 'LC08', '2023-03-09', NULL),
(35, 'LC08', '2023-11-04', NULL),
('36', 'RD06', '2023-11-01', NULL),
('37', 'RD06', '2023-04-01', NULL),
('38', 'RD06', '2023-03-01', NULL),
('39', 'RD06', '2023-04-01', NULL),
('40', 'RD06', '2023-04-05', NULL),
('41', 'RD06', '2023-05-04', NULL),
('42', 'RD06', '2023-06-08', NULL),
('43', 'RD06', '2023-07-09', NULL),
('44', 'RD06', '2023-08-01', NULL),
('45', 'RD06', '2023-08-01', NULL),
('46', 'RD06', '2023-10-01', NULL),
('47', 'RD06', '2023-11-01', NULL),
('48', 'RD06', '2023-11-01', NULL),
('49', 'RD06', '2023-12-01', NULL),
('50', 'RD06', '2023-12-02', NULL)
;

INSERT INTO train_emp (course_id, emp_id, duration)
VALUES ('CR03', 4, '3 tuần'),
('CR03', 7, '3 tuần'),
('CR06',9,'2 tháng'),
('CR06',10,'2 tháng'),
('CR06',11,'2 tháng'),
('CR07',12,'1 tháng'),
('CR07',14,'1 tháng'),
('CR07',17,'1 tháng'),
('CR05', 27, '2 tháng'),
('CR05', 28, '2 tháng'),
('CR05', 29, '3 tháng'),
('CR05', 31, '3 tháng'),
('CR03', 36, '6 tháng'), 
('CR05', 36, '11 tháng'), 
('CR09', 37, '7 tháng'), 
('CR03', 37, '9 tháng'),  
('CR03', 38, '10 tháng'),  
('CR08', 39, '12 tháng'), 
('CR03', 39, '6 tháng'), 
('CR03', 40, '7 tháng'), 
('CR08', 40, '11 tháng'), 
('CR09', 40, '5 tháng'), 
('CR03', 41, '6 tháng'), 
('CR08', 42, '9 tháng'),   
('CR03', 43, '7 tháng'), 
('CR08', 43, '11 tháng'), 
('CR09', 43, '6 tháng'), 
('CR08', 44, '8 tháng'), 
('CR09', 44, '10 tháng'), 
('CR03', 44, '5 tháng'), 
('CR03', 45, '9 tháng'), 
('CR08', 45, '12 tháng'), 
('CR09', 45, '6 tháng')
;

INSERT INTO dept_manager (dept_id, emp_id, start_date, end_date)
VALUES
('MG01', 1, '2023-03-01', NULL),
('HR02',4,'2024-05-01',NULL),
('AC03',8,'2024-05-01',NULL),
('MK04',12,'2024-02-01',NULL),
('CS05', 25, '2024-03-05', NULL),
('QA07', 32, '2023-04-01', NULL),
('LC08', 35, '2023-11-04', NULL),
('RD06', '38', '2023-09-01', NULL)
;

#INDEX
create index employeeindex on employee(emp_name,email);
create index titleindex on titles(title);

#nhân viên có hạn hợp đồng trước ngày 01/01/2025
select * from employee
where emp_id
in (select emp_id from contract_of_emp where end_date <'2025-01-01' and end_date in (select max(end_date) from contract_of_emp group by emp_id ));

#Nhân viên đã làm việc được hơn 1 năm
select * from employee
where datediff(now(), join_date) > 365;

# nhân viên trong phòng Quản lý có thời gian vào công ty trong tháng 3,5 năm 2023
select * from employee
where emp_id in
(select emp_id from dept_emp
where dept_id ='MG01')
and join_date between '2023-03-01' and '2023-05-31';

#nhân viên sinh nhật trong tháng này
select * from employee
where month(dob) = month(now());

#thực tập sih và thời gian thực tập
SELECT 
    contract_of_emp.contract_id, 
    employee.emp_id, 
    employee.emp_name, 
    contract_of_emp.start_date, 
    contract_of_emp.end_date,
    TIMESTAMPDIFF(MONTH, contract_of_emp.start_date, contract_of_emp.end_date) AS so_thang
FROM 
    contract_of_emp 
INNER JOIN 
    employee 
ON 
    contract_of_emp.emp_id = employee.emp_id
WHERE 
    contract_of_emp.contract_id = 'CT3';

#tất cả các chức vụ từ khi vào công ty của Phan văn Tiến
SELECT employee.emp_id, emp_name, title, start_date, end_date
FROM titles
INNER JOIN employee ON employee.emp_id = titles.emp_id
WHERE emp_name = "Phan Van Tien";

#số lượng nhân viên mỗi phòng ban và tỉ lệ phần trăm trong công ty
SELECT d.dept_id, d.dept_name,
       COUNT(e.emp_id) AS number_of_employees,
       ROUND((COUNT(e.emp_id) / total_employees.total) * 100, 2) AS percentage
FROM department d
LEFT JOIN dept_emp de ON d.dept_id = de.dept_id
LEFT JOIN employee e ON de.emp_id = e.emp_id
CROSS JOIN (SELECT COUNT(*) AS total FROM employee) AS total_employees
GROUP BY d.dept_id, d.dept_name, total_employees.total;

#số lượng nhân viên từng trình độ học vấn và tỉ lệ phần trăm trong công ty
SELECT edu.education_level, COUNT(e.emp_id) AS number_of_employees, 
    ROUND((COUNT(e.emp_id) / total_employees.total) * 100, 2) AS percentage
FROM education edu
JOIN employee e ON edu.emp_id = e.emp_id
CROSS JOIN (SELECT COUNT(*) AS total FROM employee) AS total_employees
GROUP BY edu.education_level, total_employees.total;

#danh sách nhân viên có trình độ học vấn thạc sĩ
select employee.emp_id, employee.emp_name, education.education_level
from employee inner join education on employee.emp_id = education.emp_id
where education.education_level = 'Thạc sĩ';

#top 10 người có lương cơ bản cao nhất công ty
select salary.emp_id, emp_name, basic_salary
from salary inner join employee on employee.emp_id = salary.emp_id
where end_date is null
order by basic_salary desc
limit 10;
#thông tin cá nhân của manager của mỗi phòng ban
select employee.*, department.dept_name
from employee inner join dept_manager inner join department
on employee.emp_id = dept_manager.emp_id and dept_manager.dept_id = department.dept_id
where employee.emp_id in (select emp_id from dept_manager);

#lương trung bình của nhân viên mỗi phòng ban
SELECT d.dept_id, d.dept_name, 
       AVG(s.basic_salary) AS average_salary
FROM department d
LEFT JOIN dept_emp de ON d.dept_id = de.dept_id
LEFT JOIN salary s ON de.emp_id = s.emp_id
GROUP BY d.dept_id, d.dept_name
ORDER BY average_salary;

#danh sách 10 nhân viên nghỉ phép nhiều nhất
SELECT a.emp_id, b.emp_name, SUM(DATEDIFF(a.end_dayoff_date, a.start_dayoff_date) + 1) AS total_days_off
FROM day_off AS a
JOIN employee AS b ON b.emp_id = a.emp_id
GROUP BY emp_id
ORDER BY total_days_off DESC
LIMIT 10;

#danh sách nhân viên nghỉ phép trong tháng 5
SELECT a.emp_id, a.emp_name, b.category, b.start_dayoff_date, b.end_dayoff_date
FROM day_off AS b
JOIN employee AS a ON b.emp_id = a.emp_id
WHERE (start_dayoff_date BETWEEN '2024-05-01' AND '2024-05-31')
OR (end_dayoff_date BETWEEN '2024-05-01' AND '2024-05-31')
OR (start_dayoff_date < '2024-05-01' AND end_dayoff_date > '2024-05-31');

#số lượng nhân viên tham gia vào từng khóa đào tạo
select course_name as Ten_khoa_hoc, count(emp_id) as So_nhan_vien
from train_emp inner join training on train_emp.course_id = training.course_id
group by train_emp.course_id;

#Tạo view: gồm id, tên, ngày sinh, địa chỉ, chức vụ hiện tại, phòng ban hiện tại, mức lương hiện tại.
create view employeeview as
select e.emp_id, e.emp_name, e.dob, e.emp_address, t.title, d.dept_name, s.basic_salary
from employee e
join titles t on t.emp_id = e.emp_id
join dept_emp de on de.emp_id = e.emp_id
join department d on d.dept_id = de.dept_id
join salary s on s.emp_id = e.emp_id
where t.end_date is null and de.end_date is null and s.end_date is null
order by e.emp_id;

#Tạo Trigger khi xóa nhân viên
CREATE TABLE deleted_employee (
    emp_id INT NOT NULL,
    emp_name VARCHAR(30) NOT NULL,
    gender VARCHAR(3),
    dob DATETIME,
    emp_address VARCHAR(100),
    emp_phone VARCHAR(12),
    email VARCHAR(30),
    join_date DATE,
    deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (emp_id)
);
DELIMITER $$
CREATE TRIGGER before_delete_employee
BEFORE DELETE ON employee
FOR EACH ROW
BEGIN
  INSERT INTO deleted_employee (emp_id, emp_name, gender, dob, emp_address, emp_phone, email, join_date)
  VALUES (OLD.emp_id, OLD.emp_name, OLD.gender, OLD.dob, OLD.emp_address, OLD.emp_phone, OLD.email, OLD.join_date);
END $$
DELIMITER ;

#Tạo Trigger cập nhật khi thay đổi thông tin cá nhân nhân viên (trường nào không thay đổi mặc định là NULL)
CREATE TABLE change_emp_info (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  employee_id INT NOT NULL,                
  old_phone VARCHAR(12) DEFAULT NULL,      
  old_email VARCHAR(30) DEFAULT NULL,     
  change_date DATETIME DEFAULT NOW(),
  action VARCHAR(20) DEFAULT 'update'     
);
DELIMITER $$
CREATE TRIGGER before_emp_info_update
BEFORE UPDATE ON employee
FOR EACH ROW
BEGIN
  IF old.emp_phone <> new.emp_phone AND old.email <> new.email THEN
    INSERT INTO change_emp_info(employee_id, old_phone, old_email)
    VALUES (old.emp_id, old.emp_phone, old.email);
  ELSEIF old.emp_phone <> new.emp_phone THEN
    INSERT INTO change_emp_info(employee_id, old_phone)
    VALUES (old.emp_id, old.emp_phone);
  ELSEIF old.email <> new.email THEN
    INSERT INTO change_emp_info(employee_id, old_email)
    VALUES (old.emp_id, old.email);
  END IF;
END $$
DELIMITER ;
#Procedure: Thêm nhân viên
DELIMITER $$
CREATE PROCEDURE add_employee(
  IN emp_name VARCHAR(30),
  IN gender VARCHAR(3),
  IN dob DATETIME,
  IN emp_address VARCHAR(100),
  IN emp_phone VARCHAR(12),
  IN email VARCHAR(30),
  IN join_date DATE
)
BEGIN
  INSERT INTO employee (emp_name, gender, dob, emp_address, emp_phone, email, join_date)
  VALUES (emp_name, gender, dob, emp_address, emp_phone, email, join_date);
END $$
DELIMITER ;

#Procedure: Sửa thông tin nhân viên
DELIMITER $$
CREATE PROCEDURE update_employee(
  IN emp_id_input INT,
  IN new_emp_name VARCHAR(30),
  IN new_gender VARCHAR(3),
  IN new_dob DATETIME,
  IN new_emp_address VARCHAR(100),
  IN new_emp_phone VARCHAR(12),
  IN new_email VARCHAR(30),
  IN new_join_date DATE
)
BEGIN
  UPDATE employee
  SET
    emp_name = new_emp_name,
    gender = new_gender,
    dob = new_dob,
    emp_address = new_emp_address,
    emp_phone = new_emp_phone,
    email = new_email,
    join_date = new_join_date
  WHERE emp_id = emp_id_input;
END $$
DELIMITER ;

#Procedure: Xóa thông tin nhân viên
DELIMITER $$
CREATE PROCEDURE delete_employee(
  IN emp_id_input INT
)
BEGIN
  DELETE FROM employee
  WHERE emp_id = emp_id_input;
END $$
DELIMITER ;

#Procedure: Lấy danh sách nhân viên trong 1 phòng ban cụ thể
DELIMITER $$
CREATE PROCEDURE get_employee_list_in_department(dept_id_input CHAR(4))
BEGIN
  SELECT e.emp_id, e.emp_name
  FROM employee e
  INNER JOIN dept_emp de ON e.emp_id = de.emp_id
  WHERE de.dept_id = dept_id_input;
END $$
DELIMITER ;

#Procedure: Lấy danh sách các khóa học tham gia của 1 nhân viên cụ thể
DELIMITER $$
CREATE PROCEDURE get_employee_trainings(IN emp_id_input INT)
BEGIN
  SELECT 
    e.emp_name AS employee_name, 
    t.course_name
  FROM employee e
  JOIN train_emp te ON e.emp_id = te.emp_id
  JOIN training t ON te.course_id = t.course_id
  WHERE e.emp_id = emp_id_input;
END $$
DELIMITER ;

#Function: Tìm số ngày nghỉ trong năm
DELIMITER $$
CREATE FUNCTION calculate_days_off_in_year(emp_id_input INT, year_input INT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE total_days_off INT;
  
  SET total_days_off = (
    SELECT SUM(
      CASE
        WHEN YEAR(start_dayoff_date) = year_input AND YEAR(end_dayoff_date) = year_input THEN DATEDIFF(end_dayoff_date, CONCAT(year_input, '-01-01')) + 1
        WHEN YEAR(start_dayoff_date) < year_input AND YEAR(end_dayoff_date) > year_input THEN DATEDIFF(CONCAT(year_input, '-12-31'), CONCAT(year_input, '-01-01'))
        WHEN YEAR(start_dayoff_date) = year_input AND YEAR(end_dayoff_date) > year_input THEN DATEDIFF(end_dayoff_date, start_dayoff_date) + 1
        WHEN YEAR(start_dayoff_date) < year_input AND YEAR(end_dayoff_date) = year_input THEN DATEDIFF(CONCAT(year_input, '-12-31'), start_dayoff_date) + 1
        ELSE 0
      END
    )
    FROM day_off
    WHERE emp_id = emp_id_input
  );
  
  RETURN total_days_off;
END $$
DELIMITER ;
