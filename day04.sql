--Aliases kodu ile tablo yazdirilirken, field isimleri sadece o cikti icin degistirilebilir.
--ALIASES

CREATE TABLE calisanlar1  (
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50)
);
INSERT INTO calisanlar1 VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO calisanlar1 VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO calisanlar1 VALUES(345678901, 'Mine Bulut','Izmir');
select * from calisanlar1;

--eğer iki sütunun verilerini birleştirmek istersek || (concat) sembolu kullanılır
select calisan_id as id,calisan_isim || calisan_dogdugu_sehir AS calisan_bilgisi from calisanlar1; 
--as geçici olarak ismini değiştirmek için kullanılır

--2.YOLLL - || yerine virgül koyup birleştirmek istediğimiz sütun isimlerini concat parantezine koyarız
select calisan_id as id, concat(calisan_isim,calisan_dogdugu_sehir) AS calisan_bilgisi from calisanlar1;

--Aralarında boşluk olmasını iistiyorsak
select calisan_id as id,calisan_isim ||' '|| calisan_dogdugu_sehir AS calisan_bilgisi from calisanlar1; 

--IS NULL CONDITION - arama yapılan field'da null değeri almış kayıtları getirir
CREATE TABLE insanlar
(
ssn char(9),
name varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');  
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa'); 
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');

select * from insanlar

--Name sütununda null olan değerlei listeleyelim
select name from insanlar where name IS NULL

--ınsanlar tablosunda null sadece null olmayan değerleri listeleyiniz
select name from insanlar where name IS NOT NULL

--insanlar tablosunda null değer almış verileri no name olarak değiştiriniz
update insanlar
SET name='No Name'
Where name is null;

--ORDER BY--tablodaki verileri sıralamak için kullanılır.
--order by komutu belli bir field'a göre natural order olarak sıralama yapmak için kullanılır.
--order by komutu sadece select komutu ile kullanılır
/*
Tablolardaki verileri sıralamak için ORDER BY komutu kullanırız
Büyükten küçüğe yada küçükten büyüğe sıralama yapabiliriz
Default olarak küçükten büyüğe sıralama yapar (ASC-yazadabiliriz yazmayadabiliriz yine sıralama yapar)
Eğer BÜYÜKTEN KÜÇÜĞE sıralmak istersek ORDER BY komutundan sonra DESC komutunu kullanırız
*/
CREATE TABLE insanlar1
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar1 VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar1 VALUES(234567890, 'Veli','Cem', 'Ankara');  
INSERT INTO insanlar1 VALUES(345678901, 'Mine','Bulut', 'Ankara');  
INSERT INTO insanlar1 VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar1 VALUES (344678901, 'Mine','Yasa', 'Ankara');  
INSERT INTO insanlar1 VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

select * from insanlar1 
--insanlar tablosundaki dataları adrese göre sıralayınız.
select * from insanlar1 order by adres;

--insanlar tablosundaki ismi mine olanları ssn sırali olarak listeleyiniz
select * from insanlar1 where isim='Mine' order by ssn;

--NOT : Order By komutundan sonra field ismi yerine field numarasi da kullanilabilir
--Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin
select * from insanlar1 where soyisim='Bulut' order by 2; --isim 2. sırada olduğu için

--Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin
select * from insanlar1 order by ssn DESC --desc büyükten küçüğe doğru sıralar

-- Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin
select * from insanlar1 order by isim ASC, soyisim desc;

--LENGTH KOMUTU- eğer sütun uzunluğuna göre sıralamak istersek length komutunu kullanırız
--uzunluğu büyükten küçüğe doğru sıralamak istersek desc komutu ekleriz

--isim ve soyisim değerlerini soyisim kelime uzunluğuna göre sıralayınız
select isim,soyisim from insanlar1 order by length (soyisim);

--isim ve soyisim değerlerini soyisim kelime uzunluğuna göre tersten sıralayınız
select isim,soyisim from insanlar1 order by length (soyisim) desc;

--Tüm isim ve soyisim değerlerini aynı sutunda çağırarak herbir sütun değerini uzunluğuna göre sıralayınız
select isim ||' '|| soyisim AS isim_soyisim from insanlar1 order by length(isim ||soyisim)

--2.yol
select isim ||' '|| soyisim AS isim_soyisim from insanlar1 order by length(isim)+ length(soyisim)

--3.Yol
SELECT CONCAT(isim,' ',soyisim) AS isim_soyisim FROM insanlar1 ORDER BY LENGTH (concat(isim,soyisim))

--GROUP BY CLAUSE
/*
Group By komutu sonuçları bir veya daha fazla sütuna göre gruplamak için SELECT
komutuyla birlikte kullanılır.
*/
CREATE TABLE manav
(
isim varchar(50), 
Urun_adi varchar(50),  
Urun_miktar int
);
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( ‘Veli', 'Elma',2);  
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);  
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);  
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);  
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);  
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);  
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);  
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

SELECT * from manav;

--İsme gore alinan toplam urunleri bulun
select isim,sum(urun_miktar) AS alinan_toplam_urun from manav
group by isim;		

-- Isme gore alinan toplam urunleri bulun ve bu urunleri buyukten kucuge listeleyiniz
select isim,sum(urun_miktar) AS alinan_toplam_urun from manav
group by isim			 
order by alinan_toplam_urun desc						 

-- Urun ismine gore urunu alan toplam kisi sayisi
select * from manav
select urun_adi,count(isim) from manav	
group by urun_adi						 
					
--isme göre toplam aldığı miktarı gösteren kod						 
select isim,count(urun_adi) as aldigi_urun_miktari from manav	
group by isim			 
						 
