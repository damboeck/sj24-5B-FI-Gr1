# erste Stunde 
show databases;
use htl_2;
show tables;
describe Person;
describe Telefon;
ALTER TABLE Person
ADD Email varchar(100);
ALTER TABLE Person
MODIFY Geburt DATE NULL;
CREATE TABLE IF NOT EXISTS Telefon (
idTelefon INT PRIMARY KEY AUTO_INCREMENT,
idPerson INT, 
Nummer VARCHAR(40),
CONSTRAINT fkPerson FOREIGN KEY (idPerson) REFERENCES Person(idPerson)
);