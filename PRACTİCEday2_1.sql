/*
1.Data Query Language (Veri Sorgulama Dili - DQL)
SELECT: veritabanındaki verileri alır.

2.Data Manipulation Language (Veri Kullanma Dili - DML)tablo içindeki verilerle işlem yapacağımız zaman kullanılır
INSERT:Veritabanına yeni veri ekler.
DELETE:Veritabanındaki verileri siler VERİLERİ SİLMEK İÇİN -DELETE
UPDATE:Veritabanındaki verileri günceller.

3.Data Definition Language (Veri Tanimlama Dili - DDL)
DROP: Bir veritabanını veya veritabanı içindeki tabloyu siler.    TABLOYU SİLER
ALTER: Bir veritabanı veya veritabanı içindeki tabloyu günceller. TABLOYU GÜNCELLER
CREATE:Bir veritabanı veya veritabanı içinde tablo oluşturur.     TABLO OLUŞTURUR
*/

CREATE TABLE parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);
INSERT INTO parent VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO parent VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO parent VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO parent VALUES (104, 'Apple', 'Adam Eve');

select * from parent;

CREATE TABLE child
(
ted_vergino int,
urun_id int,
urun_isim VARCHAR(50),
musteri_isim VARCHAR(50),
CONSTRAINT fk FOREIGN KEY(ted_vergino) REFERENCES parent(vergi_no)
);

INSERT INTO child VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO child VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO child VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO child VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO child VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO child VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO child VALUES(104, 1007,'Phone', 'Aslan Yılmaz');

select * from child;

--parent tabloda olmayan primary key ile child tabloya veri girişi yapılamaz,mesela 105 girilemez 
--İSTİSNASI:--parent tabloda null değeri olmasa bile child tablo null değer kabul edebilir
--child tablodaki veri silinmeden paret tablodaki veri silinemez
--child tablo silinmeden parent tablo silinemez


--SORU 1: child tablosuna ted_verginosu 101 olan veri girişi yapınız
--(ilk olarak parent tabloya bakarız primary key değerinde 101 var mı ?varsa child'a veri girişi yapabiliriz)
insert into child values(101,2000,'Araba','Afra Çınar') 

--SORU 2: .child tablosuna ted_verginosu 105 olan veri girişi yapınız.
--(ilk olarak parent tabloya bakarız.primary key değerinde 105 var mı?varsa child'a veri girişi yapabiliriz,yoksa yapamayız)

--SORU 3: child tablosuna ted_vergino null olan veri girişi yapınız
--(child tablo null değer kabul edebilir)
insert into child values(null,4000,'Motor','Salim Çınar')

--SORU 4: .parent tablosundaki vergi_no 101 olan veriyi siliniz
--forign key ile tablolar biribirine bağlandığı için child tablodaki veri silinmeden parent tablodaki veri silinemez
delete from parent where vergi_no=101

--SORU 5: child tablosundaki ted_vergino 101 olan verileri siliniz
delete from child where ted_vergino=101;

--SORU 6: .parent tablosundaki vergi_no 101 olan veriyi siliniz
--(bunu yapmak mümkündür çünkü 5. soruda child tablodan ted_vergino=101 olan veriyi sildik)
delete from parent where vergi_no=101;
select * from parent

--SORU 7: .parent tablosunu siliniz.
(child tablo silinmeden parent tablo silinemez)

--SORU 8: child tablosunu siliniz
drop table child;

--SORU 9: .parent tablosunu siliniz
--(buu silmek artık mümkün çünkü child'ı 8.soruda sildik)
drop table parent 









