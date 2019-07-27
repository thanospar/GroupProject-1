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
  `quantity` INT(3) NULL,
  PRIMARY KEY (`book_id`),
  CONSTRAINT `FK_Books_1`
    FOREIGN KEY (`publisher_id`) REFERENCES `groupprojectdb`.`publishers` (`publisher_id`));
    
CREATE TABLE `groupprojectdb`.`written_by` (
  `written_by_id` INT NOT NULL AUTO_INCREMENT,
  `book_id` INT NOT NULL,
  `author_id` INT NOT NULL,
  PRIMARY KEY (`written_by_id`),
  CONSTRAINT `FK_Written_by_1`
    FOREIGN KEY (`book_id`) REFERENCES `groupprojectdb`.`books` (`book_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Written_by_2`
    FOREIGN KEY (`author_id`) REFERENCES `groupprojectdb`.`authors` (`author_id`) ON DELETE CASCADE);
    
CREATE TABLE `groupprojectdb`.`belongs` (
  `belong_id` INT NOT NULL AUTO_INCREMENT,
  `book_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`belong_id`),
  CONSTRAINT `FK_Belongs_1`
    FOREIGN KEY (`book_id`) REFERENCES `groupprojectdb`.`books` (`book_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Belongs_2`
    FOREIGN KEY (`category_id`) REFERENCES `groupprojectdb`.`categories` (`category_id`) ON DELETE CASCADE);
    
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
INSERT INTO `groupprojectdb`.`categories` (`category`) VALUES ('Horror');
INSERT INTO `groupprojectdb`.`categories` (`category`) VALUES ('Science Fiction');

INSERT INTO `groupprojectdb`.`publishers` (`brand`, `info`) VALUES ('Dioptra', 'info about Dioptra');
INSERT INTO `groupprojectdb`.`publishers` (`brand`, `info`) VALUES ('Anubis', 'info about Anubis');
INSERT INTO `groupprojectdb`.`publishers` (`brand`, `info`) VALUES ('BELL', 'info about BELL');

INSERT INTO `groupprojectdb`.`authors` (`first_name`, `last_name`, `date_of_birth`, `date_of_death`, `biography`, `url_path`) VALUES ('Isaac', 'Asimov', '1920-01-02', '1992-04-06', 'Isaac Asimov (/ˈaɪzᵻk ˈæzᵻmɒv/; born Isaak Yudovich Ozimov; circa January 2, 1920 - April 6, 1992) was an American author and professor of biochemistry at Boston University, best known for his works of science fiction and for his popular science books. Asimov was prolific and wrote or edited more than 500 books and an estimated 90,000 letters and postcards. His books have been published in 9 of the 10 major categories of the Dewey Decimal Classification.', 'IssacAsimov.jpg');
INSERT INTO `groupprojectdb`.`authors` (`first_name`, `last_name`, `date_of_birth`, `biography`, `url_path`) VALUES ('Clive', 'Barker', '1952-10-05', 'Barker is an author of horror/fantasy. He began writing horror early in his career, mostly in the form of short stories (collected in Books of Blood 1–6) and the Faustian novel The Damnation Game (1985). Later he moved towards modern-day fantasy and urban fantasy with horror elements in Weaveworld (1987), The Great and Secret Show (1989), the world-spanning Imajica (1991), and Sacrament (1996). When Books of Blood were first published in the United States in paperback, Stephen King was quoted on the book covers: "I have seen the future of horror and his name is Clive Barker."[5] As influences on his writing, Barker lists Herman Melville, Edgar Allan Poe, Ray Bradbury, William S. Burroughs, William Blake, and Jean Cocteau, among others. He is the writer of the best-selling Abarat series, and plans on producing two more novels in the series.', 'CliveBarker.jpg');
INSERT INTO `groupprojectdb`.`authors` (`first_name`, `last_name`, `date_of_birth`, `biography`, `url_path`) VALUES ('Dan', 'Simmons', '1948-04-04', 'Dan Simmons (born April 4, 1948) is an American science fiction and horror writer. He is the author of the Hyperion Cantos and the Ilium/Olympos cycles, among other works which span the science fiction, horror, and fantasy genres, sometimes within a single novel. A typical example of Simmons intermingling of genres is Song of Kali (1985), winner of the World Fantasy Award. He also writes mysteries and thrillers, some of which feature the continuing character Joe Kurtz.', 'DanSimmons.jpg');

INSERT INTO `groupprojectdb`.`books` (`title`, `summary`, `isbn`, `cover`, `year_published`, `book_series`, `price`, `url_path`, `publisher_id`,`quantity`) VALUES ('Foundation', 'The Foundation series is Isaac Asimov’s iconic masterpiece. Unfolding against the backdrop of a crumbling Galactic Empire, the story of Hari Seldon’s two Foundations is a lasting testament to an extraordinary imagination, one whose unprecedented scale shaped science fiction as we know it today. The Galactic Empire has prospered for twelve thousand years. Nobody suspects that the heart of the thriving Empire is rotten, until psychohistorian Hari Seldon uses his new science to foresee its terrible fate. Exiled to the desolate planet Terminus, Seldon establishes a colony of the greatest minds in the Empire, a Foundation which holds the key to changing the fate of the galaxy. However, the death throes of the Empire breed hostile new enemies, and the young Foundation’s fate will be threatened first.', '9789604972661', 'Paperback', '2011', 'Foundation', '10', 'foundation.jpg', '2','11');
INSERT INTO `groupprojectdb`.`books` (`title`, `summary`, `isbn`, `cover`, `year_published`, `book_series`, `price`, `url_path`, `publisher_id`,`quantity`) VALUES ('Foundation and Empire', 'The Foundation series is Isaac Asimov s iconic masterpiece. Unfolding against the backdrop of a crumbling Galactic Empire, the story of Hari Seldon s two Foundations is a lasting testament to an extraordinary imagination, one whose unprecedented scale shaped science fiction as we know it today. The First Foundation survived two centuries of barbarism as the once-mighty Galactic Empire descended into chaos. Now it mist prepare for war against the remnants of the Empire as the Imperial fleet advances on their planet, Terminus. Hari Seldon predicted this war; he even prepared his Foundation for it. But he couldn t foresee the birth of the mutant Mule. In possession of a power which reduces fearsome opposition to devoted slaves, the Mule poses a terrible threat to Seldon s Foundation.', '9789604972661', 'Paperback', '2012', 'Foundation', '9', 'foundationempire.jpg', '2', '22');
INSERT INTO `groupprojectdb`.`books` (`title`, `summary`, `isbn`, `cover`, `year_published`, `book_series`, `price`, `url_path`, `publisher_id`,`quantity`) VALUES ('Second Foundation', 'The Foundation series is Isaac Asimov’s iconic masterpiece. Unfolding against the backdrop of a crumbling Galactic Empire, the story of Hari Seldon’s two Foundations is a lasting testament to an extraordinary imagination, one whose unprecedented scale shaped science fiction as we know it today. The Galactic Empire has prospered for twelve thousand years. Nobody suspects that the heart of the thriving Empire is rotten, until psychohistorian Hari Seldon uses his new science to foresee its terrible fate. Exiled to the desolate planet Terminus, Seldon establishes a colony of the greatest minds in the Empire, a Foundation which holds the key to changing the fate of the galaxy. However, the death throes of the Empire breed hostile new enemies, and the young Foundation’s fate will be threatened first.', '9789604972661', 'Paperback', '2014', 'Foundation', '11', 'secondfoundation.jpg', '2','13');
INSERT INTO `groupprojectdb`.`books` (`title`, `summary`, `isbn`, `cover`, `year_published`, `price`, `url_path`, `publisher_id`,`quantity`) VALUES ('Weaveworld', 'Reissue of the highly acclaimed thriller by the world’s most outstanding dark fantasist. WEAVEWORLD is an epic adventure of the imagination. It begins with a carpet in which a world of rapture and enchantment is hiding; a world which comes to life, alerting the dark forces and beginning a desperate battle to preserve the last vestiges of magic which Humankind still has access to. WEAVEWORLD is a book of visions and horrors, a story of quest, titanic struggles, of love and of hope. It is a triumph of imagination and storytelling, an adventure, a nightmare, a promise… ‘Barker’s fecundity of invention is beyond praise. In a world of hard-bitten horror and originality, Clive Barker dislocates your mind.’ THE MAIL ON SUNDAY.', '978-960-620-453-1', 'Paperback', '2009', '18', 'weaveworld.jpg', '3','46');
INSERT INTO `groupprojectdb`.`books` (`title`, `summary`, `isbn`, `cover`, `year_published`, `book_series`, `price`, `url_path`, `publisher_id`,`quantity`) VALUES ('Hyperion', 'It is the 29th century and the universe of the Human Hegemony is under threat. Invasion by the warlike Ousters looms, and the mysterious schemes of the secessionist AI TechnoCore bring chaos ever closer. On the eve of disaster, with the entire galaxy at war, seven pilgrims set fourth on a final voyage to the legendary Time Tombs on Hyperion, home to the Shrike, a lethal creature, part god and part killing machine, whose powers transcend the limits of time and space. The pilgrims have resolved to die before discovering anyhting less than the secrets of the universe itself.', '9780575076372', 'Paperback', '2005', 'Hyperion Cantos', '14', 'hyperion.jpg', '2','13');
INSERT INTO `groupprojectdb`.`books` (`title`, `summary`, `isbn`, `cover`, `year_published`, `book_series`, `price`, `url_path`, `publisher_id`,`quantity`) VALUES ('The Fall of Hyperion', 'The mysterious Time Tombs are opening and the Shrike that has risen from them may well control the fate of all mankind. The Ousters are laying seige to the Hegemony of Man and the AIs we created have turned against us to build the Ultimate Intelligence; God. The God of Machines. His genesis could mean annihilation for man. Something is drawing the hegemony, the Ousters, the AIs, the entire universe to the Shrike.', '9780575099487', 'Paperback', '2012', 'Hyperion Cantos', '15', 'hyperionfall.jpg', '2','19');

INSERT INTO `groupprojectdb`.`written_by` (`book_id`, `author_id`) VALUES ('1', '1');
INSERT INTO `groupprojectdb`.`written_by` (`book_id`, `author_id`) VALUES ('2', '1');
INSERT INTO `groupprojectdb`.`written_by` (`book_id`, `author_id`) VALUES ('3', '1');
INSERT INTO `groupprojectdb`.`written_by` (`book_id`, `author_id`) VALUES ('4', '2');
INSERT INTO `groupprojectdb`.`written_by` (`book_id`, `author_id`) VALUES ('5', '3');
INSERT INTO `groupprojectdb`.`written_by` (`book_id`, `author_id`) VALUES ('6', '3');

INSERT INTO `groupprojectdb`.`belongs` (`book_id`, `category_id`) VALUES ('1', '2');
INSERT INTO `groupprojectdb`.`belongs` (`book_id`, `category_id`) VALUES ('2', '2');
INSERT INTO `groupprojectdb`.`belongs` (`book_id`, `category_id`) VALUES ('3', '2');
INSERT INTO `groupprojectdb`.`belongs` (`book_id`, `category_id`) VALUES ('4', '3');
INSERT INTO `groupprojectdb`.`belongs` (`book_id`, `category_id`) VALUES ('5', '4');
INSERT INTO `groupprojectdb`.`belongs` (`book_id`, `category_id`) VALUES ('6', '4');

INSERT INTO `groupprojectdb`.`invoices` (`date`, `user_id`) VALUES ('2019-03-21', '1');

INSERT INTO `groupprojectdb`.`boughts` (`price`, `invoice_id`, `book_id`) VALUES ('3', '1', '1');
INSERT INTO `groupprojectdb`.`boughts` (`price`, `invoice_id`, `book_id`) VALUES ('4', '1', '2');
INSERT INTO `groupprojectdb`.`boughts` (`price`, `invoice_id`, `book_id`) VALUES ('1', '1', '3');
