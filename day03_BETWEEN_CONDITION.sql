--BETWEEN CONDITION
--iki mantıksal ifade ile tanımlayabileceiğimiz durumları tek komutla yazabilme imkanı veerir
--yazdığımız 2 sınırda aralığa dahildir(inclusive) 

---- Musteriler tablosundan urun_id'si 20 ile 40 arasında olan tüm verileri listeleyiniz
select * from musteriler where urun_id>=20 and urun_id<=40

--between ile yapımı
select * from musteriler where urun_id between 20 and 40

--NOT BETWEEN 
--aralığın dışındakileri verir



