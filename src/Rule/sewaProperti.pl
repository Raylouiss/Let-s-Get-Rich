inputPakaiKartu(IsPakaiKartu) :-
        format('\nAnda memiliki Kartu Diskon Sewa.\nApakah Anda ingin memakainya? (y/n) ',[]),
        read(PakaiKartu),
        (((PakaiKartu='y'; PakaiKartu='yes'; PakaiKartu='Y'; PakaiKartu='Yes')-> IsPakaiKartu = 'y'; 
          (PakaiKartu='n'; PakaiKartu='no'; PakaiKartu='N'; PakaiKartu='No') -> IsPakaiKartu = 'n'), !; 
        write('Input tidak valid. Silahkan input kembali.\n\n'), inputPakaiKartu(IsPakaiKartu)).

sewaProperti(X) :-
            (X=v;X=w),
            write('\nSayang sekali, Anda harus sewa properti :(.\n'),
            lokasiP(LocX,X),
            namaLokasi(LocX, NamaLoc),
            uangP(UangX,X),
            asetP(AsetX,X),
            kepemilikanCardP(KeCard,X),
            (((X=v, milikBangunan(LocX,Pemilik), Pemilik=w) ->
                (getIndex(KeCard, diskonSewa, Idx) -> 
                    inputPakaiKartu(IsPakaiKartu),
                    (IsPakaiKartu='y' ->
                        kartuDiskonSewa(X),!;
                        (
                            tingkatBangunan(LocX,Tingkat), 
                            sewa(LocX, Sewa),
                            uangP(Uang2,w), 
                            asetP(Aset2,w),
                            (UangX < Sewa -> 
                                mekanismeBankrut(X),!;
                                (
                                    UangXNow is (UangX-Sewa), Uang2Now is (Uang2+Sewa),
                                    AsetXNow is (AsetX-Sewa), Aset2Now is (Aset2+Sewa),
                                    retractall(uangP(_, X)), retractall(uangP(_, w)),
                                    asserta(uangP(UangXNow,X)), asserta(uangP(Uang2Now,w)),
                                    retractall(asetP(_, X)), retractall(asetP(_, w)),
                                    asserta(asetP(AsetXNow,X)), asserta(asetP(Aset2Now,w)),
                                    format('Nama Lokasi            : ~w\n', [NamaLoc]),
                                    format('Tingkat Bangunan       : ~w\n', [Tingkat]),
                                    format('Harga Sewa Lokasi      : ~w\n', [Sewa]),
                                    format('Uang Pemain v semula   : ~w\n', [UangX]),
                                    format('Uang Pemain v sekarang : ~w\n', [UangXNow]),
                                    format('Uang Pemain w semula   : ~w\n', [Uang2]),
                                    format('Uang Pemain w sekarang : ~w\n', [Uang2Now])
                                )
                            )
                        ));
                        (
                            tingkatBangunan(LocX,Tingkat), 
                            sewa(LocX, Sewa),
                            uangP(Uang2,w), 
                            asetP(Aset2,w),
                            (UangX < Sewa -> 
                                mekanismeBankrut(X),!;
                                (
                                    UangXNow is (UangX-Sewa), Uang2Now is (Uang2+Sewa),
                                    AsetXNow is (AsetX-Sewa), Aset2Now is (Aset2+Sewa),
                                    retractall(uangP(_, X)), retractall(uangP(_, w)),
                                    asserta(uangP(UangXNow,X)), asserta(uangP(Uang2Now,w)),
                                    retractall(asetP(_, X)), retractall(asetP(_, w)),
                                    asserta(asetP(AsetXNow,X)), asserta(asetP(Aset2Now,w)),
                                    format('Nama Lokasi            : ~w\n', [NamaLoc]),
                                    format('Tingkat Bangunan       : ~w\n', [Tingkat]),
                                    format('Harga Sewa Lokasi      : ~w\n', [Sewa]),
                                    format('Uang Pemain v semula   : ~w\n', [UangX]),
                                    format('Uang Pemain v sekarang : ~w\n', [UangXNow]),
                                    format('Uang Pemain w semula   : ~w\n', [Uang2]),
                                    format('Uang Pemain w sekarang : ~w\n', [Uang2Now])
                                )
                            )
                        )
                )
            );
            ((X=w, milikBangunan(LocX,Pemilik), Pemilik=v) ->
                (getIndex(KeCard, diskonSewa, Idx) -> 
                    inputPakaiKartu(IsPakaiKartu),
                    (IsPakaiKartu='y' ->
                        kartuDiskonSewa(X),!;
                        (
                            tingkatBangunan(LocX,Tingkat), 
                            sewa(LocX, Sewa),
                            uangP(Uang1,v), 
                            asetP(Aset1,v),
                            (UangX < Sewa -> 
                                mekanismeBankrut(X),!;
                                (
                                    UangXNow is (UangX-Sewa), Uang1Now is (Uang1+Sewa),
                                    AsetXNow is (AsetX-Sewa), Aset1Now is (Aset1+Sewa),
                                    retractall(uangP(_, X)), retractall(uangP(_, v)),
                                    asserta(uangP(UangXNow,X)), asserta(uangP(Uang1Now,v)),
                                    retractall(asetP(_, X)), retractall(asetP(_, v)),
                                    asserta(asetP(AsetXNow,X)), asserta(asetP(Aset1Now,v)),
                                    format('Nama Lokasi            : ~w\n', [NamaLoc]),
                                    format('Tingkat Bangunan       : ~w\n', [Tingkat]),
                                    format('Harga Sewa Lokasi      : ~w\n', [Sewa]),
                                    format('Uang Pemain v semula   : ~w\n', [UangX]),
                                    format('Uang Pemain v sekarang : ~w\n', [UangXNow]),
                                    format('Uang Pemain w semula   : ~w\n', [Uang1]),
                                    format('Uang Pemain w sekarang : ~w\n', [Uang1Now])
                                )
                            )
                        ));
                        (
                            tingkatBangunan(LocX,Tingkat), 
                            sewa(LocX, Sewa),
                            uangP(Uang1,w), 
                            asetP(Aset1,w),
                            (UangX < Sewa -> 
                                mekanismeBankrut(X),!;
                                (
                                    UangXNow is (UangX-Sewa), Uang1Now is (Uang1+Sewa),
                                    AsetXNow is (AsetX-Sewa), Aset1Now is (Aset1+Sewa),
                                    retractall(uangP(_, X)), retractall(uangP(_, v)),
                                    asserta(uangP(UangXNow,X)), asserta(uangP(Uang1Now,v)),
                                    retractall(asetP(_, X)), retractall(asetP(_, v)),
                                    asserta(asetP(AsetXNow,X)), asserta(asetP(Aset1Now,v)),
                                    format('Nama Lokasi            : ~w\n', [NamaLoc]),
                                    format('Tingkat Bangunan       : ~w\n', [Tingkat]),
                                    format('Harga Sewa Lokasi      : ~w\n', [Sewa]),
                                    format('Uang Pemain v semula   : ~w\n', [UangX]),
                                    format('Uang Pemain v sekarang : ~w\n', [UangXNow]),
                                    format('Uang Pemain w semula   : ~w\n', [Uang1]),
                                    format('Uang Pemain w sekarang : ~w\n', [Uang1Now])
                                )
                            )
                        )
                )
            )), !.