inputUpgrade(IsUpgrade) :-
        format('\nApakah Anda ingin meningkatkan tingkat properti Anda? (y/n) ', []),
        read(Upgrade),
        (((Upgrade='y'; Upgrade='yes'; Upgrade='Y'; Upgrade='Yes')-> IsUpgrade = 'y'; 
          (Upgrade='n'; Upgrade='no'; Upgrade='N'; Upgrade='No') -> IsUpgrade = 'n'), !; 
        write('Input tidak valid. Silahkan input kembali.\n\n'), inputUpgrade(IsUpgrade)).

beliProperti :- 
                /* X = player */
                /* Beli Properti satu tingkatan di atas yang dimiliki, kemudian tanyakan apakah user ingin upgrade */
                turn(X),
                lokasiP(Loc,X),
                uangP(Uang,X),
                (notForSale(Loc) -> format('Maaf, Anda tidak bisa membeli properti di lokasi ini! >_<', []);
                    tingkatBangunan(Loc,Tingkat),
                    kepemilikanPropertiP(KeProp,X),
                    milikBangunan(Loc,Pemilik),
                    ((Pemilik \= ' ', Pemilik \= X) ->
                        format('Maaf, Anda tidak bisa membeli properti di lokasi ini! >_<', []);
                        ((Tingkat = 3, \+ landMark(X)) ->
                            format('Maaf, Anda belum bisa membeli Landmark :(\n', []);
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
                                    (Tingkat2 = 4 -> retractall(tingkatBangunan(Loc,_)), asserta(tingkatBangunan(Loc,'L'));
                                    retractall(tingkatBangunan(Loc,_)),
                                    asserta(tingkatBangunan(Loc,Tingkat2))),
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
                                                beliProperti;
                                                (!)
                                            )
                                        )
                                    )
                                )
                            )
                        )
                    )
                ), !.