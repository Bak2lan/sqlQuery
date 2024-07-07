create table social_medias
(
    id                    serial primary key,
    name_of_social_medias varchar(50),
    description           varchar(50),
    created_by            varchar(50)
);
alter table social_medias
    add column made_year int;
insert into social_medias(name_of_social_medias, description, created_by, made_year)
values ('Instagram', 'Share with best interesting stories', 'Mike Creeger', 2011),
       ('Telegram', 'Talk with friends', 'Pavel Durov', 2012),
       ('WhatsApp', 'Video call ', 'Brain Ecton', 2010),
       ('FaceBook', 'The best fresh news and share with them', 'Mark Zuckerberg', 2000);

create table users
(
    id            serial primary key,
    full_name     varchar(50) not null,
    age           int         not null,
    social_medias int references social_medias (id)
);

insert into users(full_name, age, social_medias)
values ('Baktulan', 24, 2),
       ('Omurbek', 22, 1),
       ('Joomart', 19, 4),
       ('Janbolot', 23, 3);

create table publications
(
    id               serial primary key,
    name             varchar(50),
    description      varchar,
    user_id          int references users (id),
    social_medias_id int references social_medias (id)
);

alter table publications
    alter column description set not null;
alter table publications
    alter column name set not null;
alter table publications rename column description to pub_description;

insert into publications(name, description, user_id, social_medias_id)
values ('news', 'It good weather in outside', 1, 3),
       ('Congratulations', 'I won iphone 15 pro max', 3, 1),
       ('Lets talk', 'How do you think about...', 2, 4),
       ('Winter is coming', 'One month till Winter', 4, 2);


create table libraries
(
    id              serial primary key,
    name_of_library varchar(50),
    address         varchar(50)
);

alter table libraries
    alter column name_of_library set not null, add constraint unique_name_library unique (name_of_library);
alter table libraries
    add column year_of_created int;
alter table libraries
    alter column address set not null;

insert into libraries(name_of_library, address, year_of_created)
values ('Bayalinov', 'Chui 23', 1997),
       ('Alykul Osmonov', 'Ankara 23', 2000),
       ('Chyngyz Aitmatov', '7 april', 1993),
       ('State Library', 'Manas 12', 2004);



create table authors
(
    id        serial primary key,
    full_name varchar(50),
    gender    varchar not null
);

insert into authors(full_name, gender)
values ('Leo Tolstoy', 'male'),
       ('Fyodor Dostoevsky', 'male'),
       ('Anton Chekhov', 'male'),
       ('Alexander Pushkin ', 'male'),
       ('Mikhail Bulgakov', 'male');



create table books
(
    id           serial primary key,
    name_of_book varchar(50),
    pages        int not null,
    genre_book   varchar(50),
    library_id   int references libraries (id),
    author_id    int references authors (id)
) insert into books(name_of_book,pages,genre_book,library_id,author_id)
values
('War and Peace',1222,'Historical Fiction',1,1),
('Crime and Punishment',545,'Psychological Fiction',2,2),
('The Cherry Orchard',75,' Drama',1,3),
('Eugene Onegin',224,'Novel in Verse, Romance',3,4),
('The Master and Margarita',388,'Fantasy, Satire',1,5);


create table coaches
(
    id         serial primary key,
    full_name  varchar(50),
    experience int
);


insert into coaches (full_name, experience)
VALUES ('Pep Guardiola', 20),
       ('Jurgen Klopp', 18),
       ('Zinedine Zidane', 15),
       ('Diego Simeone', 19),
       ('Carlo Ancelotti', 25),
       ('Jose Mourinho', 22);



create table captains
(
    id        serial primary key,
    full_name varchar(50),
    age       int
);

insert into captains (full_name, age)
VALUES ('Lionel Messi', 36),
       ('Cristiano Ronaldo', 39),
       ('Sergio Ramos', 38),
       ('Manuel Neuer', 37),
       ('Harry Kane', 30),
       ('Virgil van Dijk', 32);



create table foodball_clubs
(
    id               serial primary key,
    name_of_club     varchar not null,
    count_of_players int,
    coaches_id       int references coaches (id),
    captains_id      int references captains (id)
);
insert into foodball_clubs (name_of_club, count_of_players, coaches_id, captains_id)
VALUES ('FC Barcelona', 25, 1, 1),
       ('Liverpool FC', 23, 2, 2),
       ('Real Madrid CF', 24, 3, 3),
       ('Atletico Madrid', 22, 4, 4),
       ('AC Milan', 24, 5, 5),
       ('Manchester United', 26, 6, 6);



create table unversities
(
    id           serial primary key,
    name         varchar,
    address      varchar(50),
    created_year int,
    faculty_id   int references faculties (id)
        director_id int references directors(id)
);

alter table unversities
    alter column address set not null, add constraint unique_address_univer unique (address);
alter table unversities
    alter column created_year set not null;
alter table unversities
    add column count_of_teachers int;

insert into unversities(name, address, created_year, faculty_id, director_id, count_of_teachers)
values ('KGMA', 'Manas 443', 1995, 4, 2, 54),
       ('KSLA', 'Chui 33', 1993, 2, 1, 23),
       ('BGU', 'Manas 4', 2000, 1, 3, 67),
       ('KGUSTA', 'Ahunbaeva 44', 1997, 1, 3, 77);



create table faculties
(
    id                serial primary key,
    name_of_faculty   varchar,
    count_of_students int
);

insert into faculties(name_of_faculty, count_of_students)
values ('International relationship', 69),
       ('Judje', 40),
       ('Criminal analys', 75),
       ('Economic faculty', 90),
       ('Engineer', 55);

create table directors
(
    id         serial primary key,
    full_name  varchar(50) not null,
    experience int
);
insert into directors(full_name, experience)
values ('Sansyzbaev Nazirbek ', 20),
       ('Omorov Jekshen', 12),
       ('Mamasaliev Bayastan', 30),
       ('Anashov Asan', 13);


create table orders
(
    id         serial primary key,
    product_id int references products (id)
);

alter table orders
    add column customer_id int references customers (id);
alter table orders
    add column date_of_order date;
alter table orders
    add column delivery_date date;
alter table orders
    alter column customer_id set not null;
alter table orders
    alter column product_id set not null;

insert into orders (product_id, customer_id, date_of_order, delivery_date)
values (1, 1, '2023-01-15', '2023-01-20'),
       (2, 2, '2023-02-10', '2023-02-15'),
       (3, 3, '2023-03-05', '2023-03-10'),
       (4, 4, '2023-04-20', '2023-04-25'),
       (5, 5, '2023-05-15', '2023-05-20'),
       (6, 6, '2023-06-10', '2023-06-15');



create table products
(
    id           serial primary key,
    name_product varchar(50),
    price        int,
    description  varchar(50),
    maded_date   date
);
alter table products rename column maded_date to manufacture_date;
insert into products (name_product, price, description, manufacture_date)
values ('laptop', 1000, 'high-end gaming laptop', '2022-11-01'),
       ('smartphone', 700, 'latest model smartphone', '2023-01-10'),
       ('headphones', 150, 'noise-cancelling headphones', '2023-02-15'),
       ('monitor', 300, '4k ultra hd monitor', '2023-03-20'),
       ('keyboard', 80, 'mechanical keyboard', '2023-04-05'),
       ('mouse', 50, 'wireless optical mouse', '2023-05-10');


create table customers
(
    id        serial primary key,
    full_name varchar,
    order_id  int references orders (id)
);

alter table customers drop column order_id;
insert into customers (full_name)
values ('john doe'),
       ('jane smith'),
       ('alice johnson'),
       ('bob brown'),
       ('charlie davis'),
       ('diana evans');





