printPropertiBankrut([], _).
printPropertiBankrut([Head | Tail], Count) :-
    tingkatBangunan(Head, Tingkat),
    ((Tingkat = 0 -> Tingkatan = 'Tanah');
    (Tingkat = 1 -> Tingkatan = 'Bangunan 1');
    (Tingkat = 2 -> Tingkatan = 'Bangunan 2');
    (Tingkat = 3 -> Tingkatan = 'Bangunan 3');
    (Tingkat = 'L' -> Tingkatan = 'Landmark');
    true),
    hargaBangunan(Head,Harga),
    format('~w. ~w, ~w : ~w~N', [Count, Head, Tingkatan, Harga]),
    NewCount is Count + 1,
    printPropertiBankrut(Tail, NewCount).

loop(X,Z):-
    ((X = v;X = w),uangP(Money,X)),
    ((X = v;X = w),nilaiPropertiP(Prop,X)),
    ((X = v; X = w), kepemilikanPropertiP(KeProp,X)),
    ((X = v;X = w),lokasiP(Loc,X)),
    write('\n'),
    write('Daftar propertimu :'),
    write('\n'),
    KePropBaru = KeProp,
    printPropertiBankrut(KePropBaru, 1),
    length(KePropBaru, Panjang),
    write('\n'),
    write('Properti mana yang ingin dijual?(Pilih nomor)'),
    write('\n'),
    read(JualProp),
    (JualProp=<Panjang ->
    KePropDummy = KeProp,
    Index is JualProp-1,
    getCard(KePropDummy, 0, Index, Result),
    hargaBangunan(Result,Harga),
    TambahUang is Harga*0.8,
    retractall(milikBangunan(Result,_)),
    asserta(milikBangunan(Result,' ')),
    retractall(hargaBangunan(Result,_)),
    retractall(sewa(Result,_)),
    (colorSet(Result, true) -> 
        isColorSet(Result, B, C),
        sewa(B, HargaSewaB),
        sewa(C, HargaSewaC),
        HargaSewaNewB is HargaSewaB/2,
        HargaSewaNewC is HargaSewaC/2,
        retractall(sewa(B, _)),
        retractall(sewa(C, _)),
        asserta(sewa(B,HargaSewaNewB)),
        asserta(sewa(C,HargaSewaNewC)),
        retractall(colorSet(Result,_)),
        retractall(colorSet(B,_)),
        retractall(colorSet(C,_)),
        write('Sayang sekali, Color Set dinonaktifkan :(\n');
        retractall(colorSet(Result,_))),
    retractall(tingkatBangunan(Result,_)),
    asserta(tingkatBangunan(Result,' ')),
    removeElmtList(KeProp, Result, NewKeProp),
    retractall(kepemilikanPropertiP(_,X)),
    asserta(kepemilikanPropertiP(NewKeProp,X)),
    MoneyNow is Money + TambahUang,
    format('Uangmu : ~w~N', [MoneyNow]),
    PropNow is Prop - Harga,
    format('Total kekayaan properti : ~w~N', [PropNow]),
    AsetNow is MoneyNow + PropNow,
    retractall(uangP(_,X)),
    asserta(uangP(MoneyNow,X)),
    retractall(nilaiPropertiP(_,X)),
    asserta(nilaiPropertiP(PropNow,X)),
    retractall(asetP(_,X)),
    asserta(asetP(AsetNow,X)),
    (MoneyNow<Z ->
    write('\n'),
    (Loc = tx -> write('Pembayaran pajak masih kurang!!');write('Pembayaran biaya sewa masih kurang!')),
    write('\n'),
    loop(X,Z);true)
    ;
    write('\n'),
    write('Input tidak valid'),
    write('\n'),
    loop(X,Z),
    !)
    .

mekanismeBankrut(X) :-
    ((X = v;X = w),uangP(Money,X)),
    ((X = v;X = w),nilaiPropertiP(Prop,X)),
    ((X = v;X = w),asetP(Aset,X)),
    PropDummy is Prop*0.8,
    AsetDummy is PropDummy + Money,
    ((X = v;X = w),lokasiP(Loc,X)),
    (Loc = tx -> 
    Rent is Aset*0.1
    ;
    tingkatBangunan(Loc, Tingkat), rent(Loc, Tingkat, Rent)),!,
    (AsetDummy>=Rent ->
    write('\n'),
    write('Wah, uangmu kurang! Apakah kamu ingin tetap meneruskan permainan?(lanjut/tidak)'),
    write('\n'),
    read(Lanjut),
    (Lanjut = 'lanjut'->
    loop(X,Rent),
    ((X = v;X = w),uangP(Money2,X)),
    (Money2>=Rent->
    write('\n'),
    (Loc = tx -> write('Hore, pajak sudah bisa dibayar!');write('Hore, sewa sudah bisa dibayar!')),
    write('\n'),
    ((X = v;X = w),nilaiPropertiP(Prop2,X)),
    Moneybaru is Money2-Rent,
    Asetbaru is Moneybaru + Prop2,
    retractall(uangP(_,X)),
    asserta(uangP(Moneybaru,X)),
    retractall(asetP(_,X)),
    asserta(asetP(Asetbaru,X)),
    (Loc = tx -> format('Uang setelah membayar pajak: ~w~N', [Moneybaru]);format('Uang setelah membayar sewa: ~w~N', [Moneybaru])),
    ((Loc\=cc, Loc\=go, Loc\=jl, Loc\=tx, Loc\= fp, Loc\= wt)->
    (X = v -> Lawan = w; Lawan = v),
    uangP(UangLawan, Lawan),
    asetP(AsetLawan,Lawan),
    UangLawan2 is UangLawan + Rent,
    AsetLawan2 is AsetLawan + Rent,
    retractall(uangP(_,Lawan)),
    asserta(uangP(UangLawan2,Lawan)),
    retractall(asetP(_,Lawan)),
    asserta(asetP(AsetLawan2,Lawan))
    ;
    (X = v -> Lawan = w; Lawan = v),
    uangP(UangLawan, Lawan),
    asetP(AsetLawan,Lawan),
    retractall(uangP(_,Lawan)),
    asserta(uangP(UangLawan,Lawan)),
    retractall(asetP(_,Lawan)),
    asserta(asetP(AsetLawan,Lawan)),
    !)
    ,!)
    ;
    (Lanjut = 'tidak' ->
    write('\n'),
    write('Sayang sekali, uangmu sudah tidak cukup. Selamat tinggal :)'),
    write('\n'),
    (X = v ->
    winPlayerW,
    gameOver
    ;
    winPlayerV,
    gameOver),
    retractall(tingkatBangunan(_,_)),
    retractall(hargaBangunan(_,_)),
    retractall(milikBangunan(_,_)),
    retractall(sewa(_,_)),
    retractall(lokasiP(_,_)),
    retractall(uangP(_,_)),
    retractall(nilaiPropertiP(_,_)),
    retractall(asetP(_,_)),
    retractall(kepemilikanPropertiP(_,_)),
    retractall(kepemilikanCardP(_,_)),
    retractall(jailedP(_,_)),
    retractall(addrP(_,_)),
    retractall(countDiceJail(_,_)),
    retractall(turn(_)),
    retractall(landMark(_)),
    retractall(colorSet(_,_)),
    retractall(countDice(_)),!
    )
    ;
    write('\n'),
    write('Input tidak valid'),
    write('\n'),
    mekanismeBankrut(X),
    !)
    ;
    write('\n'),
    write('Sayang sekali, uangmu sudah tidak cukup. Selamat tinggal :)'),
    write('\n'),
    (X = v ->
    winPlayerW,
    gameOver
    ;
    winPlayerV,
    gameOver),
    retractall(tingkatBangunan(_,_)),
    retractall(hargaBangunan(_,_)),
    retractall(milikBangunan(_,_)),
    retractall(sewa(_,_)),
    retractall(lokasiP(_,_)),
    retractall(uangP(_,_)),
    retractall(nilaiPropertiP(_,_)),
    retractall(asetP(_,_)),
    retractall(kepemilikanPropertiP(_,_)),
    retractall(kepemilikanCardP(_,_)),
    retractall(jailedP(_,_)),
    retractall(addrP(_,_)),
    retractall(landMark(_)),
    retractall(countDiceJail(_,_)),
    retractall(turn(_)),
    retractall(colorSet(_,_)),
    retractall(countDice(_)),!
    ).