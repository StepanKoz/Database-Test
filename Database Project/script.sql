
create table user(user_id serial primary key, surname varchar(100) not null, name varchar(100) not null, phone varchar(100), telegram varchar(100) not null, address varchar(100), email varchar(100) not null);

create table item(item_id serial primary key, name varchar(100) not null, category varchar(100) not null, price real not null, quantity int not null, author varchar(100) not null, size varchar(100) not null, color varchar(100));

create type status_enum as enum('received', 'preparing', 'delivering', 'delivered', 'closed' );

create table order(order_id serial primary key, user_id int, sum real, status status_enum, constraint user_id_fk foreign key(user_id) references user(user_id));

create table order_items(order_id int, item_id int, constraint order_id_fk foreign key(order_id) references order(order_id), constraint item_id_fk foreign key(item_id) references item(item_id));

create table cart(user_id int, item_id int, constraint item_id_fk foreign key(item_id) references item(item_id), constraint user_id_fk foreign key(user_id) references user(user_id));


select user_id from users where email='test@mail.com'

select * from orders o join users u on o.user_id=u.user_id 

select u.surname, u.name, i.name, i.price from cart c join users u on c.user_id=u.user_id join item i on c.item_id=i.item_id 
