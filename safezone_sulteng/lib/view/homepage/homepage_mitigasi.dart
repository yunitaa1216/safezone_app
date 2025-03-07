import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';
import 'dart:convert';

class MitigasiPage extends StatefulWidget {
  @override
  _MitigasiPageState createState() => _MitigasiPageState();
}

class _MitigasiPageState extends State<MitigasiPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    // Inisialisasi AnimationController
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500), // Durasi animasi
    )..repeat(reverse: true); // Animasi berulang
  }

  @override
  void dispose() {
    _animationController.dispose(); // Hapus AnimationController saat widget dihapus
    super.dispose();
  }

  Future<Map<String, dynamic>> fetchLatestEarthquakes() async {
    try {
      final response = await http.get(Uri.parse('https://data.bmkg.go.id/DataMKG/TEWS/gempaterkini.xml'));

      if (response.statusCode == 200) {
        final Xml2Json xml2json = Xml2Json();
        xml2json.parse(response.body);
        var jsonData = json.decode(xml2json.toParker());

        var earthquakes = jsonData['Infogempa']['gempa'];
        return earthquakes[0];
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
    return {};
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;

        return FutureBuilder<Map<String, dynamic>>(
          future: fetchLatestEarthquakes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No data available'));
            }

            var earthquake = snapshot.data!;
            List<String> coordinates = earthquake['point']['coordinates'].split(',');
            double latitude = double.parse(coordinates[0]);
            double longitude = double.parse(coordinates[1]);
            LatLng earthquakeLocation = LatLng(latitude, longitude);

            String earthquakeInfo = "Tanggal: ${earthquake['Tanggal']}\n"
                "Jam: ${earthquake['Jam']}\n"
                "Magnitude: ${earthquake['Magnitude']}\n"
                "Kedalaman: ${earthquake['Kedalaman']}\n"
                "Wilayah: ${earthquake['Wilayah']}\n"
                "Potensi: ${earthquake['Potensi']}";

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Temukan Bencana Terkini',
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Raleway',
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/pemetaaan');
                      },
                      child: Text(
                        'Lihat Semua',
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Raleway',
                          color: Color(0xFF646464),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenWidth * 0.02),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 250,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FlutterMap(
                            options: MapOptions(
                              initialCenter: earthquakeLocation,
                              initialZoom: 5.0,
                              minZoom: 3.0,
                              maxZoom: 18.0,
                            ),
                            children: [
                              TileLayer(
                                urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                                subdomains: ['a', 'b', 'c'],
                              ),
                              MarkerLayer(
                                markers: [
                                  Marker(
                                    point: earthquakeLocation,
                                    width: 40,
                                    height: 40,
                                    child: AnimatedBuilder(
                                      animation: _animationController,
                                      builder: (context, child) {
                                        return Opacity(
                                          opacity: _animationController.value, // Animasi opacity
                                          child: Icon(
                                            Icons.warning_amber,
                                            size: 30,
                                            color: Colors.red,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
  padding: const EdgeInsets.all(15.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center, // Teks dalam Column jadi di tengah
    mainAxisAlignment: MainAxisAlignment.center, // Menyesuaikan dengan tinggi layar jika diperlukan
    children: [
      Text(
        'Gempa Bumi Terkini',
        textAlign: TextAlign.center, // Memastikan teks rata tengah
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      SizedBox(height: 10),
      Text(
        earthquakeInfo,
        textAlign: TextAlign.left, // Memastikan teks rata tengah
        style: TextStyle(fontSize: 16),
      ),
    ],
  ),
),
                    ],
                  ),
                ),
                SizedBox(height: screenWidth * 0.05),
              ],
            );
          },
        );
      },
    );
  }
}