CREATE SCHEMA IF NOT EXISTS angusshop;
use `angusshop`;

CREATE TABLE category
(
  catid   INT          NOT NULL AUTO_INCREMENT,
  catname VARCHAR(255) NULL    ,
  catdesc VARCHAR(255) NULL    ,
  PRIMARY KEY (catid)
);

CREATE TABLE chat
(
  chatid INT NOT NULL AUTO_INCREMENT,
  userid INT NOT NULL,
  prodid INT NOT NULL,
  PRIMARY KEY (chatid)
);

CREATE TABLE product
(
  prodid      INT          NOT NULL AUTO_INCREMENT,
  userid      INT          NOT NULL,
  catid       INT          NOT NULL,
  price       INT          NULL    ,
  cond        VARCHAR(255) NULL    ,
  description VARCHAR(255) NULL    ,
  image       VARCHAR(255) NULL     COMMENT 'flask directory',
  postdate    DATE         NULL    ,
  PRIMARY KEY (prodid)
);

CREATE TABLE transaction
(
  transid INT NOT NULL AUTO_INCREMENT,
  userid  INT NOT NULL,
  prodid  INT NOT NULL,
  PRIMARY KEY (transid)
);

CREATE TABLE user
(
  userid      INT          NOT NULL AUTO_INCREMENT,
  username    VARCHAR(255) NULL    ,
  email       VARCHAR(255) NULL    ,
  password    VARCHAR(20)  NULL    ,
  joindate    DATE         NULL    ,
  profilepic  VARCHAR(255) NULL     COMMENT 'flask directory',
  description VARCHAR(255) NULL    ,
  PRIMARY KEY (userid)
);

ALTER TABLE product
  ADD CONSTRAINT FK_category_TO_product
    FOREIGN KEY (catid)
    REFERENCES category (catid);

ALTER TABLE transaction
  ADD CONSTRAINT FK_user_TO_transaction
    FOREIGN KEY (userid)
    REFERENCES user (userid);

ALTER TABLE transaction
  ADD CONSTRAINT FK_product_TO_transaction
    FOREIGN KEY (prodid)
    REFERENCES product (prodid);

ALTER TABLE chat
  ADD CONSTRAINT FK_user_TO_chat
    FOREIGN KEY (userid)
    REFERENCES user (userid);

ALTER TABLE chat
  ADD CONSTRAINT FK_product_TO_chat
    FOREIGN KEY (prodid)
    REFERENCES product (prodid);

ALTER TABLE product
  ADD CONSTRAINT FK_user_TO_product
    FOREIGN KEY (userid)
    REFERENCES user (userid);

        
      