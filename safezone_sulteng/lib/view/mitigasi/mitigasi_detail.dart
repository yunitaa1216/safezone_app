import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:safezone_sulteng/model/mitigasi_model/mitigasi_model.dart';

class MitigasiDetailPage extends StatelessWidget {
  final MitigasiModel mitigasi;

 MitigasiDetailPage({required this.mitigasi});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFBDE1B9),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text(
            'Mitigasi',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        toolbarHeight: screenHeight * 0.05,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 13.0),
              Text(
                mitigasi.judul,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 18.0),
              Image.asset(
                mitigasi.gambar,
                width: MediaQuery.of(context).size.width, // Menyesuaikan lebar gambar dengan lebar layar
                fit: BoxFit.cover,
              ),
              SizedBox(height: 8.0),
              // Text(
              //   'Agar terhindar dari berbagai macam penyakit, ada banyak cara menjaga kesehatan tubuh yang bisa dilakukan. Dengan menerapkan cara-cara tersebut, kualitas hidup yang sehat dapat terjaga. Sebenarnya menerapkan berbagai cara menjaga kesehatan tubuh bukanlah hal yang sulit. Hanya saja, Anda harus konsisten dalam melakukannya. Hal ini perlu dibiasakan, mulai dari hal kecil seperti istirahat dengan cukup dan olahraga secara teratur.',
              //   style: TextStyle(fontSize: 16),
              // ),
              // SizedBox(height: 16.0),
              // Text(
              //   'Langkah-Langkah Mitigasi',
              //   style: TextStyle(
              //     fontWeight: FontWeight.bold,
              //     fontSize: 20,
              //   ),
              // ),
              // SizedBox(height: 8.0),
              Text(
                mitigasi.langkahMitigasi.join(", ") + ".", // Menggabungkan langkah-langkah mitigasi dalam satu kalimat
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 8.0),
              Text(
                'Langkah-Langkah Mitigasi Bencana Banjir',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 8.0),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(), // Mencegah konflik scroll dengan SingleChildScrollView
                itemCount: mitigasi.langkahMitigasi.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.check_circle, color: Color(0xFF1E7F1D)),
                    title: Text(
                      mitigasi.langkahMitigasi[index],
                      style: TextStyle(fontSize: 13),
                      textAlign: TextAlign.justify,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
