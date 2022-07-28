use kutuphane

--SELECT SORGULARI

--��renci tablosundaki t�m kay�tlar� listeleyin.

select * from ogrenci
 
 --��renci tablosundaki ��rencinin ad�n� ve soyad�n� ve s�n�f�n� listeleyin.
select ograd,ogrsoyad,sinif from ogrenci

--��renci tablosundaki cinsiyeti k�z (K) olan kay�tlar� listeleyiniz.

select * from ogrenci where cinsiyet='K'

--��renciler tablosundaki s�n�flar�n ad�n� listeleyiniz.(Not her s�n�f ad� birkez g�sterilsin.)

select distinct sinif from ogrenci
 
--��renci tablosundaki cinsiyeti K�z ve S�n�f� 10A olan ��rencileri listeleyiniz.

select * from ogrenci where cinsiyet='K' and sinif='10A'

 
--��renci tablosundaki 10A veya 10B s�n�f�ndaki ��rencilerin ad�n�, soyad�n� ve s�n�f�n� listeleyiniz.

select ograd, ogrsoyad, sinif from ogrenci 
where sinif='10A' or sinif='10B'

--��renci tablosundaki ��rencinin ad�n�, soyad�n� ve numaras�n� okul numaras� olarak listeleyiniz. (as kullan�m �rne�i)

select ograd,ogrsoyad,ogrno as 'okul numaras�' from ogrenci
 

--��renci tablosundaki ��rencinin ad�n� ve soyad�n� birle�tirip, adsoyad olarak listeleyiniz. (as kullan�m �rne�i)

select ograd+ogrsoyad as 'Ad Soyad' from ogrenci

 
--��renci tablosundaki Ad� �A� harfi ile ba�layan ��rencileri listeleyiniz.

select * from ogrenci where ograd like 'A%' 
 
--kitap tablosundaki sayfa say�s� 50 ile 200 aras�nda olan kitaplar�n ad�n� ve sayfa say�s�n� listeleyiniz.


select * from kitap where sayfasayisi between 50 and 200

--��renci tablosunda ad� Fidan, �smail ve Leyla olan ��rencileri listeleyiniz.
 
select * from ogrenci where ograd in ('Fidan','�smail','Leyla')
 
 --��renci tablosundaki ��rencilerden ad� A, D ve K ile ba�layan ��rencileri listeleyiniz.

select * from ogrenci where ograd like '[ADK]%'
 
--��renci tablosundaki s�n�f� 9A olan Erkekleri veya s�n�f� 9B olan k�zlar�n ad�n�, soyad�n�, s�n�f�n� ve cinsiyetini listeleyiniz.

select ograd,ogrsoyad,sinif,cinsiyet from ogrenci 
where (sinif='9A' and cinsiyet='E') or (sinif='9B' and cinsiyet='K')


 --S�n�f� 9A veya BB olan erkekleri listeleyiniz.


select ograd,ogrsoyad,sinif,cinsiyet from ogrenci 
where (sinif='9A' or sinif='9B') and cinsiyet='E'
 

--��renci tablosunda do�um y�l� 1989 olan ��rencileri listeleyiniz.(Not: veritaban�nda tarihler ay/g�n/y�l �eklinde sorgulan�r)

select * from ogrenci 
where dtarih between '01/01/1989' and '12/31/1989'
 
--��renci numaras� 30 ile 50 aras�nda olan K�z ��rencileri listeleyiniz.

select * from ogrenci 
where ogrno between 30 and 70 and cinsiyet = 'K'

--��rencileri ad�na g�re s�ralay�n�z.

select * from ogrenci order by ograd
 
 
--��rencileri ad�na, ad� ayn� olanlar�da soyadlar�na g�re s�ralay�n�z.

select * from ogrenci order by ograd,ogrsoyad
 
 --10A s�n�f�ndaki ��rencileri okul numaras�na g�re azalan olarak s�ralay�n�z.

select * from ogrenci where sinif='10A' order by ogrno desc
 
--��renciler tablosundaki ilk 10 kayd� listeleyiniz.

select top 10 * from ogrenci
 
 --��renciler tablosundaki ilk 10 kayd�n ad, soyad ve do�um tarihi bilgilerini listeleyiniz.

select top 10 ograd,ogrsoyad,dtarih from ogrenci
 
 --Sayfa say�s� en fazla olan kitab� listeleyiniz.

select top 1 * from kitap order by sayfasayisi desc
 
 --��renciler tablosundaki en gen� ��renciyi listeleyiniz.
 
select top 1 ograd,ogrsoyad,dtarih from ogrenci order by dtarih desc
 
--10A s�n�f�ndaki en ya�l� ��renciyi listeyin.

select top 1 ograd,ogrsoyad,dtarih from ogrenci 
where sinif='10A' order by dtarih
 
--�kinci harfi N olan kitaplar� listeleyiniz.
 
select * from kitap 
where kitapadi like '_n%'
 
 --��rencileri s�n�flar�na g�re gruplayarak listeleyin.

select * from ogrenci order by sinif
 
 --��rencileri her sorgulamada s�ralamas� farkl� olacak �ekilde  rastgele listeleyin.
 
select * from ogrenci order by newid()
 
 

-- Rastgele bir ��renci se�in


select top 1 * from ogrenci order by newid()
 
 -- 10A s�n�f�ndan rastgele bir ��rencinin ad�n�, soyad�n�, numaras�n� ve s�n�f�n� getirin.

select top 1 ogrno,ograd,ogrsoyad,sinif from ogrenci
where sinif= '10A' 
order by newid()
 
 

--INSERT INTO SORGULARI
--Yazar tablosunu KEMAL UYUMAZ isimli yazar� ekleyin.

insert into yazar(yazarad,yazarsoyad) values('Kemal','UYUMAZ')

-- Biyografi t�r�n� t�r tablosuna ekleyiniz.

insert into tur values('Biyografi')
 
-- 10A s�n�f� olan �A�LAR �Z�MC� isimli erkek,  s�n�f� 9B olan LEYLA ALAG�Z isimli k�z ve  s�n�f� 11C olan Ay�e Bekta� isimli k�z  ��rencileri tek sorguda ekleyin.

insert into ogrenci(ograd,ogrsoyad,sinif,cinsiyet)
values('�a�lar','�z�mc�','10A','E'),('Leyla','Alag�z','9B','K'),('Ay�e','Bekta�','11C','K')
 
--��renci tablosundaki rastgele bir ��renciyi yazarlar tablosuna yazar olarak ekleyiniz.
 
insert into yazar(yazarad, yazarsoyad) 
select top 1 ograd,ogrsoyad from ogrenci
order by newid()
 
 --��renci numaras� 10 ile 30 aras�ndaki ��rencileri yazar olarak ekleyiniz.

insert into yazar(yazarad, yazarsoyad) 
select ograd,ogrsoyad from ogrenci where ogrno between 10 and 30
 
 --Nurettin Belek isimli yazar� ekleyip yazar numaras�n� yazd�r�n�z.(Not: Otomatik artt�rmada son artt�r�lan de�er @@IDENTITY de�i�keni i�inde tutulur.)

insert into yazar(yazarad, yazarsoyad) 
values('Nurettin','Belek')
select @@IDENTITY
 
 

--UPDATE SORGULARI
--NOT:update sorgusunda dikkat edilmesi gereken en �nemli husus �art k�sm�d�r. �art yaz�lmazsa g�ncelleme i�lemine t�m kay�tlar dahil edilir.

 --10B s�n�f�ndaki ��renci numaras� 3 olan ��renciyi 10C s�n�f�na ge�irin.


update ogrenci set sinif='10C' where ogrno=3

--sorguyu g�r�nt�lemek i�in yaz�ld�
select * from ogrenci where ogrno=3
 
-- 9A s�n�f�ndaki t�m ��rencileri 10A s�n�f�na aktar�n


update ogrenci set sinif='10A' where sinif='9A'


--T�m ��rencilerin puan�n� 5 puan artt�r�n.


update ogrenci set puan=puan+5

--sorguyu g�r�nt�lemek i�in yaz�ld�
select * from ogrenci
 

--DELETE SORGULARI
--NOT : DELETE sorgusunda dikkat edilmesi gereken en �nemli husus �art k�sm�d�r. �art yaz�lmazsa silme i�lemine t�m kay�tlar dahil edilir.

--NOT : TRUNCATE TABLE komutu sorgu �rneklerinin sonunda verilecektir.(Tabloyu bo�altmak i�in kullan�l�r. TRUNCATE TABLE TABLOADI)

--25 numaral� yazar� silin.

--Not: veritaban� fk ayarlar�nda delete,update cascade ayarland��� i�in ili�kili tablolar� otomatik olarak g�ncellenecek.
delete from yazar where yazarno=25
 
-- B�RDEN �OK TABLODAN VER� �EKME (JOIN KULLANMADAN)
--��rencinin ad�n�, soyad�n� ve kitap ald��� tarihleri listeleyin.
select ograd,ogrsoyad,atarih from ogrenci,islem
where ogrenci.ogrno=islem.ogrno

--F�kra ve hikaye t�r�ndeki kitaplar�n ad�n�  ve t�r�n� listeleyin.
 
select kitap.kitapadi, tur.turadi from kitap,tur
where kitap.turno=tur.turno 
and tur.turadi in ('Hikaye','F�kra')
 
 --10B veya 10C s�n�f�ndaki ��rencilerin numaras�n�, ad�n�, soyad�n� ve okudu�u kitaplar� listeleyin.
 
select ogrenci.ogrno,ograd,ogrsoyad,kitapadi 
from ogrenci,islem,kitap
where (sinif='10B' or sinif='10C')
and ogrenci.ogrno=islem.ogrno
and islem.kitapno=kitap.kitapno
 
 --Roman t�r�ndeki kitaplar� okuyan ��rencilerin numaras�n�, ad�n�, soyad�n� ve okudu�u kitab�n ad�n� listeleyin
 
select distinct ogrenci.ogrno,ograd,ogrsoyad,kitapadi
from ogrenci,islem,kitap,tur
where ogrenci.ogrno=islem.ogrno
and islem.kitapno=kitap.kitapno
and kitap.turno=tur.turno
and tur.turadi='Roman'
 
 

--SQL JOIN ( INNER JOIN ) KULLANIMI
--��rencinin ad�n�, soyad�n� ve kitap ald��� tarihleri listeleyin.
 
select ograd,ogrsoyad,islem.atarih from ogrenci
join islem on islem.ogrno=ogrenci.ogrno
 
--F�kra ve hikaye t�r�ndeki kitaplar�n ad�n�  ve t�r�n� listeleyin.
 
select kitapadi,turadi from kitap
join tur on kitap.turno=tur.turno 
and tur.turadi in('Hikaye','F�kra')
 
--yada
 
select kitapadi,turadi from kitap
join tur on kitap.turno=tur.turno 
where tur.turadi in('Hikaye','F�kra')
 
 --10B veya 10C s�n�f�ndaki ��rencilerin numaras�n�, ad�n�, soyad�n� ve okudu�u kitaplar�, ��renci ad�na g�re  listeleyin.
select ogrenci.ogrno,ograd,ogrsoyad,sinif,kitapadi
from ogrenci
join islem on ogrenci.ogrno=islem.ogrno
join kitap on islem.kitapno=kitap.kitapno
where sinif='10B' or sinif='10C'
order by ogrenci.ograd
 
 

--SQL LEFT JOIN Kullan�m�
 --Kitap alan ��rencinin ad�, soyad�, kitap ald��� tarih listelensin. Kitap almayan ��rencilerinde listede g�r�ns�n.
select ograd,ogrsoyad,islem.islemno from ogrenci
left join islem on islem.ogrno=ogrenci.ogrno
 
 --Kitap almayan ��rencileri listeleyin.
 
select ograd,ogrsoyad,islem.atarih from ogrenci
left join islem on islem.ogrno=ogrenci.ogrno
where islem.atarih is null
 
 --Al�nan kitaplar�n kitap numaras�n�, ad�n� ve ka� defa al�nd���n� kitap numaralar�na g�re artan s�rada listeleyiniz.
 
select kitap.kitapno, kitap.kitapadi,count(*) from islem
left join kitap
on kitap.kitapno=islem.kitapno
group by kitap.kitapadi,kitap.kitapno
order by kitap.kitapno

--SQL LEFT JOIN ve RIGHT JOIN Kullan�m�
--Her ��rencinin ad�, soyad�, kitab�n ad�, yazar�n ad� soyad ve kitab�n t�r�n� ve kitab�n al�nd��� tarihi listeleyiniz.  Kitap almayan ��renciler de listede g�r�ns�n.

Select ograd,ogrsoyad yazarad,yazarsoyad,kitapadi,turadi from kitap 
join tur on tur.turno=kitap.turno
join yazar on kitap.turno=yazar.yazarno
join islem on kitap.kitapno=islem.kitapno
right join ogrenci on ogrenci.ogrno=islem.ogrno

--Her ��rencinin ad�, soyad�, kitab�n ad�, yazar�n ad� soyad ve kitab�n t�r�n� ve kitab�n al�nd��� tarihi listeleyiniz.  Kitap almayan ��renciler de listede g�r�ns�n.( Farkl� ��z�m)

Select ograd,ogrsoyad yazarad,yazarsoyad,kitapadi,turadi from islem 
join kitap on islem.kitapno=kitap.turno
right join ogrenci on ogrenci.ogrno=islem.ogrno
left join tur on kitap.turno=tur.turno
left join yazar on yazar.yazarno=kitap.yazarno 

--10A veya 10B s�n�f�ndaki ��rencilerin ad� soyad� ve okudu�u kitap say�s�n� getirin.

select sinif, ograd,ogrsoyad,count(islemno) from ogrenci
left join islem on islem.ogrno=ogrenci.ogrno
where sinif in ('10A','10B')
group by sinif,ograd,ogrsoyad
order by count(*)
 
--�� ��E SELECT SORGULARI
--En fazla sayfa say�l� kitab�n bilgilerini listeleyiniz.

--Y�ntem 1

select top 1 * from kitap order by sayfasayisi desc --1
 
--Y�ntem 2( �� i�e select ile)
 
select * from kitap where sayfasayisi in (select max(sayfasayisi) from kitap) --2
 
 
--Sayfa say�s� ortalama sayfa say�s�ndan fazla olan kitaplar� listeleyiniz.


select * from kitap where sayfasayisi >(select avg(sayfasayisi) from kitap)
 

--�� i�e select ile dram t�r�ndeki kitaplar� listeleyiniz.
 
select * from kitap where kitap.kitapno=(select (kitap.kitapno) from tur where turadi='dram')
 
--Ad� e harfi ile ba�layan yazarlar�n kitaplar�

select * from kitap where kitap.yazarno in (select yazar.yazarno from yazar where yazarad like 'e%')
 
 --�� i�e sorgu ile kitap okumayan ��rencileri listeleyiniz.
 
select * from ogrenci where ogrenci.ogrno not in ( select distinct islem.ogrno from islem)
 
--�� i�e select ile okunmayan kitaplar� listeleyiniz. 
select * from kitap where kitap.kitapno not in (select distinct islem.kitapno from islem)
 
-- May�s ay�nda okunmayan kitaplar� listeleyin.
 
select * from kitap where kitap.kitapno not in (select distinct islem.kitapno from islem where MONTH(islem.atarih)=5)
 
 

--SQL AVG Kullan�m�
--AVG fonksiyonu ortalama de�eri d�nd�r�r.

--T�m kitaplar�n ortalama sayfa say�s�n� bulunuz.
 
select avg(sayfasayisi) as [ortalama sayfa] from kitap
 

--Sayfa say�s� ortalama sayfan�n  �zerindeki kitaplar� listeleyin.

select kitapadi,sayfasayisi from kitap
where sayfasayisi>(select avg(sayfasayisi) from kitap)
 
--SQL COUNT Kullan�m�
--COUNT fonksiyonu , belirtilen �l��tlerle e�le�en sat�r say�s�n� d�nd�r�r.

--��renci tablosundaki ��renci say�s�n� g�sterin

select count(*) from ogrenci
 
--��renci tablosundaki toplam ��renci say�s�n� toplam say� takma(alias kullan�m�) ad� ile listeleyin.
 
select count(*) as ogrenciSayisi from ogrenci
 
--��renci tablosunda ka� farkl� isimde ��renci oldu�unu listeleyiniz.

select count(distinct ograd) from ogrenci
 
--SQL MAX Kullan�m�
--MAX fonksiyonu belirtilen �l��lerle e�le�en en y�ksek kay�t� getirir.

--En fazla sayfa say�s� olan kitab�n sayfa say�s�n� listeleyiniz.

select max(sayfasayisi) as 'En Fazla Sayfa' from kitap
 
--En fazla sayfas� olan kitab�n ad�n� ve sayfa say�s�n� listeleyiniz.

select kitapadi,sayfasayisi from kitap
where sayfasayisi= (select max(sayfasayisi) from kitap)
 
--SQL MIN Kullan�m�
--MIN fonksiyonu belirtilen �l��lerle e�le�en en y�ksek kay�t� getirir.

--En az sayfa say�s� olan kitab�n sayfa say�s�n� listeleyiniz.

select min(sayfasayisi) as 'En Fazla Sayfa' from kitap
 
--En az sayfas� olan kitab�n ad�n� ve sayfa say�s�n� listeleyiniz.
 
select kitapadi,sayfasayisi from kitap
where sayfasayisi= (select min(sayfasayisi) from kitap)
 
--Dram t�r�ndeki en fazla sayfas� olan kitab�n sayfa say�s�n� bulunuz.
 
select max(sayfasayisi) from kitap,tur 
where kitap.turno=tur.turno and tur.turadi='dram'
 
--numaras� 15 olan ��rencinin okudu�u toplam sayfa say�s�n� bulunuz.
select sum(sayfasayisi) from ogrenci,islem,kitap
where ogrenci.ogrno=islem.ogrno 
and islem.kitapno=kitap.kitapno
and ogrenci.ogrno=15
 

--SQL DATE / SQL DATEDIFF Kullan�m�
--DATEDIFF :Belirtilen tarihler aras�ndaki fark� hesaplamak i�in kullan�l�r. 

--GETDATE :�uan ki tarih ve zaman� getirir. MySqlde now() fonksiyonu kullan�l�r.

--��rencinin ad�n�, soyad�n� ve ya��n� listeleyin.
 
SELECT ograd, ogrsoyad,DATEDIFF(year,dtarih,GETDATE()) from ogrenci
 
--SQL GROUP BY Kullan�m�
--�sme g�re ��renci say�lar�n�n adedini bulunuz.(�rn: ali 5 tane, ahmet 8 tane )
 
select ograd,count(*) from ogrenci group by ograd
 
--Her s�n�ftaki ��renci say�s�n� bulunuz.
 
select sinif, count(*) from ogrenci group by sinif
 
--Her s�n�ftaki erkek ve k�z ��renci say�s�n� bulunuz.
 
select sinif, cinsiyet,count(*) from ogrenci group by cinsiyet,sinif
 
--Her ��rencinin ad�n�, soyad�n� ve okudu�u toplam sayfa say�s�n� b�y�kten k����e do�ru  listeleyiniz.

select ograd,ogrsoyad,sum(sayfasayisi) as sayfa from ogrenci,kitap,islem
where ogrenci.ogrno=islem.ogrno and kitap.kitapno=islem.kitapno
group by ograd,ogrsoyad,ogrenci.ogrno
order by sayfa
 
--Her ��rencinin okudu�u kitap say�s�n� getiriniz.
select ograd,ogrsoyad,count(*) as kitapsayisi from ogrenci,kitap,islem
where ogrenci.ogrno=islem.ogrno and kitap.kitapno=islem.kitapno
group by ograd,ogrsoyad,ogrenci.ogrno
order by kitapsayisi