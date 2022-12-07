--ÖDEV
---Her iki ayda ortak satilmayan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız

--Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz
select marka_id,calisan_sayisi from markalar
where marka_isim IN (select isyeri from calisanlar2 where sehir='Ankara');
select * from markalar
select * from calisanlar2

