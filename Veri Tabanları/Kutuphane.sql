use kutuphane

--SELECT SORGULARI

--Öðrenci tablosundaki tüm kayýtlarý listeleyin.

select * from ogrenci
 
 --Öðrenci tablosundaki öðrencinin adýný ve soyadýný ve sýnýfýný listeleyin.
select ograd,ogrsoyad,sinif from ogrenci

--Öðrenci tablosundaki cinsiyeti kýz (K) olan kayýtlarý listeleyiniz.

select * from ogrenci where cinsiyet='K'

--Öðrenciler tablosundaki sýnýflarýn adýný listeleyiniz.(Not her sýnýf adý birkez gösterilsin.)

select distinct sinif from ogrenci
 
--Öðrenci tablosundaki cinsiyeti Kýz ve Sýnýfý 10A olan öðrencileri listeleyiniz.

select * from ogrenci where cinsiyet='K' and sinif='10A'

 
--Öðrenci tablosundaki 10A veya 10B sýnýfýndaki öðrencilerin adýný, soyadýný ve sýnýfýný listeleyiniz.

select ograd, ogrsoyad, sinif from ogrenci 
where sinif='10A' or sinif='10B'

--Öðrenci tablosundaki öðrencinin adýný, soyadýný ve numarasýný okul numarasý olarak listeleyiniz. (as kullaným örneði)

select ograd,ogrsoyad,ogrno as 'okul numarasý' from ogrenci
 

--Öðrenci tablosundaki öðrencinin adýný ve soyadýný birleþtirip, adsoyad olarak listeleyiniz. (as kullaným örneði)

select ograd+ogrsoyad as 'Ad Soyad' from ogrenci

 
--Öðrenci tablosundaki Adý ‘A’ harfi ile baþlayan öðrencileri listeleyiniz.

select * from ogrenci where ograd like 'A%' 
 
--kitap tablosundaki sayfa sayýsý 50 ile 200 arasýnda olan kitaplarýn adýný ve sayfa sayýsýný listeleyiniz.


select * from kitap where sayfasayisi between 50 and 200

--Öðrenci tablosunda adý Fidan, Ýsmail ve Leyla olan öðrencileri listeleyiniz.
 
select * from ogrenci where ograd in ('Fidan','Ýsmail','Leyla')
 
 --Öðrenci tablosundaki öðrencilerden adý A, D ve K ile baþlayan öðrencileri listeleyiniz.

select * from ogrenci where ograd like '[ADK]%'
 
--Öðrenci tablosundaki sýnýfý 9A olan Erkekleri veya sýnýfý 9B olan kýzlarýn adýný, soyadýný, sýnýfýný ve cinsiyetini listeleyiniz.

select ograd,ogrsoyad,sinif,cinsiyet from ogrenci 
where (sinif='9A' and cinsiyet='E') or (sinif='9B' and cinsiyet='K')


 --Sýnýfý 9A veya BB olan erkekleri listeleyiniz.


select ograd,ogrsoyad,sinif,cinsiyet from ogrenci 
where (sinif='9A' or sinif='9B') and cinsiyet='E'
 

--Öðrenci tablosunda doðum yýlý 1989 olan öðrencileri listeleyiniz.(Not: veritabanýnda tarihler ay/gün/yýl þeklinde sorgulanýr)

select * from ogrenci 
where dtarih between '01/01/1989' and '12/31/1989'
 
--Öðrenci numarasý 30 ile 50 arasýnda olan Kýz öðrencileri listeleyiniz.

select * from ogrenci 
where ogrno between 30 and 70 and cinsiyet = 'K'

--Öðrencileri adýna göre sýralayýnýz.

select * from ogrenci order by ograd
 
 
--Öðrencileri adýna, adý ayný olanlarýda soyadlarýna göre sýralayýnýz.

select * from ogrenci order by ograd,ogrsoyad
 
 --10A sýnýfýndaki öðrencileri okul numarasýna göre azalan olarak sýralayýnýz.

select * from ogrenci where sinif='10A' order by ogrno desc
 
--Öðrenciler tablosundaki ilk 10 kaydý listeleyiniz.

select top 10 * from ogrenci
 
 --Öðrenciler tablosundaki ilk 10 kaydýn ad, soyad ve doðum tarihi bilgilerini listeleyiniz.

select top 10 ograd,ogrsoyad,dtarih from ogrenci
 
 --Sayfa sayýsý en fazla olan kitabý listeleyiniz.

select top 1 * from kitap order by sayfasayisi desc
 
 --Öðrenciler tablosundaki en genç öðrenciyi listeleyiniz.
 
select top 1 ograd,ogrsoyad,dtarih from ogrenci order by dtarih desc
 
--10A sýnýfýndaki en yaþlý öðrenciyi listeyin.

select top 1 ograd,ogrsoyad,dtarih from ogrenci 
where sinif='10A' order by dtarih
 
--Ýkinci harfi N olan kitaplarý listeleyiniz.
 
select * from kitap 
where kitapadi like '_n%'
 
 --Öðrencileri sýnýflarýna göre gruplayarak listeleyin.

select * from ogrenci order by sinif
 
 --Öðrencileri her sorgulamada sýralamasý farklý olacak þekilde  rastgele listeleyin.
 
select * from ogrenci order by newid()
 
 

-- Rastgele bir öðrenci seçin


select top 1 * from ogrenci order by newid()
 
 -- 10A sýnýfýndan rastgele bir öðrencinin adýný, soyadýný, numarasýný ve sýnýfýný getirin.

select top 1 ogrno,ograd,ogrsoyad,sinif from ogrenci
where sinif= '10A' 
order by newid()
 
 

--INSERT INTO SORGULARI
--Yazar tablosunu KEMAL UYUMAZ isimli yazarý ekleyin.

insert into yazar(yazarad,yazarsoyad) values('Kemal','UYUMAZ')

-- Biyografi türünü tür tablosuna ekleyiniz.

insert into tur values('Biyografi')
 
-- 10A sýnýfý olan ÇAÐLAR ÜZÜMCÜ isimli erkek,  sýnýfý 9B olan LEYLA ALAGÖZ isimli kýz ve  sýnýfý 11C olan Ayþe Bektaþ isimli kýz  öðrencileri tek sorguda ekleyin.

insert into ogrenci(ograd,ogrsoyad,sinif,cinsiyet)
values('Çaðlar','Üzümcü','10A','E'),('Leyla','Alagöz','9B','K'),('Ayþe','Bektaþ','11C','K')
 
--Öðrenci tablosundaki rastgele bir öðrenciyi yazarlar tablosuna yazar olarak ekleyiniz.
 
insert into yazar(yazarad, yazarsoyad) 
select top 1 ograd,ogrsoyad from ogrenci
order by newid()
 
 --Öðrenci numarasý 10 ile 30 arasýndaki öðrencileri yazar olarak ekleyiniz.

insert into yazar(yazarad, yazarsoyad) 
select ograd,ogrsoyad from ogrenci where ogrno between 10 and 30
 
 --Nurettin Belek isimli yazarý ekleyip yazar numarasýný yazdýrýnýz.(Not: Otomatik arttýrmada son arttýrýlan deðer @@IDENTITY deðiþkeni içinde tutulur.)

insert into yazar(yazarad, yazarsoyad) 
values('Nurettin','Belek')
select @@IDENTITY
 
 

--UPDATE SORGULARI
--NOT:update sorgusunda dikkat edilmesi gereken en önemli husus þart kýsmýdýr. þart yazýlmazsa güncelleme iþlemine tüm kayýtlar dahil edilir.

 --10B sýnýfýndaki öðrenci numarasý 3 olan öðrenciyi 10C sýnýfýna geçirin.


update ogrenci set sinif='10C' where ogrno=3

--sorguyu görüntülemek için yazýldý
select * from ogrenci where ogrno=3
 
-- 9A sýnýfýndaki tüm öðrencileri 10A sýnýfýna aktarýn


update ogrenci set sinif='10A' where sinif='9A'


--Tüm öðrencilerin puanýný 5 puan arttýrýn.


update ogrenci set puan=puan+5

--sorguyu görüntülemek için yazýldý
select * from ogrenci
 

--DELETE SORGULARI
--NOT : DELETE sorgusunda dikkat edilmesi gereken en önemli husus þart kýsmýdýr. þart yazýlmazsa silme iþlemine tüm kayýtlar dahil edilir.

--NOT : TRUNCATE TABLE komutu sorgu örneklerinin sonunda verilecektir.(Tabloyu boþaltmak için kullanýlýr. TRUNCATE TABLE TABLOADI)

--25 numaralý yazarý silin.

--Not: veritabaný fk ayarlarýnda delete,update cascade ayarlandýðý için iliþkili tablolarý otomatik olarak güncellenecek.
delete from yazar where yazarno=25
 
-- BÝRDEN ÇOK TABLODAN VERÝ ÇEKME (JOIN KULLANMADAN)
--Öðrencinin adýný, soyadýný ve kitap aldýðý tarihleri listeleyin.
select ograd,ogrsoyad,atarih from ogrenci,islem
where ogrenci.ogrno=islem.ogrno

--Fýkra ve hikaye türündeki kitaplarýn adýný  ve türünü listeleyin.
 
select kitap.kitapadi, tur.turadi from kitap,tur
where kitap.turno=tur.turno 
and tur.turadi in ('Hikaye','Fýkra')
 
 --10B veya 10C sýnýfýndaki öðrencilerin numarasýný, adýný, soyadýný ve okuduðu kitaplarý listeleyin.
 
select ogrenci.ogrno,ograd,ogrsoyad,kitapadi 
from ogrenci,islem,kitap
where (sinif='10B' or sinif='10C')
and ogrenci.ogrno=islem.ogrno
and islem.kitapno=kitap.kitapno
 
 --Roman türündeki kitaplarý okuyan öðrencilerin numarasýný, adýný, soyadýný ve okuduðu kitabýn adýný listeleyin
 
select distinct ogrenci.ogrno,ograd,ogrsoyad,kitapadi
from ogrenci,islem,kitap,tur
where ogrenci.ogrno=islem.ogrno
and islem.kitapno=kitap.kitapno
and kitap.turno=tur.turno
and tur.turadi='Roman'
 
 

--SQL JOIN ( INNER JOIN ) KULLANIMI
--Öðrencinin adýný, soyadýný ve kitap aldýðý tarihleri listeleyin.
 
select ograd,ogrsoyad,islem.atarih from ogrenci
join islem on islem.ogrno=ogrenci.ogrno
 
--Fýkra ve hikaye türündeki kitaplarýn adýný  ve türünü listeleyin.
 
select kitapadi,turadi from kitap
join tur on kitap.turno=tur.turno 
and tur.turadi in('Hikaye','Fýkra')
 
--yada
 
select kitapadi,turadi from kitap
join tur on kitap.turno=tur.turno 
where tur.turadi in('Hikaye','Fýkra')
 
 --10B veya 10C sýnýfýndaki öðrencilerin numarasýný, adýný, soyadýný ve okuduðu kitaplarý, öðrenci adýna göre  listeleyin.
select ogrenci.ogrno,ograd,ogrsoyad,sinif,kitapadi
from ogrenci
join islem on ogrenci.ogrno=islem.ogrno
join kitap on islem.kitapno=kitap.kitapno
where sinif='10B' or sinif='10C'
order by ogrenci.ograd
 
 

--SQL LEFT JOIN Kullanýmý
 --Kitap alan öðrencinin adý, soyadý, kitap aldýðý tarih listelensin. Kitap almayan öðrencilerinde listede görünsün.
select ograd,ogrsoyad,islem.islemno from ogrenci
left join islem on islem.ogrno=ogrenci.ogrno
 
 --Kitap almayan öðrencileri listeleyin.
 
select ograd,ogrsoyad,islem.atarih from ogrenci
left join islem on islem.ogrno=ogrenci.ogrno
where islem.atarih is null
 
 --Alýnan kitaplarýn kitap numarasýný, adýný ve kaç defa alýndýðýný kitap numaralarýna göre artan sýrada listeleyiniz.
 
select kitap.kitapno, kitap.kitapadi,count(*) from islem
left join kitap
on kitap.kitapno=islem.kitapno
group by kitap.kitapadi,kitap.kitapno
order by kitap.kitapno

--SQL LEFT JOIN ve RIGHT JOIN Kullanýmý
--Her öðrencinin adý, soyadý, kitabýn adý, yazarýn adý soyad ve kitabýn türünü ve kitabýn alýndýðý tarihi listeleyiniz.  Kitap almayan öðrenciler de listede görünsün.

Select ograd,ogrsoyad yazarad,yazarsoyad,kitapadi,turadi from kitap 
join tur on tur.turno=kitap.turno
join yazar on kitap.turno=yazar.yazarno
join islem on kitap.kitapno=islem.kitapno
right join ogrenci on ogrenci.ogrno=islem.ogrno

--Her öðrencinin adý, soyadý, kitabýn adý, yazarýn adý soyad ve kitabýn türünü ve kitabýn alýndýðý tarihi listeleyiniz.  Kitap almayan öðrenciler de listede görünsün.( Farklý Çözüm)

Select ograd,ogrsoyad yazarad,yazarsoyad,kitapadi,turadi from islem 
join kitap on islem.kitapno=kitap.turno
right join ogrenci on ogrenci.ogrno=islem.ogrno
left join tur on kitap.turno=tur.turno
left join yazar on yazar.yazarno=kitap.yazarno 

--10A veya 10B sýnýfýndaki öðrencilerin adý soyadý ve okuduðu kitap sayýsýný getirin.

select sinif, ograd,ogrsoyad,count(islemno) from ogrenci
left join islem on islem.ogrno=ogrenci.ogrno
where sinif in ('10A','10B')
group by sinif,ograd,ogrsoyad
order by count(*)
 
--ÝÇ ÝÇE SELECT SORGULARI
--En fazla sayfa sayýlý kitabýn bilgilerini listeleyiniz.

--Yöntem 1

select top 1 * from kitap order by sayfasayisi desc --1
 
--Yöntem 2( Ýç içe select ile)
 
select * from kitap where sayfasayisi in (select max(sayfasayisi) from kitap) --2
 
 
--Sayfa sayýsý ortalama sayfa sayýsýndan fazla olan kitaplarý listeleyiniz.


select * from kitap where sayfasayisi >(select avg(sayfasayisi) from kitap)
 

--Ýç içe select ile dram türündeki kitaplarý listeleyiniz.
 
select * from kitap where kitap.kitapno=(select (kitap.kitapno) from tur where turadi='dram')
 
--Adý e harfi ile baþlayan yazarlarýn kitaplarý

select * from kitap where kitap.yazarno in (select yazar.yazarno from yazar where yazarad like 'e%')
 
 --Ýç içe sorgu ile kitap okumayan öðrencileri listeleyiniz.
 
select * from ogrenci where ogrenci.ogrno not in ( select distinct islem.ogrno from islem)
 
--Ýç içe select ile okunmayan kitaplarý listeleyiniz. 
select * from kitap where kitap.kitapno not in (select distinct islem.kitapno from islem)
 
-- Mayýs ayýnda okunmayan kitaplarý listeleyin.
 
select * from kitap where kitap.kitapno not in (select distinct islem.kitapno from islem where MONTH(islem.atarih)=5)
 
 

--SQL AVG Kullanýmý
--AVG fonksiyonu ortalama deðeri döndürür.

--Tüm kitaplarýn ortalama sayfa sayýsýný bulunuz.
 
select avg(sayfasayisi) as [ortalama sayfa] from kitap
 

--Sayfa sayýsý ortalama sayfanýn  üzerindeki kitaplarý listeleyin.

select kitapadi,sayfasayisi from kitap
where sayfasayisi>(select avg(sayfasayisi) from kitap)
 
--SQL COUNT Kullanýmý
--COUNT fonksiyonu , belirtilen ölçütlerle eþleþen satýr sayýsýný döndürür.

--Öðrenci tablosundaki öðrenci sayýsýný gösterin

select count(*) from ogrenci
 
--Öðrenci tablosundaki toplam öðrenci sayýsýný toplam sayý takma(alias kullanýmý) adý ile listeleyin.
 
select count(*) as ogrenciSayisi from ogrenci
 
--Öðrenci tablosunda kaç farklý isimde öðrenci olduðunu listeleyiniz.

select count(distinct ograd) from ogrenci
 
--SQL MAX Kullanýmý
--MAX fonksiyonu belirtilen ölçülerle eþleþen en yüksek kayýtý getirir.

--En fazla sayfa sayýsý olan kitabýn sayfa sayýsýný listeleyiniz.

select max(sayfasayisi) as 'En Fazla Sayfa' from kitap
 
--En fazla sayfasý olan kitabýn adýný ve sayfa sayýsýný listeleyiniz.

select kitapadi,sayfasayisi from kitap
where sayfasayisi= (select max(sayfasayisi) from kitap)
 
--SQL MIN Kullanýmý
--MIN fonksiyonu belirtilen ölçülerle eþleþen en yüksek kayýtý getirir.

--En az sayfa sayýsý olan kitabýn sayfa sayýsýný listeleyiniz.

select min(sayfasayisi) as 'En Fazla Sayfa' from kitap
 
--En az sayfasý olan kitabýn adýný ve sayfa sayýsýný listeleyiniz.
 
select kitapadi,sayfasayisi from kitap
where sayfasayisi= (select min(sayfasayisi) from kitap)
 
--Dram türündeki en fazla sayfasý olan kitabýn sayfa sayýsýný bulunuz.
 
select max(sayfasayisi) from kitap,tur 
where kitap.turno=tur.turno and tur.turadi='dram'
 
--numarasý 15 olan öðrencinin okuduðu toplam sayfa sayýsýný bulunuz.
select sum(sayfasayisi) from ogrenci,islem,kitap
where ogrenci.ogrno=islem.ogrno 
and islem.kitapno=kitap.kitapno
and ogrenci.ogrno=15
 

--SQL DATE / SQL DATEDIFF Kullanýmý
--DATEDIFF :Belirtilen tarihler arasýndaki farký hesaplamak için kullanýlýr. 

--GETDATE :Þuan ki tarih ve zamaný getirir. MySqlde now() fonksiyonu kullanýlýr.

--Öðrencinin adýný, soyadýný ve yaþýný listeleyin.
 
SELECT ograd, ogrsoyad,DATEDIFF(year,dtarih,GETDATE()) from ogrenci
 
--SQL GROUP BY Kullanýmý
--Ýsme göre öðrenci sayýlarýnýn adedini bulunuz.(Örn: ali 5 tane, ahmet 8 tane )
 
select ograd,count(*) from ogrenci group by ograd
 
--Her sýnýftaki öðrenci sayýsýný bulunuz.
 
select sinif, count(*) from ogrenci group by sinif
 
--Her sýnýftaki erkek ve kýz öðrenci sayýsýný bulunuz.
 
select sinif, cinsiyet,count(*) from ogrenci group by cinsiyet,sinif
 
--Her öðrencinin adýný, soyadýný ve okuduðu toplam sayfa sayýsýný büyükten küçüðe doðru  listeleyiniz.

select ograd,ogrsoyad,sum(sayfasayisi) as sayfa from ogrenci,kitap,islem
where ogrenci.ogrno=islem.ogrno and kitap.kitapno=islem.kitapno
group by ograd,ogrsoyad,ogrenci.ogrno
order by sayfa
 
--Her öðrencinin okuduðu kitap sayýsýný getiriniz.
select ograd,ogrsoyad,count(*) as kitapsayisi from ogrenci,kitap,islem
where ogrenci.ogrno=islem.ogrno and kitap.kitapno=islem.kitapno
group by ograd,ogrsoyad,ogrenci.ogrno
order by kitapsayisi