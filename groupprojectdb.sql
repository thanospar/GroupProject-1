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