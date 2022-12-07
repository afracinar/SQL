--DML (iç mimar)-->UPDATE
--Tablodaki data nasıl update edilir? (UPDATE SET)

CREATE TABLE tedarikcis -- parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);
INSERT INTO tedarikcis VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikcis VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikcis VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikcis VALUES (104, 'Apple', 'Adam Eve');
CREATE TABLE uruns -- child
(
ted_vergino int, 
urun_id int, 
urun_isim VARCHAR(50), 
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikcis(vergi_no)
on delete cascade
);    
INSERT INTO uruns VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO uruns VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO uruns VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO uruns VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO uruns VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO uruns VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO uruns VALUES(104, 1007,'Phone', 'Aslan Yılmaz');
select * from tedarikcis
select * from uruns

-- vergi_no’su 102 olan tedarikcinin firma ismini 'Vestel' olarak güncelleyeniz.
UPDATE tedarikcis 
set firma_ismi='Vestel' where vergi_no=102;

--vergi_no’su 101 olan tedarikçinin firma ismini 'casper' ve irtibat_ismi’ni 'Ali Veli' olarak güncelleyiniz.
UPDATE tedarikcis
set firma_ismi='Casper',irtibat_ismi='Ali Veli' where vergi_no=101
select * from tedarikcis

--  uruns tablosundaki 'Phone' değerlerini 'Telefon' olarak güncelleyiniz.
update uruns
set urun_isim='Telefon' where urun_isim='Phone'
 select * from uruns
 
-- uruns tablosundaki urun_id değeri 1004'ten büyük olanların urun_id’sini 1 arttırın.
update uruns
set urun_id=urun_id+1 where urun_id>1004

--uruns tablosundaki tüm ürünlerin urun_id değerini ted_vergino sutun değerleri ile toplayarak güncelleyiniz.
update uruns
set urun_id=urun_id+ted_vergino

--tabloyu eski haline getiriyoruz
delete from uruns
delete from tedarikcis

-- urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci tablosunda irtibat_ismi
-- 'Adam Eve' olan firmanın ismi (firma_ismi) ile degistiriniz.
update uruns
set urun_isim=(select firma_ismi from tedarikcis where irtibat_ismi='Adam Eve')
WHERE musteri_isim='Ali Bak'

select * from uruns

--uruns tablosundaki laptop satın alan müşterilerin ismini,firma_ismi Apple'ın irtibat_ismi ile değiştirin
update uruns
set musteri_ismi=(select irtibat_ismi from tedarikcis where firma_ismi='Apple')
where urun_isim='Laptop'


 

