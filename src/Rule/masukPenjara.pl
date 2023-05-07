masukPenjara(Player) :-
            retractall(lokasiP(_, Player)),
            asserta(lokasiP(jl, Player)),
            retractall(jailedP(_, Player)),
            asserta(jailedP(true, Player)),
            retractall(addrP(_, Player)),
            asserta(addrP(8, Player)).
