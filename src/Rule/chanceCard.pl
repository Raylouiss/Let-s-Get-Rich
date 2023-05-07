chanceCard(X) :-
    lokasiP(cc,X),
    random(1, 12, A),
    write('\nChance Card!\n'),
    ((A=1 -> 
            write('\nPemain mendapatkan Kartu Tax!\n'),
            addrP(Addr, X),
            ((Addr < 12 -> retractall(addrP(_, X)), asserta(addrP(12, X)));
             (Addr < 28 -> retractall(addrP(_, X)), asserta(addrP(28, X)));
             (retractall(addrP(_, X)), asserta(addrP(12, X)))
            ),
            retractall(lokasiP(_, X)), asserta(lokasiP(tx,X)),
            bayarPajak(X),
            !);
     (A=2 -> 
            write('\nPemain mendapatkan Kartu Hadiah!\n'),
            hadiah(X), 
            !);
     (A=3 -> 
            write('\nPemain mendapatkan Kartu Get Out From Jail!\n'), 
            kepemilikanCardP(ListKartu, X),
            ListKartuBaru = [outJail],
            append(ListKartu, ListKartuBaru, Result),
            retractall(kepemilikanCardP(_, X)), asserta(kepemilikanCardP(Result, X)),
            !);
     (A=4 -> 
            write('\nPemain mendapatkan Kartu Go to Jail!\n'),
            write('\nAnda masuk penjara! Sayang Sekali :(\n'),
            masukPenjara(X),
            !);
     (A=5 -> 
            write('\nPemain mendapatkan Kartu Advance to GO!\n'),
            retractall(lokasiP(_, X)), asserta(lokasiP(go,X)),
            retractall(addrP(_, X)), asserta(addrP(0,X)),
            passGo(X),
            !);
     (A=6 -> 
            write('\nPemain mendapatkan Kartu Go Back Three Spaces!\n'),
            retractall(lokasiP(_, X)), asserta(lokasiP(go,X)),
            addrP(Loc,X), NewLoc is mod(Loc-3, 32), 
            retractall(addrP(_, X)), asserta(addrP(NewLoc, X)), listLokasi(List), nth0(NewLoc, List, NewLocName), retractall(lokasiP(_, X)), asserta(lokasiP(NewLocName,X)),
            format('Pemain sekarang berada di ~w\n', [NewLocName]),
            !);
     (A=7 -> 
            write('\nPemain mendapatkan Kartu Diskon Sewa!\n'),
            kepemilikanCardP(ListKartu2, X),
            ListKartuBaru = [diskonSewa],
            append(ListKartu2, ListKartuBaru, Result),
            retractall(kepemilikanCardP(_, X)), asserta(kepemilikanCardP(Result, X)),
            !);
     (A=8 -> 
            write('\nPemain mendapatkan Kartu Jalan-Jalan ke Bangkok!\n'),
            write('\nPemain sekarang berada di b1.'),
            retractall(lokasiP(_, X)), asserta(lokasiP(b1,X)),
            retractall(addrP(_, X)), asserta(addrP(5,X)),
            !);
     (A=9 -> 
            write('\nPemain mendapatkan Kartu Jalan-Jalan ke Tokyo!\n'),
            write('\nPemain sekarang berada di c3.'),
            retractall(lokasiP(_, X)), asserta(lokasiP(c3,X)),
            retractall(addrP(_, X)), asserta(addrP(11,X)),
            !);
     (A=10 -> 
            write('\nPemain mendapatkan Kartu Jalan-Jalan ke Buenos Aires!\n'),
            write('\nPemain sekarang berada di e3.'),
            retractall(lokasiP(_, X)), asserta(lokasiP(e3,X)),
            retractall(addrP(_, X)), asserta(addrP(19,X)),
            !);
     (A=11 -> 
            write('\nPemain mendapatkan Kartu Jalan-Jalan ke Paris!\n'),
            write('\nPemain sekarang berada di g2.'),
            retractall(lokasiP(_, X)), asserta(lokasiP(g2,X)),
            retractall(addrP(_, X)), asserta(addrP(26,X)),
            !)
     ).

hadiah(Y) :-
    random(1, 5, A),
    X is A*50, 
    write('Pemain mendapatkan Hadiah sebanyak: '), 
    write(X), 
    write(' LGR.\n'),
    uangP(Money, Y),
    TotalMoney is Money + X,
    retractall(uangP(_, X)), asserta(uangP(TotalMoney, Y)),
    asetP(Aset, Y),
    TotalAset is Aset + X,
    retractall(uangP(_, X)), asserta(asetP(TotalAset, Y)).

kartuDiskonSewa(Y) :-
       (Y = v -> Enemy = w; Enemy = v),
       lokasiP(X, Y),
       tingkatBangunan(X, Tingkat),
       namaLokasi(X, NamaLoc),
       sewa(X, Harga),
       Pembayaran is Harga/2,
       format('\nBiaya sewa menjadi ~w LGR~N', [Pembayaran]),
       uangP(Money, Y),
       TotalMoney is Money - Pembayaran,
       (TotalMoney < 0 -> mekanismeBankrut(Y),!;
       retractall(uangP(_, X)), asserta(uangP(TotalMoney, Y)),
       asetP(Aset, Y),
       TotalAset is Aset - Pembayaran,
       retractall(asetP(_, X)), asserta(asetP(TotalAset, Y)),
       uangP(MoneyEnemy, Enemy),
       TotalEnemyMoney is MoneyEnemy + Pembayaran,
       retractall(uangP(_, X)), asserta(uangP(TotalEnemyMoney, Enemy)),
       asetP(AsetEnemy, Enemy),
       TotalEnemyAset is AsetEnemy + Pembayaran,
       retractall(asetP(_, X)), asserta(asetP(TotalEnemyAset, Enemy)),
       kepemilikanCardP(KeCard, Y),
       removeElmtList(KeCard, diskonSewa, KeCardResult),
       retractall(kepemilikanCardP(_, X)), asserta(kepemilikanCardP(KeCardResult,Y)),
       (Y = v ->
       format('Nama Lokasi            : ~w\n', [NamaLoc]),
       format('Tingkat Bangunan       : ~w\n', [Tingkat]),
       format('Harga Sewa Lokasi      : ~w\n', [Pembayaran]),
       format('Uang Pemain v semula   : ~w\n', [Money]),
       format('Uang Pemain v sekarang : ~w\n', [TotalMoney]),
       format('Uang Pemain w semula   : ~w\n', [MoneyEnemy]),
       format('Uang Pemain w sekarang : ~w\n', [TotalEnemyMoney]);
       
       format('Nama Lokasi            : ~w\n', [NamaLoc]),
       format('Tingkat Bangunan       : ~w\n', [Tingkat]),
       format('Harga Sewa Lokasi      : ~w\n', [Pembayaran]),
       format('Uang Pemain v semula   : ~w\n', [MoneyEnemy]),
       format('Uang Pemain v sekarang : ~w\n', [TotalEnemyMoney]),
       format('Uang Pemain w semula   : ~w\n', [Money]),
       format('Uang Pemain w sekarang : ~w\n', [TotalMoney])
       )), !.
/*
Kartu Tax: Pemain akan langsung pindah ke tempat Tax berikutnya (terdekat) dan langsung dikenai pajak.
Kartu Hadiah: Pemain langsung mendapatkan uang berdasarkan nilai yang tertera pada kartu tersebut. Nilainya dapat diacak dan nominalnya dibebaskan selama tidak merusak flow permainan (balanced).
Kartu Get Out From Jail: Pemain dapat menggunakan kartu ini saat berada di dalam penjara untuk langsung keluar tanpa menunggu tiga kali giliran atau membayar denda.
Kartu Go To Jail: Pemain langsung ditransportasi ke lokasi Penjara dan dipenjara. Permainan dilanjutkan oleh pemain selanjutnya.
Kartu Advance to GO: Pemain maju sampai ke GO dan mendapatkan 200 LGR
Kartu Go Back Three Spaces: Pemain mundur sebanyak tiga langkah
Kartu Jalan-Jalan ke Bangkok: Pemain pergi ke lokasi B1 (Bangkok)
Kartu Jalan-Jalan ke Tokyo: Pemain pergi ke lokasi C3 (Tokyo)
Kartu Jalan-Jalan ke Buenos Aires: Pemain pergi ke lokasi E3 (Buenos Aires)
Kartu Jalan-Jalan ke Paris: Pemain pergi ke lokasi G2 (Paris)
Kartu Diskon Sewa: Pemain dapat menggunakan kartu ini saat menyewa properti milik pemain lainnya, sehingga pemain mendapatkan diskon 5, 10, 15, atau 20 persen biaya sewa
*/