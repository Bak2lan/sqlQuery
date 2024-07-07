create table countries
(
    id                  serial primary key,
    name_country        varchar not null,
    capital             varchar not null unique,
    population          INTEGER,
    language_of_country varchar not null

);
insert into countries (name_country, capital, population, language_of_country, the_year_of_independence)
values ('Kyrgyzstan', 'Bishkek', 7000000, 'Kyrgyz', 1991),
       ('Uzbekistan', 'Tahkent', 30000000, 'Uzbek', 1992),
       ('Kazakhstan', 'Astana', 10000000, 'Kazakh', 1993),
       ('Russian', 'Moscow', 35000000, 'Russian', 1991);

alter table countries
    add column the_year_of_independence int;

drop table countries;

create table persons
(
    id           serial primary key,
    first_name   varchar(50),
    last_name    varchar(50),
    email        varchar unique,
    phone_number NUMERIC,
    country_id   int references countries (id)
);

insert into persons(first_name, last_name, email, phone_number, country_id, cars_id)
values ('Baktulan', 'Nazirbek uulu', 'baku@mail.ru', 0552931005, 1, 3),
       ('Davron', 'Shukurov', 'davr@gmail.com', 07549310235, 2, 2),
       ('Oljas', 'Suiunbaev', 'oljas@mail.ru', 0522957013, 3, 4),
       ('Ivan', 'Alexandrov', 'alex@mail.ru', 08865466232, 3, 1);

drop table persons;
alter table persons
    alter column email set not null;
alter table persons
    alter column phone_number set not null;

create table cars
(
    id                 serial primary key,
    name               varchar(50),
    model              varchar(50),
    country_of_made_id int references countries (id)
);

insert into cars (name, model, country_of_made_id)
values ('Mersedes-Benz', '210', 4),
       ('Chevrolet', 'Malibu', 2),
       ('Tulpar', 'Kara-Eger', 1),
       ('Toyota', 'Camry', 3);

alter table persons
    add column cars_id int references cars (id);

create table it_courses
(
    id             serial primary key,
    name_of_course varchar not null,
    duration       varchar,
    address        varchar

);

insert into it_courses(name_of_course, duration, address)
values ('Peak-Soft', 'Back-end and Front-end languages', 'Grajdanskaya 119'),
       ('Attractors', 'UI design and JAVAScript ', 'Chui 24'),
       ('GEEKS', 'Python and JavaScript ', 'Ankara 28'),
       ('CodiFy', 'Back-end and Front-end languages', 'Abay 99'),
       ('IT-run', 'DEVOPS and Data Science', 'Sovetskaya 32');

alter table it_courses rename column duration to description;

create table groups
(
    id                serial primary key,
    name_of_group     varchar(50),
    count_of_students int,
    it_course_id      int references it_courses (id)
);

insert into groups (name_of_group, count_of_students, it_course_id)
values ('Java14', 7, 1),
       ('DEVOPS-12', 20, 5),
       ('JS-10', 13, 2),
       ('Python', 30, 3);

alter table groups
    alter column count_of_students set not null,
    add constraint unique_name_of_group unique (name_of_group);


create table store
(
    id            serial primary key,
    name_of_store varchar(50),
    type_of_store varchar(40)

);

insert into store (name_of_store, type_of_store, address, supplier_id)
values ('Brand-Mix', 'Clothes,bugs,shoes', 'Ankara 24', 3),
       ('Globus', 'Super-Market', 'Chui12', 2),
       ('Asia', 'Super-Market', 'Manas 77', 1),
       ('LC-waikiki', 'Clothes,bugs,shoes', 'Bayalinov 33', 4),
       ('Candyshop', 'Candies', 'Kuiukova 10', 5);

alter table store
    add column address varchar;
alter table store
    add column supplier_id int references supplier (id);
alter table store
    alter column name_of_store set not null;
alter table store
    alter column name_of_store set not null , add constraint unique_name unique (name_of_store);
drop table store;

create table supplier
(
    id               serial primary key,
    name_of_supplier varchar(50),
    type_of_supplier varchar not null
);

insert into supplier(name_of_supplier, type_of_supplier)
values ('Umut', 'Milk'),
       ('GreenGarden', 'Vegetable'),
       ('Charlotte', 'Clothes'),
       ('Baziko-Style', 'Clothes'),
       ('Sweet-Sweet', 'Candies');


create table hospitals
(
    id                        serial primary key,
    name                      varchar(50),
    address                   varchar(50),
    director_name_of_hospital varchar(50)
);

alter table hospitals
    add column departments_id int references departments (id);

insert into hospitals(name, address, director_name_of_hospital, departments_id)
values ('Healthe', 'Chui 13', 'Tynystan Mamasaliev', 1),
       ('Den-Sooluk', 'Abay 24', 'Asel Janbolot kyzy', 4),
       ('KyrgyzState', 'Shabdan Baatyr 11', 'Aizat Duisheeva', 2),
       ('CityHosp', 'Lenin 18', 'Bolot Jabirov', 3),
       ('Djal Child Hosp', 'Ahunbaeva 99', 'Asan Usonov', 5);


create table departments
(
    id                 serial primary key,
    name_of_department varchar(50),
    count_of_doctors   int
);

insert into departments (name_of_department, count_of_doctors)
values ('Ortodont', 9),
       ('Lor', 12),
       ('Hirurgia', 5),
       ('Urolog', 4),
       ('Reanimasia', 10);

create table doctors
(
    id         serial primary key,
    first_name varchar(50),
    last_name  varchar(50),
    experience int not null,
    gender     varchar
);

insert into doctors(first_name, last_name, experience, gender)
VALUES ('Baktulan', 'Nazirbek uulu', 20, 'male'),
       ('Asel', 'Beishenova', 4, 'female'),
       ('Almaz', 'Umetaliev', 15, 'male'),
       ('Askat', 'Omorov', 30, 'male'),
       ('Aizada', 'Talantbekova', 9, 'female');

alter table doctors
    alter column gender set not null;
alter table doctors rename column experience to experience_year;

create table phones
(
    id     serial primary key,
    name   varchar(50),
    model  varchar(50),
    price  int,
    memory int
);

insert into phones (name, model, price, memory)
values ('Samsung', 'Galaxy 13', 40000, 64),
       ('Samsung', 'Galaxy 8', 34000, 32),
       ('POCO', 'Google', 23400, 128),
       ('iPhone', 'pro max 13', 50000, 128),
       ('iPhone', '12 Pro', 30000, 256),
       ('Redmi', 'Note 12', 34000, 128),
       ('Samsung', 'Galaxy 17', 80000, 128);

create table laptop
(
    id    serial primary key,
    name  varchar(50),
    model varchar(50),
    price int
);

insert into laptop(name, model, price)
values ('MacBook', 'Air M1', 85000),
       ('MacBook', 'Air M2', 90000),
       ('Lenovo', 'Thinkpad', 132000),
       ('Acer', '12', 34000);


create table gadget_store
(
    id        serial primary key,
    name      varchar not null,
    phone_id  int references phones (id),
    laptop_id int references laptop (id)


);

insert into gadget_store(name, phone_id, laptop_id)
values ('LiderMobile', 2, 3),
       ('AppleStore', 4, 2),
       ('Almurut', 1, 4),
       ('O`Store', 3, 1);



create table workers
(
    id              serial primary key,
    name            varchar(50),
    type_of_work    varchar not null,
    experience_year int
);

alter table workers
    alter column experience_year set not null;
alter table workers rename column name to first_name;


insert into workers (name, type_of_work, experience_year)
values ('Asan', 'Software Engineer', 10),
       ('Uson', 'Marketing Specialist', 3),
       ('Baktulan', 'Data Analyst', 5),
       ('Asel', 'Graphic Designer', 6),
       ('Bektur', 'Software Engineer', 3);

create table companies
(
    id              serial primary key,
    name_of_company varchar,
    address         varchar(50)
);

alter table companies
    add column worker_id int references workers (id);

insert into companies(name_of_company, address, worker_id)
values ('NVIDIA', 'Chicago 33', 1),
       ('Google', 'New-York 4321', 3),
       ('Meta', 'Washington 12', 2),
       ('FaceBook', 'California 44', 5);

