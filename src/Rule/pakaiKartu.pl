printKartu([], _).
printKartu([Head | Tail], Count) :-
    kartu(Head, X), 
    format('~w. Kartu ~w: ~w~N', [Count, Head, X]),
    NewCount is Count + 1,
    printKartu(Tail, NewCount).

getCard([A | _], IndexNow, IndexSearch, Result) :- 
    IndexSearch = IndexNow, Result = A, !.
getCard([_ | Tail], IndexNow, IndexSearch, Result) :-
    IndexNow \= IndexSearch,
    NewIndex is IndexNow + 1,
    getCard(Tail, NewIndex, IndexSearch, Result).


removeElmtList([A], Elmt, ListResult) :- A==Elmt, ListResult=[], !.
removeElmtList([A|B], Elmt, ListResult) :- A==Elmt, ListResult=B, !.
removeElmtList([A|B], Elmt, ListResult) :- A\=Elmt, removeElmtList(B, Elmt, ListResult2), ListResult=[A|ListResult2].

pakaiKartu :-
    turn(X),
    kepemilikanCardP(Card, X),
    DummyCard1 = Card,
    ((DummyCard1 = [] -> write('Anda tidak memiliki kartu!'), !); 
    write('List Kartu yang anda miliki:\n'), printKartu(DummyCard1, 1),
    write('\nSilahkan pilih kartu yang ingin digunakan (pilih sesuai dengan penomoran disertai dengan tanda titik):\n'),
    write('Apabila tidak ingin memilih kartu apapun silahkan input nilai -1\n'),
    DummyCard2 = Card,
    length(Card, Panjang),
    read(Input),
    ((Input > Panjang -> write('Pemilihan Kartu tidak valid!'), !); 
    (Input = -1 -> write('Tidak ada kartu yang dipilih\n'), !); 
    IndexInput is Input-1,
    getCard(DummyCard2, 0, IndexInput, Result),
    (((Result = diskonSewa, lokasiP(Lokasi, X), milikBangunan(Lokasi, Y), Y \= ' ', X \= Y) -> write('Kartu diskonSewa berhasil dipakai\n'),
    removeElmtList(Card, diskonSewa, NewCard), kartuDiskonSewa(X), retractall(kepemilikanCardP(_, X)), asserta(kepemilikanCardP(NewCard, X)), !); 
    ((Result = outJail, lokasiP(Loc, X), Loc = jl, jailedP(Status, X), Status = true) -> write('Kartu outJail berhasil dipakai\n'), 
    keluarPenjara(X, true), removeElmtList(Card, outJail, NewCard), retractall(kepemilikanCardP(_, X)), asserta(kepemilikanCardP(NewCard, X)), !));
    write('Kartu tidak bisa dipakai sekarang!\n'), !)).