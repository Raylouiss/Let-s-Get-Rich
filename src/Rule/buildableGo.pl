printListProp([], _).
printListProp([Head | Tail], Count) :-
    tingkatBangunan(Head, Tingkat),
    ((Tingkat = 0 -> Tingkatan = 'Tanah');
    (Tingkat = 1 -> Tingkatan = 'Bangunan 1');
    (Tingkat = 2 -> Tingkatan = 'Bangunan 2');
    (Tingkat = 3 -> Tingkatan = 'Bangunan 3');
    (Tingkat = 'L' -> Tingkatan = 'Landmark')),
    format('~w. ~w - ~w~N', [Count, Head, Tingkatan]),
    NewCount is Count + 1,
    printListProp(Tail, NewCount).

getProp([A | _], IndexNow, IndexSearch, Result) :- 
    IndexSearch = IndexNow, Result = A, !.
getProp([_ | Tail], IndexNow, IndexSearch, Result) :-
    IndexNow \= IndexSearch,
    NewIndex is IndexNow + 1,
    getProp(Tail, NewIndex, IndexSearch, Result).

askUpgrade(IsUpgrade) :-
    format('\nApakah Anda masih ingin meningkatkan tingkat properti Anda? (y/n) ', []),
    read(Upgrade),
    (((Upgrade='y'; Upgrade='yes'; Upgrade='Y'; Upgrade='Yes')-> IsUpgrade = 'y'; 
      (Upgrade='n'; Upgrade='no'; Upgrade='N'; Upgrade='No') -> IsUpgrade = 'n'), !; 
    write('Input tidak valid. Silahkan input kembali.\n\n'), inputUpgrade(IsUpgrade)).

upProperti(Loc) :- 
    /* X = player */
    /* Beli Properti satu tingkatan di atas yang dimiliki, kemudian tanyakan apakah user ingin upgrade */
    turn(X),
    uangP(Uang,X),
    (notForSale(Loc) -> format('Maaf, Anda tidak bisa membeli properti di lokasi ini! >_<', []);
        tingkatBangunan(Loc,Tingkat),
        kepemilikanPropertiP(KeProp,X),
        milikBangunan(Loc,Pemilik),
        ((Pemilik \= ' ', Pemilik \= X) ->
            format('Maaf, Anda tidak bisa membeli properti di lokasi ini! >_<', []);
            (Tingkat = 'L' ->
                format('Anda sudah memiliki tingkat bangunan tertinggi! Tidak dapat membeli bangunan lagi...',[]);
                (Pemilik = X -> TingkatTemp is Tingkat + 1; TingkatTemp is 0),
                buy(Loc,TingkatTemp,Harga),
                UangNow is (Uang-Harga),
                (UangNow < 0 -> 
                    format('Mohon maaf, Uang Anda tidak cukup :(\n',[]);
                    (Pemilik = X ->
                        Tingkat2 is Tingkat + 1;
                        Tingkat2 is 0, NewLoc = [Loc], 
                        append(KeProp, NewLoc, NewListLoc),
                        retractall(kepemilikanPropertiP(_,X)),
                        asserta(kepemilikanPropertiP(NewListLoc,X))
                    ),
                    retractall(uangP(_,X)),
                    asserta(uangP(UangNow,X)),
                    nilaiPropertiP(Prop,X),
                    PropNow is Prop + Harga,
                    retractall(nilaiPropertiP(_,X)),
                    asserta(nilaiPropertiP(PropNow,X)),
                    (Tingkat2 = 4 -> asserta(tingkatBangunan(Loc,'L'));
                    retractall(tingkatBangunan(Loc,_)), asserta(tingkatBangunan(Loc,Tingkat2))),
                    retractall(milikBangunan(Loc,_)),
                    asserta(milikBangunan(Loc,X)),
                    (hargaBangunan(Loc, Price) ->
                        PriceNow is Price + Harga; PriceNow is Harga),
                    rent(Loc,Tingkat2,HargaSewa),
                    ((Loc\=h1,Loc\=h2,isColorSet(Loc,B,C),milikBangunan(B,X),milikBangunan(C,X)) -> 
                            (colorSet(Loc, true) -> 
                                    HargaSewa2 is (2*HargaSewa);
                                    HargaSewa2 is (2*HargaSewa),
                                    retractall(colorSet(Loc, _)),
                                    retractall(colorSet(B, _)),
                                    retractall(colorSet(C, _)),
                                    asserta(colorSet(Loc, true)),
                                    asserta(colorSet(B, true)),
                                    asserta(colorSet(C, true)),
                                    sewa(B, HargaSewaB),
                                    sewa(C, HargaSewaC),
                                    HargaSewaB2 is (2 * HargaSewaB),
                                    HargaSewaC2 is (2 * HargaSewaC),
                                    retractall(sewa(B, _)),
                                    retractall(sewa(C, _)),
                                    asserta(sewa(B, HargaSewaB2)),
                                    asserta(sewa(C, HargaSewaC2)),
                                    write('\nSelamat Anda berhasil mengaktifkan color set!\nHarga Sewa menjadi dua kali lipat.\n')
                            );
                    ((Loc=h1;Loc=h2),isColorSet(Loc,B,_),milikBangunan(B,X)) -> 
                            (colorSet(Loc, true) -> 
                                    HargaSewa2 is (2*HargaSewa);
                                    HargaSewa2 is (2*HargaSewa),
                                    retractall(colorSet(Loc, _)),
                                    retractall(colorSet(B, _)),
                                    asserta(colorSet(Loc, true)),
                                    asserta(colorSet(B, true)),
                                    sewa(B, HargaSewaB),
                                    HargaSewaB2 is (2 * HargaSewaB),
                                    retractall(sewa(B, _)),
                                    asserta(sewa(B, HargaSewaB2)),
                                    write('\nSelamat Anda berhasil mengaktifkan color set!\n Harga Sewa menjadi dua kali lipat.\n')
                            );
                    HargaSewa2 is HargaSewa
                    ),
                    retractall(hargaBangunan(Loc, _)),
                    retractall(sewa(Loc, _)),
                    asserta(hargaBangunan(Loc, PriceNow)),
                    asserta(sewa(Loc, HargaSewa2)),
                    (Tingkat2 = 4 -> 
                        format('Selamat! Anda telah memiliki properti tingkat tertinggi di lokasi ~w!',[Loc]);
                        (   format('Properti berhasil dibeli! Kini Anda memiliki properti tingkat ~w di lokasi ~w.\n', [Tingkat2,Loc]),
                            inputUpgrade(IsUpgrade),
                            (IsUpgrade='y' ->
                                upProperti(Loc);
                                (!)
                            )
                        )
                    )
                )
            )
        )
    ), !.

buildGo :-
    turn(X),
    lokasiP(Loc, X),
    kepemilikanPropertiP(Prop, X),
    DummyProp = Prop, 
    ((DummyProp = [] -> write('Kamu tidak memiliki properti!'), !); 
    
    ((Loc = go -> 
    write('Properti yang dimiliki:\n'),
    printListProp(DummyProp, 1),
    write('Silahkan pilih properti yang ingin ditingkatkan (pilih sesuai dengan penomoran disertai dengan tanda titik):\n'),
    write('Apabila tidak ingin meningkatkan properti apapun silahkan input nilai -1\n'),
    read(Input),
    length(Prop, Panjang),
    ((Input > Panjang -> write('Pilihan tidak valid!\n'), !);
    (Input = -1 -> write('Tidak ada properti yang ingin ditingkatkan\n'), !);
    IndexInput is Input-1,
    DummyProp2 = Prop,
    getProp(DummyProp2, 0, IndexInput, Result),
    upProperti(Result), throwDice, !));
    (write('Anda tidak berada di lokasi GO!\n'), !))).