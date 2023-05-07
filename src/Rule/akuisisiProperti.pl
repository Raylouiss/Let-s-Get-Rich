akuisisiProperti :- 
                /* X = player */
                /* Beli Properti satu tingkatan di atas yang dimiliki, kemudian tanyakan apakah user ingin upgrade */
                turn(X),
                (X = v -> Enemy = w; Enemy = v),
                lokasiP(Loc,X),
                uangP(Uang,X),
                milikBangunan(Loc,Pemilik),
                tingkatBangunan(Loc,Tingkat),
                ((notForSale(Loc); Pemilik = ' '; Tingkat = 'L') -> format('Maaf, Anda tidak bisa akuisisi properti di lokasi ini! >_<', []);
                    kepemilikanPropertiP(KeProp,X),
                    kepemilikanPropertiP(KePropEnemy,Enemy),
                    (Pemilik = X ->
                        format('Maaf, Anda tidak bisa akuisisi properti Anda sendiri! >_<', []);
                        hargaBangunan(Loc, Harga),
                        UangNow is (Uang-Harga),
                        (UangNow < 0 -> 
                            format('Mohon maaf, Uang Anda tidak cukup :(\n',[]);
                            NewLoc = [Loc], 
                            append(KeProp, NewLoc, NewListLoc), 
                            retractall(kepemilikanPropertiP(_,X)),
                            asserta(kepemilikanPropertiP(NewListLoc,X)),
                            retractall(uangP(_,X)),
                            asserta(uangP(UangNow,X)),
                            uangP(UangEnemy, Enemy),
                            UangEnemyNow is (UangEnemy + Harga),
                            retractall(uangP(_,Enemy)),
                            asserta(uangP(UangEnemyNow,Enemy)),
                            nilaiPropertiP(Prop,X),
                            nilaiPropertiP(PropEnemy,Enemy),
                            PropNow is Prop + Harga,
                            PropEnemyNow is PropEnemy - Harga,
                            removeElmtList(KePropEnemy, Loc, KePropEnemyResult),
                            retractall(kepemilikanPropertiP(_,Enemy)),
                            retractall(nilaiPropertiP(_,X)),
                            retractall(nilaiPropertiP(_,Enemy)),
                            retractall(milikBangunan(Loc,_)),
                            asserta(kepemilikanPropertiP(KePropEnemyResult,Enemy)),
                            asserta(nilaiPropertiP(PropNow,X)),
                            asserta(nilaiPropertiP(PropEnemyNow,Enemy)),
                            asserta(milikBangunan(Loc,X)),
                            (   format('Properti berhasil diakuisisi! Kini Anda memiliki properti tingkat ~w di lokasi ~w.\n', [Tingkat,Loc]),
                                (Tingkat \= 'L' ->
                                    inputUpgrade(IsUpgrade),
                                    (IsUpgrade='y' ->
                                        beliProperti;
                                        (!)
                                    ); true
                                )
                            )
                        )
                    )
                ), !.