import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signify/pages/home/history/history.dart';
import '../../../components/bottom_bar.dart';
import '../translate/signTranslate.dart';
import '../../../pages/home/profile/profile.dart';
import '../../../pages/home/guide/guide.dart';
import '../../../pages/home/home.dart';

class Dictionary extends StatefulWidget {
  const Dictionary({super.key});

  @override
  State<Dictionary> createState() => _DictionaryState();
}

class _DictionaryState extends State<Dictionary> {
  final TextEditingController _textController = TextEditingController();
  int _selectedIndex = 1;

    // Daftar halaman
    final List<Widget> pages = [
      const Home(),
      const Guide(),
      const SignTranslate(),
      const History(),
      const Profile(),
    ];


  @override
  Widget build(BuildContext context) {
    List<String> cardTitles = [
      'Oke',
      'Hai',
      'Halo',
      'Kenalin',
      'Nama',
      'Saya',
      'Adalah',
      'Atmin',
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
                      'Kamus Bahasa Isyarat',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        PopupMenuButton(
                          icon: const Icon(Icons.more_vert, size: 30),
                          itemBuilder: (context) => [
                            PopupMenuItem(value: 'settings', child: Text('Pengaturan')),
                            PopupMenuItem(value: 'help', child: Text('Bantuan')),
                          ],
                          onSelected: (value) {
                            switch (value) {
                              case 'settings':
                                break;
                              case 'help':
                                break;
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                backgroundColor: Colors.transparent,
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color(0xFF042558),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(0, 4),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 7,
                              child: Text(
                                'Yuk Pelajari Bahasa Isyarat',
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(flex: 3, child: Image.asset('name'))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 9,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF5483B3),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  offset: Offset(0, 4),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: TextField(
                              controller: _textController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search, color: Colors.white),
                                hintText: 'Cari kata yang ingin kamu cari',
                                hintStyle: TextStyle(color: Colors.white70),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xFF01A9F2),
                                  Color(0xFF172D9D),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  offset: Offset(0, 4),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: IconButton(
                              icon: Icon(Icons.filter_list, color: Colors.white),
                              onPressed: () {
                                showMenu(
                                  context: context,
                                  position: RelativeRect.fromLTRB(100, 100, 20, 0),
                                  items: [
                                    PopupMenuItem(
                                      value: 'filter1',
                                      child: Text('Filter 1', style: TextStyle(color: Colors.white)),
                                    ),
                                    PopupMenuItem(
                                      value: 'filter2',
                                      child: Text('Filter 2', style: TextStyle(color: Colors.white)),
                                    ),
                                    PopupMenuItem(
                                      value: 'filter3',
                                      child: Text('Filter 3', style: TextStyle(color: Colors.white)),
                                    ),
                                  ],
                                  color: Color(0xFF5483B3),
                                ).then((value) {
                                  if (value != null) {
                                    print('Selected filter: $value');
                                    // Tambahkan logika filter di sini
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 3 / 1,
                      ),
                      itemCount: cardTitles.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF85B7FE),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  offset: Offset(0, 4),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      cardTitles[index],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.visible,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      'assets/images/sample.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
