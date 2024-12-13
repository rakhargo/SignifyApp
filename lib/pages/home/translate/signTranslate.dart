import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Tambahkan ini untuk clipboard
import '../../../components/bottom_bar.dart';
import '../../../pages/home/profile/profile.dart';
import '../../../pages/home/guide/guide.dart';
import '../../../pages/home/history/history.dart';
import '../../../pages/home/home.dart';
import '../../../pages/home/translate/textTranslate.dart'; // Pastikan untuk mengimpor halaman textTranslate

class SignTranslate extends StatefulWidget {
  const SignTranslate({super.key});

  @override
  State<SignTranslate> createState() => _SignTranslateState();
}

class _SignTranslateState extends State<SignTranslate> {
  final TextEditingController _textController = TextEditingController(); // Kontroler untuk input teks
  bool _isHovering = false;
  bool _isHoveringTulisan = false;
  bool _isHoveringSwitch = false;
  bool _isHoveringIsyarat = false;
  bool _isTulisanFirst = true; // Menyimpan urutan tombol

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 2;

    void _onItemTapped(int index) {
      switch (index) {
        case 0:
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
          break;
        case 1:
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Guide()));
          break;
        case 2:
          Navigator.push(context, MaterialPageRoute(builder: (context) => const SignTranslate()));
          break;
        case 3:
          Navigator.push(context, MaterialPageRoute(builder: (context) => const History()));
          break;
        case 4:
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Profile()));
          break;
      }
      setState(() {
        _selectedIndex = index; // Update index yang dipilih
      });
    }

    // Fungsi untuk menyalin teks ke clipboard
    void _copyToClipboard() {
      Clipboard.setData(ClipboardData(text: _textController.text)).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Teks disalin ke clipboard')),
        );
      });
    }

    // Fungsi untuk menukar posisi dan navigasi ke halaman textTranslate
    void _swapAndNavigate() {
      setState(() {
        _isTulisanFirst = !_isTulisanFirst; // Tukar posisi
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TextTranslate()), // Ganti dengan halaman textTranslate Anda
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFC2E8FF),
              Color(0xFF6395B4),
            ],
          ),
        ),
        child: Column(
          children: [
            AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Terjemahkan Isyarat',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          // Aksi untuk ikon history
                        },
                        icon: const Icon(Icons.history, size: 30), // Ukuran ikon history
                      ),
                      PopupMenuButton(
                        icon: const Icon(Icons.more_vert, size: 30),
                        itemBuilder: (context) => [
                          PopupMenuItem(value: 'profile', child: Text('Profil')),
                          PopupMenuItem(value: 'settings', child: Text('Pengaturan')),
                          PopupMenuItem(value: 'help', child: Text('Bantuan')),
                        ],
                        onSelected: (value) {
                          switch (value) {
                            case 'profile':
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const Profile()));
                              break;
                            case 'settings':
                              // Tambahkan halaman pengaturan di sini
                              break;
                            case 'help':
                              // Tambahkan halaman bantuan di sini
                              break;
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),

            Container(
              margin: EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kamera Penerjemah',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0XFF052659)),
                    ),
                  ],
                ),
              ),
            ),

            // Container untuk Hasil Penerjemah dengan border radius dan drop shadow
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hasil Terjemahan',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0XFF052659)),
                      ),
                      SizedBox(height: 12),
                      // Membungkus Row ke dalam Column dan menambahkan warna latar belakang
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20), // Border radius 20px
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              offset: Offset(0, 4),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end, // Rata kanan
                              children: [
                                MouseRegion(
                                  cursor: SystemMouseCursors.click, // Menampilkan cursor klik
                                  onEnter: (_) => setState(() => _isHovering = true), // Saat mouse masuk
                                  onExit: (_) => setState(() => _isHovering = false), // Saat mouse keluar
                                  child: GestureDetector(
                                    onTap: _copyToClipboard,
                                    child: Row(
                                      children: [
                                        Text(
                                          'Salin',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: _isHovering ? Colors.blue : Colors.black,
                                          ),
                                        ),
                                        SizedBox(width: 12),
                                        Icon(
                                          Icons.copy,
                                          color: _isHovering ? Colors.blue : Colors.black, // Warna ikon hover
                                        ),
                                        SizedBox(width: 5), // Jarak antara teks dan ikon
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // Input form teks panjang dengan border radius
                            Container(
                              margin: EdgeInsets.only(top: 12), // Jarak antara Salin dan TextField
                              child: TextField(
                                controller: _textController,
                                maxLines: 5, // Atur tinggi input teks
                                decoration: InputDecoration(
                                  hintText: 'Hasil Teksnya...',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20), // Border radius untuk TextField
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      // Button Switch Translate
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Tampilkan "Tulisan" atau "Isyarat" tergantung pada posisi
                          _isTulisanFirst
                              ? _buildIsyaratButton()
                              : _buildTulisanButton(),

                          MouseRegion(
                            onEnter: (_) {
                              setState(() {
                                _isHoveringSwitch = true;
                              });
                            },
                            onExit: (_) {
                              setState(() {
                                _isHoveringSwitch = false;
                              });
                            },
                            child: GestureDetector(
                              onTap: _swapAndNavigate, // Menangani klik pada ikon swap
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                child: Row(
                                  children: [
                                    ShaderMask(
                                      shaderCallback: (Rect bounds) {
                                        return LinearGradient(
                                          colors: [
                                            _isHoveringSwitch ? Colors.blue : Color(0xFF01A9F2),
                                            _isHoveringSwitch ? Colors.blue : Color(0xFF172D9D),
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ).createShader(bounds);
                                      },
                                      child: Icon(
                                        Icons.swap_horiz,
                                        size: 48, // Ukuran ikon 32 piksel
                                        color: Colors.white, // Warna ini tidak akan terlihat karena diganti gradien
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          _isTulisanFirst
                              ? _buildTulisanButton()
                              : _buildIsyaratButton(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget _buildTulisanButton() {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHoveringTulisan = true),
      onExit: (_) => setState(() => _isHoveringTulisan = false),
      child: Container(
        decoration: BoxDecoration(
          color: _isHoveringTulisan ? Colors.blue : Color(0xFF5381B2),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            Text(
              'Tulisan',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 12),
            Icon(Icons.text_fields, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _buildIsyaratButton() {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHoveringIsyarat = true),
      onExit: (_) => setState(() => _isHoveringIsyarat = false),
      child: Container(
        decoration: BoxDecoration(
          color: _isHoveringIsyarat ? Colors.blue : Color(0xFF052355),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            Icon(Icons.pan_tool, color: Colors.white),
            SizedBox(width: 12),
            Text(
              'Isyarat',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
