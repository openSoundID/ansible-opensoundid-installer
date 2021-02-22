CREATE TABLE IF NOT EXISTS Bird 
(id INT PRIMARY KEY,
 gen VARCHAR(50) NOT NULL,
 sp VARCHAR(50) NOT NULL,
 ssp VARCHAR(50),
 en VARCHAR(100),
 fr VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Record
(id VARCHAR(30) PRIMARY KEY,
 bird_id INT NOT NULL,
 cnt VARCHAR(50),
 loc VARCHAR(250),
 lat VARCHAR(50),
 lng VARCHAR(50),
 alt VARCHAR(50),
 q VARCHAR(1),
 length VARCHAR(50),
 time VARCHAR(50),
 date VARCHAR(50),
 rmk VARCHAR(4096),
 type VARCHAR(250),
 origin VARCHAR(25),
 enable BOOLEAN,
 foreign key (bird_id) references Bird(id)
 
 );

CREATE TABLE IF NOT EXISTS Also
(record_id VARCHAR(30) NOT NULL,
 bird_id INT NOT NULL,
 primary key(record_id,bird_id),
 foreign key (record_id) references Record(id),
 foreign key (bird_id) references Bird(id)
);




