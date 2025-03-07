import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:safezone_sulteng/model/mitigasi_model/mitigasi_model.dart';
import 'package:safezone_sulteng/view/mitigasi/mitigasi_detail.dart';

class MitigasiWidget extends StatefulWidget {
  final List<MitigasiModel> mitigasiList;

  const MitigasiWidget({Key? key, required this.mitigasiList}) : super(key: key);

  @override
  State<MitigasiWidget> createState() => _MitigasiWidgetState();
}

class _MitigasiWidgetState extends State<MitigasiWidget> {
  Color _warna1 = Colors.white;
  Color _textColor1 = Colors.black;
  Color _warna2 = Colors.white;
  Color _textColor2 = Colors.black;
  Color _warna3 = Colors.white;
  Color _textColor3 = Colors.black;
  Color _warna4 = Colors.white;
  Color _textColor4 = Colors.black;
  Color _warna5 = Colors.white;
  Color _textColor5 = Colors.black;
  Color _warna6 = Colors.white;
  Color _textColor6 = Colors.black;

  String _searchKeyword = '';
  

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          //-------------- SEARCH BUTTON -----------------
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _searchKeyword = value.toLowerCase();
                  });
                },
                decoration: InputDecoration(
                  labelText: "Cari informasi mitigasi",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(0xFF979797),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Pilihan topik",
                ),
              ),
              SizedBox(height: 8,),
              //-----------Button Topic---------------------
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                               _warna1 = (_warna1 == Color(0xFF1E7F1D)) ? Color(0xFFFFFFFF) : Color(0xFF1E7F1D);
          _textColor1 = (_textColor1 == Colors.white) ? Colors.black : Colors.white;
        });
                          },
                          child: Text('Banjir',
                              style:
                                  TextStyle(color: _textColor1, fontSize: 14)),
                          style: ElevatedButton.styleFrom(backgroundColor: _warna1),
                        ),
                        SizedBox(width: 10.0),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                               _warna2 = (_warna2 == Color(0xFF1E7F1D)) ? Color(0xFFFFFFFF) : Color(0xFF1E7F1D);
          _textColor2 = (_textColor2 == Colors.white) ? Colors.black : Colors.white;
        });
                          },
                          child: Text('Gempa',
                              style:
                                  TextStyle(color: _textColor2, fontSize: 14)),
                          style: ElevatedButton.styleFrom(backgroundColor: _warna2),
                        ),
                        SizedBox(width: 10.0),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                               _warna3 = (_warna3 == Color(0xFF1E7F1D)) ? Color(0xFFFFFFFF) : Color(0xFF1E7F1D);
          _textColor3 = (_textColor3 == Colors.white) ? Colors.black : Colors.white;
        });
                          },
                          child: Text('Kebakaran Hutan',
                              style: TextStyle(color: _textColor3, fontSize: 14)),
                  style: ElevatedButton.styleFrom(backgroundColor: _warna3),
                ),
                        SizedBox(width: 10.0),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                               _warna4 = (_warna4 == Color(0xFF1E7F1D)) ? Color(0xFFFFFFFF) : Color(0xFF1E7F1D);
          _textColor4 = (_textColor4 == Colors.white) ? Colors.black : Colors.white;
        });
                          },
                          child: Text('Tanah Longsor',
                              style:
                                  TextStyle(color: _textColor4, fontSize: 14)),
                          style: ElevatedButton.styleFrom(backgroundColor: _warna4),
                ),
                        SizedBox(width: 10.0),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _warna5 = (_warna5 == Color(0xFF1E7F1D)) ? Color(0xFFFFFFFF) : Color(0xFF1E7F1D);
          _textColor5 = (_textColor5 == Colors.white) ? Colors.black : Colors.white;
        });
                          },
                          child: Text('Abrasi',
                              style:
                                  TextStyle(color: _textColor5, fontSize: 14)),
                          style: ElevatedButton.styleFrom(backgroundColor: _warna5),
                        ),
                        SizedBox(width: 10.0),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                               _warna6 = (_warna6 == Color(0xFF1E7F1D)) ? Color(0xFFFFFFFF) : Color(0xFF1E7F1D);
          _textColor6 = (_textColor6 == Colors.white) ? Colors.black : Colors.white;
        });
                          },
                          child: Text('Gunung Merapi',
                              style:
                                  TextStyle(color: _textColor6, fontSize: 14)),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: _warna6),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),
              //-----------------------Mitigasi LIST-----------------------------
              //-----------------------Mitigasi LIST-----------------------------
SingleChildScrollView(
  child: Column(
    children: [
      // Konten lain sebelum list
      ListView.builder(
        shrinkWrap: true, // Jangan ambil ruang tak terbatas
        physics: NeverScrollableScrollPhysics(), // Disable scroll karena di-wrap oleh SingleChildScrollView
        itemCount: widget.mitigasiList.length,
        itemBuilder: (context, index) {
          MitigasiModel mitigasi = widget.mitigasiList[index];
          if (mitigasi.judul.toLowerCase().contains(_searchKeyword)) {
            return buildMitigasiCard(mitigasi);
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    ],
  ),
),

            ],
          ),
        ],
      ),
    );
  }

  Widget buildMitigasiCard(MitigasiModel mitigasi) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MitigasiDetailPage(mitigasi: mitigasi),
        ),
      );
    },
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            mitigasi.gambar,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mitigasi.judul,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 5.0),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
}