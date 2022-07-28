ALTER SESSION SET NLS_DATE_LANGUAGE='AMERICAN';
ALTER SESSION SET NLS_DATE_FORMAT='DD-MON-RR';
-- this is for table creation
drop table user_package;
drop table call_record;
drop table sim;
drop table operators;
drop table customer_details;
drop table callcost;
drop table package;

create table package(
    plan_id number(10) not null,
    cost number(10,5),
    duration varchar2(15),
    primary key (plan_id)
);

create table callcost(
    duration number(10) not null,
    cost number(10,5),
    primary key (duration)
);

create table customer_details(
    cust_id number(10) not null,
    cust_name varchar2(15),
    city varchar2(15),
    nid_no number(20),
    gender varchar2(8),
    age number(10,2),
    primary key (cust_id)
);

create table operators (
    op_id number(10) not null,
    op_name varchar2(20),
    duration number(10),
    primary key (op_id),
    foreign key (duration) references callcost ON DELETE CASCADE 
);

create table sim(
    sim_type varchar2(10) not null,
    sim_number number(15),
    cost number(10,5),
    cust_id number(10),
    op_id number(10),
    primary key (sim_type),
    foreign key (cust_id) references customer_details ON DELETE CASCADE ,
    foreign key (op_id) references operators ON DELETE CASCADE 
);

create table call_record (
    record_id number(10) not null,
    duration varchar2(10),
    op_id number(10),
    sim_type varchar2(10),
    dial_time varchar2(10),
    dial_date date,
    primary key (record_id),
    foreign key (op_id) references operators ON DELETE CASCADE ,
    foreign key (sim_type) references sim ON DELETE CASCADE 
);

create table user_package(
    sim_type varchar2(10),
    plan_id number(10) ,
    start_date date,
    primary key (sim_type, plan_id),
    foreign key (plan_id) references package ON DELETE CASCADE ,
    foreign key (sim_type) references  sim ON DELETE CASCADE 
);

-- lab1 => inserting data into the table   

-- insert data into package table
insert into package (plan_id, cost, duration) values (101, 100.50 , '07:01:10');
insert into package (plan_id, cost, duration) values (102, 260.75 , '03:00:00');
insert into package (plan_id, cost, duration) values (103, 230.50 , '04:13:20');
insert into package (plan_id, cost, duration) values (104, 403.99 , '01:20:30');
insert into package (plan_id, cost, duration) values (105, 29.360,  '10:17:40');
insert into package (plan_id, cost, duration) values (106, 302.23 , '14:13:50');
insert into package (plan_id, cost, duration) values (107, 203.43 , '30:01:60');
insert into package (plan_id, cost, duration) values (108, 505.12 , '25:21:45');
insert into package (plan_id, cost, duration) values (109, 603.23 , '20:12:33');
insert into package (plan_id, cost, duration) values (110, 793.21 , '18:07:50');

-- insert data into callcost
insert into callcost (duration , cost) values (1, 20);
insert into callcost (duration , cost) values (2, 29);
insert into callcost (duration , cost) values (3, 38);
insert into callcost (duration , cost) values (4, 47);
insert into callcost (duration , cost) values (5, 56);
insert into callcost (duration , cost) values (6, 65);
insert into callcost (duration , cost) values (7, 74);
insert into callcost (duration , cost) values (8, 83);
insert into callcost (duration , cost) values (9, 92);
insert into callcost (duration , cost) values (10, 100);
insert into callcost (duration , cost) values (20, 200);

-- insert into custormer details table 
insert into customer_details (cust_id, cust_name, city, nid_no, gender, age) values (301 , 'Emon' , 'Bogra' , 12345678, 'Male', 23);
insert into customer_details (cust_id, cust_name, city, nid_no, gender, age) values (302 , 'Arnob' , 'Natore' , 22345632, 'Male', 33);
insert into customer_details (cust_id, cust_name, city, nid_no, gender, age) values (303 , 'Shoriful' , 'Bogra' , 32345623, 'Male', 54);
insert into customer_details (cust_id, cust_name, city, nid_no, gender, age) values (304 , 'Parvej' , 'Bogra' , 92345623, 'Male', 34);
insert into customer_details (cust_id, cust_name, city, nid_no, gender, age) values (305 , 'Bayesh' , 'Rajshahi' , 72345232, 'Male', 12);
insert into customer_details (cust_id, cust_name, city, nid_no, gender, age) values (306 , 'Jafrin' , 'Khulna' , 52323678, 'Female', 43);
insert into customer_details (cust_id, cust_name, city, nid_no, gender, age) values (307 , 'Jenney' , 'Lalmonirhat' , 12354678, 'Female', 75);
insert into customer_details (cust_id, cust_name, city, nid_no, gender, age) values (308 , 'Tahsin' , 'Cumilla' , 43345678, 'Male', 64);
insert into customer_details (cust_id, cust_name, city, nid_no, gender, age) values (309 , 'Mehedi' , 'Dhaka' , 23325678, 'Male', 32);
insert into customer_details (cust_id, cust_name, city, nid_no, gender, age) values (310 , 'Rinvy' , 'Dhaka' , 43245678, 'Female', 65);
insert into customer_details (cust_id, cust_name, city, nid_no, gender, age) values (311 , 'Mehedi' , 'Chittagong' , 432324678, 'Female', 75);

-- insert into operators table
insert into operators (op_id, op_name , duration) values (401, 'Grammen Phone', 1);
insert into operators (op_id, op_name , duration) values (402, 'Grammen Phone', 3);
insert into operators (op_id, op_name , duration) values (403, 'Grammen Phone', 5);
insert into operators (op_id, op_name , duration) values (404, 'Robi', 7);
insert into operators (op_id, op_name , duration) values (405, 'Robi', 9);
insert into operators (op_id, op_name , duration) values (406, 'Robi', 2);
insert into operators (op_id, op_name , duration) values (407, 'Airtel', 4);
insert into operators (op_id, op_name , duration) values (408, 'Airtel', 6);
insert into operators (op_id, op_name , duration) values (409, 'Bangla Link', 8);
insert into operators (op_id, op_name , duration) values (410, 'Teletalk', 10);


-- insert into sim table
insert into sim (sim_type, sim_number , cost, cust_id , op_id) values (501, 2123534678, 421.342, 301, 410);
insert into sim (sim_type, sim_number , cost, cust_id , op_id) values (502, 8632343435, 433.454, 301, 409);
insert into sim (sim_type, sim_number , cost, cust_id , op_id) values (503, 5454345345, 434.454, 303, 403);
insert into sim (sim_type, sim_number , cost, cust_id , op_id) values (504, 5454345454, 878.455, 303, 403);
insert into sim (sim_type, sim_number , cost, cust_id , op_id) values (505, 6656565654, 989.454, 302, 401);
insert into sim (sim_type, sim_number , cost, cust_id , op_id) values (506, 8677665434, 323.453, 310, 402);
insert into sim (sim_type, sim_number , cost, cust_id , op_id) values (507, 5653343432, 554.334, 304, 401);
insert into sim (sim_type, sim_number , cost, cust_id , op_id) values (508, 6565645123, 656.342, 310, 404);
insert into sim (sim_type, sim_number , cost, cust_id , op_id) values (509, 8998676543, 767.876, 309, 406);
insert into sim (sim_type, sim_number , cost, cust_id , op_id) values (510, 7566543431, 345.765, 305, 405);
insert into sim (sim_type, sim_number , cost, cust_id , op_id) values (511, 3434343235, 546.655, 301, 408);
insert into sim (sim_type, sim_number , cost, cust_id , op_id) values (512, 2323243434, 565.565, 305, 409);
insert into sim (sim_type, sim_number , cost, cust_id , op_id) values (513, 5454632567, 656.778, 308, 408);
insert into sim (sim_type, sim_number , cost, cust_id , op_id) values (514, 8787554554, 766.345, 306, 406);
insert into sim (sim_type, sim_number , cost, cust_id , op_id) values (515, 8765644554, 676.565, 307, 404);
insert into sim (sim_type, sim_number , cost, cust_id , op_id) values (516, 4987454333, 565.655, 302, 407);
insert into sim (sim_type, sim_number , cost, cust_id , op_id) values (517, 4354643454, 876.876, 308, 404);
insert into sim (sim_type, sim_number , cost, cust_id , op_id) values (518, 3435445655, 876.876, 307, 405);
insert into sim (sim_type, sim_number , cost, cust_id , op_id) values (519, 3435445655, null, 308, 405);


-- inset into call record table

insert into call_record (record_id, duration, sim_type, op_id, dial_time, dial_date) values (601, '00:15:20',502, 408, '02:12PM', to_date('2022/05/31', 'yyyy/mm/dd'));
insert into call_record (record_id, duration, sim_type, op_id, dial_time, dial_date) values (602, '01:43:12',501, 406, '10:12AM', to_date('2022/03/21', 'yyyy/mm/dd'));
insert into call_record (record_id, duration, sim_type, op_id, dial_time, dial_date) values (603, '02:54:23',510, 404, '12:12PM', to_date('2022/11/12', 'yyyy/mm/dd'));
insert into call_record (record_id, duration, sim_type, op_id, dial_time, dial_date) values (604, '05:23:43',503, 402, '04:12AM', to_date('2022/03/12', 'yyyy/mm/dd'));
insert into call_record (record_id, duration, sim_type, op_id, dial_time, dial_date) values (605, '00:43:43',509, 410, '06:12AM', to_date('2022/04/24', 'yyyy/mm/dd'));
insert into call_record (record_id, duration, sim_type, op_id, dial_time, dial_date) values (606, '00:12:54',504, 401, '06:12PM', to_date('2022/10/25', 'yyyy/mm/dd'));
insert into call_record (record_id, duration, sim_type, op_id, dial_time, dial_date) values (607, '07:21:12',508, 403, '11:12AM', to_date('2022/07/17', 'yyyy/mm/dd'));
insert into call_record (record_id, duration, sim_type, op_id, dial_time, dial_date) values (608, '01:32:43',505, 405, '03:12PM', to_date('2022/02/19', 'yyyy/mm/dd'));
insert into call_record (record_id, duration, sim_type, op_id, dial_time, dial_date) values (609, '02:21:12',507, 407, '04:12AM', to_date('2022/04/02', 'yyyy/mm/dd'));
insert into call_record (record_id, duration, sim_type, op_id, dial_time, dial_date) values (610, '02:23:54',506, 409, '08:12PM', to_date('2022/09/19', 'yyyy/mm/dd'));
insert into call_record (record_id, duration, sim_type, op_id, dial_time, dial_date) values (611, '02:23:54',506, 406, '08:12PM', to_date('2022/09/22', 'yyyy/mm/dd'));
insert into call_record (record_id, duration, sim_type, op_id, dial_time, dial_date) values (612, '02:23:54',504, 407, '08:12PM', to_date('2023/09/19', 'yyyy/mm/dd'));

-- insert data into user_package
insert into user_package (plan_id, sim_type, start_date) values (101,503,to_date('2022/09/20', 'yyyy/mm/dd'));
insert into user_package (plan_id, sim_type, start_date) values (102,501,to_date('2022/10/10', 'yyyy/mm/dd'));
insert into user_package (plan_id, sim_type, start_date) values (103,502,to_date('2022/04/23', 'yyyy/mm/dd'));
insert into user_package (plan_id, sim_type, start_date) values (104,504,to_date('2022/02/13', 'yyyy/mm/dd'));
insert into user_package (plan_id, sim_type, start_date) values (105,505,to_date('2022/01/23', 'yyyy/mm/dd'));
insert into user_package (plan_id, sim_type, start_date) values (106,507,to_date('2022/05/25', 'yyyy/mm/dd'));
insert into user_package (plan_id, sim_type, start_date) values (107,508,to_date('2022/09/17', 'yyyy/mm/dd'));
insert into user_package (plan_id, sim_type, start_date) values (108,503,to_date('2022/08/17', 'yyyy/mm/dd'));
insert into user_package (plan_id, sim_type, start_date) values (109,509,to_date('2022/09/29', 'yyyy/mm/dd'));
insert into user_package (plan_id, sim_type, start_date) values (110,510,to_date('2022/11/30', 'yyyy/mm/dd'));
insert into user_package (plan_id, sim_type, start_date) values (110,503,to_date('2022/11/30', 'yyyy/mm/dd'));
insert into user_package (plan_id, sim_type, start_date) values (106,510,to_date('2022/11/30', 'yyyy/mm/dd'));
insert into user_package (plan_id, sim_type, start_date) values (104,503,to_date('2022/11/30', 'yyyy/mm/dd'));
insert into user_package (plan_id, sim_type, start_date) values (105,502,to_date('2022/11/30', 'yyyy/mm/dd'));

-- lab2 =>  
-- Show all table 
select * from tab;

-- describe table
describe call_record;

-- add new column in call_record table
alter table call_record add demo_column varchar2(10);
describe call_record;

-- modify call_record table column defination
alter table call_record modify demo_column number(10);
describe call_record;

--delete a colum from call_record table
alter table call_record drop column demo_column;
describe call_record;

-- add old column in call_record table
alter table call_record add old_column varchar2(10);
describe call_record;

-- rename the column name in call_record table
alter table call_record rename column old_column to new_column;
describe call_record;


--delete the new column from call_record table
alter table call_record drop column new_column;
describe call_record;

-- show all the values from operators table
select *from operators;

-- update a existing column content from call_record table
update operators set op_name = 'Bangla Link' where op_id = 408;
select * from operators;

-- insert demo data into operators table
insert into operators (op_name, op_id,duration) values ('demo',12,1);
select * from operators;

-- delete a row from the operators table
delete from operators where op_id = 12;
select * from operators;







-- Lab3 =>
-- show the content from operators table
select * from operators;
-- show the content from callcost table
select * from callcost;

-- now try to remove a table row
-- this row has been linked with the operator table row

savepoint main1;
delete from callcost where duration = 1;
rollback to main1;

--now the correct row
delete from callcost where duration = 20;
select * from callcost;

-- show the column of cust_id from the sim table
select cust_id from sim;

--show distinct row of cust_id from the sim table
select distinct cust_id from sim;

-- show all the rows from the sim table
select * from sim;

-- calculated area
select cost as current_cost, (cost/5) as reduced_cost from sim where cust_id = 301;

-- applying condition in the table 
select cost,cust_id from sim where cust_id = 301 or cust_id = 302;

-- range
select cost,cust_id from sim where cust_id between 301 and 303;

-- In close
select cost,cust_id from sim where cust_id IN (301,303,304);

-- not In close
select cost,cust_id from sim where cust_id not IN (301,303,304);

--like 
select op_id , op_name as name from operators where op_name like '%one';
select op_id , op_name as name from operators where op_name like '%o%';

-- order by
select sim_number , sim_type , cost , cust_id, op_id as sim_cost from sim order by cost;

-- desc order 
select sim_number , sim_type , cost , cust_id , op_id as sim_cost from sim order by cost desc;

-- order by using two column
select sim_number , sim_type , cost , cust_id , op_id as sim_cost from sim order by cust_id,op_id;








-- lab4

-- aggregate function

-- count 
select count(*) , count(cost) from sim;
-- sum and average
select count(*) , sum(cost) , avg(cost) from sim;

-- NVL averrage
select avg(NVL(cost,0)) as AVG_Considering_NULL_value from sim;

-- using all
select count (cost) , count (distinct cost) , count (all cost) from sim;

-- Group by close
select cust_id , count(op_id) from sim group by cust_id;
select cust_id , count(op_id) from sim where cost >= 500 group by cust_id;

-- using having
select cust_id , count(op_id) from sim group by cust_id having count(op_id) > 1;

-- using system date;
select dial_date from call_record;
select dial_date from call_record where dial_date > sysdate;




-- lab5

-- nested query

select sim_number , cust_id from sim where op_id in (
        select op_id from operators where op_name like '%o%'
            );


-- UNION ALL operations
select sim_number , cust_id from sim where cost > 500 
UNION ALL 
select sim_number , cust_id from sim where op_id in (
        select op_id from operators where op_name like '%o%'
            );

-- Union operation
select sim_number , cust_id from sim where cost > 500 
UNION
select sim_number , cust_id from sim where op_id in (
        select op_id from operators where op_name like '%o%'
            );

-- intersect
select sim_number , cust_id from sim where cost > 500 
INTERSECT
select sim_number , cust_id from sim where op_id in (
        select op_id from operators where op_name like '%o%'
            );

-- minus
select sim_number , cust_id from sim where cost > 500 
minus
select sim_number , cust_id from sim where op_id in (
        select op_id from operators where op_name like '%o%'
            );

-- multiple operations (will excute the left operation first)
select sim_number , cust_id from sim where cost > 500 
UNION
select sim_number , cust_id from sim where op_id in (
        select op_id from operators where op_name like '%o%'
            )
Intersect 
select sim_number , cust_id from sim where op_id in (406 , 407 , 403);




-- lab6

-- join using where
select c.cust_name, c.city, s.sim_number from customer_details c , sim s where c.cust_id = s.cust_id;

-- now using join operation
select c.cust_name, c.city, s.sim_number from customer_details c join sim s on c.cust_id = s.cust_id;

-- now using using keyword
select c.cust_name, c.city, s.sim_number from customer_details c join sim s using( cust_id );

-- Natural Join operation
select s.sim_number, s.cost , o.op_name from sim s Natural join operators o ;

-- cross join
select s.sim_number, s.cost, r.duration, r.dial_date, r.dial_date from sim s cross join call_record r ;

-- Inner join
select c.cust_name, c.city, s.sim_number from customer_details c inner join sim s on c.cust_id = s.cust_id;

-- outer join
-- left outer join
select c.cust_name, c.city, s.sim_number from customer_details c left outer join sim s on c.cust_id = s.cust_id;

-- Full outer join
select c.cust_name, c.city, s.sim_number from customer_details c FULL OUTER JOIN  sim s on c.cust_id = s.cust_id;

-- non equi join
select c.cust_name, c.city, s.sim_number from customer_details c join sim s on s.cost between 500 and 550;




-- lab7
-- pl/sql start

-- find max_cost from package table
set serveroutput on
declare
    max_package_cost package.cost%type;
begin
    select max(cost) into max_package_cost from package;
    dbms_output.put_line('max_cost: ' || max_package_cost);
end;
/

-- find city name of user like Chittagong
set serveroutput on
declare
    output_cust_name customer_details.cust_name%type;
    city_name customer_details.city%type := 'Chittagong';
begin
    select cust_name into output_cust_name from customer_details where city=city_name;
    dbms_output.put_line('Output city: ' || output_cust_name);
end;
/

-- nested query inside the begin block
set serveroutput on 
declare
    op_name_output operators.op_name%type;
    sim_cost_number sim.cost%type := 565.565;
begin
    select o.op_name into op_name_output from sim s join operators o on s.op_id = o.op_id and cost = sim_cost_number;
    dbms_output.put_line('operator name '|| op_name_output);
end;
/

-- give discount 
-- if cost is less then 100 then give 5% discount
-- if cost is less then 200 then give 10% discount
-- if cost is less then 300 then give 15% discount
-- if cost is less then 400 then give 20% discount
-- if cost is less then 500 then give 25% discount
-- else give 30% discount

set serveroutput on 
declare 
    cost_of_sim sim.cost%type;
    discount_cost sim.cost%type;
    name_of_this_operator operators.op_name%type := 'Teletalk';
begin
    select s.cost into cost_of_sim from sim s join operators o on s.op_id = o.op_id and op_name = name_of_this_operator;
    
    IF cost_of_sim < 100 then discount_cost:= cost_of_sim - (cost_of_sim * 0.05);
    elsif cost_of_sim < 200 then discount_cost:= cost_of_sim - (cost_of_sim * 0.10);
    elsif cost_of_sim < 300 then discount_cost:= cost_of_sim - (cost_of_sim * 0.15);
    elsif cost_of_sim < 400 then discount_cost:= cost_of_sim - (cost_of_sim * 0.20);
    elsif cost_of_sim < 500 then discount_cost:= cost_of_sim - (cost_of_sim * 0.25);
    else discount_cost:= cost_of_sim - (cost_of_sim * 0.30);
    
    end if;
    dbms_output.put_line('current price= ' || cost_of_sim || ' discount cost= '|| discount_cost);
end;
/





-- lab8

-- procedures 
set serveroutput on;
create or replace procedure get_cost is 
    cost_of_sim sim.cost%type;
    name_of_this_operator operators.op_name%type := 'Teletalk';
begin
    select s.cost into cost_of_sim from sim s join operators o on s.op_id = o.op_id and op_name = name_of_this_operator;
    dbms_output.put_line('cost = '|| cost_of_sim);
end;
/
show errors;

begin
    get_cost;
end;
/

set serveroutput on
create or replace procedure input_callcost (callcost_duration callcost.duration%type, callcost_cost callcost.cost%type) is
begin
    insert into callcost (duration, cost) values (callcost_duration, callcost_cost);
end input_callcost;
/

show errors;
select * from callcost;
begin
    input_callcost(30, 200);
end;
/
select * from callcost;

-- function 
set serveroutput on
create or replace function avg_cost return NUMBER is
    output_result package.cost%type;
begin
    select avg(cost) into output_result from package;
    return output_result;
end avg_cost;
/

begin
    dbms_output.put_line('average cost of package ' || avg_cost);
end;
/



-- lab9
-- Trigger 

create or replace Trigger operators_input_trigger before insert or update on operators for each row
begin
    IF :new.op_name = 'Grammen Phone' then :new.duration:= 1;
    elsif :new.op_name = 'Robi' then :new.duration:= 2;
    elsif :new.op_name = 'Airtel' then :new.duration:= 3;
    elsif :new.op_name = 'Bangla Link' then :new.duration:= 4;
    else :new.duration:= 5;
    end IF;
end operators_input_trigger;
/
show errors;

select * from operators;
insert into operators (op_id, op_name) values (430, 'Grammen Phone');
select * from operators;
insert into operators (op_id, op_name) values (431, 'Robi');
select * from operators;
insert into operators (op_id, op_name) values (432, 'Airtel');
select * from operators;
insert into operators (op_id, op_name) values (433, 'Bangla Link');
select * from operators;
insert into operators (op_id, op_name) values (434, 'Teletalk');
select * from operators;

commit

select *from user_package;
delete from user_package where sim_type = 502;
select *from user_package;

rollback;
select *from user_package;

-- check for savpoint
savepoint point_1;
delete from user_package where sim_type = 502;
select *from user_package;

savepoint point_2;
delete from user_package where sim_type = 501;
select *from user_package;


rollback to point_1;
select *from user_package;


-- date
select sysdate from dual;

select current_date from dual;

select systimestamp from dual;






-- view
create or replace view show_table_content as
    select s.sim_number, s.cost , o.op_name from sim s Natural join operators o ;

select * from show_table_content;

-- drop in view
drop view show_table_content;

-- view 
create or replace view show_table_content as
    select s.sim_type, s.sim_number, s.cost from sim s;

select * from show_table_content;

-- insert into view
insert into show_table_content values (520, 11111111, null);
select * from show_table_content;




-- rowType Cursour 

set serveroutput on;
declare
    cursor call_record_details is select o.op_name , r.duration , r.dial_time , r.dial_date from operators o join call_record r on o.op_id = r.op_id order by r.dial_date;
    call_record_details_row call_record_details%rowtype;
begin
open call_record_details;
    loop
      fetch call_record_details into call_record_details_row;
      Exit when call_record_details%rowcount > 4;
      IF call_record_details_row.dial_date < sysdate THEN
        dbms_output.put_line('Operator Name : '|| call_record_details_row.op_name || ' Call duration : '|| call_record_details_row.duration || ' Call time : '|| call_record_details_row.dial_time || ' Dial Date : '|| call_record_details_row.dial_date);
      end IF;
    end loop;
close call_record_details;
end;
/

