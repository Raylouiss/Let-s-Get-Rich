:- dynamic(tingkatBangunan/2). /* Parameter nya (Lokasi, TingkatBangunan) mungkin bisa ditambahin nanti di rule pembelian lokasi? */
:- dynamic(hargaBangunan/2). /* Parameter (Lokasi, Harga) mungkin bisa ditambahin juga nnti pas di rule pembelian lokasi? */
:- dynamic(milikBangunan/2). /* Parameter (Lokasi, Pemilik) */
:- dynamic(sewa/2). /* Parameter (Lokasi, HargaSewa) */
:- dynamic(colorSet/2). /* Parameter (Lokasi, Boolean) */

checkLocationDetail(X) :-
        (forSale(X), namaLokasi(X, Name),
        deskripsiLokasi(X, Description),
        format('Nama Lokasi         : ~w~N', [Name]),
        format('Deskripsi Lokasi    : ~w~N', [Description]), nl,
        ((milikBangunan(X, Pemilik),
        Pemilik \= ' ',
        format('Kepemilikan         : Player ~w~N', [Pemilik]));
        (write('Kepemilikan         : Belum ada player yang membeli lokasi ini'),nl)),
        ((sewa(X, Price),
        format('Biaya Sewa Saat Ini : ~w~N', [Price]));
        (write('Biaya Sewa Saat ini : Belum ada player yang membeli lokasi ini'), nl)),
        ((hargaBangunan(X, Harga),
        format('Biaya Akuisisi      : ~w~N', [Harga]));
        (write('Biaya Akuisisi      : Belum ada player yang membeli lokasi ini'), nl)),
        ((tingkatBangunan(X, Tingkat),
        Tingkat \= ' ',
        format('Tingkatan Properti  : ~w~N', [Tingkat]));
        (write('Tingkatan Properti  : Belum ada player yang membeli lokasi ini'), nl)), !);
        (notForSale(X), namaLokasi(X, Name),
        deskripsiLokasi(X, Description),
        format('Nama Lokasi         : ~w~N', [Name]),
        format('Deskripsi Lokasi    : ~w~N', [Description]), !);
        (format('~w bukan merupakan lokasi yang valid! Silahkan masukkan lokasi yang tepat.', [X])).
        