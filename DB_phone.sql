CREATE TABLE `user` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `userName` VARCHAR(50) NOT NULL,
    `passWord` VARCHAR(255) NOT NULL,
    `roleId` SMALLINT NOT NULL DEFAULT 0,
    `phone` CHAR(10) NOT NULL,
    `address` VARCHAR(255)CHARACTER SET UTF8MB4 NOT NULL,
    `firstName` VARCHAR(15)CHARACTER SET UTF8MB4 NOT NULL,
    `lastName` VARCHAR(15)CHARACTER SET UTF8MB4 NOT NULL,
    image text,
    createdAt DATETIME NOT NULL,
    updatedAt DATETIME NOT NULL,
    CONSTRAINT PK_Person PRIMARY KEY (id)
);

create table `product`(
	`productId` int  not null auto_increment,
    `productName` varchar(50) not null,
    `price`	decimal(10,2) not null default 0,
    `quantity` int not null default 0,
    `discount` int not null default 0,
    img TEXT not null,
    content TEXT  CHARACTER SET utf8mb4 null default null,
    unit varchar(20) not null,
	createdAt datetime not null,
    updatedAt datetime not null,
    
	CONSTRAINT PK_product PRIMARY KEY(productId) 
);

create table category(
	categoryId int not null auto_increment,
    categoryName varchar(255) not null,
    primary key(categoryId) 
); 
create table product_category(
	`productId` int not null,
    categoryId int not null,
    foreign key (categoryId) references category(categoryId) ON DELETE CASCADE ,
    foreign key (productId) references product(productId) ON DELETE CASCADE ,
    primary key (`productId`,categoryId) 
);

create table `order`(
	`orderId`int NOT NULL AUTO_INCREMENT,
    `userId` int not null,
    `status` VARCHAR(255)CHARACTER SET UTF8MB4 NOT NULL,
	`total`	decimal(10,2) not null default 0,
	`createdAt` DATETIME NOT NULL,

    `phone` VARCHAR(255)CHARACTER SET UTF8MB4 NOT NULL,
    `address` VARCHAR(255)CHARACTER SET UTF8MB4 NOT NULL,
    `delivery` VARCHAR(255)CHARACTER SET UTF8MB4 NOT NULL,
    foreign key (userId) references `user`(id) ON DELETE CASCADE ,
    primary key (orderId) 
);

create table `payment`(
    `paymentId` int  not null auto_increment,
    `orderId` int NOT NULL,
    `total`	decimal(10,2) not null default 0,
    tranType SMALLINT(6) NOT NULL DEFAULT 0,
     `status` SMALLINT(6) NOT NULL DEFAULT 0,
    createdAt datetime not null,
    updatedAt datetime not null,
   
    foreign key (orderId) references `order`(orderId) ON DELETE CASCADE,
     primary key (paymentId)
);



create table `order_detail` (
	`orderdetailId` VARCHAR(50)CHARACTER SET UTF8MB4 NOT NULL,
    orderId int not null,
    `productId` int not null,
    `price`	decimal(10,2) not null default 0,
    `quantity` int not null default 0,
    foreign key (orderId) references `order`(orderId) ON DELETE CASCADE ,
    foreign key (productId) references product(productId) ON DELETE CASCADE ,
    primary key(orderdetailId) 
);

create table `cart` (
	`cartId` int  not null auto_increment,
   `userId`int not null,
    `sessionId` VARCHAR(100) NOT NULL,
    `status` SMALLINT(6) NOT NULL DEFAULT 0,  
    createdAt datetime not null,
    updatedAt datetime not null,
    foreign key (userId) references user(id) ON DELETE NO ACTION,
   primary key (cartId) 
);

create table `cart_item`(
cartitemId int  not null auto_increment,
    productId int not null,
    cartId  int  not null,
    `price`	decimal(10,2) not null default 0,
    `quantity` int not null default 0,
    `discount` int not null default 0,
     createdAt datetime not null,
    updatedAt datetime not null,
    primary key (cartitemId),
    foreign key (productId) references product(productId) ON DELETE CASCADE,
        foreign key (cartId) references cart(cartId) ON DELETE CASCADE
);




