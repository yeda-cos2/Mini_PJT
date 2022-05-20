
DROP TABLE transaction;
DROP TABLE product;
DROP TABLE users;
DROP TABLE review;
DROP TABLE recipe;

DROP SEQUENCE seq_product_prod_no;
DROP SEQUENCE seq_transaction_tran_no;
DROP SEQUENCE seq_review_no;
DROP SEQUENCE seq_recipe_no;

CREATE  SEQUENCE  seq_product_prod_no	 	 	INCREMENT BY  1  START  WITH  10000;
CREATE  SEQUENCE  seq_transaction_tran_no	 INCREMENT  BY  1  START  WITH  10000;
CREATE  SEQUENCE  seq_review_no	 INCREMENT  BY  1  START  WITH  10000;
CREATE  SEQUENCE  seq_recipe_no	 INCREMENT  BY  1  START  WITH  10000;


CREATE TABLE users ( 
	user_id 			VARCHAR2(20)	NOT NULL,
	user_name 	VARCHAR2(50)	NOT NULL,
	password 		VARCHAR2(10)	NOT NULL,
	role 					VARCHAR2(5) 		DEFAULT 'user',
	ssn 					VARCHAR2(13),
	cell_phone 		VARCHAR2(14),
	addr 				VARCHAR2(100),
	email 				VARCHAR2(50),
	reg_date 		DATE,
	PRIMARY KEY(user_id)
);


CREATE TABLE product ( 
	prod_no 			 			NUMBER 		 		NOT NULL,
	prod_name 			 	VARCHAR2(100)  	NOT NULL,
	prod_detail 		 		VARCHAR2(200),
	manufacture_day		 VARCHAR2(8),
	price 				 			NUMBER(10),
	image_file 			 		VARCHAR2(100),
	reg_date 			 		DATE,
	total          number,
	cancel     VARCHAR2(10),
	PRIMARY KEY(prod_no)
);

CREATE TABLE transaction ( 
	tran_no 			 		NUMBER 			 NOT  NULL,
	prod_no 			 		NUMBER(16)		 NOT  NULL  REFERENCES  product(prod_no),
	buyer_id 			 	VARCHAR2(20)	 NOT  NULL  REFERENCES  users(user_id),
	payment_option	 	VARCHAR(3),
	receiver_name 	 	VARCHAR2(20),
	receiver_phone	 	VARCHAR2(14),
	demailaddr 		 	VARCHAR2(100),
	dlvy_request 	 		VARCHAR2(100),
	tran_status_code 	VARCHAR(3),
	order_data 		 	DATE,
	dlvy_date 		 		DATE,
	purchase_count        number,
	PRIMARY KEY(tran_no)
);

CREATE TABLE review(
review_no  NUMBER 		 		NOT NULL,
user_id   VARCHAR2(20)   	REFERENCES  users(user_id),
prod_no   NUMBER(16)    NOT  NULL  REFERENCES  product(prod_no),
content        CLOB,
PRIMARY KEY(review_no)
);

CREATE TABLE recipe(
recipe_no NUMBER 		 		NOT NULL,
recipe_name  VARCHAR2(20),
recipe_detail  VARCHAR2(50),
writer  VARCHAR2(20) REFERENCES  users(user_id),
reg_date  VARCHAR2(10),
file_name VARCHAR2(200),
difficulty NUMBER,
cooking_time NUMBER,		 
ingredient VARCHAR2(100),
recipe_order VARCHAR2(1000),
theme NUMBER,
review_num NUMBER 		 
);
insert into recipe values (seq_recipe_no.nextval,'Conchiglioni Rigati','타이풍 쉬림프 파스타','user12','20221220', '1622711370004681.jpg','초급',30,'야채','순서순서','양식','0');

INSERT 
INTO users ( user_id, user_name, password, role, ssn, cell_phone, addr, email, reg_date ) 
VALUES ( 'admin', 'admin', '1234', 'admin', NULL, NULL, '서울시 서초구', 'admin@mvc.com',to_date('2012/01/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS')); 

INSERT 
INTO users ( user_id, user_name, password, role, ssn, cell_phone, addr, email, reg_date ) 
VALUES ( 'manager', 'manager', '1234', 'admin', NULL, NULL, NULL, 'manager@mvc.com', to_date('2012/01/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS'));          

INSERT INTO users 
VALUES ( 'user01', 'SCOTT', '1111', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user02', 'SCOTT', '2222', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user03', 'SCOTT', '3333', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user04', 'SCOTT', '4444', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user05', 'SCOTT', '5555', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user06', 'SCOTT', '6666', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user07', 'SCOTT', '7777', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user08', 'SCOTT', '8888', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user09', 'SCOTT', '9999', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user10', 'SCOTT', '1010', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user11', 'SCOTT', '1111', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user12', 'SCOTT', '1212', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user13', 'SCOTT', '1313', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user14', 'SCOTT', '1414', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user15', 'SCOTT', '1515', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user16', 'SCOTT', '1616', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user17', 'SCOTT', '1717', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user18', 'SCOTT', '1818', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user19', 'SCOTT', '1919', 'user', NULL, NULL, NULL, NULL, sysdate);
           
           

insert into product values (seq_product_prod_no.nextval,'Conchiglioni Rigati','타이풍 쉬림프 파스타','20220512',14000, '1622711370004681.jpg',sysdate,51,0);
insert into product values (seq_product_prod_no.nextval,'Vintage Plate','북유럽 빈티지 접시','20210516',31000, 'ddc55d4ef3b0257f17c2bb8560a40c91.jpg',sysdate,51,0);
insert into product values (seq_product_prod_no.nextval,'Wood Tray','혼밥 우드 트레이','20220315',16000, 'ddd.PNG',sysdate,51,0);
insert into product values (seq_product_prod_no.nextval,'Buttermilk Scone','고소한 스콘을 즐겨보세요','20220512',2500, 'waf.PNG',sysdate,51,0);
insert into product values (seq_product_prod_no.nextval,'Tiramisu Cake','달달한 조각 케이크','20220412',5000, '6627852889_l.jpg',sysdate,51,0);

commit;
