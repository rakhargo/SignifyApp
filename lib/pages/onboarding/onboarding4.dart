import 'package:flutter/material.dart';
import 'onboarding3.dart';
import '../auth/login.dart';

class Onboarding4 extends StatelessWidget {
  const Onboarding4({super.key});

  @override
  Widget build(BuildContext context) {
    // Mendapatkan tinggi layar
    final screenHeight = MediaQuery.of(context).size.height;
    // Menghitung tinggi maksimum untuk konten
    final contentHeight = screenHeight -
        AppBar().preferredSize.height -
        48; // Sesuaikan padding sesuai kebutuhan

    // Halaman aktif (di sini, Onboarding2)
    int currentPage =
        3; // Ganti sesuai halaman (1 untuk Onboarding1, 2 untuk Onboarding2, dst)

    return Scaffold(
      backgroundColor: const Color(0xFFC2E8FF),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 24), // Margin horizontal untuk seluruh body
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Mengatur spasi antara elemen
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Mengatur teks rata kiri
                  children: [
                    const Text(
                      'Kemudahan Penggunaan Aplikasi',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 12), // Menambahkan jarak di sini
                    Row(
                      children: <Widget>[
                        Image.asset(
                          '../../assets/logo.png', // Pastikan path yang benar
                          height: 64,
                          width: 64,
                        ),
                        const SizedBox(width: 8),
                        const CustomStrokeText(
                          text: 'Signify',
                          strokeColor: Colors.white,
                          strokeWidth: 4,
                          textColor: Colors.black,
                          fontSize: 48,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Column(
                  children: [
                    // Indikator Halaman
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(4, (index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == currentPage - 1
                                ? const Color(
                                    0xFF0F6BAC) // Ganti amber dengan #0F6BAC
                                : Colors.grey, // Warna indikator tidak aktif
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ],
            ),
            const Text(
              'Mari mulai perjalanan baru menuju inklusivitas!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Baris 2: Gambar
            Center(
              child: Container(
                height: contentHeight * 0.65, // Membatasi tinggi gambar
                width: double.infinity, // Memenuhi lebar yang tersedia
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: AssetImage(
                        'assets/images/your_image.png'), // Ganti dengan gambar Anda
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Center(child: Text('Ini Gambar!')),
              ),
            ),
            const SizedBox(height: 20),

            // Baris 3: Tombol
            Row(
              children: [
                Expanded(
                  flex: 25,
                  // Membuat tombol mengisi ruang yang tersedia
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Onboarding3()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF258BD6), // Ganti amber dengan #0F6BAC
                      padding: const EdgeInsets.symmetric(
                          vertical: 15), // Tinggi tombol
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8), // Sudut membulat
                      ),
                    ),
                    child: const Text(
                      'Sebelumnya',
                      style: TextStyle(
                        fontSize:
                            16, // Ukuran font yang lebih besar untuk tombol
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  flex: 75,
                  // Membuat tombol mengisi ruang yang tersedia
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF0F6BAC), // Ganti amber dengan #0F6BAC
                      padding: const EdgeInsets.symmetric(
                          vertical: 15), // Tinggi tombol
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8), // Sudut membulat
                      ),
                    ),
                    child: const Text(
                      'Selanjutnya',
                      style: TextStyle(
                        fontSize:
                            16, // Ukuran font yang lebih besar untuk tombol
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomStrokeText extends StatelessWidget {
  final String text;
  final Color strokeColor;
  final double strokeWidth;
  final Color textColor;
  final double fontSize;

  const CustomStrokeText({
    super.key,
    required this.text,
    required this.strokeColor,
    required this.strokeWidth,
    required this.textColor,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Stroke
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth
              ..color = strokeColor,
          ),
        ),
        // Teks utama
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
