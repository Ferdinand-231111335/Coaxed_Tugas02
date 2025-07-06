import 'package:flutter/material.dart';
import '../models/makhluk.dart';

class MakhlukProvider with ChangeNotifier {
  final List<Makhluk> _makhlukList = [
    Makhluk(
      nama: 'Ikan Lele',
      habitat: 'Air Tawar',
      kategori: 'Hewan',
      deskripsi:
          'Ikan lele. Dalam bahasa Inggris disebut pula airbreathing catfish, siluroid, mudfish dan walking catfish. Nama ilmiahnya, Clariidae, berasal dari bahasa Yunani chlaros, yang berarti ‘lincah’, ‘kuat’, merujuk pada kemampuannya untuk tetap hidup dan bergerak di luar air. Ikan-ikan keluarga Clariidae dikenali dari tubuhnya yang licin memanjang tak bersisik, dengan sirip punggung dan sirip anus yang juga panjang, yang kadang-kadang menyatu dengan sirip ekor. Lele memiliki tubuh yang lonjong seperti torpedo atau sangat panjang seperti sidat pendek. Kepalanya keras menulang di bagian atas, dengan mata yang kecil dan mulut lebar yang terletak di ujung moncong, dilengkapi dengan empat pasang sungut peraba (barbels) yang amat berguna untuk bergerak di air yang gelap. Beberapa spesies lele tidak bisa melihat.',
      status:
          'Salah satu spesies ikan lele, yaitu ikan lele raksasa Mekong (Pangasianodon gigas), terancam punah akibat penangkapan ikan yang berlebihan, hilangnya habitat, bendungan yang menghalangi jalur migrasi, serta adanya perubahan iklim. Ikan ini merupakan ikan air tawar terbesar dan terlangka didunia, dengan panjang mencapai hampir tiga meter dan berat hingga 300kg',
      gambar1: 'https://nas.er.usgs.gov/XIMAGESERVERX/2019/20191004074947.jpg',
      gambar2: 'https://asset-2.tstatic.net/kupang/foto/bank/images/ikan-lele-raksasa-268-meter.jpg',
    ),
    Makhluk(
      nama: 'Ikan Nila',
      habitat: 'Air Tawar',
      kategori: 'Hewan',
      deskripsi:
          'Ikan nila adalah sejenis ikan konsumsi air tawar. Ikan ini diperkenalkan dari Afrika, tepatnya Afrika bagian timur, pada tahun 1969, dan kini menjadi ikan peliharaan yang populer di kolam-kolam air tawar di Indonesia sekaligus hama di setiap sungai dan danau Indonesia. Nama ilmiahnya adalah Oreochromis niloticus, dan dalam bahasa Inggris dikenal sebagai Nile Tilapia. Tubuh berwarna kehitaman atau keabuan, dengan beberapa pita gelap melintang (belang) yang makin mengabur pada ikan dewasa. Ekor bergaris-garis tegak, 7–12 buah. Tenggorokan, sirip dada, sirip perut, sirip ekor, dan ujung sirip punggung dengan warna merah atau kemerahan (atau kekuningan) ketika musim berbiak. Ada garis gurat sisi pada bagian batang tubuh yang berfungsi untuk alat keseimbangan ikan pada saat berenang. Ikan nila dilaporkan sebagai pemakan segala (omnivora), ia dapat memakan hewan kecil lainnya seperti larva nyamuk dan plankton sampai aneka tumbuhan air seperti tanaman hydrilla dan ganggang air seperti enteromorpha, sehingga ikan ini dapat dimanfaatkan sebagai pengendali gulma air. Karena mudahnya dipelihara dan dibiakkan, ikan ini segera diternakkan di banyak negara sebagai ikan konsumsi, termasuk di pelbagai daerah di Indonesia. Akan tetapi mengingat rasa dagingnya yang tidak istimewa, ikan nila juga tidak pernah mencapai harga yang tinggi. Di samping dijual dalam keadaan segar, daging ikan nila sering pula dijadikan filet.',
      status:
          'Ikan nila tidak dalam kondisi terancam punah secara global. Ikan nila dikenal sebagai salah satu spesies invasif yang paling luas penyebarannya. Namun, ikan nila asli, seperti Oreochromis amphimelas, diklasifikasikan sebagai terancam punah oleh IUCN karena ancaman dari penangkapan ikan yang berlebihan, polusi, dan perubahan iklim. Spesies ini menjadi lebih rentan terhadap ancaman lain, termasuk ikan nila invasif. ',
      gambar1: 'https://assets.pikiran-rakyat.com/crop/0x0:0x0/1200x675/photo/2023/03/14/3275053706.jpg',
      gambar2: 'https://inaturalist-open-data.s3.amazonaws.com/photos/6252392/original.jpeg',
    ),
    Makhluk(
      nama: 'Ikan Patin',
      habitat: 'Air Tawar',
      kategori: 'Hewan',
      deskripsi:
          'Ikan Patin (Pangasius pangasius) merupakan salah satu ikan asli perairan Indonesia, yang merupakan kelompok ikan berkumis dalam ordo (Siluriformes). Ikan patin mirip dengan ikan lele, meskipun keduanya termasuk dalam kelompok ikan lele (catfish). Ikan lele memiliki tubuh yang lebih lebar dan bisa tumbuh sangat besar, sedangkan ikan patin memiliki tubuh yang lebih ramping dan tidak berlemak. Ikan patin memiliki ukuran tubuh yang dapat mencapai 120 cm, tidak bersisik, dan memiliki mulut di ujung kepala agak ke bawah, ciri khas catfish. Mereka omnivora, makan segala, termasuk cacing, ikan rucah, dan limbah peternakan. Ciri-ciri umum dari ikan patin yaitu memiliki tubuh berwarna putih perak, dua pasang kumis yang pendek, tidak bersisik, dan senang berkelompok. Habitat ikan patin berada di tepian sungai besar, muara sungai, dan danau.',
      status:
          'Ikan patin (Pangasius spp.) tidak terancam punah secara keseluruhan karena mudah dibudidayakan, tetapi beberapa spesies ikan patin, khususnya Pangasius raksasa, mengalami penurunan populasi yang signifikan dan dianggap sangat terancam punah. Penyebab penurunan populasi ikan patin di beberapa daerah meliputi penangkapan ikan yang berlebihan, pencemaran sungai, dan perubahan habitat. ',
      gambar1: 'https://1.bp.blogspot.com/-qqzJJcT-rXc/T5A4_tCS_iI/AAAAAAAAH_k/-ujrjtRTPrY/s1600/ikan_patin_pangasius_larnaudii.jpg',
      gambar2: 'https://tnaqua.org/app/uploads/2020/05/cropped-ID_GiantPangasiusCatfish_1200x490.jpg',
    ),
    Makhluk(
      nama: 'Ikan Tambakan',
      habitat: 'Air Tawar',
      kategori: 'Hewan',
      deskripsi:
          'Ikan tembakang atau Tambakan (Helostoma temminckii) adalah salah satu jenis ikan air tawar yang berasal dari wilayah tropis, tepatnya Asia Tenggara. Ikan ini tersebar secara alami di Indonesia (Sumatra, Jawa, Kalimantan), Thailand, Malaysia (Asia Tenggara) hingga akhirnya diintroduksi ke seluruh dunia. Ikan ini juga dikenal dengan nama (Gurami Pencium/Kissing Gourami) dalam penamaan Internasional, hal ini dikarenakan kebiasaannya "mencium" saat mengambil makanan dari permukaan benda padat maupun saat berduel antara sesama pejantan. Di Indonesia sendiri, ikan ini memiliki banyak nama seperti Ikan bulan-bulan, Ikan biawan, hingga ikan samarinda. Ikan tambakan memiliki tubuh berbentuk pipih vertikal. Sirip punggung dan sirip analnya memiliki bentuk dan ukuran yang hampir serupa. Sirip ekornya sendiri berbentuk nyaris bundar atau mengarah cembung ke luar, sementara sirip dadanya yang berjumlah sepasang juga berbentuk nyaris bundar. Di kedua sisi tubuhnya terdapat gurat sisi, pola berupa garis tipis yang berawal dari pangkal celah insangnya sampai pangkal sirip ekornya. Kurang lebih ada sekitar 43-48 sisik yang menyusun gurat sisi tersebut. Ikan tambakan diketahui bisa tumbuh hingga ukuran 30 sentimeter. Ikan tambakan adalah ikan omnivora yang mau memakan hampir segala jenis makanan. Makanannya bervariasi, mulai dari lumut, tanaman air, zooplankton, hingga serangga air.',
      status:
          'Ikan tambakan mudah dibudidayakan karena memiliki kemampuan adaptasi yang tinggi terhadap kondisi perairan, termasuk yang memiliki kadar oksigen terlarut rendah, tetapi populasinya sedang mengalami penurunan dan terancam kepunahan di beberapa daerah. Penangkapan ikan secara terus-menerus tanpa adanya upaya pelestarian merupakan salah satu penyebab utama penurunan populasi ikan tambakan.  ',
      gambar1: 'https://upload.wikimedia.org/wikipedia/commons/2/20/Kissfish.jpg',
      gambar2: 'https://media.istockphoto.com/id/1226781777/id/foto/kiising-gourami-helostoma-temminckii.jpg?s=612x612&w=0&k=20&c=BqVW3LFo2mAqGrVV3PAKoJmGJOj7EKIVQbAecvG6wL0=',
    ),
    Makhluk(
      nama: 'Ikan Gurame',
      habitat: 'Air Tawar',
      kategori: 'Hewan',
      deskripsi:
          'Gurami atau gurame (Osphronemus goramy) adalah sejenis ikan air tawar yang populer sebagai ikan konsumsi di Asia Tenggara dan Asia Selatan. Di samping itu, gurami juga sering dipelihara dalam akuarium. Ikan gurami memiliki tubuh memanjang dan pipih, dengan sisik besar yang menutupi seluruh tubuhnya. Warna tubuhnya bervariasi dari putih, silver, hingga keemasan. Ia juga memiliki dua sirip perut panjang seperti benang dan dapat bernapas melalui organ labirin seperti ikan cupang. Ikan gurami adalah omnivora yang menyukai berbagai jenis makanan, baik tumbuhan maupun hewan. Pakan alami seperti daun-daunan, kutu air, dan maggot merupakan pilihan yang baik. Selain itu, ikan gurami juga dapat diberi makan pelet, jagung rebus, ampas tahu, dan berbagai jenis pakan alternatif lainnya. Ikan gurami umumnya hidup di perairan tawar yang tenang seperti rawa, situ, danau, serta kolam. Mereka juga bisa ditemukan di sungai yang alirannya lambat dan lahan basah. Ikan gurami lebih suka lingkungan dengan air yang tidak terlalu deras. ',
      status:
          'Ikan gurame berpotensi mengalami ancaman punah, meskipun tidak termasuk dalam kategori terancam punah secara global saat ini. Beberapa faktor yang menyebabkan ancaman ini antara lain perburuan liar, perusakan habitat, dan perubahan kualitas air. Ikan gurame merupakan ikan yang banyak dikonsumsi, sehingga perburuan liar untuk memenuhi kebutuhan pasar bisa mengurangi populasinya. ',
      gambar1: 'https://unair.ac.id/wp-content/uploads/2022/09/Foto-oleh-aquadiction.world_.jpg',
      gambar2: 'https://dkpp.bulelengkab.go.id/uploads/konten/membuat-sendiri-pakan-alternatif-ikan-gurami-51.jpg',
    ),
    Makhluk(
      nama: 'Teratai',
      habitat: 'Air Tawar',
      kategori: 'Tumbuhan',
      deskripsi:
          'Teratai (Nymphaea) adalah nama genus untuk tanaman air dari suku Nymphaeaceae. Dalam bahasa Inggris dikenal sebagai water-lily atau waterlily. Di Indonesia, teratai juga digunakan untuk menyebut tanaman dari genus Nelumbo (lotus). Tanaman tumbuh di permukaan air yang tenang. Bunga dan daun terdapat di permukaan air, keluar dari tangkai yang berasal dari rhizoma yang berada di dalam lumpur pada dasar kolam, sungai atau rawa. Tangkai terdapat di tengah-tengah daun. Daun berbentuk bundar atau bentuk oval yang lebar yang terpotong pada jari-jari menuju ke tangkai. Permukaan daun tidak mengandung lapisan lilin sehingga air yang jatuh ke permukaan daun tidak membentuk butiran air. Bunga terdapat pada tangkai yang merupakan perpanjangan dari rimpang. Diameter bunga antara 5–10 cm. Buah teratai berwarna coklat dengan panjang 16,55 mm (15,88-17,23 mm) dan diameter 17,33 mm (15,54-19,12 mm); bentuk buah bulat tanpa tangkai; diameter 10–11 mm. Jumlah biji dalam buah: 750 biji. Teratai merupakan tanaman air yang unik. Teratai yang tumbuh di air yang sangat berlumpur (kotor, coklat), warna bunganya lebih cemerlang. Warna bunga bila putih lebih putih, bila merah lebih merah, bila merah muda makin terang warnanya.',
      status:
          'Secara umum, teratai (Nymphaea dan Nelumbo) belum termasuk spesies yang terancam punah secara global, tetapi beberapa jenisnya dapat terancam di wilayah tertentu akibat perusakan habitat, polusi air, invasi spesies asing, dan perubahan iklim. Misalnya, di Asia Selatan, Nelumbo nucifera (teratai suci) mulai menurun karena pencemaran dan alih fungsi lahan, sementara di Australia, spesies Nymphaea endemik terancam oleh kekeringan ekstrem. Meskipun sebagian besar spesies masih tergolong aman, pelestarian ekosistem air tawar sangat penting untuk menjaga keberlangsungan tanaman ini.',
      gambar1: 'https://awsimages.detik.net.id/community/media/visual/2023/09/24/bunga-teratai_169.jpeg?w=1200',
      gambar2: 'https://www.illinoiswildflowers.info/wetland/photos/sacred_lotus1.jpg',
    ),
    Makhluk(
      nama: 'Ikan Tuna',
      habitat: 'Air Asin',
      kategori: 'Hewan',
      deskripsi:
          'Tuna adalah ikan laut pelagik yang termasuk tribus Thunnini. Ikan ini adalah perenang andal (pernah diukur mencapai 77 km/jam). Tuna memiliki bentuk tubuh yang sedikit banyak mirip dengan torpedo, disebut fusiform, sedikit memipih di sisi-sisinya dan dengan moncong meruncing. Sirip punggung (dorsal) dua berkas, sirip punggung pertama berukuran relatif kecil dan terpisah dari sirip punggung kedua. Di belakang sirip punggung dan sirip dubur (anal) terdapat sederetan sirip-sirip kecil tambahan yang disebut finlet. Di kedua sisi batang ekor masing-masing terdapat dua lunas samping berukuran kecil; Tubuh kebanyakan dengan wilayah barut badan (corselet), yakni bagian di belakang kepala dan di sekitar sirip dada yang ditutupi oleh sisik-sisik yang tebal dan agak besar. Bagian tubuh sisanya bersisik kecil atau tanpa sisik. Aspek yang luar biasa dari fisiologi tuna adalah kemampuannya untuk menjaga suhu tubuh lebih tinggi daripada suhu lingkungan. Sebagai contoh, tuna sirip biru dapat mempertahankan suhu tubuh 75-95 °F (24-35 °C), dalam air dingin bersuhu 43 °F (6 °C). Namun, tidak seperti makhluk endotermik seperti mamalia dan burung, ikan tuna tidak dapat mempertahankan suhu dalam kisaran yang relatif sempit',
      status:
          'Beberapa populasi tuna sirip biru, terutama di Atlantik dan Pasifik, mengalami penangkapan berlebihan dan bahkan terancam punah. Tuna sirip biru Atlantik pernah dimasukkan dalam daftar spesies terancam punah dalam daftar merah IUCN. ',
      gambar1: 'https://aruna.id/wp-content/uploads/2021/01/yellowfin-tuna.jpg',
      gambar2: 'https://media.istockphoto.com/id/1334255833/id/foto/albacore-tuna-thunnus-alalunga-ikan-terisolasi.jpg?s=612x612&w=0&k=20&c=Uskns-DQgEr3Fu_9Bj-OVNICE9opqJBFJ6SKvUQ1Fw8=',
    ),
    Makhluk(
      nama: 'Ikan Hiu Putih Besar',
      habitat: 'Air Asin',
      kategori: 'Hewan',
      deskripsi:
          'Hiu putih besar ( Carcharodon carcharias ) adalah spesies hiu lamniformes yang dikenal karena ukurannya yang besar, dengan individu terbesar mencapai panjang 6 meter dan berat 1.100 kg. Mereka adalah predator puncak di lautan, memakan berbagai hewan seperti singa laut, anjing laut, dan ikan besar. Hiu putih besar terkenal karena ukurannya, dengan spesimen betina terbesar yang diawetkan berukuran panjang 5,83 m (19,1 kaki) dan berat sekitar 2.000 kg (4.400 pon) saat dewasa. Namun, sebagian besar lebih kecil; jantan berukuran 3,4 hingga 4,0 m (11 hingga 13 kaki), dan betina berukuran 4,6 hingga 4,9 m (15 hingga 16 kaki) rata-rata. Menurut sebuah studi tahun 2014, umur hiu putih besar diperkirakan mencapai 70 tahun atau lebih, jauh di atas perkiraan sebelumnya, menjadikannya salah satu ikan bertulang rawan dengan umur terpanjang yang diketahui saat ini. Menurut studi yang sama, hiu putih besar jantan membutuhkan waktu 26 tahun untuk mencapai kematangan seksual, sedangkan hiu putih besar betina membutuhkan waktu 33 tahun untuk siap menghasilkan keturunan. Hiu putih besar dapat berenang dengan kecepatan 25 km/jam (16 mph) untuk waktu yang singkat dan hingga kedalaman 1.200 m (3.900 kaki). Hiu putih besar bisa dibilang merupakan ikan makropredator terbesar yang masih ada di dunia, dan merupakan salah satu predator utama mamalia laut , seperti pinniped dan lumba-lumba . Hiu putih besar juga dikenal memangsa berbagai hewan lain, termasuk ikan , hiu lain, dan burung laut . Ia hanya memiliki satu predator alami yang tercatat, yaitu orca .',
      status:
          'Hiu putih besar tergolong rentan karena pertumbuhannya lambat, memiliki umur panjang, berkembang biak di usia tua, dan jumlah anak yang dilahirkan sedikit. Selain itu, hiu putih besar juga menjadi target perburuan untuk diambil sirip dan giginya, serta sering dijadikan trofi olahraga memancing. Penangkapan ikan berlebihan dan perubahan iklim juga merupakan salah satu penyebabnya, karena dapat menyebabkan penurunan populasi mangsa utama hiu putih besar, seperti anjing laut dan ikan, yang berakibat pada penurunan populasi hiu putih besar.',
      gambar1: 'https://ichef.bbci.co.uk/ace/ws/640/amz/worldservice/live/assets/images/2014/01/09/140109024443_great_white_shark_512x288_a_nocredit.jpg.webp',
      gambar2: 'https://cdn.idntimes.com/content-images/community/2023/11/2000px-great-white-shark-14730744390-3241d69518fb4418eb841c3d4dc24ca6-2f798ec5ef6b2ca0da44088ef0622194_600x400.jpg',
    ),
    Makhluk(
      nama: 'Penyu Laut Hijau',
      habitat: 'Air Asin',
      kategori: 'Hewan',
      deskripsi:
          'Penyu hijau (Chelonia mydas) adalah penyu laut besar yang termasuk dalam keluarga Cheloniidae. Hewan ini adalah satu-satunya spesies dalam golongan Chelonia. Mereka hidup di semua laut tropis dan subtropis, terutama di Samudera Atlantik dan Samudera Pasifik. Namanya didapat dari lemak bewarna hijau yang terletak di bawah cangkang mereka. Penyu hijau dapat berenang hingga 40 mil per jam, menjadikannya penyu laut tercepat. [ 88 ] Penyu hijau menunjukkan perbedaan jenis kelamin melalui perkembangan dan penampilannya. Sebagai penyu dewasa, penyu jantan mudah dibedakan dari penyu betina karena memiliki ekor yang lebih panjang (tampak memanjang melewati cangkang) dan cakar yang lebih panjang pada sirip depan. Waktu penetasan dan jenis kelamin penyu ditentukan oleh suhu inkubasi sarang. Penetasan terjadi lebih cepat di sarang yang lebih hangat daripada sarang yang berada dalam kondisi lebih dingin. Lokasi bersarang yang hangat di atas 30 derajat Celsius mendukung perkembangan betina, sedangkan lokasi bersarang di bawah 30 derajat Celsius menghasilkan jantan. Posisi telur di sarang juga memengaruhi penentuan jenis kelamin. Telur di tengah cenderung menetas sebagai betina karena kondisi yang lebih hangat di dalam sarang. Penyu hijau memainkan peran penting dalam ekosistem tempat mereka tinggal. Di padang lamun, penyu memakan lamun dengan cara memotong bagian atas saja dan menyisakan akarnya. Melalui teknik makan mereka, penyu membantu meningkatkan kesehatan dan pertumbuhan padang lamun. Padang lamun yang sehat yang disediakan oleh penyu menyediakan habitat dan tempat makan bagi banyak spesies ikan dan krustasea.',
      status:
          'Penyu laut hijau terancam punah karena berbagai faktor, termasuk perburuan dan eksploitasi untuk diambil daging, telur, dan kulitnya, kerusakan habitat akibat pembangunan pesisir, pencemaran, perubahan iklim, dan tangkapan sampingan dalam kegiatan perikanan. Banyak penyu juga mati karena mengira plastik berbahaya sebagai ubur-ubur yang lezat.',
      gambar1: 'https://assets.pikiran-rakyat.com/crop/0x0:0x0/1200x675/photo/2024/03/26/817493036.jpg',
      gambar2: 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiaSZIdPx5v46oe4NL4t6qkLxqk9z9p3r0TZzAQjutwIsgzsPUN272XIdvV3CYPIXnw4M1-5ERH_HGGIk-9hZUBAJzJL-3aiBsG2PfIgX4a7T5RgITx52VzBhpooxYv-EDEUyqldBVfUdL6/s704/green+sea+turtle+grazing.jpg',
    ),
    Makhluk(
      nama: 'Paus Biru',
      habitat: 'Air Asin',
      kategori: 'Hewan',
      deskripsi:
          'Paus biru (Balaenoptera musculus) adalah mamalia laut yang tergolong dalam subordo paus balin. Panjangnya mencapai lebih dari 33 meter dan massanya tercatat sebesar 181 ton atau lebih. Binatang ini diyakini merupakan hewan terbesar yang pernah diketahui. Paus biru memiliki tubuh yang panjang dan tampak membentang bila dibandingkan dengan tubuh paus lain. Kepalanya datar, berbentuk seperti huruf U, dan memiliki punggung yang terbentang dari lubang sembur hingga bagian bibir atas. Bagian depan mulut dipenuhi oleh plat balin (terdapat sekitar 300 plat, dan masing-masing panjangnya sekitar satu meter) yang tergantung di rahang atas. Antara 70 hingga 118 lekukan (disebut plat ventral) membentang di sepanjang leher dan sejajar dengan panjang tubuh. Plat ini membantu mengeluarkan air dari mulut setelah makan Paus biru dapat menempuh kecepatan 50 kilometer per jam (31 mph) (biasanya ketika berinteraksi dengan paus lain), namun kecepatannya biasanya hanya 20 kilometer per jam (12 mph). Ketika makan, kecepatan berkurang hingga 5 kilometer per jam (3,1 mph). Paus biru kebanyakan hidup sendiri atau dengan individu lain. Tidak diketahui berapa lama paus hidup bersama. Di tempat berlimpahnya makanan, terdapat 50 paus biru di wilayah yang kecil. Namun, mereka tidak membentuk kelompok yang besar (tidak seperti paus balin lainnya). Makanan pokok paus biru adalah krill, meskipun mereka juga memakan copepoda dalam jumlah kecil. Spesies zooplankton ini dimakan oleh berbagai paus biru dari satu samudra ke samudra lain.',
      status:
          'Saat ini, paus biru terdaftar sebagai spesies yang terancam punah berdasarkan Undang-Undang Spesies Terancam Punah dan dilindungi berdasarkan Undang-Undang Perlindungan Mamalia Laut. Paus biru terancam punah karena berbagai faktor, terutama perburuan paus komersial di masa lalu, polusi suara, dan gangguan habitat akibat perubahan iklim serta aktivitas manusia lainnya seperti tabrakan kapal dan peralatan penangkapan ikan. ',
      gambar1: 'https://img.okezone.com/content/2023/03/14/624/2780890/deretan-fakta-paus-biru-yang-jarang-diketahui-banyak-orang-o9rVlrtaPc.jpg',
      gambar2: 'https://awsimages.detik.net.id/community/media/visual/2021/06/18/paus-biru-pygmy_169.png?w=650',
    ),
    Makhluk(
      nama: 'Kuda Laut',
      habitat: 'Air Asin',
      kategori: 'Hewan',
      deskripsi:
          'Kuda laut adalah jenis ikan yang hidup di laut dari genus Hippocampus dan famili Syngnathidae. Hewan dengan ukuran yang bervariasi antara 16 mm (untuk spesies Hippocampus denise) sampai 35 cm ini dapat ditemukan di perairan tropis dan menengah di seluruh dunia. Kuda laut merupakan satu-satunya spesies yang jantannya dapat hamil. Kuda laut betina memiliki kantung di depan perutnya dan menaruh telurnya di sana. Sang jantan akan mengerami dan membawa telur ini hingga menetas. Sirip dorsal pada kuda laut terletak pada bagian bawah sedangkan sirip pektoralnya terletak pada bagian kepala, di dekat insang. Beberapa spesies kuda laut berwarna transparan sebagian, sehingga tidak mudah terlihat. Kuda laut memakan lebih dari 3000 plankton setiap hari. Mereka mencari makan dengan cara menyangkutkan diri di rumput-rumput laut dan terumbu karang dengan ekor dan mengisap makanan serta plankton dengan moncongnya. Kuda laut tidak memiliki gigi dan perut untuk memproses makanan, sehingga makanan yang mereka konsumsi melewati pencernaan mereka dengan cepat, mereka harus makan setiap saat untuk bertahan hidup.',
      status:
          'Kuda laut terancam punah karena berbagai faktor, terutama karena hilangnya habitat akibat pembangunan pesisir, polusi, dan perusakan ekosistem, serta penangkapan berlebihan untuk perdagangan tradisional dan pasar gelap. Selain itu, perubahan iklim juga berdampak pada habitat mereka. Kuda laut ditangkap dan dijual secara ilegal untuk memenuhi permintaan pasar gelap di negara-negara seperti China, Vietnam, dan Indonesia, yang memperburuk ancaman terhadap kelangsungan hidup mereka. ',
      gambar1: 'https://dkpp.bulelengkab.go.id/uploads/konten/kuda-laut-ikan-paling-setia-dengan-pasangannya-14.jpeg',
      gambar2: 'https://cdn.idntimes.com/content-images/post/20200825/c1a-be481cd932bac03fb12e1dc07cb81873_600x400.jpg',
    ),
    Makhluk(
      nama: 'Rumput Laut',
      habitat: 'Air Asin',
      kategori: 'Tumbuhan',
      deskripsi:
          'Rumput laut atau Gulma laut (bahasa Inggris: seaweed) merupakan salah satu sumber daya hayati yang umumnya dapat ditemukan banyak di daerah interdal atau perairan payau dengan cahaya matahari yang cukup. Rumput laut merupakan ganggang yang hidup di laut dan tergolong dalam divisi thallophyta. Rumput laut termasuk tumbuhan tingkat rendah, sebab rumput laut mempunyai sifat tidak bisa dibedakan antara bagian akar, batang, dan daun. Seluruh bagian pada rumput laut disebut dengan thallus, di mana bentuk thallus rumput laut bermacam-macam, ada yang bulat seperti tabung, pipih, gepeng, bulat, dan lain sebagainya. Rumput laut memiliki banyak manfaat penting bagi manusia. Kandungan  utama  rumput  laut adalah karbohidrat, protein dan lemak. Kandungan nutrisi yang  tinggi dan kaya antioksidan membuat rumput laut dapat dimanfaatkan dalam berbagai bidang industri. Rumput laut umumnya berwarna hijau, coklat, atau merah. Rumput laut hidup menempel di batu atau karang; menjadi habitat dan sumber makanan bagi banyak hewan laut.',
      status:
          'Status kepunahan rumput laut saat ini bervariasi di berbagai wilayah, namun secara umum, ada indikasi bahwa rumput laut mengalami penurunan di berbagai tempat di seluruh dunia, termasuk di Semenanjung Monterey. Hal ini disebabkan oleh berbagai faktor, termasuk perubahan iklim, polusi, pemanenan berlebihan, dan spesies invasif. ',
      gambar1: 'https://www.faunadanflora.com/wp-content/uploads/2017/01/Budidaya-Rumput-Laut.jpg',
      gambar2: 'https://www.aciar.gov.au/sites/default/files/2020-11/Seaweed%20feature%201.jpg',
    ),
  ];

  List<Makhluk> get makhlukList => _makhlukList;

  List<Makhluk> get makhlukAirTawar {
    return _makhlukList.where((makhluk) => makhluk.habitat == 'Air Tawar').toList();
  }

  List<Makhluk> get makhlukAirAsin {
    return _makhlukList.where((makhluk) => makhluk.habitat == 'Air Asin').toList();
  }

  void addMakhluk(Makhluk makhluk) {
    _makhlukList.add(makhluk);
    notifyListeners();
  }
}
