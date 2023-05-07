mauMainLagi(Result) :-
    write('Selamat anda menebak dengan benar, apakah anda ingin bermain lagi? Jika ya input (y.), Jika tidak input(n.): '),
    read(X),
    ((X = 'y' -> Result = 'y', !);
    (X = 'n' -> Result = 'n', !);
    (write('Input tidak valid!, Silahkan input ulang\n'), sleep(1), mauMainLagi(Result), !)).

inputValid(Result) :-
    write('Silahkan Menebak hasil dengan input (head/tail) : '),
    read(X),
    ((X = 'head' -> Result = 'head', !); (X = 'tail' -> Result = 'tail', !);
    (write('Input tidak valid!, Silahkan Input ulang pilihan anda!\n'), sleep(1), inputValid(Result), !)).

inputMain(Result) :-
    write('Apakah anda ingin berpartisipasi di game koin flip? Jika ya silahkan ketik (y.), Jika tidak silahkan ketik (n.): '),
    read(X),
    ((X = 'y' -> Result = 'y', !);
    (X = 'n' -> Result = 'n', !);
    (write('Input tidak valid!, Silahkan input ulang\n'), sleep(1), inputMain(Result), !)).

coinFlip :-
    turn(X),
    lokasiP(Loc, X),
    uangP(Uang, X),
    asetP(Aset, X),
    ((Loc = cf ->
        write('Selamat datang di mini game koin flip\n'),
        write('=====================================\n'),
        write('============= KOIN FLIP =============\n'),
        write('=====================================\n'),
        sleep(1),
        write('Berikut sedikit penjelasan tentang permainan mini game koin flip :\n'),
        sleep(1),
        write('1. Apabila player ingin memainkan game koin flip, Player harus membayar 100 LGR\n'),
        write('2. Setelah membayar player harus menebak hasil koin flip head atau tail\n'),
        write('3. Apabila player berhasil menebak dengan benar maka player akan mendapatkan uang sebesar 2x lipat pembayaran awal\n'),
        write('4. Player juga bisa melanjutkan koin flip sampai maksimal 3 kali untuk memaksimalkan keuntungan (apabila beruntung)\n'),
        write('5. Apabila player gagal menebak hasil dengan benar maka uang player akan hangus\n'),
        inputMain(Input),
        ((Input = 'y' -> 
            ((Uang >= 100 -> 
                UangBaru is Uang-100,
                AsetBaru is Aset-100,
                retractall(uangP(_, X)), asserta(uangP(UangBaru, X)),
                retractall(asetP(_, X)), asserta(asetP(AsetBaru, X)),
                inputValid(Player),
                Tagihan is 100,
                random(1, 3, Tebak),
                ((Tebak = 1 -> Mesin = 'head'); (Tebak = 2 -> Mesin = 'tail')),
                ((Player = Mesin -> 
                    mauMainLagi(Jawaban),
                    ((Jawaban = 'y' -> 
                        Tagihan2 is 200,
                        inputValid(Player2),
                        random(1, 3, Tebak2),
                        ((Tebak2 = 1 -> Mesin2 = 'head'); (Tebak2 = 2 -> Mesin2 = 'tail')),
                         ((Player2 = Mesin2 ->
                            mauMainLagi(Jawaban2), 
                            ((Jawaban2 = 'y' ->
                                Tagihan3 is 400,
                                inputValid(Player3),
                                random(1,3, Tebak3), 
                                ((Tebak3 = 1 -> Mesin3 = 'head'); (Tebak3 = 2 -> Mesin3 = 'tail')),
                                ((Player3 = Mesin3) ->
                                    (write('Selamat anda berhasil memenangkan game Koin Flip\n'), 
                                    Pendapatan is Tagihan3 * 2,
                                    format('Berikut adalah total uang yang anda dapatkan : ~w~N', [Pendapatan]),
                                    uangP(UangNow, X),
                                    UangAkhir is UangNow + Pendapatan,
                                    asetP(AsetNow, X),
                                    AsetAkhir is AsetNow + Pendapatan,
                                    retractall(uangP(_, X)), asserta(uangP(UangAkhir, X)),
                                    retractall(asetP(_, X)), asserta(asetP(AsetAkhir, X)), !) ;  
                                  (Player3 \= Mesin3) -> 
                                    (write('Sayang sekali tebakanmu masih salah sehingga kamu kalah :(\n'), !) ));
                              (Jawaban2 = 'n' -> 
                                write('Yahhh harusnya kamu lebih berani dongg\n'),
                                Pendapatan is Tagihan2 * 2,
                                format('Berikut adalah total uang yang anda dapatkan : ~w~N', [Pendapatan]),
                                uangP(UangNow, X),
                                UangAkhir is UangNow + Pendapatan,
                                asetP(AsetNow, X),
                                AsetAkhir is AsetNow + Pendapatan,
                                retractall(uangP(_, X)), asserta(uangP(UangAkhir, X)),
                                retractall(asetP(_, X)), asserta(asetP(AsetAkhir, X)), !) ));
                           (Player2 \= Mesin2 ->
                            write('Sayang sekali tebakanmu masih salah sehingga kamu kalah :(\n'), !) )); 
                        (Jawaban = 'n' -> 
                            write('Yahhh harusnya kamu lebih berani dongg\n'),
                            Pendapatan is Tagihan * 2,
                            format('Berikut adalah total uang yang anda dapatkan : ~w~N', [Pendapatan]),
                            uangP(UangNow, X),
                            UangAkhir is UangNow + Pendapatan,
                            asetP(AsetNow, X),
                            AsetAkhir is AsetNow + Pendapatan,
                            retractall(uangP(_, X)), asserta(uangP(UangAkhir, X)),
                            retractall(asetP(_, X)), asserta(asetP(AsetAkhir, X)), !) ) ); 
                    (Player \= Mesin ->
                        write('Sayang sekali tebakanmu masih salah sehingga kamu kalah :(\n'), !)) ); (Uang < 100 -> write('Uang kamu tidak cukup untuk bermain koin flip!\n'), !)));
                    (Input = 'n' -> write('Terima kasih telah berkunjung ke mini game koin flip!\n'), !) ), throwDice);
                    (write('Kamu sedang tidak berada di lokasi cf!\n'), !)).
