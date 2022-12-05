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

