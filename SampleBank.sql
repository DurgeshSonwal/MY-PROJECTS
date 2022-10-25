
-- This is basic database of sample data of Bank Database Management System 

create DATABASE BMS_DB1;
use BMS_DB1;


-- CUSTOMER_PERSONAL_INFO

CREATE TABLE customer_personal_info
(	
	customer_id VARCHAR(5),
    customer_name VARCHAR(30),
    date_of_birth DATE,
    guardian_name VARCHAR(30),
    address VARCHAR(50),
    contact_no  BIGINT(10),
    mail_id VARCHAR(30),
    gender CHAR(1),
    marital_status VARCHAR(10),
    identification_doc_type VARCHAR(20),
    id_doc_no VARCHAR(20),
    citizenship VARCHAR(10),
    CONSTRAINT cust_pers_info_pk PRIMARY KEY(customer_id)
);        
        
        
-- CUSTOMER_REFERENCE_INFO
    
CREATE TABLE customer_reference_info
(	
	customer_id VARCHAR(5),
    reference_acc_name VARCHAR(20),
    reference_acc_no BIGINT(16),
    reference_acc_address VARCHAR(50),
    relation VARCHAR(25),
    CONSTRAINT cust_ref_info_pk PRIMARY KEY(customer_id),
    CONSTRAINT cust_ref_info_pk FOREIGN KEY(customer_id) REFERENCES CUSTOMER_PERSONAL_INFO(customer_id)
);


-- BANK_INFO

CREATE TABLE bank_info
(	
	ifsc_code VARCHAR(15),
    bank_name VARCHAR(25),
    branch_name VARCHAR(25),
    CONSTRAINT bank_info_pk PRIMARY KEY(ifsc_code)
);


-- ACCOUNT_INFO

CREATE TABLE account_info
(	
	account_no BIGINT(16),
    customer_id VARCHAR(5),
    account_type VARCHAR(10),
    registration_date DATE,
    activation_date DATE,
    ifsc_code VARCHAR(15),
    interest DECIMAL(7,2),
    initial_deposit BIGINT(10),
    CONSTRAINT acc_info_pk PRIMARY KEY(account_no),
    CONSTRAINT acc_info_pers_fk FOREIGN KEY(customer_id) REFERENCES customer_personal_info(customer_id),
    CONSTRAINT acc_info_bank_fk FOREIGN KEY(ifsc_code) REFERENCES bank_info(ifsc_code)
);


-- BANK_INFO

INSERT INTO bank_info(ifsc_code, bank_name, branch_name) VALUES('HDFC0008793','HDFC','VALASARAVAKKAM');
INSERT INTO bank_info(ifsc_code, bank_name, branch_name) VALUES('SBIN0004342','SBI','TNAGAR');
INSERT INTO bank_info(ifsc_code, bank_name, branch_name) VALUES('ICIC0001844','ICICI','TNAGAR');
INSERT INTO bank_info(ifsc_code, bank_name, branch_name) VALUES('ICIC0006283','ICICI','PERUNGUDI');
INSERT INTO bank_info(ifsc_code, bank_name, branch_name) VALUES('SBIN0006354','SBI','SAIDAPET');


-- CUSTOMER_PERSONAL_INFO

INSERT INTO customer_personal_info(customer_id, customer_name, date_of_birth, guardian_name, address, contact_no, mail_id, gender, marital_status, identification_doc_type, id_doc_no, citizenship) VALUES('C-001','JOHN','1984-05-03','PETER','NO.14, ST.MARKD ROAD, BANGALORE','9734527343','john_123@gmial.com','m','married','AADHAR CARD','2093 4787 2833','INDIAN');
INSERT INTO customer_personal_info(customer_id, customer_name, date_of_birth, guardian_name, address, contact_no, mail_id, gender, marital_status, identification_doc_type, id_doc_no, citizenship) VALUES('C-002','JAMES','1983-07-08','GEORGE','NO.19, MG ROAD, BANGALORE','9837336347','james55@gmial.com','m','married','AADHAR CARD','6789 3453 2976','INDIAN');
INSERT INTO customer_personal_info(customer_id, customer_name, date_of_birth, guardian_name, address, contact_no, mail_id, gender, marital_status, identification_doc_type, id_doc_no, citizenship) VALUES('C-003','SUNITHA','1984-10-06','BINOD','NO.21, GM ROAD, CHENNAI','9833200043','098suni@gmial.com','f','single','AADHAR CARD','8343 3449 8652','INDIAN');
INSERT INTO customer_personal_info(customer_id, customer_name, date_of_birth, guardian_name, address, contact_no, mail_id, gender, marital_status, identification_doc_type, id_doc_no, citizenship) VALUES('C-004','RAMESH','1985-12-11','KRISHNAN','NO.08, LB ROAD, CHENNAI','7898326329','ramesh9876@gmial.com','m','married','AADHAR CARD','3437 2039 3493','INDIAN');
INSERT INTO customer_personal_info(customer_id, customer_name, date_of_birth, guardian_name, address, contact_no, mail_id, gender, marital_status, identification_doc_type, id_doc_no, citizenship) VALUES('C-005','KUMAR','1983-04-26','KIRAN','NO.14, MM ROAD, BANGALORE','8874633274','kumar_5@gmial.com','m','married','AADHAR CARD','3848 0908 5565','INDIAN');


-- CUSTOMER_REFERENCE_INFO

INSERT INTO customer_reference_info(customer_id, reference_acc_name, reference_acc_no, reference_acc_address, relation) VALUES('C-001','JOHN','97387437436286','BANGALORE','Customer');
INSERT INTO customer_reference_info(customer_id, reference_acc_name, reference_acc_no, reference_acc_address, relation) VALUES('C-002','JAMES','97235401672','BANGALORE','Customer');
INSERT INTO customer_reference_info(customer_id, reference_acc_name, reference_acc_no, reference_acc_address, relation) VALUES('C-003','SUNITHA','76532077809','CHENNAI','Employee');
INSERT INTO customer_reference_info(customer_id, reference_acc_name, reference_acc_no, reference_acc_address, relation) VALUES('C-004','RAMESH','48623872084','CHENNAI','Customer');
INSERT INTO customer_reference_info(customer_id, reference_acc_name, reference_acc_no, reference_acc_address, relation) VALUES('C-005','KUMAR','53244362024','BANGALORE','Customer');


-- ACCOUNT_INFO

INSERT INTO account_info(account_no, customer_id, account_type, registration_date, activation_date, ifsc_code, interest, initial_deposit) VALUES('97387437436286','C-001','savings','2015-03-11','2015-05-09','HDFC0008793','1.50','1380000');
INSERT INTO account_info(account_no, customer_id, account_type, registration_date, activation_date, ifsc_code, interest, initial_deposit) VALUES('382354016722','C-002','savings','2015-06-28','2015-08-17','ICIC0001844','2.00','2460000');
INSERT INTO account_info(account_no, customer_id, account_type, registration_date, activation_date, ifsc_code, interest, initial_deposit) VALUES('765320778098','C-003','savings','2016-12-06','2017-02-21','ICIC0006283','1.00','940000');
INSERT INTO account_info(account_no, customer_id, account_type, registration_date, activation_date, ifsc_code, interest, initial_deposit) VALUES('48623872084','C-004','savings','2015-02-20','2015-05-15','SBIN0004342','1.50','1800000');
INSERT INTO account_info(account_no, customer_id, account_type, registration_date, activation_date, ifsc_code, interest, initial_deposit) VALUES('53244362024','C-005','savings','2015-08-29','2015-10-13','SBIN0006354','2.00','2070000');


