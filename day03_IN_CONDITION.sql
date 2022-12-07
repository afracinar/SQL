--IN CONDITION
--Birden fazla mantıksal operatör ile tanımlayabileceiğimiz durumları tek komutla yazabilme imkanı verir
--AND=belirtilen şartların her ikisi de gerçekleşiyorsa
--OR=belirtilen şartlardan biri gerçekleşirse

CREATE TABLE musteriler  (
urun_id int,  
musteri_isim varchar(50), 
urun_isim varchar(50)
);
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');  
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');  
INSERT INTO musteriler VALUES (20, 'John', 'Apple');  
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm');  
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple');  
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange');  
INSERT INTO musteriler VALUES (40, 'John', 'Apricot');  
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');

select * from musteriler

-- Musteriler tablosundan urun ismi orange, apple veya apricot olan tüm verileri listeleyiniz
select * from musteriler where urun_isim='Orange' OR urun_isim='Apple' OR urun_isim='Apricot';

--In Condition ile yapımı
select * from musteriler where urun_isim IN('Orange','Apple','Apricot')

-- NOT IN --> Yazdığımız verilerin dışındakileri getirir
select * from musteriler where urun_isim NOT IN('Orange','Apple','Apricot')






