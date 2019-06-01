/*
 * TODO(Студент): Опишите процесс создания базы данных
 * 1. Создайте все таблицы, согласно предложенной диаграмме.
 * 2. Опишите все необходимые отношения между таблицами.
 * 3. Добавьте в каждую таблицу минимум три записи.
 */

   CREATE TABLE UserInfo
      (id INT PRIMARY KEY ,
      name VARCHAR(255) NOT NULL,
      surname VARCHAR(255) NOT NULL
    );

  CREATE TABLE Roles (
      id INT UNIQUE ,
      name VARCHAR(255) PRIMARY KEY
  );

  CREATE TABLE Users (
      id INT UNIQUE,
      email VARCHAR(255) PRIMARY KEY,
      password VARCHAR(255),
      info INT references UserInfo(id) UNIQUE,
      role INT references Roles(id)
  );

 CREATE TABLE  Orders (
     id INT PRIMARY KEY,
     users INT references Users(id)
 );

  CREATE TABLE Supplier (
      id INT UNIQUE,
      name VARCHAR(255) PRIMARY KEY,
      address VARCHAR(255) NOT NULL,
      phone VARCHAR(255),
      representative VARCHAR(255) NOT NULL
  );

  CREATE TABLE Product (
      id INT UNIQUE,
      code VARCHAR(255) PRIMARY KEY,
      title VARCHAR(255),
      supplier INT references Supplier(id),
      initial_price DOUBLE,
      retail_value DOUBLE
 );

 CREATE TABLE Order2Product (
     orders int references Orders(id),
     product int references Product(id),
     PRIMARY KEY (orders,product)
 );

ALTER TABLE Orders ADD COLUMN created timestamp;

  INSERT into Users (id, email, password, info, role) VALUES
      (1,'test1@gmailcom', 'test1', 10,1),
      (2, 'test2@gmail.com', 'test2',20,2),
      (3, 'test3@gmail.com', 'test3',30,2);
SELECT * from ROLES;

 INSERT into UserInfo (id, name, surname) VALUES
     (10,'Vasya','Ivanov'),
     (20, 'Petya', 'Sidorov'),
     (30, 'Kolya', 'Kirkorov');

 INSERT into Roles (id,name) VALUES
     (1, 'BestUser'),
     (2,'NormalUser');

INSERT into Orders (id, users, created ) values
    (123,1,'2019-03-01 03:03:20'),
    (34555,1,'2019-03-04 21:13:20'),
    (5565876,3,'2019-03-08 17:43:20');

INSERT into PRODUCT (ID, CODE, TITLE, SUPPLIER, INITIAL_PRICE, RETAIL_VALUE) VALUES
    (101, '3039940','Product1', 71, 200.5,30.1),
    (201,'457987534','Product2',72,40,33.6),
    (301,'46987893','Product3',73,55.4,176.3);

INSERT into SUPPLIER (ID, NAME, ADDRESS, PHONE, REPRESENTATIVE) values
    (71, 'Company1','Adress1','89004006855','Ivan'),
    (72, 'Company2','Adress2','89004006855','Ivan'),
    (73, 'Company3','Adress3','89004006855','Ivan');

INSERT into ORDER2PRODUCT (ORDERS, PRODUCT) VALUES
    (123,101),
    (34555,201),
    (5565876,301);

