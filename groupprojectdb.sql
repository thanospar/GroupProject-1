CREATE SCHEMA `groupprojectdb` DEFAULT CHARACTER SET utf8mb4 ;

CREATE TABLE `groupprojectdb`.`authors` (
  `author_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `date_of_birth` DATE NULL,
  `date_of_death` DATE NULL,
  `biography` VARCHAR(1000) NULL,
  PRIMARY KEY (`author_id`));

CREATE TABLE `groupprojectdb`.`publishers` (
  `publisher_id` INT NOT NULL AUTO_INCREMENT,
  `brand` VARCHAR(45) NOT NULL,
  `info` VARCHAR(1000) NULL,
  PRIMARY KEY (`publisher_id`));

CREATE TABLE `groupprojectdb`.`book_series` (
  `book_series_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`book_series_id`));

CREATE TABLE `groupprojectdb`.`categories` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `category` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`category_id`));

CREATE TABLE `groupprojectdb`.`books` (
  `book_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `summary` VARCHAR(1000) NULL,
  `isbn` VARCHAR(20) NULL,
  `cover` ENUM('Paperback', 'Hardback') NULL,
  `year_published` DATE NULL,
  `publisher_id` INT NULL,
  `book_series_id` INT NULL,
  PRIMARY KEY (`book_id`),
  CONSTRAINT `FK_Books_1`
    FOREIGN KEY (`publisher_id`) REFERENCES `groupprojectdb`.`publishers` (`publisher_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Books_2`
    FOREIGN KEY (`book_series_id`) REFERENCES `groupprojectdb`.`book_series` (`book_series_id`) ON DELETE NO ACTION ON UPDATE NO ACTION);
    
CREATE TABLE `groupprojectdb`.`written_by` (
  `written_by_id` INT NOT NULL AUTO_INCREMENT,
  `book_id` INT NOT NULL,
  `author_id` INT NOT NULL,
  PRIMARY KEY (`written_by_id`),
  CONSTRAINT `FK_Written_by_1`
    FOREIGN KEY (`book_id`) REFERENCES `groupprojectdb`.`books` (`book_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Written_by_2`
    FOREIGN KEY (`author_id`) REFERENCES `groupprojectdb`.`authors` (`author_id`) ON DELETE NO ACTION ON UPDATE NO ACTION);
    
CREATE TABLE `groupprojectdb`.`belongs` (
  `belong_id` INT NOT NULL AUTO_INCREMENT,
  `book_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`belong_id`),
  CONSTRAINT `FK_Belongs_1`
    FOREIGN KEY (`book_id`) REFERENCES `groupprojectdb`.`books` (`book_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Belongs_2`
    FOREIGN KEY (`category_id`) REFERENCES `groupprojectdb`.`categories` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION);
    
/*All User's gets stored in APP_USER table*/
create table groupprojectdb.APP_USER (
   id BIGINT NOT NULL AUTO_INCREMENT,
   sso_id VARCHAR(30) NOT NULL,
   password VARCHAR(100) NOT NULL,
   first_name VARCHAR(30) NOT NULL,
   last_name  VARCHAR(30) NOT NULL,
   email VARCHAR(30) NOT NULL,
   PRIMARY KEY (id),
   UNIQUE (sso_id)
);
   
/* USER_PROFILE table contains all possible roles */ 
create table groupprojectdb.USER_PROFILE(
   id BIGINT NOT NULL AUTO_INCREMENT,
   type VARCHAR(30) NOT NULL,
   PRIMARY KEY (id),
   UNIQUE (type)
);
   
/* JOIN TABLE for MANY-TO-MANY relationship*/  
CREATE TABLE groupprojectdb.APP_USER_USER_PROFILE (
    user_id BIGINT NOT NULL,
    user_profile_id BIGINT NOT NULL,
    PRIMARY KEY (user_id, user_profile_id),
    CONSTRAINT FK_APP_USER FOREIGN KEY (user_id) REFERENCES APP_USER (id),
    CONSTRAINT FK_USER_PROFILE FOREIGN KEY (user_profile_id) REFERENCES USER_PROFILE (id)
);
  
/* Populate USER_PROFILE Table */
INSERT INTO groupprojectdb.USER_PROFILE(type)
VALUES ('USER');
  
INSERT INTO groupprojectdb.USER_PROFILE(type)
VALUES ('ADMIN');
  
INSERT INTO groupprojectdb.USER_PROFILE(type)
VALUES ('DBA');
  
  
/* Populate one Admin User which will further create other users for the application using GUI */
INSERT INTO groupprojectdb.APP_USER(sso_id, password, first_name, last_name, email)
VALUES ('sam','$2a$10$4eqIF5s/ewJwHK1p8lqlFOEm2QIA0S8g6./Lok.pQxqcxaBZYChRm', 'Sam','Smith','samy@xyz.com');
  
  
/* Populate JOIN Table */
INSERT INTO groupprojectdb.APP_USER_USER_PROFILE (user_id, user_profile_id)
  SELECT user.id, profile.id FROM groupprojectdb.app_user user, groupprojectdb.user_profile profile
  where user.sso_id='sam' and profile.type='ADMIN';
 
/* Create persistent_logins Table used to store rememberme related stuff*/
CREATE TABLE groupprojectdb.persistent_logins (
    username VARCHAR(64) NOT NULL,
    series VARCHAR(64) NOT NULL,
    token VARCHAR(64) NOT NULL,
    last_used TIMESTAMP NOT NULL,
    PRIMARY KEY (series)
);