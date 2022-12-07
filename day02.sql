CREATE TABLE ogrenciler2
(
ogrenci_no char(7), --uzunluğu belli olan stringler için kullanılır
isim varchar(20), --uzunluğunu bilmediğimiz stringler riçin varchar kullanılır
soyisim varchar(25),
not_ort real,  
kayit_tarih date
);

--Var olan tablodan yeni bir tablo oluşturma
create table NOTLAR
AS
Select isim,not_ort from ogrenciler2

Select * from notlar; --notlar tablosundan her şeyi getir

--INSER--TABLO İÇİNE VERİ EKLEME
insert into notlar values('Salim',95.7); --ekranda görebilmek için tekrar select * from notlar; kısmını çalıştımak yeterli
insert into notlar values('Sevgi',65.1);
insert into notlar values('Zeki',67.7);

create table talebeler(
isim varchar (10),
notlar real	
);
insert into talebeler values('Salim',95.7); 
insert into talebeler values('Sevgi',65.1);
insert into talebeler values('Zeki',67.7);

select isim from notlar;

--CONSTRAINT (kısıtlama)
--UNIQUE-bir sütundaki değerlerin benzersiz/tekrarsız/tek olmasını sağlar
CREATE TABLE ogrenciler3
(
ogrenci_no char(7) unique, --hangi field'ın benzersiz olmaısnı istiyorsak onun yanına yazarız
isim varchar(20)not null, --bir sütunun null içermemsini yani boş olmamasını sağlar.not null constrait olarak verilmez
soyisim varchar(25),
not_ort real,  
kayit_tarih date
);
select * from ogrenciler3; --ogrenciler3 tablosundaki her şeyi getir

insert into ogrenciler3 values('1234567','Afra','Çınar',75.5,now());
insert into ogrenciler3 values('1234568','Ali','Veli',75.5,now());
--parçalı veri ekleme
insert into ogrenciler3 (ogrenci_no,soyisim,not_ort) values ('1234569','Evren',85.5);--not null kısıtlaması olduğu için bu veri eklenemez

--PRIMARY KEY OLUŞTURMA
--primary key benzersizdir.bir veya birden fazla field'ın kombinasyonudur.bir tabloda en fazla 1 tane primary key olabilir.
--primary key field'ında hiçbir data null olamaz
--primary key-bir sütunun null içermemesini ve sütundaki verilerin benzersiz olmasını sağlar=not null+unique
CREATE TABLE ogrenciler4
(
ogrenci_no char(7) PRIMARY KEY, 
isim varchar(20),
soyisim varchar(25),
not_ort real,  
kayit_tarih date
);

--PRIMARY KEY ATAMASI 2.YOLL
--Eğer constraint ismini kendimiz vermek istersek bu yolu kullanırız
CREATE TABLE ogrenciler5
(
ogrenci_no char(7), 
isim varchar(20),
soyisim varchar(25),
not_ort real,  
kayit_tarih date,
CONSTRAINT ogr PRIMARY KEY(ogrenci_no);

--FOREIGN KEY
	--foreign key child'dır.primary key parent
	--iki tablo arasında relation oluşturmak için kullanılır.
	--foreign key başka bir tablonun primary key'ine bağlıdır
	--foreign key'in olduğu tablo child table diye adlandırılır.
	--bir tabloda birden fazla foreign key olabilir
	--foreign key null değeri alabilir 
	--parent table da olmayan id ile child'a ekleme yapamayız
--PRACTİCE
	/*
	“tedarikciler3” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”, “iletisim_isim” field’lari olsun ve “tedarikci_id” yi Primary Key yapin.
“urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun ve
“tedarikci_id” yi Foreign Key yapin.
	*/
create table tedarikciler3(
	tedarikci_id char(5) primary key,
	tedarikci_ismi varchar(20),
	iletisim_isim varchar(20)
);
	
create table urunler(
	tedarikci_id char(5),
	urun_id char(5),
	FOREIGN KEY (tedarikci_id) references tedarikciler3(tedarikci_id)
);
	select * from urunler;
	select * from tedarikciler3; --çağırdığımızda [PK] diye primary key olan sütunu gösterir
	
--PRACTİCE
	/*calisanlar” isimli bir Tablo olusturun. Icinde “id”, 
	“isim”, “maas”, “ise_baslama” field’lari olsun.
	“id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın.
“adresler” isminde baska bir tablo olusturun.
	Icinde “adres_id”, “sokak”, “cadde” ve “sehir” fieldlari olsun. “adres_id” field‘i ile Foreign Key oluşturun.
	*/
create table calisanlar(
	id varchar(15) primary key,
	isim varchar(30) UNIQUE,
	maas int NOT NULL,
	ise_baslama date
);
create table adresler(
	adres_id varchar(30),
	sokak varchar(30),
	cadde varchar(30),
	sehir varchar(30),
foreign key (adres_id) references calisanlar(id)
	);
	
INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010','Mehmet Yılmaz', 5000, '2018-04-14'); --unique constrait olduğu için bunu kabul etmez,eklemez
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); --maaş not null constrait olduğu için eklemez,kabul etmez
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); --isim not null olduğu için eklemez
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');--syntax hatası yani int olarak belirttiğimiz bir field'a string atayamayız
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14'); --primary key yani not null olamk zorunda
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); --primary key yani unique olmak zorunda
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14'); --primary key not null olmak zorunda

INSERT INTO adresler values('10003','Mutlu Sok','40.Cad','IST');
INSERT INTO adresler values('10003','Can Sok','50.Cad','Ankara');
INSERT INTO adresler values('10002','Ağa Sok','30.Cad','İzmir');
	
--parent table'da(primary key atadığımız tablo) olmayan id ile child'a ekleme yapamayız
INSERT INTO adresler values('10012','Ağa Sok','30.Cad','İzmir'); --calisanlar tablosunda '10012' id si olmadığı için ekleme yapmaz

--FK'ye null değer atanabilir
INSERT INTO adresler values(null,'Can Sok','50.Cad','Antep');
INSERT INTO adresler values(null,'Ağa Sok','30.Cad','Maraş');	
	
Select * from calisanlar;
select * from adresler;
	
--CHECK CONSTRAİNT
	--check ile bir alana girilebilecek veriler sınırlandırılabilir.
	--mesela yaş değeri,nüfus değeri için negatif değer girilmesini engelleyebiliriz.Değerleri dınırlandırabiliriz
	
create table sehirler2(
	alan_kodu int  primary key,
	isim varchar (20) not null,
	nufus int check(nufus>0)
);	
INSERT INTO sehirler2 values(12345,'İstanbul',-5);	--hata verir ekleme yapmaz çünkü nufus'u negatif girdik
INSERT INTO sehirler2 values(12345,'İstanbul',2000); --ekleme yapar çünkü değer pozitif
	
--DQL-- WHERE KULLANIMI
select * from calisanlar; --calisanlar tablosundaki her şeyi getirdi
select isim from calisanlar; --calisanlar tablosundaki isimleri getirdi

-- calisanlar tablosundan maaşı 5000 den büyük olan isimleri listeleyiniz
select isim from calisanlar where maas>5000;	
select isim,maas from calisanlar where maas>5000;--calisanlar tablosundan maaşı 5000'den çok olanların isim ve maaşını getirir
	
-- calisanlar tablosundan ismi veli han olan tüm verileri listeleyin
select * from calisanlar where isim='Veli Han';	
	
-- calisanlar tablosundan maaşı 5000 olan tüm isimleri listeleyiniz	
select * from calisanlar where maas=5000;	
	
--DML-- DELETE KOMUTU
delete from calisanlar; --eğer parent table başka bir child table ile ilişkiliyse önce child table silinmelidir.
delete from adresler; --adresler tablosunun içindeki bütün veriler silinir
	
--adresler tablsoundan şehri antep olan verileri sil	
delete from adresler where sehir='Antep'; 
	select * from adresler;



