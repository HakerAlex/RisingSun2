CREATE DATABASE  IF NOT EXISTS `risingsun`; 
USE `risingsun`;

-- tables
-- Table articles
CREATE TABLE articles (
    ID int    NOT NULL  AUTO_INCREMENT,
    Title text    NOT NULL ,
    Article text    NOT NULL ,
    Author int    NOT NULL ,
    NamePage varchar(1500)    NOT NULL ,
    DateCreate timestamp    NOT NULL ,
    Image varchar(1500)    NULL ,
    Archive bool    NOT NULL ,
    CONSTRAINT articles_pk PRIMARY KEY (ID)
);

-- Table firstpage
CREATE TABLE firstpage (
    ID int    NOT NULL  AUTO_INCREMENT,
    Article_ID int    NOT NULL ,
    Raiting int    NOT NULL ,
    Feature bool    NOT NULL DEFAULT 0 ,
    CONSTRAINT firstpage_pk PRIMARY KEY (ID)
);

-- Table rules
CREATE TABLE rules (
    ID int    NOT NULL  AUTO_INCREMENT,
    NameRule varchar(1500)    NOT NULL ,
    CONSTRAINT rules_pk PRIMARY KEY (ID)
);

-- Table tags
CREATE TABLE tags (
    ID int    NOT NULL  AUTO_INCREMENT,
    Name varchar(1500)    NOT NULL ,
    CONSTRAINT tags_pk PRIMARY KEY (ID)
);

-- Table tagsarcticle
CREATE TABLE tagsarcticle (
    ID int    NOT NULL  AUTO_INCREMENT,
    ID_Teg int    NOT NULL ,
    ID_Arcticle int    NOT NULL ,
    CONSTRAINT tagsarcticle_pk PRIMARY KEY (ID)
);

-- Table users
CREATE TABLE users (
    ID int    NOT NULL  AUTO_INCREMENT,
    name varchar(100)    NOT NULL ,
    username varchar(50)    NOT NULL ,
    password varchar(1500)    NOT NULL ,
    status varchar(20)    NOT NULL ,
    CONSTRAINT users_pk PRIMARY KEY (ID)
);

-- Table usersrules
CREATE TABLE usersrules (
    ID int    NOT NULL  AUTO_INCREMENT,
    ID_Users int    NOT NULL ,
    ID_Rules int    NOT NULL ,
    CONSTRAINT usersrules_pk PRIMARY KEY (ID)
);


-- foreign keys
-- Reference:  Articles_Users (table: articles)


ALTER TABLE articles ADD CONSTRAINT Articles_Users FOREIGN KEY Articles_Users (Author)
    REFERENCES users (ID);
-- Reference:  FirstPage_Articles (table: firstpage)


ALTER TABLE firstpage ADD CONSTRAINT FirstPage_Articles FOREIGN KEY FirstPage_Articles (Article_ID)
    REFERENCES articles (ID);
-- Reference:  TegsArcticle_Articles (table: tagsarcticle)


ALTER TABLE tagsarcticle ADD CONSTRAINT TegsArcticle_Articles FOREIGN KEY TegsArcticle_Articles (ID_Arcticle)
    REFERENCES articles (ID);
-- Reference:  TegsArcticle_Tegs (table: tagsarcticle)


ALTER TABLE tagsarcticle ADD CONSTRAINT TegsArcticle_Tegs FOREIGN KEY TegsArcticle_Tegs (ID_Teg)
    REFERENCES tags (ID);
-- Reference:  UsersRules_Rules (table: usersrules)


ALTER TABLE usersrules ADD CONSTRAINT UsersRules_Rules FOREIGN KEY UsersRules_Rules (ID_Rules)
    REFERENCES rules (ID);
-- Reference:  UsersRules_Users (table: usersrules)


ALTER TABLE usersrules ADD CONSTRAINT UsersRules_Users FOREIGN KEY UsersRules_Users (ID_Users)
    REFERENCES users (ID);


LOCK TABLES `rules` WRITE;
INSERT INTO `rules` VALUES (1,'Admin'),(2,'Author'),(3,'Editor'),(4,'Corrector');

LOCK TABLES `users` WRITE;
INSERT INTO `users` VALUES (1,'Alex Potemkin','admin','13f4665574daccb908a4a5e444bbc1a5a6d6ab4bb2e6b22a7dd36b70b12acc54','ACTIVE'),(2,'Vasia Pupkin','editor','13f4665574daccb908a4a5e444bbc1a5a6d6ab4bb2e6b22a7dd36b70b12acc54','ACTIVE'),(3,'Petr Vasilev','author','13f4665574daccb908a4a5e444bbc1a5a6d6ab4bb2e6b22a7dd36b70b12acc54','ACTIVE'),(4,'Ivan Ivanov','corrector','13f4665574daccb908a4a5e444bbc1a5a6d6ab4bb2e6b22a7dd36b70b12acc54','ACTIVE');
	
LOCK TABLES `usersrules` WRITE;
INSERT INTO `usersrules` (ID_Users,ID_Rules) VALUES (1,1),(2,2),(3,3),(4,4);	

UNLOCK TABLES;
-- End of file.

