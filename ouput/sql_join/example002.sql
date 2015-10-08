CREATE TABLE tb_employee (
id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(20) NOT NULL,
country VARCHAR(20) NOT NULL,
DepartmentID INT(11)
);
 
INSERT INTO tb_employee VALUES(123,'Rafferty','Australia',31);
INSERT INTO tb_employee VALUES(124,'Jones','Australia',33);
INSERT INTO tb_employee VALUES(145,'Heisenberg','Australia',33);
INSERT INTO tb_employee VALUES(201,'Robinson','United States',34);
INSERT INTO tb_employee VALUES(305,'Smith','Germany',34);
INSERT INTO tb_employee VALUES(306,'Williams','Germany',NULL);
