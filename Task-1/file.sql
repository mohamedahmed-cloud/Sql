-- Online SQL Editor to Run SQL Online.
-- Use the editor to create new tables, insert data and all other SQL operations.
  
SELECT * FROM Customers;
CREATE TABLE recipes (
  student_id INT NOT NULL,
  frist_name VARCHAR(30) NOT NULL,
  second_name VARCHAR(30) NOT NULL,
  age INT NOT NULL,
  email VARCHAR(30) NOT NULL,
  PRIMARY KEY (student_id),
  UNIQUE (frist_name),
  UNIQUE (second_name),
  UNIQUE (age),
  UNIQUE (email)

);

INSERT INTO recipes 
    (student_id, frist_name,second_name,age,email) 
VALUES 
    (1,"mohamed","yousef",21,"may@gamil.com");