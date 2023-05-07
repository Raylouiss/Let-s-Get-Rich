passGo(X) :-
        write('Anda telah sampai/melewati GO, Anda mendapatkan uang sebanyak LGR 200.\n'),
        ((X=v;X=w),
        uangP(Temp1,X),
        asetP(Temp2,X),
        Temp11 is Temp1 + 200,
        Temp22 is Temp2 + 200,
        retractall(landMark(X)),
        asserta(landMark(X)),
        retractall(uangP(_, X)),
        asserta(uangP(Temp11,X)),
        retractall(asetP(_, X)),
        asserta(asetP(Temp22,X)),!).