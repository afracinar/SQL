--Database oluşturma
--Create database afra;
Create database cinar;

--DDL -Data Definition Language
--CREATE -Data Tablo Oluşturma
CREATE TABLE ogrenciler
(
ogrenci_no char(7), --uzunluğunu bildiğimiz stringler için char kullanılır
isim varchar(20), --uzunluğunu bilmediğimiz stringler için varchar kullanılır
soyisim varchar(25),
not_ort real,  --real ondalıklı sayılar için kullanılır yani double gibi
kayit_tarih date
)

--Var olan tablodan yeni tablo oluşturma:
Create Table ogrenci_notlari
AS
SELECT isim,soyisim,not_ort FROM ogrenciler;

--DML -Data Manipulation Language
--INSERT - (Database'e veri ekleme) Tüm fieldlara data ekleme
Insert Into ogrenciler VALUES ('1234567','Afra','Çınar',85.5,now());
Insert Into ogrenciler VALUES ('1234567','Afra','Çınar',85.5,'2022-05-14');

--INSERT - (Database'e veri ekleme) Bazı fieldlara data ekleme
Insert Into ogrenciler(isim,soyisim) VALUES ('Taha','Çınar');

--DQL -Data Query Language
--SELECT
select * from ogrenciler; --ogrenciler tablosundan herşeyi seç_* herşey anlamındadır


