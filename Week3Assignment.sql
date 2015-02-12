
--create database Banking;

drop table if exists account_transaction;
drop table if exists customer_account;
drop table if exists customer;
drop table if exists account;


create table if not exists customer
(
	cust_id	int not null constraint pk_customer primary key,
	cust_f_name varchar(100) not null,
	cust_l_name varchar(100) not null,
	home_phone char(10) null,
	mobile_phone char(10) null,
	email_addr varchar(100)
)
;

Insert into customer (cust_id, cust_l_name, cust_f_name, home_phone, mobile_phone, email_addr) values (1, 'Last1', 'First1', '1111111111', '1111111111', '11@xxx.com');
Insert into customer (cust_id, cust_l_name, cust_f_name, home_phone, mobile_phone, email_addr) values (2, 'Last1', 'First2', '2222222222', '2222222222', '22@xxx.com');

Insert into customer (cust_id, cust_l_name, cust_f_name, home_phone, mobile_phone, email_addr) values (3, 'Last3', 'First3', '3333333333', '3333333333', '33@xxx.com');
Insert into customer (cust_id, cust_l_name, cust_f_name, home_phone, mobile_phone, email_addr) values (4, 'Last4', 'First4', '4444444444', '4444444444', '44@xxx.com');


create table if not exists account
(
	acct_id	int not null constraint pk_accuont primary key,
	acct_type char(1) -- c for checking, s for savings
)
;

Insert into account (acct_id, acct_type) values (1, 'c');
Insert into account (acct_id, acct_type) values (2, 's');

Insert into account (acct_id, acct_type) values (3, 'c');

Insert into account (acct_id, acct_type) values (4, 'c');


/*
	Many to many relationship between account and customer_account. One account can be owned by more than one customer (joint account).
	Similarly, one customer can have multiple accounts (both savings and checkings)
*/
create table if not exists customer_account
(
	cust_id	int not null constraint fk_customer_account_1 references customer(cust_id),
	acct_id int not null constraint fk_customer_account_2 references account(acct_id),
	constraint pk_customer_account primary key (cust_id, acct_id)
)
;

Insert into customer_account (cust_id, acct_id) values (1, 1);
Insert into customer_account (cust_id, acct_id) values (2, 1);

Insert into customer_account (cust_id, acct_id) values (3, 2);
Insert into customer_account (cust_id, acct_id) values (4, 3);
Insert into customer_account (cust_id, acct_id) values (4, 4);



/*
	One to many relationship between account and account_transaction
*/
create table if not exists account_transaction
(
	tran_id	serial not null constraint pk_acct_txn primary key,
	acct_id	int not null constraint fk_acct_txn_1 references account(acct_id),
	txn_type char(1) not null, -- 'd' for debit, 'c' for credit
	amount float not null,
	txn_date timestamp
)
;

Insert into account_transaction (acct_id, amount, txn_type, txn_date)  values (1, 100, 'c', current_timestamp);
Insert into account_transaction (acct_id, amount, txn_type, txn_date)  values (2, 200, 'c', current_timestamp);
Insert into account_transaction (acct_id, amount, txn_type, txn_date)  values (3, 300, 'c', current_timestamp);
Insert into account_transaction (acct_id, amount, txn_type, txn_date)  values (4, 400, 'c', current_timestamp);

Insert into account_transaction (acct_id, amount, txn_type, txn_date)  values (1, 10, 'd', current_timestamp);
Insert into account_transaction (acct_id, amount, txn_type, txn_date)  values (1, 10, 'd', current_timestamp);

Insert into account_transaction (acct_id, amount, txn_type, txn_date)  values (2, 50, 'd', current_timestamp);
Insert into account_transaction (acct_id, amount, txn_type, txn_date)  values (3, 25.5, 'd', current_timestamp);
Insert into account_transaction (acct_id, amount, txn_type, txn_date)  values (4, 12, 'd', current_timestamp);

select * from customer;
select * from account;
select * from customer_account;
select * from account_transaction;


/*
	-- many to many relationship
	-> customer 1 and 2  is associated to accountid 1
	-> customer 4 is associated to accountid 4
*/
select c.*, a.*
from customer as c
	join customer_account as ca on ca.cust_id = c.cust_id
	join account as a on a.acct_id = ca.acct_id
order by c.cust_id, a.acct_id;


		
/*
	one account can multiple transactions - exhibiting one to many relationship
*/		
select a.*, txn.amount, txn.txn_type, txn.txn_date
from account as a
	join account_transaction as txn on txn.acct_id = a.acct_id
order by txn.txn_date, txn.acct_id;


/*
	Extra query - show account balance
*/	

select  cust.customers_name, a.acct_id, ctxn.credit, dtxn.debit, ctxn.credit - dtxn.debit as balance
from account as a
	join (
		select ca.acct_id, string_agg(c.cust_f_name || ' ' || c.cust_l_name, ', ') as customers_name
		from customer as c 
			join customer_account as ca on ca.cust_id = c.cust_id
		group by ca.acct_id
	) as cust on cust.acct_id = a.acct_id
	join (
		select txn.acct_id, sum(amount) as credit
		from account_transaction as txn
		where txn.txn_type = 'c'
		group by txn.acct_id
	) as ctxn on ctxn.acct_id = a.acct_id
	join (
		select txn.acct_id, sum(amount) as debit
		from account_transaction as txn
		where txn.txn_type = 'd'
		group by txn.acct_id
	) as dtxn on dtxn.acct_id = a.acct_id
order by a.acct_id
