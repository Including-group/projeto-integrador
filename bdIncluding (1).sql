create table users(
	id int primary key,
    username varchar(500),
    email varchar(500),
    password varchar(500),
	created_at datetime,
	updated_at datetime
);

create table images(
	id int primary key,
	name varchar(500),
    url varchar(1000),
	created_at datetime,
	updated_at datetime
);

create table addresses(
	id int primary key,
	street varchar(500),
	neighborhood varchar(500),
	number varchar(500),
	city varchar(500),
	state varchar(500),
	country varchar(500),
	zipcode varchar(500),
	additional_details varchar(500),
	created_at datetime,
	updated_at datetime
);

create table customers(
	id int primary key,
	name varchar(500),
    email varchar(500),
    age int,
    working boolean,
    phone_number varchar(50),
    active boolean,
    description varchar(500),
    user_id int,
	FOREIGN KEY (user_id) REFERENCES users(id),
    image_id int,
    FOREIGN KEY (image_id) references images(id),
    abilities varchar(500),
	created_at datetime,
	updated_at datetime
);

create table customer_addresses(
	id int primary key,
    address_id int,
    FOREIGN KEY (address_id) references addresses(id),
    customer_id int,
    foreign key (customer_id) references customers(id),
	created_at datetime,
	updated_at datetime
);

create table companies(
	id int primary key,
    name varchar(500),
    email varchar(500),
    description varchar(500),
    phone_numer varchar(50),
    sector varchar(500),
    user_id int,
    foreign key (user_id) references users(id),
    image_id int,
    FOREIGN KEY (image_id) references images(id),
	created_at datetime,
	updated_at datetime
);

create table vacancies(
	id int primary key,
    title varchar(500),
    description varchar(500),
    location varchar(500),
    knowledge_level varchar(500),
    salary float,
    premium boolean,
    company_id int,
    foreign key (company_id) references companies(id),
	created_at datetime,
	updated_at datetime
);

create table posts(
	id int primary key,
    title varchar(500),
    text varchar(500),
    image_id int,
    FOREIGN KEY (image_id) references images(id),
	created_at datetime,
	updated_at datetime
);

create table customer_posts(
	id int primary key,
    customer_id int,
    foreign key (customer_id) references customers(id),
    post_id int,
    foreign key (post_id) references posts(id),
	created_at datetime,
	updated_at datetime
);

create table company_posts(
	id int primary key,
    company_id int,
    foreign key (company_id) references companies(id),
    post_id int,
    foreign key (post_id) references posts(id),
	created_at datetime,
	updated_at datetime
);

create table comments(
	id int primary key,
    post_id int,
    foreign key (post_id) references posts(id),
    customer_id int,
    foreign key (customer_id) references customers(id),
    comment varchar(500),
	created_at datetime,
	updated_at datetime
);

create table post_reactions(
	id int primary key,
    type enum('LIKE','LOVE','HATE','HAHA','CONGRATULATIONS', 'BRILLIANT'),
    customer_id int,
    foreign key (customer_id) references customers(id),
    post_id int,
    foreign key (post_id) references posts(id),
	created_at datetime,
	updated_at datetime
);

create table comment_reactions(
	id int primary key,
    type enum('LIKE','LOVE','HATE','HAHA','CONGRATULATIONS', 'BRILLIANT'),
    customer_id int,
    foreign key (customer_id) references customers(id),
    comment_id int,
    foreign key (comment_id) references comments(id),
	created_at datetime,
	updated_at datetime
);

create table post_favorities(
	id int primary key,
    post_id int,
    foreign key (post_id) references posts(id),
    customer_id int,
    foreign key (customer_id) references customers(id),
	created_at datetime,
	updated_at datetime
);

create table vancacy_favorities(
	id int primary key,
    vacancy_id int,
    FOREIGN KEY (vacancy_id) references vacancies(id),
    customer_id int,
    foreign key (customer_id) references customers(id),
	created_at datetime,
	updated_at datetime
);

create table applications(
	id int primary key,
    vacancy_id int,
    FOREIGN KEY (vacancy_id) references vacancies(id),
    customer_id int,
    foreign key (customer_id) references customers(id),
    accepted boolean,
    answer varchar(500),
	created_at datetime,
	updated_at datetime
);

create table friendships(
	id int primary key,
    customer_id int,
    foreign key (customer_id) references customers(id),
    friend_id int,
    foreign key (friend_id ) references customers(id),
	created_at datetime,
	updated_at datetime
);

create table projects(
	id int primary key,
    title varchar(500),
    description varchar(500),
    project_requirements varchar(500),
    project_tecnologies varchar(500),
    image_id int,
    FOREIGN KEY (image_id) references images(id),
	created_at datetime,
	updated_at datetime
);

create table user_projects(
	id int primary key,
    customer_id int,
    foreign key (customer_id) references customers(id),
    project_id int,
    foreign key (project_id) references projects(id),
	created_at datetime,
	updated_at datetime
);

create table company_projects(
	id int primary key,
    company_id int,
    foreign key (company_id) references companies(id),
    project_id int,
    foreign key (project_id) references projects(id),
	created_at datetime,
	updated_at datetime
);
