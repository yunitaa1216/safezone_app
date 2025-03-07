import 'package:flutter/material.dart';
import 'package:safezone_sulteng/view/widgets/bottom_navigation_bar.dart';
import 'homepage_peta.dart'; // Import halaman peta
import 'homepage_mitigasi.dart'; // Import halaman mitigasi

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Menyimpan index yang dipilih

  // Fungsi untuk menangani tap pada item navigasi
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/homepage');
        break;
      case 1:
        Navigator.pushNamed(context, '/peta');
        break;
      case 2:
        Navigator.pushNamed(context, '/mitigasi');
        break;
      case 3:
        Navigator.pushNamed(context, '/profil');
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenHeight = constraints.maxHeight;
        final screenWidth = constraints.maxWidth;
        final containerHeight = screenHeight * 0.27; // Tinggi container hijau
        final imageSize = screenWidth * 0.4; // Lebar dan tinggi gambar

        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                // Stack untuk container hijau
                Stack(
                  children: [
                    Container(
                      color: Colors.white,
                      height: containerHeight + 20,
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFBDE1B9),
                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        height: containerHeight,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: screenHeight * 0.04),
                              Text(
                                'Bertindak Sekarang',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.05,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF0C0C0C),
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.008),
                              Text(
                                'Pantau dan ambil tindakan untuk melindungi diri dan orang-orang terdekat.',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.035,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF000000),
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Lihat Peta',
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.04,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF1E7F1D),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth * 0.08,
                                        vertical: screenHeight * 0.012,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                  Transform.translate(
                                    offset: Offset(0, -screenHeight * 0.02),
                                    child: Image.asset(
                                      'assets/images/home.png',
                                      width: imageSize,
                                      height: imageSize * 0.7,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // Pindahkan HomepagePeta sedikit ke atas
                Transform.translate(
                  offset: Offset(0, -screenHeight * 0.02), // Naikkan peta ke atas
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                    child: HomepagePeta(),
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, -screenHeight * 0.026), // Naikkan mitigasi sedikit
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                    child: MitigasiPage(),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: MyBottomNavigationBar(
            selectedIndex: _selectedIndex,
            onItemTapped: _onItemTapped,
          ),
        );
      },
    );
  }
}
