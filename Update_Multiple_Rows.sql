######################################## mySQL #######################################################
#Update multiple rows in same query using mySQL
INSERT INTO countries (id, updated_at, name)
VALUES
(4, now(), 'American Samoa'),
(9, now(), 'Antigua and Barbuda')
ON DUPLICATE KEY UPDATE
updated_at=VALUES(updated_at), name=VALUES(name)
 
UPDATE countries
SET name = (case when id=4  then 'American Samoa'
                 when id=9  then 'Antigua and Barbuda'
                 when id=16 then 'Commonwealth of The Bahamas'
            end),
    updated_at = now()
WHERE id in (4,9,16);

########################################################## PostgreSQL #####3####################################################
## Use update ... from syntax and use a mapping table. If you want to update more than one column, it's much more generalizable:
update test as t set
    column_a = c.column_a
from (values
    ('123', 1),
    ('345', 2)  
) as c(column_b, column_a) 
where c.column_b = t.column_b;

## -- postgres FTW
update users as u set 
  email = u2.email,
  first_name = u2.first_name,
  last_name = u2.last_name
from (values
  (1, 'hollis@weimann.biz', 'Hollis', 'Connell'),
  (2, 'robert@duncan.info', 'Robert', 'Duncan')
) as u2(id, email, first_name, last_name)
where u2.id = u.id;
