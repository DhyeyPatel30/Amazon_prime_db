create database if not exists amazon_prime;
use amazon_prime;

CREATE TABLE customer (
    customer_id VARCHAR(6) primary key,
    first_name VARCHAR(20) not null,
    last_name VARCHAR(20) not null,
    email VARCHAR(30) not null unique,
    phone_number VARCHAR(13) not null
);

create table account(
password varchar(20) not null UNIQUE,
email VARCHAR(30) primary key,
phone_number int not null,
cus_id VARCHAR(6),
FOREIGN KEY (cus_id) REFERENCES customer(customer_id)
);

alter table account modify phone_number varchar(20) not null;
alter table account drop primary key;
alter table account modify password varchar(20) not null unique;
alter table account modify email varchar(30) primary key;

create table profile(
profile_id varchar(10) primary key,
email varchar(30) not null UNIQUE,
maturity_rating varchar(5) not null,
FOREIGN KEY (email) references account(email)
);

create table likes(
profile_id varchar(10) not null unique,
content_type varchar(20) not null,
content_name varchar(20) primary key,
FOREIGN KEY (profile_id) REFERENCES profile(profile_id)
);

create table payment_history(
pay_id int primary key,
pay_history varchar(45) not null,
history_id varchar(10) not null UNIQUE,
pay_method varchar(20) not null,
pay_date date not null,
customer_id varchar(6),
FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

create table subscription(
sub_id varchar(20) primary key,
sub_start DATETIME not null,
sub_end DATETIME not null,
sub_plan varchar(20) not null,
sub_cost int not null,
pay_id int not null,
cus_id varchar(6) not null,
FOREIGN KEY (pay_id) REFERENCES payment_history(pay_id),
FOREIGN KEY (cus_id) references customer(customer_id) 
);

create table content(
con_id varchar(10) primary key,
email varchar(30) not null,
sub_id varchar(20) not null,
FOREIGN KEY (email) REFERENCES account(email),
FOREIGN KEY (sub_id) REFERENCES subscription(sub_id)
);

create table categories(
cat_id varchar(10) primary key,
con_id varchar(10) not null,
cat_name varchar(10) not null,
FOREIGN KEY (con_id) REFERENCES content(con_id)
);

create table genre(
genre_id varchar(10) primary key,
con_id varchar(10) not null,
genre_name varchar(20) not null,
FOREIGN KEY (con_id) REFERENCES content(con_id)
);

create table movies(
movie_id varchar(10) primary key,
con_id varchar(10) not null,
movie_name varchar(20) not null,
movie_type varchar(10) not null,
releade_date date not null,
rating int not null,
FOREIGN KEY (con_id) REFERENCES content(con_id)
);

create table series(
tvshow_id varchar(10) primary key,
tvshow_name varchar(20) not null,
con_id varchar(10) not null,
tvshow_type varchar(10),
release_date date not null,
episodes int not null,
rating int not null,
FOREIGN KEY (con_id) REFERENCES content(con_id)
);

insert into customer values
(300704, "dhyey", "patel", "dhyeyptl3074@gmail.com", 9327300588);

insert into customer values
(050304, "honey", "rajgor", "honeyrajgor4@gamil.com", 8160544974),
(050804, "diya", "chauhan", "diyachauhan05@gmail.com", 7600295768),
(210804, "riya", "patel", "riyapatel21@gmail.com", 9150032960),
(211204, "akshita", "parekh", "akshitaparekh21@gmail.com",7016830338),
(210304, "alay", "patel", "alaypatel212@gmail.com", 9978184010),
(251204, "vivek", "patel", "vivekpatel12@gmail.com", 8141660649),
(290104, "aesha", "parmar", "aeshaparmar29@gmail.com", 8140107009),
(010204, "urvi", "tandel", "urvitandel01.com", 6352446511),
(140203, "kriya", "shah", "kriyashah14@gmail.com", 9104662470);

select* from account;

insert into account values
("honey@123", "honeyrajgor4@gmail.com", 8160544974, 050304),
("diya058","diyachauhan05@gmail.com", 7600295768, 050804),
("riya218", "riyapatel21@gmail.com", 9150032960, 210804),
("dhyey3074", "dhyeyptl3074@gmail.com", 9327300588, 300704),
("akhshita2112","akshitaparekh21@gmail.com", 7016830338, 211204),
("alay2112", "alaypatel212@gmail.com", 9978184010, 210304),
("vivek25", "vivekpatel12@gmail.com",8141660649, 251204),
("aeshaparmar", "aeshaparmar29@gmail.com", 8140107009, 290104),
("urvi01", "urvitandel01.com", 6352446511, 010204),
("kriya@14", "kriyashah14@gmail.com", 9104662470, 140203);

select * from account;

select * from customer
left join account
on customer.customer_id=account.cus_id
union
select *  from customer
right join account
on  customer.customer_id=account.cus_id;
