-- create and select the database
DROP DATABASE IF EXISTS prs;
CREATE DATABASE prs;
USE prs;

CREATE TABLE user (
  ID             INT             PRIMARY KEY  AUTO_INCREMENT,
  UserName       VARCHAR(20)     NOT NULL     UNIQUE,
  Password       VARCHAR(10)     NOT NULL,
  FirstName      VARCHAR(20)     NOT NULL,
  LastName       VARCHAR(20)     NOT NULL,
  PhoneNumber    VARCHAR(12)     NOT NULL,
  Email          VARCHAR(75)     NOT NULL,
  IsReviewer     TinyInt(1)      NOT NULL,
  IsAdmin        TinyInt(1)      NOT NULL,
  IsActive       TinyInt(1)      DEFAULT 1 NOT NULL,
  DateCreated    DATETIME        DEFAULT CURRENT_TIMESTAMP NOT NULL,
  DateUpdated    DATETIME        DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
  UpdatedByUser  INT             DEFAULT 1 NOT NULL -- SYSTEM MADE THE CHANGE INDICTED BY THE 1

);

  -- make user.email unique
ALTER TABLE user
ADD UNIQUE (Email);

CREATE TABLE vendor (
  ID              INT            PRIMARY KEY  AUTO_INCREMENT,
  Code            VARCHAR(10)    NOT NULL     UNIQUE,
  Name            VARCHAR(255)   NOT NULL,
  Address         VARCHAR(255)   NOT NULL,
  City            VARCHAR(255)   NOT NULL,
  State           VARCHAR(2)     NOT NULL,
  Zip             VARCHAR(5)     NOT NULL,
  PhoneNumber     VARCHAR(12)    NOT NULL,
  Email           VARCHAR(100)   NOT NULL,
  IsPreApproved   TinyInt(1)     NOT NULL,
  IsActive        TinyInt(1)     DEFAULT 1 NOT NULL,
  DateCreated     DATETIME       DEFAULT CURRENT_TIMESTAMP NOT NULL,
  DateUpdated     DATETIME       DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
  UpdatedByUser   INT            DEFAULT 1 NOT NULL -- SYSTEM MADE THE CHANGE INDICTED BY THE 1
);

CREATE TABLE purchaserequest (
  ID                  INT            PRIMARY KEY  AUTO_INCREMENT,
  UserID              INT            NOT NULL,
  Description         VARCHAR(100)   NOT NULL,
  Justification       VARCHAR(255)   NOT NULL,
  DateNeeded          DATE           NOT NULL,
  DeliveryMode        VARCHAR(25)    NOT NULL,
  Status              VARCHAR(20)    NOT NULL,
  Total               DECIMAL(10,2)  NOT NULL,
  SubmittedDate       DATETIME       NOT NULL,
  ReasonForRejection  VARCHAR(100),  -- NULLABLE
  IsActive            TinyInt(1)     DEFAULT 1 NOT NULL,
  DateCreated         DATETIME       DEFAULT CURRENT_TIMESTAMP NOT NULL,
  DateUpdated         DATETIME       DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
  UpdatedByUser       INT            DEFAULT 1 NOT NULL, -- SYSTEM MADE THE CHANGE INDICTED BY THE 1
  
  FOREIGN KEY (UserID) REFERENCES user (ID)
);

CREATE TABLE product (
  ID                  INT             PRIMARY KEY AUTO_INCREMENT,
  VendorID            INT             NOT NULL,
  PartNumber          VARCHAR(50)     NOT NULL,
  Name                VARCHAR(150)    NOT NULL,
  Price               DECIMAL(10,2)   NOT NULL,
  Unit                VARCHAR(255), -- NULLABLE
  PhotoPath           VARCHAR(255), -- NULLABLE
  IsActive            TinyInt(1)      DEFAULT 1 NOT NULL,
  DateCreated         DATETIME        DEFAULT CURRENT_TIMESTAMP NOT NULL,
  DateUpdated         DATETIME        DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
  UpdatedByUser       INT             DEFAULT 1 NOT NULL, -- SYSTEM MADE THE CHANGE INDICTED BY THE 1
  
  FOREIGN KEY (VendorID) REFERENCES vendor (ID),
  CONSTRAINT vendor_part unique (VendorID, PartNumber)
);

CREATE TABLE purchaserequestlineitem (
  ID                  INT             PRIMARY KEY AUTO_INCREMENT,
  PurchaseRequestID   INT             NOT NULL,
  ProductID           INT             NOT NULL,
  Quantity            INT             NOT NULL,
  IsActive            TinyInt(1)      DEFAULT 1 NOT NULL,
  DateCreated         DATETIME        DEFAULT CURRENT_TIMESTAMP NOT NULL,
  DateUpdated         DATETIME        DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
  UpdatedByUser       INT             DEFAULT 1 NOT NULL, -- SYSTEM MADE THE CHANGE INDICTED BY THE 1
  
  FOREIGN KEY (ProductID) REFERENCES product (ID),
  FOREIGN KEY (PurchaseRequestID) REFERENCES purchaserequest (ID),
  CONSTRAINT req_pdt unique (PurchaseRequestID, ProductID)
);

-- Add 'SYSTEM' user
INSERT INTO user (ID, UserName, Password, FirstName, LastName, PhoneNumber, Email, IsReviewer, IsAdmin) VALUES 
(1,'sjohnson','apple9','Sheila','Johnson','513-236-1832','sheilajohnson1832@gmail.com',1,1),
(2,'sblessing','login','Sean','Blessing','513-600-7096','sean@blessingtechnology.com',1,1),
(3,'dcollins','innov8','Doug','Collins','513-236-8564','doug_collins@me.com',1,1),
(4,'dinodeb','fossils','Deb','Smith','513-555-1111','deb@trammelpark.org',1,1),
(5,'fiona1','bibirocks','Fiona','Hippo','513-281-4700','fiona@cincinnatizoo.ord',1,1),
(6,'jsprat','nofat','Jack','Sprat','801-555-1111','jack_sprat@nurseryrhyme.com',1,1),
(7,'mickey1','ears','Mickey','Mouse','708-555-5555','mickey@disney.com',1,1),
(8,'Simba','lion','Simba','King','513-777-0000','simba@king.com',1,1),
(9,'pinkalicious','pink','Pinkalicious','Peters','201-000-7465','pinkalicious@pbs.org',1,1),
(10,'barbie','majesty','Barbie','Smith','312-555-0000','barbie@matteltoys.com',1,1);


-- insert vendor
INSERT INTO vendor (ID, Code, Name, Address, City, State, Zip, PhoneNumber, Email, isPreApproved) 
VALUES 
(1,'BB-1001','Best Buy','100 Best Buy Street','Louisville','KY','40207','502-111-9099','geeksquad@bestbuy.com',1),
(2,'AP-1001','Apple Inc','1 Infinite Loop','Cupertino','CA','95014','800-123-4567','genius@apple.com',1),
(3,'AM-1001','Amazon','410 Terry Ave. North','Seattle','WA','98109','206-266-1000','amazon@amazon.com',0),
(4,'ST-1001','Staples','9550 Mason Montgomery Rd','Mason','OH','45040','513-754-0235','support@orders.staples.com',0),
(5,'MC-1001','Micro Center','11755 Mosteller Rd','Sharonville','OH','45241','513-782-8500','support@microcenter.com',0),
(6,'KR-1001','Kroger','1014 Vine Street','Cincinnati','OH','45202','513-794-4100','kroger@kroger.com',0),
(7,'TA-1001','Target','1000 Nicollet Mall','Minneapolis','MN','55403','612-304-6073','support@target.com',0),
(8,'HD-1001','The Home Depot','2455 Paces Ferry Rd. NW','Atlanta','GA','30339','770-433-8211','support@homedepot.com',0),
(9,'LO-1001','Lowes','1000 Lowes Blvd','Mooresville','NC','28117','800-4456937','support@lowes.com',0);

-- insert base products
INSERT INTO product (ID, VendorID, PartNumber, Name, Price , Unit , PhotoPath) VALUES (1,1,'ME280LL','iPad Mini 2',296.99,NULL,NULL);
INSERT INTO product (ID, VendorID, PartNumber, Name, Price , Unit , PhotoPath) VALUES (2,2,'ME280LL','iPad Mini 2',299.99,NULL,NULL);
INSERT INTO product (ID, VendorID, PartNumber, Name, Price , Unit , PhotoPath) VALUES (3,3,'105810','Hammermill Paper, Premium Multi-Purpose Paper Poly Wrap',8.99,'1 Ream / 500 Sheets',NULL);
INSERT INTO product (ID, VendorID, PartNumber, Name, Price , Unit , PhotoPath) VALUES (4,4,'122374','HammerMill® Copy Plus Copy Paper, 8 1/2\" x 11\", Case',29.99,'1 Case, 10 Reams, 500 Sheets per ream',NULL);
INSERT INTO product (ID, VendorID, PartNumber, Name, Price , Unit , PhotoPath) VALUES (5,4,'784551','Logitech M325 Wireless Optical Mouse, Ambidextrous, Black ',14.99,NULL,NULL);
INSERT INTO product (ID, VendorID, PartNumber, Name, Price , Unit , PhotoPath) VALUES (6,4,'382955','Staples Mouse Pad, Black',2.99,NULL,NULL);
INSERT INTO product (ID, VendorID, PartNumber, Name, Price , Unit , PhotoPath) VALUES (7,4,'2122178','AOC 24-Inch Class LED Monitor',99.99,NULL,NULL);
INSERT INTO product (ID, VendorID, PartNumber, Name, Price , Unit , PhotoPath) VALUES (8,4,'2460649','Laptop HP Notebook 15-AY163NR',529.99,NULL,NULL);
INSERT INTO product (ID, VendorID, PartNumber, Name, Price , Unit , PhotoPath) VALUES (9,4,'2256788','Laptop Dell i3552-3240BLK 15.6\"',239.99,NULL,NULL);
INSERT INTO product (ID, VendorID, PartNumber, Name, Price , Unit , PhotoPath) VALUES (10,4,'IM12M9520','Laptop Acer Acer™ Aspire One Cloudbook 14\"',224.99,NULL,NULL);
INSERT INTO product (ID, VendorID, PartNumber, Name, Price , Unit , PhotoPath) VALUES (11,4,'940600','Canon imageCLASS Copier (D530)',99.99,NULL,NULL);
INSERT INTO product (ID, VendorID, PartNumber, Name, Price , Unit , PhotoPath) VALUES (12,5,'228148','Acer Aspire ATC-780A-UR12 Desktop Computer',399.99,'','/images/AcerAspireDesktop.jpg');
INSERT INTO product (ID, VendorID, PartNumber, Name, Price , Unit , PhotoPath) VALUES (13,5,'279364','Lenovo IdeaCentre All-In-One Desktop',349.99,'','/images/LenovoIdeaCenter.jpg');
INSERT INTO product (ID, VendorID, PartNumber, Name, Price , Unit , PhotoPath) VALUES (14,5,'289450','HP OfficeJet 3830 Wireless All-In-One Printer',79.99,'','/images/HP_OfficeJet_3830.jpg');
INSERT INTO product (ID, VendorID, PartNumber, Name, Price , Unit , PhotoPath) VALUES (15,5,'112932','X-Acto School Pro Electric Pencil Sharpener',24.95,'','/images/X-Acto_SchoolElectricPencilSharpener.jpg');

-- insert purchase request
INSERT INTO purchaserequest (ID, UserID, Description, Justification, DateNeeded, DeliveryMode, Status, Total, SubmittedDate, ReasonForRejection) VALUES (1001,1,'Office Supplies','Need monthly office supplies', '2018-10-18', 'USPS', 'NEW', 59.34, '2018-10-02', 'NA');
INSERT INTO purchaserequest (ID, UserID, Description, Justification, DateNeeded, DeliveryMode, Status, Total, SubmittedDate, ReasonForRejection) VALUES (1002,2,'Copier Supplies','Need paper', '2018-10-15', 'USPS', 'NEW', 78.85, '2018-10-05', 'NA');

-- insert purchase requestlineitem
INSERT INTO purchaserequestlineitem (ID, PurchaseRequestID, ProductID, Quantity) VALUES (1507,1001,15,1);
INSERT INTO purchaserequestlineitem (ID, PurchaseRequestID, ProductID, Quantity) VALUES (1508,1001,3,6);
INSERT INTO purchaserequestlineitem (ID, PurchaseRequestID, ProductID, Quantity) VALUES (1539,1002,3,8);
INSERT INTO purchaserequestlineitem (ID, PurchaseRequestID, ProductID, Quantity) VALUES (1540,1002,4,1);

-- create a user and grant privledges
CREATE USER prs_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON prs.* TO prs_user@localhost;
