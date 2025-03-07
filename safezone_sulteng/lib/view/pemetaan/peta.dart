import 'package:flutter/material.dart';
import 'package:safezone_sulteng/view/pemetaan/detail_cluster1.dart';
import 'package:safezone_sulteng/view/widgets/bottom_navigation_bar.dart';

import 'package:flutter/material.dart';

class PetaPage extends StatefulWidget {
  @override
  _PetaPageState createState() => _PetaPageState();
}

class _PetaPageState extends State<PetaPage> {
  // Daftar lokasi marker dengan koordinat (x, y) dan informasi
  final List<Map<String, dynamic>> lokasiMarker = [
    {'x': 120.0, 'y': 100.0, 'nama': 'Sulawesi Tengah', 'info': 'Penduduk: 2.9 juta'},
    {'x': 180.0, 'y': 200.0, 'nama': 'Sulawesi Selatan', 'info': 'Penduduk: 8.8 juta'},
    {'x': 80.0, 'y': 50.0, 'nama': 'Sulawesi Utara', 'info': 'Penduduk: 2.6 juta'},
    {'x': 150.0, 'y': 250.0, 'nama': 'Sulawesi Tenggara', 'info': 'Penduduk: 2.7 juta'},
  ];

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
        centerTitle: true,
        title: Text(
          'Peta',
          style: TextStyle(
            fontSize: screenHeight * 0.022,
            fontWeight: FontWeight.w500,
          ),
        ),
        elevation: 0,
        toolbarHeight: screenHeight * 0.05,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Pemetaan Daerah Rawan Bencana Alam di Sulawesi Tengah',
                  style: TextStyle(
                    fontSize: screenWidth * 0.055,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenWidth * 0.04),
                Center(
                  child: Stack(
                    children: [
                      // Gambar peta sebagai latar belakang
                      Container(
                        width: double.infinity,
                        height: constraints.maxHeight * 0.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey, width: 0.75),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/petakuu.png', // Ganti dengan path peta Anda
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Marker interaktif
                      ...lokasiMarker.map((lokasi) {
                        return Positioned(
                          left: lokasi['x'], // Koordinat horizontal marker
                          top: lokasi['y'], // Koordinat vertikal marker
                          child: GestureDetector(
                            onTap: () {
                              // Dialog pop-up ketika marker diklik
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(lokasi['nama']),
                                    content: Text(lokasi['info']),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Tutup'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Icon(
                              Icons.location_on,
                              color: Colors.red,
                              size: 30,
                            ),
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
                SizedBox(height: screenWidth * 0.04),
                Text(
                  'Klik pada ikon untuk melihat informasi detail.',
                  style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.grey[700]),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
