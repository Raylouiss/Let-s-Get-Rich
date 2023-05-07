/* Include Fakta */
:- include('./Fakta/lokasi.pl').
:- include('./Fakta/properti.pl').
:- include('./Fakta/kartu.pl').

/* Include Rules */
:- include('./Rule/map.pl').
:- include('./Rule/throwDice.pl').
:- include('./Rule/passGo.pl').
:- include('./Rule/bayarPajak.pl').
:- include('./Rule/chanceCard.pl').
:- include('./Rule/keluarPenjara.pl').
:- include('./Rule/parkirGratis.pl').
:- include('./Rule/checkPropertyDetail.pl').
:- include('./Rule/checkLocationDetail.pl').
:- include('./Rule/help.pl').
:- include('./Rule/checkPlayerDetail.pl').
:- include('./Rule/worldTour.pl').
:- include('./Rule/beliProperti.pl').
:- include('./Rule/bayarPenjara.pl').
:- include('./Rule/mekanismebankrut.pl').
:- include('./Rule/pakaiKartu.pl').
:- include('./Rule/masukPenjara.pl').
:- include('./Rule/sewaProperti.pl').
:- include('./Rule/akuisisiProperti.pl').
:- include('./Rule/buildableGo.pl').
:- include('./Rule/coinFlip.pl').

:- dynamic(landMark/1).
:- dynamic(turn/1).

startGame :-
    createPlayerDetail(v),
    createPlayerDetail(w),
    asserta(turn(w)),
    asserta(countDice(0)),
    asserta(countDiceJail(0, v)),
    asserta(countDiceJail(0, w)),
    asserta(milikBangunan(a1, ' ')),
    asserta(milikBangunan(a2, ' ')),
    asserta(milikBangunan(a3, ' ')),
    asserta(milikBangunan(b1, ' ')),
    asserta(milikBangunan(b2, ' ')),
    asserta(milikBangunan(b3, ' ')),
    asserta(milikBangunan(c1, ' ')),
    asserta(milikBangunan(c2, ' ')),
    asserta(milikBangunan(c3, ' ')),
    asserta(milikBangunan(d1, ' ')),
    asserta(milikBangunan(d2, ' ')),
    asserta(milikBangunan(d3, ' ')),
    asserta(milikBangunan(e1, ' ')),
    asserta(milikBangunan(e2, ' ')),
    asserta(milikBangunan(e3, ' ')),
    asserta(milikBangunan(f1, ' ')),
    asserta(milikBangunan(f2, ' ')),
    asserta(milikBangunan(f3, ' ')),
    asserta(milikBangunan(g1, ' ')),
    asserta(milikBangunan(g2, ' ')),
    asserta(milikBangunan(g3, ' ')),
    asserta(milikBangunan(h1, ' ')),
    asserta(milikBangunan(h2, ' ')),
    asserta(tingkatBangunan(a1, ' ')),
    asserta(tingkatBangunan(a2, ' ')),
    asserta(tingkatBangunan(a3, ' ')),
    asserta(tingkatBangunan(b1, ' ')),
    asserta(tingkatBangunan(b2, ' ')),
    asserta(tingkatBangunan(b3, ' ')),
    asserta(tingkatBangunan(c1, ' ')),
    asserta(tingkatBangunan(c2, ' ')),
    asserta(tingkatBangunan(c3, ' ')),
    asserta(tingkatBangunan(d1, ' ')),
    asserta(tingkatBangunan(d2, ' ')),
    asserta(tingkatBangunan(d3, ' ')),
    asserta(tingkatBangunan(e1, ' ')),
    asserta(tingkatBangunan(e2, ' ')),
    asserta(tingkatBangunan(e3, ' ')),
    asserta(tingkatBangunan(f1, ' ')),
    asserta(tingkatBangunan(f2, ' ')),
    asserta(tingkatBangunan(f3, ' ')),
    asserta(tingkatBangunan(g1, ' ')),
    asserta(tingkatBangunan(g2, ' ')),
    asserta(tingkatBangunan(g3, ' ')),
    asserta(tingkatBangunan(h1, ' ')),
    asserta(tingkatBangunan(h2, ' ')),
    write('                         $$                  $$   $$                  $$$$$$              $$            $$$$$$$   $$            $$        $$  \n'),
    write('                         $$ |                $$ | $  |               $$  __$$             $$ |          $$  __$$   __|          $$ |      $$ |\n'),
    write('                         $$ |      $$$$$$  $$$$$$  _/ $$$$$$$        $$ /   __| $$$$$$  $$$$$$          $$ |  $$ |$$   $$$$$$$  $$$$$$$   $$ |\n'),
    write('                         $$ |     $$  __$$  _$$  _|  $$  _____|      $$ |$$$$  $$  __$$  _$$  _|        $$$$$$$  |$$ |$$  _____|$$  __$$  $$ |\n'),
    write('                         $$ |     $$$$$$$$ | $$ |     $$$$$$         $$ | _$$ |$$$$$$$$ | $$ |          $$  __$$< $$ |$$ /      $$ |  $$ | __|\n'),
    write('                         $$ |     $$   ____| $$ |$$    ____$$        $$ |  $$ |$$   ____| $$ |$$        $$ |  $$ |$$ |$$ |      $$ |  $$ |    \n'),
    write('                         $$$$$$$$  $$$$$$$    $$$$  |$$$$$$$  |       $$$$$$  | $$$$$$$    $$$$  |      $$ |  $$ |$$ | $$$$$$$  $$ |  $$ |$$  \n'),
    write('                         ________| _______|   ____/  _______/         ______/   _______|   ____/        __|   __| __|  _______| __|   __| __|\n\n'),
    write('*******************************************************************    Welcome to Lets Get Rich!    ********************************************************************\n'),
    write('***********************                                                                                                                          ***********************\n'),
    write('************************       "Duh utangku banyak banget", ucap si Dave di dalam pikirannya. Dave sendiri adalah seseorang yang baru           ************************\n'), 
    write('*************************  saja lulus kuliah beberapa bulan lalu dan sekarang bekerja di perusahaan game Mono.Co yang sedang mengembangkan     *************************\n'),
    write('************************** game monopoly di perangkat mobile. Akan tetapi, beberapa minggu lalu, Dave terkena penipuan miliaran rupiah yang   **************************\n'),
    write('*************************  membuatnya tidak bisa tidur karena harus membayar semua utangnya dalam 7 hari ke depan.                             *************************\n'),
    write('************************                                                                                                                        ************************\n'),
    write('***********************        Di suatu sore, saat Dave berjalan - jalan di taman untuk menghilangkan penatnya, tiba-tiba ada pria berjas        ***********************\n'), 
    write('************************   yang menghampirinya dan mengajaknya untuk bermain suatu permainan, tetapi Dave tidak mempedulikannya dan berkata     ************************\n'),
    write('*************************  "Enyahlah pak, saya lagi pengen beli truk." Lalu, pria itu berkata, "Kalau kamu ikut bermain, kamu bisa menang      *************************\n'),
    write('************************** puluhan miliar rupiah loh". Mendengar itu pun, Dave langsung menoleh ke pria tersebut dan bertanya "Hah beneran    **************************\n'),
    write('*************************  nih, emangnya main permainan apa?" Pria itu pun menjelaskan bahwa permainan yang akan dimainkan adalah monopoly.    *************************\n'), 
    write('************************   Lalu, seketika itu juga, Dave mengiyakan ajakan pria tersebut karena dia merasa sangat paham dan pandai dalam        ************************\n'),
    write('***********************    bermain monopoly. Setelah itu, Dave pun mengikuti pria tersebut masuk ke dalam sebuah mobil dan tiba - tiba .....     ***********************\n'),
    write('************************                                                                                                                        ************************\n'),
    write('*************************      "Hah, dimana aku?" kata Dave sambil kebingungan. Lalu, terdapat suara "Selamat datang peserta Let\'s Get Rich!  **************************\n'),
    write('************************** Ini adalah permainan monopoly berukuran raksasa dengan diri sendiri sebagai pionnya. Bagi yang memenangkan         **************************\n'),
    write('*************************  permainan akan mendapatkan puluhan miliar rupiah, tetapi peserta yang kalah akan mendapatkan hukuman yang sangat    *************************\n'),
    write('************************   berat hi hi hi hi". Dave yang mendengar pengumuman tersebut pun terkaget - kaget dan langsung mempersiapkan diri.    ************************\n'),
    write('***********************    Setelah itu, game pun dimulai. "Selamat Bermain"!                                                                     ***********************\n'),
    write('************************                                                                                                                        ************************\n'),
    write('*********************************************************************    Good Luck Have Fun :D    **********************************************************************\n'),
    write('*******************************************************    Panduan permainan game dapat diakses dalam <help.>    *******************************************************\n\n'),
    help.

quitGame :-
    asetP(AsetV,v),
    asetP(AsetW,w),
    ((AsetV > AsetW -> 
        winPlayerV);
     (AsetV < AsetW ->
        winPlayerW); draw),
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
    retractall(colorSet(_,_)),
    retractall(landMark(_)),
    retractall(countDice(_)),!,
    gameOver.

winPlayerV :-
    write('                                           __    __  _                                   ___  _ \n'),                                    
    write('                                          / / /\\ \\ \\(_) _ __   _ __    ___  _ __  _     / _ \\| |  __ _  _   _   ___  _ __   /\\   /\\ \n'), 
    write('                                          \\ \\/  \\/ /| || \'_ \\ | \'_ \\  / _ \\| \'__|(_)   / /_)/| | / _` || | | | / _ \\| \'__|  \\ \\ / / \n'),
    write('                                           \\  /\\  / | || | | || | | ||  __/| |    _   / ___/ | || (_| || |_| ||  __/| |      \\ V /   \n'),  
    write('                                            \\/  \\/  |_||_| |_||_| |_| \\___||_|   (_)  \\/     |_| \\__,_| \\__, | \\___||_|       \\_/    \n'), 
    write('                                                                                                        |___/ \n').
winPlayerW :-
    write('                                           __    __  _                                   ___  _                             __    __\n'), 
    write('                                          / / /\\ \\ \\(_) _ __   _ __    ___  _ __  _     / _ \\| |  __ _  _   _   ___  _ __  / / /\\ \\ \\ \n'),
    write('                                          \\ \\/  \\/ /| || \'_ \\ | \'_ \\  / _ \\| \'__|(_)   / /_)/| | / _` || | | | / _ \\| \'__| \\ \\/  \\/ / \n'),
    write('                                           \\  /\\  / | || | | || | | ||  __/| |    _   / ___/ | || (_| || |_| ||  __/| |     \\  /\\  /  \n'),
    write('                                            \\/  \\/  |_||_| |_||_| |_| \\___||_|   (_)  \\/     |_| \\__,_| \\__, | \\___||_|      \\/  \\/  \n'),
    write('                                                                                                        |___/                        \n').
draw :-
    write('                                                ____  ______  _    _____           ___            ____     ____     ___  _       __    __ \n'),
    write('                                               /  _/ /_  __/ ( )  / ___/          /   |          / __ \\   / __ \\   /   || |     / /   / / \n'),
    write('                                               / /    / /    |/   \\__ \\          / /| |         / / / /  / /_/ /  / /| || | /| / /   / /  \n'),
    write('                                             _/ /    / /         ___/ /         / ___ |        / /_/ /  / _, _/  / ___ || |/ |/ /   /_/   \n'),
    write('                                            /___/   /_/         /____/         /_/  |_|       /_____/  /_/ |_|  /_/  |_||__/|__/   (_)  \n').

gameOver :-
    write('\n\n=========================================================================================================================================================================\n\n'),
    write('                                          ______     ______     __    __     ______        ______     __   __   ______     ______   \n'),    
    write('                                         /\\  ___\\   /\\  __ \\   /\\ "-./  \\   /\\  ___\\      /\\  __ \\   /\\ \\ / /  /\\  ___\\   /\\  == \\  \n'),  
    write('                                         \\ \\ \\__ \\  \\ \\  __ \\  \\ \\ \\-./\\ \\  \\ \\  __\\      \\ \\ \\/\\ \\  \\ \\ \\ /   \\ \\  __\\   \\ \\  __<  \n'),
    write('                                          \\ \\_____\\  \\ \\_\\ \\_\\  \\ \\_\\ \\ \\_\\  \\ \\_____\\     \\ \\_____\\  \\ \\__|    \\ \\_____\\  \\ \\_\\ \\_\\ \n'),
    write('                                           \\/_____/   \\/_/\\/_/   \\/_/  \\/_/   \\/_____/      \\/_____/   \\/_/      \\/_____/   \\/_/ /_/  \n').