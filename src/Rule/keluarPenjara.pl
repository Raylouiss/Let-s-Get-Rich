:- dynamic(countDiceJail/2).

/* Double -> Keluar, Kartu Get Out From Jail -> Keluar, Bayar -> Keluar */
/* Belum keimplement : Double, Kartu, dan Bayar */
keluarPenjara(Player, Out) :-
                    (Out = true -> 
                                    write('Selamat, Anda keluar dari penjara!\n'),
                                    retractall(countDiceJail(_,Player)),
                                    asserta(countDiceJail(0, Player)),
                                    retractall(jailedP(_,Player)),
                                    asserta(jailedP(false, Player)), !
                    );
                    countDiceJail(CurrentVal, Player), 
                    NewVal is CurrentVal + 1, 
                    retractall(countDiceJail(_, Player)),
                    asserta(countDiceJail(NewVal, Player)),
                    ((NewVal = 3 -> retractall(jailedP(_, Player)), asserta(jailedP(false, Player)), retractall(countDiceJail(_, Player)), asserta(countDiceJail(0, Player)), write('Selamat, Anda keluar dari penjara!\n'));
                    write('Anda masih dalam penjara, sayang sekali :(\n')), !.