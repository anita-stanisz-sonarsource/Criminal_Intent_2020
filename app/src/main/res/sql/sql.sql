CREATE TABLE DATA
(ID INTEGER REFERENCES STATION(ID),
MONTH INTEGER CHECK (MONTH BETWEEN 1 AND 12),
TEMP_F REAL CHECK (TEMP_F BETWEEN -80 AND 150),
RAIN_I REAL CHECK (RAIN_I BETWEEN 0 AND 100),
PRIMARY KEY (ID, MONTH));

-- Rule S3651 violation
CREATE TABLE product
(id INT,
  name VARCHAR(6) NOT NULL,
  mfg_name VARCHAR(6),
  mfg_id INT)

SELECT name, price
FROM product
WHERE name is not null -- Noncompliant; always true. This column is NOT NULL
  AND mfg_name = 'Too long name' -- Noncompliant; always false. This column can contain only 6 characters

-- Rule S3618 violation
  INSERT INTO MY_TABLE  -- Noncompliant; N2 value omitted
  (
    N1
  )
  VALUES
  (
    1
  )
  
-- Rule S3641 violation
SELECT *
FROM my_table
WHERE my_column NOT IN (SELECT nullable_column FROM another_table)  -- Noncompliant; "nullable_column" may contain 'NULL' value and the whole SELECT query will return nothing
  
-- Rule S3921 violation
create table persons (id number, name varchar2(4));

insert into persons (id, name) values (1, 'Alice'); -- Noncompliant, raises ORA-12899

create or replace procedure sp1
is
  foo varchar2(2);
begin
  select name into foo from persons where id = 1; -- Noncompliant, may raise ORA-06502
end;
