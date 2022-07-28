drop table demo;
create table demo (
    id number,
    name varchar2(10)
);

alter table demo add constraint pk_demo 
    primary key (id);

alter table demo 
    add demo_column varchar2(10);

alter table demo 
    modify demo_column number(10);

insert into demo (id, demo_column) values (1, 10);
update demo set demo_column = 2 where id = 1;

set serveroutput on;
create or replace trigger demo_trigger before insert on demo for each row 
begin
    if :new.demo_column = 1 then 
     dbms_output.put_line('in valid input');

    end if;
end demo_trigger;
/

insert into demo (id, demo_column) values (3, 1);


