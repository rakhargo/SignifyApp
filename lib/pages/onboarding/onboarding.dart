import 'package:flutter/material.dart';
import 'onboarding2.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Onboarding2()),
        );
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFF2DA7C2), // Warna awal
                const Color(0xFF00E2E0), // Warna akhir
              ],
              begin: Alignment.topCenter, // Mulai dari atas
              end: Alignment.bottomCenter, // Berhenti di bawah
            ),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Menentukan ukuran font berdasarkan lebar layar
              double titleFontSize = constraints.maxWidth < 600 ? 48 : 56;
              double subtitleFontSize = constraints.maxWidth < 600 ? 16 : 20;

              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                      const SizedBox(height: 20), // Spacing antara title dan subtitle
                      Text(
                        'Menghubungkan Tangan, Menyatukan Dunia.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: subtitleFontSize, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
