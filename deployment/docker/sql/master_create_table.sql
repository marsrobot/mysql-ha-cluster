USE marketdata;

CREATE TABLE IF NOT EXISTS example_table
(
    id INT NOT NULL AUTO_INCREMENT,
    example_column VARCHAR(256),
    PRIMARY KEY ( id )
);

INSERT INTO example_table
    (example_column)
VALUES
    ('This is the first row'),
    ('This is the second row'),
    ('This is the third row');


INSERT INTO example_table
    (example_column)
VALUES
    ('This is the fourth row'),
    ('This is the fifth row'),
    ('This is the six row');