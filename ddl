

CREATE TABLE std15_102.clients (
	id int4 NOT NULL,
	"name" varchar(1000) NULL,
	place_of_birth varchar(1000) NULL,
	date_of_birth date NULL,
	adress varchar(1000) NULL,
	passport varchar(100) NULL,
	CONSTRAINT client_pk PRIMARY KEY (id)
)
WITH (
	appendonly=false
)
DISTRIBUTED BY (id);




CREATE TABLE std15_102.products (
	id int4 NOT NULL,
	product_type_id int4 NOT NULL,
	"name" varchar(1000) NULL,
	client_ref int4 NOT NULL,
	open_data date NULL,
	close_data date NULL,
	CONSTRAINT products_pk PRIMARY KEY (id),
	CONSTRAINT prod_prodtype_fk FOREIGN KEY (product_type_id) REFERENCES std15_102.product_type(id),
	CONSTRAINT prof_cl_fk FOREIGN KEY (client_ref) REFERENCES std15_102.clients(id)
)
WITH (
	appendonly=false
)
DISTRIBUTED BY (id);





CREATE TABLE std15_102.product_type (
	id int4 NOT NULL,
	"name" varchar(1000) NULL,
	begin_date date NULL,
	end_date date NULL,
	tarif_ref int4 NOT NULL,
	CONSTRAINT product_type_pk PRIMARY KEY (id),
	CONSTRAINT prod_typr_ter_fk FOREIGN KEY (tarif_ref) REFERENCES std15_102.tarifs(id)
)
WITH (
	appendonly=false
)
DISTRIBUTED BY (id);







CREATE TABLE std15_102.tarifs (
	id int4 NOT NULL,
	"name" varchar(100) NULL,
	"cost" int4 NULL,
	CONSTRAINT tarifs_pk PRIMARY KEY (id)
)
WITH (
	appendonly=false
)
DISTRIBUTED BY (id);






CREATE TABLE std15_102.accounts (
	id int4 NOT NULL,
	"name" varchar(100) NULL,
	saldo numeric(10, 2) NULL,
	client_ref int4 NOT NULL,
	open_date date NULL,
	close_date date NULL,
	product_ref int4 NOT NULL,
	acc_num varchar(25) NULL,
	CONSTRAINT accounts_pkey PRIMARY KEY (id),
	CONSTRAINT acc_cl_fk FOREIGN KEY (client_ref) REFERENCES std15_102.clients(id),
	CONSTRAINT acc_prod_fk FOREIGN KEY (product_ref) REFERENCES std15_102.products(id)
)
DISTRIBUTED BY (id);




CREATE TABLE std15_102.records (
	id int4 NOT NULL,
	dt int2 NOT NULL,
	sum numeric(10, 2) NOT NULL,
	acc_ref int4 NOT NULL,
	oper_date date NULL,
	CONSTRAINT records_pkey PRIMARY KEY (id),
	CONSTRAINT rec_acc_fk FOREIGN KEY (acc_ref) REFERENCES std15_102.accounts(id)
)
DISTRIBUTED BY (id);
