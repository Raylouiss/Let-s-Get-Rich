bayarPenjara :-
    turn(X),
    jailedP(Check, X),
    (Check = true ->
            uangP(Uang, X),
            asetP(Aset, X),
            write('Tagihan untuk keluar penjara = 100 LGR\n'),
            ((Uang >= 100 -> (keluarPenjara(X, true), NewUang is Uang - 100, retractall(uangP(_, X)), asserta(uangP(NewUang, X)), NewAset is Aset-100, retractall(asetP(_, X)), asserta(asetP(NewAset, X)), ((X = v -> asserta(turn(w))); (X = w -> asserta(turn(v)))), throwDice, !));
        (Uang < 100 -> write('Uang anda tidak cukup untuk membayar tagihan, Silahkan gunakan metode lain untuk keluar penjara!\n'), !));
        write('Anda tidak sedang dalam penjara!'), !).