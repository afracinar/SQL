create table ogrenciler10(
	id int,
	isim varchar(50),
	veli_isim varchar(50),
	yazili_notu int
);
insert into ogrenciler10 values(123,'Ali Can','Hasan',75);
insert into ogrenciler10 values(124,'Merve Gul','Ayse',85);
insert into ogrenciler10 values(125,'Kemal Yasa','Hasan',85);
insert into ogrenciler10 values(126,'Nesibe Yilmaz','Ayse',95);
insert into ogrenciler10 values(127,'Mustafa Bak','Can',99);
insert into ogrenciler10 values(127,'Mustafa Bak','Ali',99);

--ismi 'Mustafa Bak' ve 'Nesibe Yilmaz ' olam kayıtları silelim
delete from ogrenciler10 where isim='Mustafa Bak' or isim='Nesibe Yilmaz';
select * from ogrenciler10;

--veli ismi Ayse olan datayı silelim
delete from ogrenciler10 where veli_isim='Ayse';

delete from ogrenciler10; --tüm verileri siler

--DML--TRUNCATE
--TRUNCATE tabloda bütün verilerin tamamını siler,seçmeli silme yapılamaz ve geri alamayız
truncate table ogrenciler10;

--ON DELETE CASCADE
--bu komut sayesinde parent'taki silinen kayıt ile ilişkili olan tüm child kayıtlarını silebiliriz
--cascade komutu yoksa önce child sonra parent temizlenir
--FK olan satırın en sonuna ON DELETE CASCADE komutunu yazmak yeterli
--child'dan silersek parenttan silinmiyor ama parent'tan silersek ikisinden de siliniyor

--drop table if exists talebeler; --talebeler tablosu eğer varsa kaldır
create table talebeler(
	id char(3) primary key,
	isim varchar(50),
	veli_isim varchar(50),
	yazili_notu int
);
create table notlar1(
	talebe_id char(3),
	ders_adi varchar(30),
	yazili_notu int,
	constraint notlar_fk foreign key (talebe_id) references talebeler(id) on delete cascade
); --notlar1 tablosunu child yaptık.talebeler parent'tır çünkü primaty key dir
INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);

INSERT INTO notlar1 VALUES ('123','kimya',75);
INSERT INTO notlar1 VALUES ('124', 'fizik',65);
INSERT INTO notlar1 VALUES ('125', 'tarih',90);
INSERT INTO notlar1 VALUES ('126', 'Matematik',90);

select * from talebeler
select * from notlar1

--NOT=child tablodaki veriyi sildiğimizde sadece child'daki veri silinir,parent'taki veri silinmez
--NOT=parent'taki veriyi sildiğimiz zaman child'daki veri de silinmiş olur
--DELETE FROM talebeler diyince hem child hem parenttaki veriler silinir
--DELETE FROM notlar1 diyince sadece child'daki veriler siliniz

-- Notlar1 tablosundan talebe_id'si 123 olan datayı silelim
delete from notlar1 where talebe_id='123';

--talebeler tablosundan id'si 126 olan datayı silelim
delete from talebeler where id='126';

/*
    Her defasında önce child tablodaki verileri silmek yerine ON DELETE CASCADE silme özelliği ile
parent tablo dan da veri silebiliriz. Yanlız ON DELETE CASCADE komutu kullanımında parent tablodan
sildiğimiz data child tablo dan da silinir
*/







