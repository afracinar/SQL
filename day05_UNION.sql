--UNION
CREATE TABLE personel2
(
id int,
isim varchar(50),  
sehir varchar(50), 
maas int,  
sirket varchar(20),
CONSTRAINT personel_pk PRIMARY KEY (id)
	);
INSERT INTO personel2 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel2 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel2 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel2 VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel2 VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel2 VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel2 VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
	
CREATE TABLE personel_bilgi  (
id int,
tel char(10) UNIQUE ,  
cocuk_sayisi int,
CONSTRAINT personel_bilgi_fk FOREIGN KEY (id) REFERENCES personel2(id)
);
INSERT INTO personel_bilgi VALUES(123456789, '5302345678', 5);  
INSERT INTO personel_bilgi VALUES(234567890, '5422345678', 4);
INSERT INTO personel_bilgi VALUES(345678901, '5354561245', 3);
INSERT INTO personel_bilgi VALUES(456789012, '5411452659', 3);
INSERT INTO personel_bilgi VALUES(567890123, '5551253698', 2);
INSERT INTO personel_bilgi VALUES(456789012, '5524578574', 2);
INSERT INTO personel_bilgi VALUES(123456710, '5537488585', 1);

select * from personel2
select * from personel_bilgi

--SORU 1:id’si 123456789 olan personelin Personel2 tablosundan sehir ve maasini, 
-- personel_bilgi  tablosundan da tel ve cocuk sayisini yazdirin
--(iki sorguyu birleştireceiğimiz için union kullandık)
select sehir as sehir_ve_tel,maas as maas_ve_cocuksayisi from personel2 where id=123456789
union
select tel,cocuk_sayisi from personel_bilgi where id=123456789

/*UNION islemi 2 veya daha cok SELECT isleminin sonuc KUMELERINI birlestirmek icin kullanilir, 
Ayni kayit birden fazla olursa, sadece bir tanesini alir. 
*/

--UNION ALL
--UNION ALL ise tekrarli elemanlari, tekrar sayisinca yazar.
--Union all'da da her 2 query'den elde edeceğiniz tabloların sütun sayıları eşit olmalı,alt alta gelecek
--sütunların data type'ları aynı olmalıdır

--Soru: Personel tablosunda maaşı 5000'den az olan tüm isimleri ve maaşları bulunuz
select isim,maas from personel2 where maas<5000
union all
select isim,maas from personel2 where maas<5000

--NOOTTT
--Union tekrarlı verileri teke düşürür,bize o şekilde sonuç verir
--Unionn all ise tekrarlı verilerle birlikte tüm sorguları getirir

--Soru:Tabloda personel maaşı 4000'den çok olan tüm şehir ve maaşları yazdırınız
select sehir,maas from personel2 where maas>4000


--Soru: Tabloda personel maaşı 5000'den az olan tüm isim ve maasları yazdırınız
select isim,maas from personel2 where maas<5000

--Soru:Yukarıdaki 2 sorguyu union ile birleştirin
select sehir,maas from personel2 where maas>4000
union 
select isim,maas from personel2 where maas<5000

--Union all ile birleştirin
select sehir,maas from personel2 where maas>4000
union all
select isim,maas from personel2 where maas<5000

--INTERSECT (kesişimm)
/*
Farklı iki tablodaki ortak verileri INTERSECT komutu ile getirebiliriz
*/
--SORU:personel2 tablosundan istanbul veya ankara da çalışanların id'lerini yazınız
--Personel_bilgi tablosundan 2 veya 3 çocuğu olanların id'lerini yazdırınız

select id from personel2 where sehir in('Istanbul','Ankara')
INTERSECT
select id from personel_bilgi where cocuk_sayisi in(2,3)

--Soru: Maaşı 4800'den az olanları veya 5000'den çok olanların id'lerini listeleyiniz
--Personel_bilgi tablosundan 2 veya 3 çocuğu olanların id'lerini listeleyiniz
select id from personel where maas not between 4800 and 5000
INTERSECT
select id from personel_bilgi where cocuk_sayisi IN(2,3)

--Sour: Honda,Tofas,Ford 'ta çalışan ortak isim de personel varsa listeleyiniz
select isim from personel where sirket='Tofas'
Intersect
select isim from personel where sirket='Ford'
Intersect
select isim from personel where sirket='Honda'

--EXCEPT(harici)
--İki sorgulamada harici bir sorgulama istenirse EXCEPT komutu kullanılır
--Soru:5000'den az maaş alıp Honda'da çalışmayanları yazdırınız
select isim from personel2 where maas<5000
EXCEPT
select isim from personel2 where sirket='Honda'









