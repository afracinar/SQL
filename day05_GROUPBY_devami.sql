--GROUP BY DEVAMI

CREATE TABLE personel
(
id int,
isim varchar(50),  sehir varchar(50),  maas int,  
sirket varchar(20)
);

INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

select * from personel

--Soru 1:İsme göre toplam maaşları bulunuz
select isim,sum(maas) from personel
group by isim

--SORU 2:personel tablosundaki isimleri gruplayınız
select isim from personel 
group by isim

--SORU 3:personel tablosundaki isimleri şehir sayısına göre gruplayınız
select isim count(sehir)from personel 
group by isim

--SORU 4:şehre göre personel sayısını bulun
select sehir,count(isim) as calisan_sayisi from personel
group by sehir

--SORU 5:şirketlere göre maaşı 5000 den faza olan personel sayısını bulunuz
select sirket,count(*) from personel
where maas>5000
group by sirket

--HAVING CLAUSE KULLANIMI
/*
having komutu yalnızca group by komutu ile birlikte kullanılır
eğer grouplamadan sonra bir şart varsa having kullanılır
where ile aynı mantıkta çalışır
*/

--SORU 1: her şirketin min maaslarını eğer 4000'den büyükse göster
select sirket,min(maas) as en_dusuk_maas from personel
group by sirket
having min(maas)>4000

--SORU 2:Aynı isimdeki kişilerin aldığı toplam maaş 10000 den faazla ise isim ve toplam maaşı gösteren sorgu yazınız
select isim,sum(maas) from personel
group by isim
having sum(maas)>10000

--SORU 3:Eğer bir şehirde çalışan personel sayısı 1'den çoksa sehir ismi ve personel sayısını veren sordu yazın
select sehir,count(isim) from personel
group by sehir
having count(isim)>1

--SORU 4:Eğer bir şehirde alınan max maas 5000 den düşükse sehir ismini va max maaşı veren sorgu yazınız
select sehir,max(maas) from personel
group by sehir
having max(maas)<5000

--UNION OPERATOR
--İki farklı sorgulamanın sonucunu birleştiren işlemdir.
--Seçilen field sayısı ve data type'ı aynı olmalıdır

--SORU 1: Maasi 4000’den cok olan isci isimlerini ve 5000 liradan fazla maas alinan
-- sehirleri gosteren sorguyu yaziniz
select isim,maas from personel
WHERE maas>4000
UNION
select sehir,maas from personel
where maas>5000

--SORU 2) Mehmet Ozturk ismindeki kisilerin aldigi maaslari ve Istanbul’daki personelin maaslarini
-- bir tabloda gosteren sorgu yaziniz

select isim,maas from personel
where isim='Mehmet Ozturk'
union
select sehir,maas from personel
where sehir='Istanbul'
order by maas --maasa göre küçükten büyüğe sıraladı


