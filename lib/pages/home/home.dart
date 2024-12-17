import 'package:flutter/material.dart';
import 'package:signify/pages/home/lesson/lesson.dart';
import 'package:signify/pages/home/translate/textTranslate.dart';
import '../auth/login.dart';
import '../../components/bottom_bar.dart';
import '../../pages/home/guide/guide.dart';
import '../../pages/home/history/history.dart';
import '../../pages/home/profile/profile.dart';
import '../../pages/home/dictionary/dictionary.dart';
import 'translate/signTranslate.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  // Daftar halaman
  final List<Widget> pages = [
    const Home(),
    const Dictionary(),
    const SignTranslate(),
    const History(),
    const Profile(),
  ];

  void _selectMenuItem(String value) {
    // Implementasi untuk menu popup jika diperlukan
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hai, Aryaaydin Selamat datang di',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: <Widget>[
                            Image.asset(
                              '../../assets/logo.png',
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
                        PopupMenuButton<String>(
                          icon: const Icon(Icons.notifications,
                              color: Colors.blue, size: 36),
                          onSelected: _selectMenuItem,
                          itemBuilder: (BuildContext context) {
                            return [
                              const PopupMenuItem<String>(
                                value: 'option1',
                                child: Text('Option 1'),
                              ),
                              const PopupMenuItem<String>(
                                value: 'option2',
                                child: Text('Option 2'),
                              ),
                              const PopupMenuItem<String>(
                                value: 'option3',
                                child: Text('Option 3'),
                              ),
                            ];
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  children: List.generate(5, (index) {
                    List<String> cardTexts = [
                      'Mulai Gerakkan',
                      'Mulai Ketik',
                      'Panduan',
                      'Kamus Isyarat',
                      'Pelajaran Isyarat',
                    ];

                    return GestureDetector(
                      onTap: () {
                        switch (index) {
                          case 0: // Mulai Gerakkan
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignTranslate(),
                              ),
                            );
                            break;
                          case 1: // Mulai Gerakkan
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TextTranslate(),
                              ),
                            );
                            break;
                          case 2: // Panduan
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Guide(),
                              ),
                            );
                            break;
                          case 3: // Kamus Isyarat
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Dictionary(),
                              ),
                            );
                            break;
                          case 4: // Kamus Isyarat
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Lesson(),
                              ),
                            );
                            break;
                          default: // Kartu lainnya
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(index: index),
                              ),
                            );
                            break;
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xFF85B7FE),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: const Offset(0, 4),
                              blurRadius: 4,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 6,
                                child: Text(
                                  cardTexts[index],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                flex: 4,
                                child: Image.asset(
                                  '../../assets/image${index + 1}.png',
                                  height: 24,
                                  width: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index; // Update index yang dipilih
          });
        },
        pages: pages, // Kirim daftar halaman ke BottomBar
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final int index;

  const DetailPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Kartu ${index + 1}'),
      ),
      body: Center(
        child: Text('Ini adalah halaman detail untuk kartu ${index + 1}'),
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
