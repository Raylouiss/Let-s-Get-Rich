bayarPajak(X) :-
        write('\n'),
        write('Anda tiba di lokasi tax :(, Anda wajib membayar pajak sebesar 10% dari total aset Anda.\n'),
        write('\n'),
        ((X=v;X=w),
        uangP(Temp1,X),
        asetP(Temp2,X),
        Pajak is Temp2/10,
        (Temp1<Pajak ->
        mekanismeBankrut(X)
        ;
        (
        TempP1 is Temp1 - Pajak,
        TempP2 is Temp2 - Pajak,
        retractall(uangP(_,X)),
        retractall(asetP(_,X)),
        asserta(uangP(TempP1,X)),
        asserta(asetP(TempP2,X)))),!).