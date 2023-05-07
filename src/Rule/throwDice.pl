:- dynamic(countDice/1).

throwDice :-
            turn(Temp),
            ((Temp = v -> asserta(turn(w)));
            (Temp = w -> asserta(turn(v)))),
            turn(X),
            ((X = v -> write('\nSekarang adalah giliran pemain v.\n\n'));
            (X = w -> write('\nSekarang adalah giliran pemain w.\n\n'))),
            sleep(2),
            random(1, 7, A),
            write('Dadu 1: '), write(A), write('.\n'),
            random(1, 7, B),
            write('Dadu 2: '), write(B), write('.\n'),
            Total is A+B,
            jailedP(Jailed, X),
            (   A = B -> 
                write('Double!\n'),
                (Jailed = true -> 
                        keluarPenjara(X, true);
                        countDice(CurrentVal), 
                        NewVal is CurrentVal + 1, 
                        retractall(countDice(_)),
                        asserta(countDice(NewVal)),
                        ((  (NewVal = 3, X = v -> 
                                write('Anda masuk penjara! Sayang Sekali :('),
                                retractall(countDice(_)),
                                retractall(lokasi(_, v)), 
                                retractall(addrP(_,v)),
                                retractall(jailedP(_,v)),
                                asserta(jailedP(true,v)),
                                asserta(countDice(0)), 
                                asserta(addrP(8,v)),
                                asserta(lokasiP(jl, v));
                            NewVal = 3, X = w -> 
                                write('Anda masuk penjara! Sayang Sekali :('), 
                                retractall(countDice(_)),
                                retractall(lokasi(_, w)), 
                                retractall(addrP(_,w)),
                                retractall(jailedP(_,w)),
                                asserta(jailedP(true,w)),
                                asserta(countDice(0)),
                                asserta(addrP(8,w)),
                                asserta(lokasiP(jl, w))); 
                            write('Anda Maju sebanyak '), 
                            write(Total), 
                            write(' langkah.\n\n'), 
                            addrP(Y, X), 
                            NewLoc is mod(Y + Total, 32), 
                            (NewLoc < Y -> passGo(X); true), 
                            retractall(addrP(_, X)),
                            asserta(addrP(NewLoc, X)), 
                            listLokasi(List), 
                            nth0(NewLoc, List, NewLocName),
                            format('Pemain kini berada di lokasi ~w.\n',[NewLocName]),
                            retractall(lokasiP(_, X)),
                            asserta(lokasiP(NewLocName,X)), 
                            (NewLocName = tx -> bayarPajak(X); 
                            NewLocName = cc -> chanceCard(X); 
                            NewLocName = fp -> parkirGratis; 
                            NewLocName = wt -> worldTour(X);
                            (forSale(NewLocName) ->
                                milikBangunan(NewLocName, Pemilik),
                                ((Pemilik \= ' ', Pemilik \= X) -> sewaProperti(X); true); true)),
                            jailedP(JailedNew, X), 
                            (JailedNew = false -> 
                                ((X = v -> retractall(turn(_)), asserta(turn(w))); (X = w -> retractall(turn(_)), asserta(turn(v)))), throwDice; !)
                        ))
                );
                (Jailed = true -> 
                    keluarPenjara(X, false); 
                    (   write('Anda Maju sebanyak '), 
                        write(Total), 
                        write(' langkah.\n'), 
                        retractall(countDice(_)),
                        asserta(countDice(0)), 
                        addrP(Y, X), 
                        NewLoc is mod(Y + Total, 32), 
                        (NewLoc < Y -> passGo(X); true), 
                        retractall(addrP(_, X)),
                        asserta(addrP(NewLoc, X)), 
                        listLokasi(List),
                        nth0(NewLoc, List, NewLocName), 
                        format('Pemain kini berada di lokasi ~w.\n',[NewLocName]),
                        retractall(lokasiP(_, X)),
                        asserta(lokasiP(NewLocName,X)),
                        (NewLocName = tx -> bayarPajak(X); 
                        NewLocName = cc -> chanceCard(X); 
                        NewLocName = fp -> parkirGratis; 
                        NewLocName = wt -> worldTour(X);
                        (forSale(NewLocName) ->
                            milikBangunan(NewLocName, Pemilik),
                            ((Pemilik \= ' ', Pemilik \= X) -> sewaProperti(X); true); true))
                    )
                )
            ), !.