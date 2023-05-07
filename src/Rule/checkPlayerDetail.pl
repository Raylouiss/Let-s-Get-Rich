:- dynamic(lokasiP/2).
:- dynamic(uangP/2).
:- dynamic(nilaiPropertiP/2).
:- dynamic(asetP/2).
:- dynamic(kepemilikanPropertiP/2).
:- dynamic(kepemilikanCardP/2).
:- dynamic(jailedP/2).
:- dynamic(addrP/2).

createPlayerDetail(X) :-
    (asserta(lokasiP(go,X)),
    asserta(uangP(1500,X)),
    asserta(nilaiPropertiP(0,X)),
    asserta(asetP(1500,X)),
    asserta(kepemilikanPropertiP([],X)),
    asserta(jailedP(false,X)),
    asserta(addrP(0,X)),
    asserta(kepemilikanCardP([],X)),!).

printProperti([], _).
printProperti([Head | Tail], Count) :-
    tingkatBangunan(Head, Tingkat),
    ((Tingkat = 0 -> Tingkatan = 'Tanah');
    (Tingkat = 1 -> Tingkatan = 'Bangunan 1');
    (Tingkat = 2 -> Tingkatan = 'Bangunan 2');
    (Tingkat = 3 -> Tingkatan = 'Bangunan 3');
    (Tingkat = 'L' -> Tingkatan = 'Landmark');
    true),
    format('~w. ~w - ~w~N', [Count, Head, Tingkatan]),
    NewCount is Count + 1,
    printProperti(Tail, NewCount).

checkPlayerDetail(X) :-
    (X\=v,X\=w,format('\nPlayer tidak ditemukan.', []),!);
    format('\nInformasi Player ~w~N', [X]),
    ((X = v;X=w),lokasiP(Loc,X)),
    format('\nLokasi                      : ~w~N', [Loc]),
    ((X = v; X = w), uangP(Money,X)),
    format('Total Uang                  : ~w~N', [Money]),
    ((X = v; X = w), nilaiPropertiP(Prop, X)),
    format('Total Nilai Properti        : ~w~N', [Prop]),
    ((X = v; X = w), asetP(Aset,X)),
    format('Total Aset                  : ~w~N', [Aset]),
    ((X = v; X = w), kepemilikanPropertiP(KeProp,X)),
    format('\nDaftar Kepemilikan Properti :~N', [KeProp]),
    DummyCardY = KeProp,
    (DummyCardY == [] -> write('Kosong.\n');
    printProperti(DummyCardY, 1)),
    ((X = v; X = w), kepemilikanCardP(KeCard,X)),
    format('\nDaftar Kepemilikan Card     :~N', []), 
    DummyCardX = KeCard,
    (DummyCardX == [] -> write('Kosong.\n');
    printKartu(DummyCardX, 1)), !.