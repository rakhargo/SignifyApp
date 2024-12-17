import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signify/pages/home/dictionary/dictionary.dart';
import 'package:signify/pages/home/history/history.dart';
import 'package:signify/pages/home/lesson/lesson.dart';
import '../../../components/bottom_bar.dart';
import '../translate/signTranslate.dart';
import '../../../pages/home/profile/profile.dart';
import '../../../pages/home/guide/guide.dart';
import '../../../pages/home/home.dart';
import '../../../components/unavailable.dart';

class HistoryLesson extends StatefulWidget {
  const HistoryLesson({super.key});

  @override
  State<HistoryLesson> createState() => _HistoryLessonState();
}

class _HistoryLessonState extends State<HistoryLesson> {
  final TextEditingController _textController = TextEditingController();
  int _selectedIndex = 1;

  // Daftar halaman
  final List<Widget> pages = [
    const Home(),
    const Dictionary(),
    const SignTranslate(),
    const History(),
    const Profile(),
  ];

  void _navigateToDetail(int index) {
    switch (index) {
      case 0:
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      // case 7:
        // For cards 2 to 8, show the "unavailable" modal bottom sheet
        unavailable(context);
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> cardTitles = [
      // 'Sejarah Bahasa Isyarat',
      'Alfabet Bahasa Isyarat',
      'Angka dalam Bahasa Isyarat',
      'Frasa dan Salam Dasar',
      'Ekspresi Umum',
      'Gerakan untuk Situasi Khusus',
      'Latihan Interaktif',
      'Informasi tentang Bahasa Isyarat',
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
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
          child: Column(
            children: [
              AppBar(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Pelajaran Gerakan Isyarat',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    PopupMenuButton(
                      icon: const Icon(Icons.more_vert, size: 30),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                            value: 'settings', child: Text('Pengaturan')),
                        PopupMenuItem(value: 'help', child: Text('Bantuan')),
                      ],
                      onSelected: (value) {
                        // Handle menu actions
                      },
                    ),
                  ],
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()),
                          ),
                          child: const Text(
                            'Home',
                            style: TextStyle(
                              color: Color(0xFF5381B2),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Icon(Icons.chevron_right, size: 18),
                        GestureDetector(
                          onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Lesson()),
                          ),
                          child: const Text(
                            'Pelajaran',
                            style: TextStyle(
                              color: Color(0xFF5381B2),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Icon(Icons.chevron_right, size: 18),
                        const Text(
                          'Sejarah Bahasa Isyarat',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Sejarah Bahasa Isyarat',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF042457),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: Offset(0, 8),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/images/sign_language_example.jpg',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 200,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Gambar Bahasa Isyarat by (Freepik)',
                      style: TextStyle(
                        color: Color(0XFF5381B2),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 20,
                        childAspectRatio:
                            3 / 2, // Sesuaikan rasio sesuai kebutuhan
                      ),
                      itemCount: 1, // Menampilkan satu item saja
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // Tindakan ketika card diklik, misalnya navigasi ke halaman detail
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 10),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  offset: const Offset(0, 8),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Bahasa isyarat merupakan sarana komunikasi yang sangat penting bagi individu yang memiliki gangguan pendengaran. Bahasa ini memungkinkan mereka untuk mengekspresikan pikiran, perasaan, dan kebutuhan mereka dengan cara yang unik dan visual.',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Color(0XFF042457),
                                  ),
                                  textAlign: TextAlign.justify,
                                  overflow: TextOverflow
                                      .ellipsis, // Untuk menghindari overflow jika teks terlalu panjang
                                  maxLines: 5, // Batas jumlah baris teks
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Sebagai alat komunikasi, bahasa isyarat memiliki struktur yang unik dan kaya, sehingga mampu menggambarkan ide-ide kompleks. Dengan belajar bahasa isyarat, kita dapat lebih memahami dan mendukung komunitas tunarungu dalam kehidupan sehari-hari.',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Color(0XFF042457),
                                  ),
                                  textAlign: TextAlign.justify,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5, // Batas jumlah baris teks
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 3 / 1,
                      ),
                      itemCount: cardTitles.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => _navigateToDetail(index),
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: const Color(0xFF85B7FE),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  offset: const Offset(0, 4),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: Text(
                                    cardTitles[index],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Image.asset(
                                    'assets/images/sample.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        pages: pages,
        disableActiveColor: true,
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final int index;
  final String title;

  const DetailPage({Key? key, required this.index, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          'You clicked on item ${index + 1}',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
