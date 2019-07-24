CREATE SCHEMA `groupprojectdb` DEFAULT CHARACTER SET utf8mb4 ;

CREATE TABLE `groupprojectdb`.`authors` (
  `author_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `date_of_birth` DATE NULL,
  `date_of_death` DATE NULL,
  `biography` VARCHAR(1000) NULL,
  `url_path` VARCHAR(100) NULL,
  PRIMARY KEY (`author_id`));

CREATE TABLE `groupprojectdb`.`publishers` (
  `publisher_id` INT NOT NULL AUTO_INCREMENT,
  `brand` VARCHAR(45) NOT NULL,
  `info` VARCHAR(1000) NULL,
  PRIMARY KEY (`publisher_id`));

CREATE TABLE `groupprojectdb`.`quantities` (
  `quantity_id` INT NOT NULL AUTO_INCREMENT,
  `quantity` INT(3) NOT NULL,
  PRIMARY KEY (`quantity_id`));

CREATE TABLE `groupprojectdb`.`categories` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `category` VARCHAR(45) NOT NULL UNIQUE,
  PRIMARY KEY (`category_id`));

CREATE TABLE `groupprojectdb`.`books` (
  `book_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `summary` VARCHAR(1000) NULL,
  `isbn` VARCHAR(20) NULL,
  `cover` ENUM('Paperback', 'Hardback') NULL,
  `year_published` INT(4) NULL,
  `url_path` VARCHAR(100) NULL,
  `price` INT(3) NULL,
  `book_series` VARCHAR(100) NULL,
  `publisher_id` INT NULL,
  `quantity_id` INT NULL,
  PRIMARY KEY (`book_id`),
  CONSTRAINT `FK_Books_1`
    FOREIGN KEY (`publisher_id`) REFERENCES `groupprojectdb`.`publishers` (`publisher_id`),
  CONSTRAINT `FK_Books_2`
    FOREIGN KEY (`quantity_id`) REFERENCES `groupprojectdb`.`quantities` (`quantity_id`));
    
CREATE TABLE `groupprojectdb`.`written_by` (
  `written_by_id` INT NOT NULL AUTO_INCREMENT,
  `book_id` INT NOT NULL,
  `author_id` INT NOT NULL,
  PRIMARY KEY (`written_by_id`),
  CONSTRAINT `FK_Written_by_1`
    FOREIGN KEY (`book_id`) REFERENCES `groupprojectdb`.`books` (`book_id`),
  CONSTRAINT `FK_Written_by_2`
    FOREIGN KEY (`author_id`) REFERENCES `groupprojectdb`.`authors` (`author_id`));
    
CREATE TABLE `groupprojectdb`.`belongs` (
  `belong_id` INT NOT NULL AUTO_INCREMENT,
  `book_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`belong_id`),
  CONSTRAINT `FK_Belongs_1`
    FOREIGN KEY (`book_id`) REFERENCES `groupprojectdb`.`books` (`book_id`),
  CONSTRAINT `FK_Belongs_2`
    FOREIGN KEY (`category_id`) REFERENCES `groupprojectdb`.`categories` (`category_id`));
    
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
CREATE TABLE `groupprojectdb`.`invoices` (
  `invoice_id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NULL,
  `user_id` BIGINT NOT NULL,
  PRIMARY KEY (`invoice_id`),
  CONSTRAINT `FK_Invoices_1` FOREIGN KEY (`user_id`) REFERENCES `groupprojectdb`.`APP_USER` (`id`));

CREATE TABLE `groupprojectdb`.`boughts` (
  `bought_id` INT NOT NULL AUTO_INCREMENT,
  `price` INT(3) NOT NULL,
  `invoice_id` INT NOT NULL,
  `book_id` INT NOT NULL,
  PRIMARY KEY (`bought_id`),
  CONSTRAINT `FK_Bought_1` FOREIGN KEY (`invoice_id`) REFERENCES `groupprojectdb`.`invoices` (`invoice_id`),
  CONSTRAINT `FK_Bought_2` FOREIGN KEY (`book_id`) REFERENCES `groupprojectdb`.`books` (`book_id`));

INSERT INTO `groupprojectdb`.`categories` (`category`) VALUES ('Detective');
INSERT INTO `groupprojectdb`.`categories` (`category`) VALUES ('Fantasy');

INSERT INTO `groupprojectdb`.`publishers` (`brand`, `info`) VALUES ('Dioptra', 'info about Dioptra');
INSERT INTO `groupprojectdb`.`publishers` (`brand`, `info`) VALUES ('Anubis', 'info about Anubis');
INSERT INTO `groupprojectdb`.`publishers` (`brand`, `info`) VALUES ('BELL', 'info about BELL');

INSERT INTO `groupprojectdb`.`authors` (`first_name`, `last_name`, `date_of_birth`, `date_of_death`, `biography`) VALUES ('Isaac', 'Asimov', '1920-01-02', '1992-04-06', 'Isaac Asimov (/ˈaɪzᵻk ˈæzᵻmɒv/; born Isaak Yudovich Ozimov; circa January 2, 1920 - April 6, 1992) was an American author and professor of biochemistry at Boston University, best known for his works of science fiction and for his popular science books. Asimov was prolific and wrote or edited more than 500 books and an estimated 90,000 letters and postcards. His books have been published in 9 of the 10 major categories of the Dewey Decimal Classification.');

INSERT INTO `groupprojectdb`.`quantities` (`quantity`) VALUES ('5');
INSERT INTO `groupprojectdb`.`quantities` (`quantity`) VALUES ('2');
INSERT INTO `groupprojectdb`.`quantities` (`quantity`) VALUES ('7');

INSERT INTO `groupprojectdb`.`books` (`title`, `summary`, `isbn`, `cover`, `year_published`, `book_series`, `price`, `publisher_id`,`quantity_id`) VALUES ('Foundation', 'The Foundation series is Isaac Asimov’s iconic masterpiece. Unfolding against the backdrop of a crumbling Galactic Empire, the story of Hari Seldon’s two Foundations is a lasting testament to an extraordinary imagination, one whose unprecedented scale shaped science fiction as we know it today. The Galactic Empire has prospered for twelve thousand years. Nobody suspects that the heart of the thriving Empire is rotten, until psychohistorian Hari Seldon uses his new science to foresee its terrible fate. Exiled to the desolate planet Terminus, Seldon establishes a colony of the greatest minds in the Empire, a Foundation which holds the key to changing the fate of the galaxy. However, the death throes of the Empire breed hostile new enemies, and the young Foundation’s fate will be threatened first.', '9789604972661', 'Paperback', '2011', 'Foundation', '9', '2','1');
INSERT INTO `groupprojectdb`.`books` (`title`, `summary`, `isbn`, `cover`, `year_published`, `book_series`, `price`, `publisher_id`,`quantity_id`) VALUES ('Foundation and Empire', 'The Foundation series is Isaac Asimov s iconic masterpiece. Unfolding against the backdrop of a crumbling Galactic Empire, the story of Hari Seldon s two Foundations is a lasting testament to an extraordinary imagination, one whose unprecedented scale shaped science fiction as we know it today. The First Foundation survived two centuries of barbarism as the once-mighty Galactic Empire descended into chaos. Now it mist prepare for war against the remnants of the Empire as the Imperial fleet advances on their planet, Terminus. Hari Seldon predicted this war; he even prepared his Foundation for it. But he couldn t foresee the birth of the mutant Mule. In possession of a power which reduces fearsome opposition to devoted slaves, the Mule poses a terrible threat to Seldon s Foundation.', '9789604972661', 'Paperback', '2012', 'Foundation', '9', '2','2');
INSERT INTO `groupprojectdb`.`books` (`title`, `summary`, `isbn`, `cover`, `year_published`, `book_series`, `price`, `publisher_id`,`quantity_id`) VALUES ('Second Foundation', 'The Foundation series is Isaac Asimov’s iconic masterpiece. Unfolding against the backdrop of a crumbling Galactic Empire, the story of Hari Seldon’s two Foundations is a lasting testament to an extraordinary imagination, one whose unprecedented scale shaped science fiction as we know it today. The Galactic Empire has prospered for twelve thousand years. Nobody suspects that the heart of the thriving Empire is rotten, until psychohistorian Hari Seldon uses his new science to foresee its terrible fate. Exiled to the desolate planet Terminus, Seldon establishes a colony of the greatest minds in the Empire, a Foundation which holds the key to changing the fate of the galaxy. However, the death throes of the Empire breed hostile new enemies, and the young Foundation’s fate will be threatened first.', '9789604972661', 'Paperback', '2014', 'Foundation', '9', '2','3');

INSERT INTO `groupprojectdb`.`written_by` (`book_id`, `author_id`) VALUES ('1', '1');

INSERT INTO `groupprojectdb`.`belongs` (`book_id`, `category_id`) VALUES ('1', '2');
INSERT INTO `groupprojectdb`.`belongs` (`book_id`, `category_id`) VALUES ('2', '2');
INSERT INTO `groupprojectdb`.`belongs` (`book_id`, `category_id`) VALUES ('3', '2');

INSERT INTO `groupprojectdb`.`invoices` (`date`, `user_id`) VALUES ('2019-03-21', '1');

INSERT INTO `groupprojectdb`.`boughts` (`price`, `invoice_id`, `book_id`) VALUES ('3', '1', '1');
INSERT INTO `groupprojectdb`.`boughts` (`price`, `invoice_id`, `book_id`) VALUES ('4', '1', '2');
INSERT INTO `groupprojectdb`.`boughts` (`price`, `invoice_id`, `book_id`) VALUES ('1', '1', '3');
