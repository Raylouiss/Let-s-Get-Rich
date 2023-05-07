/* Deklarasi Fakta Lokasi */
/* namaLokasi(X,Y) artinya lokasi X pada peta memiliki nama Y */
namaLokasi(a1, 'Jakarta').
namaLokasi(a2, 'Kuala Lumpur').
namaLokasi(a3, 'Manila').
namaLokasi(b1, 'Bangkok').
namaLokasi(b2, 'Hanoi').
namaLokasi(b3, 'Singapura').
namaLokasi(c1, 'Beijing').
namaLokasi(c2, 'Seoul').
namaLokasi(c3, 'Tokyo').
namaLokasi(d1, 'Taiwan'). 
namaLokasi(d2, 'Hongkong'). 
namaLokasi(d3, 'Pyongyang'). 
namaLokasi(e1, 'Ottawa'). 
namaLokasi(e2, 'New York'). 
namaLokasi(e3, 'Buenos Aires'). 
namaLokasi(f1, 'Cape Town'). 
namaLokasi(f2, 'Port Louis'). 
namaLokasi(f3, 'Cairo'). 
namaLokasi(g1, 'Berlin'). 
namaLokasi(g2, 'Paris'). 
namaLokasi(g3, 'London'). 
namaLokasi(h1, 'Sydney'). 
namaLokasi(h2, 'Melbourne'). 
namaLokasi(cc, 'Chance Card').
namaLokasi(tx, 'Tax').
namaLokasi(jl, 'Jail'). 
namaLokasi(fp, 'Free Parking'). 
namaLokasi(wt, 'World Tour'). 
namaLokasi(go, 'GO').
namaLokasi(cf, 'Coin Flip').

/* deskripsiLokasi(X,Y) artinya lokasi X pada peta memiliki deskripsi Y */
deskripsiLokasi(a1, 'Jakarta adalah ibukota whichis.').
deskripsiLokasi(a2, 'Kuala Lumpur si paling twin.').
deskripsiLokasi(a3, 'Satu-satunya daerah yang memiliki air vanilla.').
deskripsiLokasi(b1, 'Satu-satunya kota yang bengkok.').
deskripsiLokasi(b2, 'Kota Matdeez.').
deskripsiLokasi(b3, 'Singapura adalah kota singa dan pura.').
deskripsiLokasi(c1, 'Kota ini dikenal dengan banyaknya hewan anjing.').
deskripsiLokasi(c2, 'Seoul adalah ibukota Korea imnida. Kamsahamnida.').
deskripsiLokasi(c3, 'Tokyo bersebelahan dengan Kyoto.').
deskripsiLokasi(d1, 'Taiwan merupakan properti khusus mas wawan.'). 
deskripsiLokasi(d2, 'Hongkong merupakan tempat nongkrong.'). 
deskripsiLokasi(d3, 'Kota utama bermain ping pong.'). 
deskripsiLokasi(e1, 'Kotanya suka ketawa.'). 
deskripsiLokasi(e2, 'Ini yang ada patung Liberty.'). 
deskripsiLokasi(e3, 'Mayoritas warga zodiaknya aries.'). 
deskripsiLokasi(f1, 'Bukan kota cape.'). 
deskripsiLokasi(f2, 'Kota penuh polusi.'). 
deskripsiLokasi(f3, 'Tempat penghuni aero.'). 
deskripsiLokasi(g1, 'Banyak berlian di kota ini.'). 
deskripsiLokasi(g2, 'Katanya Bonjour van java.'). 
deskripsiLokasi(g3, 'Mother city of UK.'). 
deskripsiLokasi(h1, 'Kotanya suka manggil-manggil.'). 
deskripsiLokasi(h2, 'Kotanya meleleh kalo dibakar.'). 
deskripsiLokasi(cc, 'Apakah Anda sedang merasa beruntung? Disinilah tempatnya!').
deskripsiLokasi(cf, 'Tempat main koin bosqq'). 
deskripsiLokasi(tx, 'Bayar pajak dongg!').
deskripsiLokasi(jl, 'Penjara T T'). 
deskripsiLokasi(fp, 'Gratis Parkir nichh.'). 
deskripsiLokasi(wt, 'Keliling dunia ygy.'). 
deskripsiLokasi(go, 'Lets goo.').

/* forSale(X) artinya lokasi X dapat dibeli */
forSale(a1).
forSale(a2).
forSale(a3).
forSale(b1).
forSale(b2).
forSale(b3).
forSale(c1).
forSale(c2).
forSale(c3).
forSale(d1).
forSale(d2).
forSale(d3).
forSale(e1).
forSale(e2).
forSale(e3).
forSale(f1).
forSale(f2).
forSale(f3).
forSale(g1).
forSale(g2).
forSale(g3).
forSale(h1).
forSale(h2).

/* notForSale(X) artinya lokasi X tidak dapat dibeli */
notForSale(cc).
notForSale(cf).
notForSale(jl).
notForSale(tx).
notForSale(fp).
notForSale(wt).
notForSale(go).

/* listLokasi(X) */
listLokasi([go,a1,a2,a3,cf,b1,b2,b3,jl,c1,c2,c3,tx,d1,d2,d3,fp,e1,e2,e3,cc,f1,f2,f3,wt,g1,g2,g3,tx,cc,h1,h2]).

/* isColorSet(X,Y,Z) */
isColorSet(a1,a2,a3).
isColorSet(a2,a1,a3).
isColorSet(a3,a2,a1).

isColorSet(b1,b2,b3).
isColorSet(b2,b1,b3).
isColorSet(b3,b2,b1).

isColorSet(c1,c2,c3).
isColorSet(c2,c1,c3).
isColorSet(c3,c2,c1).

isColorSet(d1,d2,d3).
isColorSet(d2,d1,d3).
isColorSet(d3,d2,d1).

isColorSet(e1,e2,e3).
isColorSet(e2,e1,e3).
isColorSet(e3,e2,e1).

isColorSet(f1,f2,f3).
isColorSet(f2,f1,f3).
isColorSet(f3,f2,f1).

isColorSet(g1,g2,g3).
isColorSet(g2,g1,g3).
isColorSet(g3,g2,g1).

isColorSet(h1,h2,_).
isColorSet(h2,h1,_).

