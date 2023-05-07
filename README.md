[![Open in Visual Studio Code](https://classroom.github.com/assets/open-in-vscode-c66648af7eb3fe8bc4f294546bfd86ef473780cde1dea487d3c4ff354943c9ae.svg)](https://classroom.github.com/online_ide?assignment_repo_id=9265621&assignment_repo_type=AssignmentRepo)
# Tugas-Besar-Logika-Komputasional-2022

## Daftar Isi
- [Deskripsi Singkat Permainan](#deskripsi-singkat-permainan)
- [Alur Cerita Permainan](#alur-cerita-permainan)
- [Sistematika File](#sistematika-file)
- [Tampilan Permainan](#tampilan-permainan)
- [Anggota Kelompok](#anggota-kelompok)

## Deskripsi Singkat Permainan
```
$$\                 $$\  $$\                 $$$$$$\             $$\           $$$$$$$\  $$\           $$\       $$\ 
$$ |                $$ | $  |               $$  __$$\            $$ |          $$  __$$\ \__|          $$ |      $$ |
$$ |      $$$$$$\ $$$$$$\\_/ $$$$$$$\       $$ /  \__| $$$$$$\ $$$$$$\         $$ |  $$ |$$\  $$$$$$$\ $$$$$$$\  $$ |
$$ |     $$  __$$\\_$$  _|  $$  _____|      $$ |$$$$\ $$  __$$\\_$$  _|        $$$$$$$  |$$ |$$  _____|$$  __$$\ $$ |
$$ |     $$$$$$$$ | $$ |    \$$$$$$\        $$ |\_$$ |$$$$$$$$ | $$ |          $$  __$$< $$ |$$ /      $$ |  $$ |\__|
$$ |     $$   ____| $$ |$$\  \____$$\       $$ |  $$ |$$   ____| $$ |$$\       $$ |  $$ |$$ |$$ |      $$ |  $$ |    
$$$$$$$$\\$$$$$$$\  \$$$$  |$$$$$$$  |      \$$$$$$  |\$$$$$$$\  \$$$$  |      $$ |  $$ |$$ |\$$$$$$$\ $$ |  $$ |$$\ 
\________|\_______|  \____/ \_______/        \______/  \_______|  \____/       \__|  \__|\__| \_______|\__|  \__|\__|
```
Let's Get Rich adalah permainan papan monopoli dengan menggunakan GNU Prolog. Permainan ini dibuat sebagai implementasi dari materi kuliah IF2121 Logika Komputasional yang mencakup rekurens, list, cut, fail, dan loop. Secara keseluruhan, aturan yang ada pada permainan ini sama seperti permainan papan monopoli pada umumnya. Pemain dapat bergerak dengan melempar dadu, membeli properti pada lokasi tertentu, masuk penjara, keliling dunia, mendapatkan chance card, dan lain-lain. Fitur dan spesifikasi lengkap dapat dilihat pada laporan yang disimpan pada folder "doc".

## Alur Cerita Permainan
"Duh utangku banyak banget," ucap si Dave di dalam pikirannya. Dave sendiri adalah seseorang yang baru saja lulus kuliah beberapa bulan lalu dan sekarang bekerja di perusahaan game Mono.Co yang sedang mengembangkan game monopoly di perangkat mobile. Akan tetapi, beberapa minggu lalu, Dave terkena penipuan miliaran rupiah yang membuatnya tidak bisa tidur karena harus membayar semua utangnya dalam 7 hari ke depan.

Di suatu sore, saat Dave berjalan-jalan di taman untuk menghilangkan penatnya, tiba-tiba ada pria berjas yang menghampirinya dan mengajaknya untuk bermain suatu permainan, tetapi Dave tidak mempedulikannya dan berkata "Enyahlah pak, saya lagi pengen beli truk." Lalu, pria itu berkata, "Kalau kamu ikut bermain, kamu bisa menang puluhan miliar rupiah loh". Mendengar itu pun, Dave langsung menoleh ke pria tersebut dan bertanya "Hah beneran nih, emangnya main permainan apa?" Pria itu pun menjelaskan bahwa permainan yang akan dimainkan adalah monopoly. Lalu, seketika itu juga, Dave mengiyakan ajakan pria tersebut karena dia merasa sangat paham dan pandai dalam bermain monopoly. Setelah itu, Dave pun mengikuti pria tersebut masuk ke dalam sebuah mobil dan tiba-tiba .....

"Hah, dimana aku?" kata Dave sambil kebingungan. Lalu, terdapat suara "Selamat datang peserta Let's Get Rich! Ini adalah permainan monopoly berukuran raksasa dengan diri sendiri sebagai pionnya. Bagi yang memenangkan permainan akan mendapatkan puluhan miliar rupiah, tetapi peserta yang kalah akan mendapatkan hukuman yang sangat berat hi hi hi hi". Dave yang mendengar pengumuman tersebut pun terkaget - kaget dan langsung mempersiapkan diri. Setelah itu, game pun dimulai. "Selamat Bermain"!

## Sistematika File
```
tugas-besar-logika-komputasional-2022-pushrankletsgetrich
├─── doc
│   ├─── Milestone1_pushRankLetsGetRich.txt
│   ├─── Milestone2_pushRankLetsGetRich.pdf
|   └─── Laporan_G27.pdf
├─── src
│   ├─── Fakta
│   │   ├─── kartu.pl
│   │   ├─── lokasi.pl
│   │   └─── properti.pl
|   ├─── Rule
│   |   ├─── akuisisiProperti.pl
│   |   ├─── bayarPajak.pl
│   |   ├─── bayarPenjara.pl
│   |   ├─── beliProperti.pl
│   |   ├─── buildableGo.pl
│   |   ├─── chanceCard.pl
│   |   ├─── checkLocationDetail.pl
│   |   ├─── checkPlayerDetail.pl
│   |   ├─── checkPropertyDetail.pl
│   |   ├─── coinFlip.pl
│   |   ├─── help.pl
│   |   ├─── keluarPenjara.pl
│   |   ├─── map.pl
│   |   ├─── masukPenjara.pl
│   |   ├─── mekanismeBankrut.pl
│   |   ├─── pakaiKartu.pl
│   |   ├─── parkirGratis.pl
│   |   ├─── passGo.pl
│   |   ├─── sewaProperti.pl
│   |   ├─── throwDice.pl
│   |   └─── worldTour.pl
|   └─── main.pl
└─── README.md
```
## Instruksi Pemakaian
- Download GNU Prolog di http://www.gprolog.org/<br><br>
- Extract ZIP Program<br><br>
- Jalankan main.pl file di dalam src<br><br>

## Tampilan Permainan
### Start Game
![ezgif com-gif-maker](https://user-images.githubusercontent.com/87570374/204196541-e50f7d8f-dacb-4030-b929-f11790ac4161.gif)

### Throw Dice
![ezgif com-gif-maker (4)](https://user-images.githubusercontent.com/87570374/204266745-27e05134-16fb-4dd7-804c-300f6051c785.gif)

### Beli Properti
![ezgif com-gif-maker (5)](https://user-images.githubusercontent.com/87570374/204266906-10be956f-e915-4bb8-9a99-f95442225431.gif)

### Quit Game
![ezgif com-gif-maker (6)](https://user-images.githubusercontent.com/87570374/204266768-2800d9f7-c5dc-41be-bda1-649966e742d4.gif)

## Anggota Kelompok
| NIM       | Nama                      |
| --------- | --------------------------|
| 13521124  | Michael Jonathan Halim    |
| 13521059  | Arleen Chrysantha Gunardi |
| 13521127  | Marcel Ryan Antony        |
| 13521143  | Raynard Tanadi            |
| 13521145  | Kenneth Dave Bahana       |
