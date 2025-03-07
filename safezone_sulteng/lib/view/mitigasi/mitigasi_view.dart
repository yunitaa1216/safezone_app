import 'package:flutter/material.dart';
import 'package:safezone_sulteng/model/mitigasi_model/mitigasi_model.dart';
import 'package:safezone_sulteng/view/mitigasi/mitigasi_widget.dart';
import 'package:safezone_sulteng/view/widgets/bottom_navigation_bar.dart';

class MitigasiView extends StatelessWidget {
  const MitigasiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    List<MitigasiModel> mitigasiList = [
      MitigasiModel(
        judul: "Langkah Aman: Panduan Mitigasi Bencana Banjir",
        gambar: "assets/images/banjir.jpg",
        deskripsiBencana: "Banjir adalah bencana alam yang dapat menyebabkan kerusakan besar pada infrastruktur, lingkungan, dan kehidupan manusia. Untuk meminimalkan dampak negatifnya, penting untuk memahami langkah-langkah mitigasi yang efektif. Dalam panduan ini, kami akan memberikan tips dan strategi praktis untuk mempersiapkan diri dan mengurangi risiko banjir, sehingga Anda dan keluarga dapat menghadapi situasi ini dengan lebih aman dan terencana.",
        langkahMitigasi: [
          "Pahami Risiko dan Rencanakan Evakuasi. Identification area rawan banjir dan buat rencana evakuasi yang jelas.",
          "Tingkatkan Infrastruktur Rumah. Bangun dinding pelindung, pasang pintu dan jendela anti-banjir, serta tinggikan lantai rumah untuk mencegah masuknya air.",
          "Simpan Persediaan Darurat. Siapkan kotak darurat dengan makanan tahan lama, air bersih, obat-obatan, baterai, dan dokumen penting. Simpan dokumen penting di tempat yang aman dan mudah diakses.",
          "Perawatan Lingkungan dan Pemantauan Cuaca. Bersihkan saluran drainase dan parit secara rutin serta pantau informasi cuaca."
        ],
      ),
      MitigasiModel(
        judul: "Siaga dan Tangguh: Langkah Mitigasi Bencana Gempa",
        gambar: "assets/images/gempa.jpg",
        deskripsiBencana: "Banjir adalah bencana alam yang dapat menyebabkan kerusakan besar pada infrastruktur, lingkungan, dan kehidupan manusia. Untuk meminimalkan dampak negatifnya, penting untuk memahami langkah-langkah mitigasi yang efektif. Dalam panduan ini, kami akan memberikan tips dan strategi praktis untuk mempersiapkan diri dan mengurangi risiko banjir, sehingga Anda dan keluarga dapat menghadapi situasi ini dengan lebih aman dan terencana.",
        langkahMitigasi: [
          "Melakukan latihan evakuasi secara rutin.",
          "Menjauh dari benda-benda yang bisa jatuh saat gempa.",
          "Membangun struktur bangunan yang tahan gempa.",
          "Menyiapkan tas darurat dengan perlengkapan penting.",
          "Menghindari gedung tinggi selama gempa."
        ],
      ),
      MitigasiModel(
        judul: "Waspada! Ikuti Tindakan Mitigasi Bencana Kebakaran Hutan",
        gambar: "assets/images/kebakaran.jpg",
        deskripsiBencana: "Banjir adalah bencana alam yang dapat menyebabkan kerusakan besar pada infrastruktur, lingkungan, dan kehidupan manusia. Untuk meminimalkan dampak negatifnya, penting untuk memahami langkah-langkah mitigasi yang efektif. Dalam panduan ini, kami akan memberikan tips dan strategi praktis untuk mempersiapkan diri dan mengurangi risiko banjir, sehingga Anda dan keluarga dapat menghadapi situasi ini dengan lebih aman dan terencana.",
        langkahMitigasi: [
          "Tidak membuat api unggun di area hutan.",
          "Menghindari membakar sampah di tempat terbuka.",
          "Membangun jalur api pemisah di sekitar pemukiman.",
          "Melaporkan asap atau tanda-tanda kebakaran ke pihak berwenang.",
          "Menyiapkan alat pemadam kebakaran sederhana."
        ],
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFBDE1B9),
        toolbarHeight: screenHeight * 0.05,
        leading: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/homepage', (route) => false);
            },
          ),
        ),
        title: Center(
          child: Transform.translate(
            offset: Offset(0.0, 10.0),
            child: Text(
              'Mitigasi',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
        body: SingleChildScrollView(
        child: Container(
          // height: screenHeight, // Atur tinggi sesuai kebutuhan
          child: Column(
            children: [
              MitigasiWidget(mitigasiList: mitigasiList),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: 2,
        onItemTapped: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/homepage');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/peta');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/mitigasi');
          } else if (index == 3) {
            Navigator.pushNamed(context, '/profil');
          }
        },
      ),
    );
  }
}