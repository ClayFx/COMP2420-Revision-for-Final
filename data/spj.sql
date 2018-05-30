-- This is the Suppliers-Parts-Projects example from C. J. Date, "An Introduction to Database Systems", 7th Edition.
-- The schema and data have been reproduced exactly, with the only difference being that invalid names 
-- like s#, p#,... have been replaced by snum, pnum,....

  CREATE TABLE suppliers
  (
	s_id CHAR(5) PRIMARY KEY,
	name CHAR(20) NOT NULL,
	status INTEGER NOT NULL,
	city CHAR(15) NOT NULL
  );

  CREATE TABLE parts
  (
	p_id CHAR(6) PRIMARY KEY,
	name CHAR(20) NOT NULL,
	colour CHAR(6) NOT NULL,
	weight NUMERIC(5,1) NOT NULL,
	city CHAR(15) NOT NULL
  );

  CREATE TABLE supplier_inventory
  (
	s_id CHAR(5) REFERENCES suppliers,
	p_id CHAR(6) REFERENCES parts,
	quantity INTEGER NOT NULL,
	PRIMARY KEY (s_id, p_id)
  );

  INSERT INTO suppliers VALUES ('S1', 'Smith', 20, 'London');
  INSERT INTO suppliers VALUES ('S2', 'Jones', 10, 'Paris');
  INSERT INTO suppliers VALUES ('S3', 'Blake', 30, 'Paris');
  INSERT INTO suppliers VALUES ('S4', 'Clark', 20, 'London');
  INSERT INTO suppliers VALUES ('S5', 'Adams', 30, 'Athens');
  INSERT INTO suppliers VALUES ('S6', 'Miles', 20, 'Rome');
  INSERT INTO suppliers VALUES ('S7', 'Black', 40, 'Oslo');

  INSERT INTO parts VALUES ('P1', 'Nut', 'Red', 12, 'London');
  INSERT INTO parts VALUES ('P2', 'Bolt', 'Green', 17, 'Paris');
  INSERT INTO parts VALUES ('P3', 'Screw', 'Blue', 17, 'Oslo');
  INSERT INTO parts VALUES ('P4', 'Screw', 'Red', 14, 'London');
  INSERT INTO parts VALUES ('P5', 'Cam', 'Blue', 12, 'Paris');
  INSERT INTO parts VALUES ('P6', 'Cog', 'Red', 19, 'London');

  INSERT INTO supplier_inventory VALUES ('S1', 'P1', 300);
  INSERT INTO supplier_inventory VALUES ('S1', 'P2', 200);
  INSERT INTO supplier_inventory VALUES ('S1', 'P3', 400);
  INSERT INTO supplier_inventory VALUES ('S1', 'P4', 200);
  INSERT INTO supplier_inventory VALUES ('S1', 'P5', 100);
  INSERT INTO supplier_inventory VALUES ('S1', 'P6', 100);
  INSERT INTO supplier_inventory VALUES ('S2', 'P1', 300);
  INSERT INTO supplier_inventory VALUES ('S2', 'P2', 400);
  INSERT INTO supplier_inventory VALUES ('S3', 'P2', 200);
  INSERT INTO supplier_inventory VALUES ('S4', 'P2', 200);
  INSERT INTO supplier_inventory VALUES ('S4', 'P4', 300);
  INSERT INTO supplier_inventory VALUES ('S4', 'P5', 400);
  INSERT INTO supplier_inventory VALUES ('S4', 'P6', 500);
  INSERT INTO supplier_inventory VALUES ('S5', 'P5', 1500);
  INSERT INTO supplier_inventory VALUES ('S1', 'P1', 1100);
  INSERT INTO supplier_inventory VALUES ('S2', 'P3', 6000);
  INSERT INTO supplier_inventory VALUES ('S5', 'P2', 200);


  CREATE TABLE jobs
  (
	j_id CHAR(5) PRIMARY KEY,
	name CHAR(20) NOT NULL,
	city CHAR(15) NOT NULL
  );

  CREATE TABLE requests
  (
	s_id CHAR(5) REFERENCES suppliers,
	p_id CHAR(6) REFERENCES parts,
	j_id CHAR(5) REFERENCES jobs,
	quantity INTEGER NOT NULL,
	PRIMARY KEY (s_id, p_id, j_id)
  );

  INSERT INTO jobs VALUES('J1', 'Sorter', 'Paris');
  INSERT INTO jobs VALUES('J2', 'Display', 'Rome');
  INSERT INTO jobs VALUES('J3', 'OCR', 'Athens');
  INSERT INTO jobs VALUES('J4', 'Console', 'Athens');
  INSERT INTO jobs VALUES('J5', 'RAID', 'London');
  INSERT INTO jobs VALUES('J6', 'EDS', 'Oslo');
  INSERT INTO jobs VALUES('J7', 'Tape', 'London');

  INSERT INTO requests VALUES ('S1',  'P1',  'J1',  200);
  INSERT INTO requests VALUES ('S1',  'P1',  'J4',  700);
  INSERT INTO requests VALUES ('S2',  'P3',  'J1',  400);
  INSERT INTO requests VALUES ('S2',  'P3',  'J2',  200);
  INSERT INTO requests VALUES ('S2',  'P3',  'J3',  200);
  INSERT INTO requests VALUES ('S2',  'P3',  'J4',  500);
  INSERT INTO requests VALUES ('S2',  'P3',  'J5',  600);
  INSERT INTO requests VALUES ('S2',  'P3',  'J6',  400);
  INSERT INTO requests VALUES ('S2',  'P3',  'J7',  800);
  INSERT INTO requests VALUES ('S2',  'P5',  'J2',  100);
  INSERT INTO requests VALUES ('S3',  'P3',  'J1',  200);
  INSERT INTO requests VALUES ('S3',  'P4',  'J2',  500);
  INSERT INTO requests VALUES ('S4',  'P6',  'J3',  300);
  INSERT INTO requests VALUES ('S4',  'P6',  'J7',  300);
  INSERT INTO requests VALUES ('S5',  'P2',  'J2',  200);
  INSERT INTO requests VALUES ('S5',  'P2',  'J4',  100);
  INSERT INTO requests VALUES ('S5',  'P5',  'J5',  500);
  INSERT INTO requests VALUES ('S5',  'P5',  'J7',  100);
  INSERT INTO requests VALUES ('S5',  'P6',  'J2',  200);
  INSERT INTO requests VALUES ('S5',  'P1',  'J4',  100);
  INSERT INTO requests VALUES ('S5',  'P3',  'J4',  200);
  INSERT INTO requests VALUES ('S5',  'P4',  'J4',  800);
  INSERT INTO requests VALUES ('S5',  'P5',  'J4',  400);
  INSERT INTO requests VALUES ('S5',  'P6',  'J4',  500);
