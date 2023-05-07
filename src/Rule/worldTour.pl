/* getIndex(List, SearchedElement, Result) */
getIndex([A | _], SearchedElement, Result) :- A = SearchedElement, Result is 1.
getIndex([A | List], SearchedElement, Result) :- A \= SearchedElement, getIndex(List, SearchedElement, TempResult), Result is TempResult + 1.

inputLokasi(Player) :-
        write('Pilih (ketik kode lokasi): '),
        read(Location),
        ((namaLokasi(Location, GoLocation), Location \= wt) -> 
                format('Anda berhasil tour ke ~w~N', [GoLocation]),
                listLokasi(ListLokasi),
                getIndex(ListLokasi, Location, Index),
                NewIndex is Index - 1,
                retractall(addrP(_,Player)),
                retractall(lokasiP(_,Player)),
                asserta(addrP(NewIndex, Player)),
                asserta(lokasiP(Location, Player)),
                (Location = tx -> bayarPajak(Player); 
                    Location = cc -> chanceCard(Player); 
                    Location = fp -> parkirGratis;
                    Location = go -> passGo(Player);
                    ( milikBangunan(Location, Pemilik),
                     (Pemilik \= ' ', Pemilik \= Player -> sewaProperti(Player), !; true); true, !)
                )
        ); 
        write('Input tidak valid. Silahkan input kembali.\n\n'), inputLokasi(Player).

worldTour(Player) :-
        (Player = v; Player = w),
        lokasiP(wt, Player),
        write('\nSelamat Anda berhasil masuk ke zona World Tour!\n'),
        write('-----------------------------------------------\n'),
        write('Silahkan pilih zona yang ingin anda kunjungi:\n'),
        namaLokasi(a1, Name),
        format('1.  a1 : ~w~N', [Name]),
        namaLokasi(a2, Name2),
        format('2.  a2 : ~w~N', [Name2]),
        namaLokasi(a3, Name3),
        format('3.  a3 : ~w~N', [Name3]),
        namaLokasi(b1, Name4),
        format('4.  b1 : ~w~N', [Name4]),
        namaLokasi(b2, Name5),
        format('5.  b2 : ~w~N', [Name5]),
        namaLokasi(b3, Name6),
        format('6.  b3 : ~w~N', [Name6]),
        namaLokasi(c1, Name7),
        format('7.  c1 : ~w~N', [Name7]),
        namaLokasi(c2, Name8),
        format('8.  c2 : ~w~N', [Name8]),
        namaLokasi(c3, Name9),
        format('9.  c3 : ~w~N', [Name9]),
        namaLokasi(d1, Name10),
        format('10. d1 : ~w~N', [Name10]),
        namaLokasi(d2, Name11),
        format('11. d2 : ~w~N', [Name11]),
        namaLokasi(d3, Name12),
        format('12. d3 : ~w~N', [Name12]),
        namaLokasi(e1, Name13),
        format('13. e1 : ~w~N', [Name13]),
        namaLokasi(e2, Name14),
        format('14. e2 : ~w~N', [Name14]),
        namaLokasi(e3, Name15),
        format('15. e3 : ~w~N', [Name15]),
        namaLokasi(f1, Name16),
        format('16. f1 : ~w~N', [Name16]),
        namaLokasi(f2, Name17),
        format('17. f2 : ~w~N', [Name17]),
        namaLokasi(f3, Name18),
        format('18. f3 : ~w~N', [Name18]),
        namaLokasi(g1, Name19),
        format('19. g1 : ~w~N', [Name19]),
        namaLokasi(g2, Name20),
        format('20. g2 : ~w~N', [Name20]),
        namaLokasi(g3, Name21),
        format('21. g3 : ~w~N', [Name21]),
        namaLokasi(h1, Name22),
        format('22. h1 : ~w~N', [Name22]),
        namaLokasi(h2, Name23),
        format('23. h2 : ~w~N', [Name23]),
        namaLokasi(cc, Name24),
        format('24. cc : ~w~N', [Name24]),
        namaLokasi(jl, Name25),
        format('25. jl : ~w~N', [Name25]),
        namaLokasi(fp, Name26),
        format('26. fp : ~w~N', [Name26]),
        namaLokasi(go, Name27),
        format('27. go : ~w~N', [Name27]),
        namaLokasi(cf, Name28),
        format('28. cf : ~w~N', [Name28]),
        inputLokasi(Player).