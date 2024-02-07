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
