--SUBQUERİES
--başka bir sorugunun içinde çalışan sorgudur
--where'den sonra kullanılabilir

CREATE TABLE calisanlar2 
(
id int, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
isyeri VARCHAR(20)
);
INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

CREATE TABLE markalar
(
marka_id int, 
marka_isim VARCHAR(20), 
calisan_sayisi int
);
INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);
INSERT INTO markalar VALUES(104, 'Nike', 19000);
select * from calisanlar2
select * from markalar

-- Çalisan sayisi 15.000’den cok olan markalarin isimlerini 
--ve bu markada calisanlarin isimlerini ve maaşlarini listeleyin.

select isim,maas,isyeri from calisanlar2
where isyeri IN (SELECT marka_isim from markalar where calisan_sayisi>15000)
--ın den sonra alt sorguya geçtiğimiz için parantez açıyoruz

-- marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve şehirlerini listeleyiniz
select isim,maas,sehir from calisanlar2
where isyeri in(select marka_ismi from markalar where marka_id>101)

--ankara'da calisanı olan markaların marka_id lerini ve calisan sayılarını listeleyiniz
select marka_id,calisan_sayisi from markalar
where marka_isim in(select isyeri from calisanlar2 where sehir='Ankara')

--AGGREGATE METOT KULLANIMI
--aggregate metotları(sum,count,min,max,avg) subquery içinde kullanılabilir
--avg= ortalama almak için kullanılır
--ancak sorgu tek bir değer döndürüyor olmalıdır
syntax:sum() şeklinde yazılmalıdır.ara boşluk olmamalıdır

--calisanlar2 tablosundan en yüksek maaşı listeleyelim
select max(maas) AS maximum_maas from calisanlar2
/*
eğer bir sütunda geçici olarak bir isim vermek istersek AS komutunu yazdıktan sonra vermek istediğiniz ismi yazınız
*/
--calisanlar2 tablosundan en az maaşı listeleyelim
select min(maas) AS minimum_maas from calisanlar2

--calisanlar2 tablosundaki maaşların toplamını listeleyiniz
select sum(maas) from calisanlar2

--calisanlar2 tablosundaki mmaşların ortalamasını listeeleyiniz
select avg(maas) from calisanlar2
select round(avg(maas)) from calisanlar2 --burada ondalıktaki küsüratı sildik

--calisanlar2 tablsoundaki maas'ların sayısını listeleyiniz
--COUNT - saydırma 
select count(maas) from calisanlar2 --sadece maaşları sayar
select count(*) from calisanlar2 --tablodaki tüm satırları sayar

/*
Eğer count(*) kullanırsak tablodaki tüm satırların sayısını verir
Eğer count(sütun_adi) sütun adı kullanırsak o sütundaki sayıları verir
*/

--Aggregate methodlarda subquery
--Her markanın id'sini,ismini ve toplam kaç şehirde bululnduğunu listeleyen bir sorgu yazını z
SELECT marka_id,marka_isim,
(select count(sehir) from calisanlar2 where marka_isim=isyeri) 
from markalar

--Her markanın ismini,calisan sayisini ve o markaya ait calisanların toplam maaslarını listeleyiniz
select marka_isim,calisan_sayisi ,
(select sum(maas) from calisanlar2 where marka_isim=isyeri) as toplam_maas
from markalar

--Her markanın ismini,calisan sayisini ve o markaya ait calisanların max ve min
--maaslarını listeleyen bir sorgu yazınız
select marka_isim,calisan_sayisi,
(Select max(maas) from calisanlar2 where marka_isim=isyeri) as enyuksekmaas,
(select min(maas) from calisanlar2 where marka_isim=isyeri) as endusukmaas
from markalar

--VİEW KULLANIMI
/*
view yaptığımız sorguları hafızaya alır ve tekrar bizden istenen sorgulama yerine 
view atadığımız ismi SELECT komutuyla çağırırız
*/
CREATE VIEW maxminmaas
AS
select marka_isim,calisan_sayisi,
(Select max(maas) from calisanlar2 where marka_isim=isyeri) as enyuksekmaas,
(select min(maas) from calisanlar2 where marka_isim=isyeri) as endusukmaas
from markalar

select * from maxminmaas;
