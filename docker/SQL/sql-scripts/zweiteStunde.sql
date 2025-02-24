# 2. Stunde
use htl_2;
UPDATE `htl_2`.`Person` SET `Email` = 'marel.hirscher@orf.at';
select * from Person;
select Vorname,Name from Person;
select concat(Vorname," ",Name) as nn, Vorname, Name from Person;
select * from Person where vorname like "fr%";
select Vorname,Name from Person where vorname like "%z";
select * from Person , Telefon;
select * from Person , Telefon where Person.idPerson=Telefon.idPerson;
select Vorname, Name, Nummer from Person , Telefon where Person.idPerson=Telefon.idPerson;
select * from Person left outer join Telefon on Person.idPerson=Telefon.idPerson;