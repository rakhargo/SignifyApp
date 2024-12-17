import 'package:flutter/material.dart';
import 'package:signify/pages/home/dictionary/dictionary.dart';
import '../../../components/bottom_bar.dart';
import '../translate/signTranslate.dart';
import '../../../pages/home/guide/guide.dart';
import '../../../pages/home/history/history.dart';
import '../../../pages/home/home.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _isPasswordVisible = false;
  bool _isEditable = false; // Menambahkan status untuk edit mode
  int _selectedIndex = 4; // Pindahkan _selectedIndex ke sini

  // Kontroller untuk TextField
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Daftar halaman
    final List<Widget> pages = [
      const Home(),
      const Dictionary(),
      const SignTranslate(),
      const History(),
      const Profile(),
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
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.person),
                    ),
                    const Text(
                      'Profil Pengguna',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF052659),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // Container Form
              Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: const Offset(0, 4),
                      blurRadius: 4,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Nama Lengkap',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF547FB2),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: 'cth: Defrizal Yahdiyan Risyad',
                          filled: true,
                          fillColor: Colors.transparent,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: const BorderSide(
                                color: Color(0xFFC2E8FF),
                                width: 2), // Border 2px
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: const BorderSide(
                                color: Color(0xFF547FB2),
                                width: 2), // Border saat fokus
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 20),
                        ),
                        enabled: _isEditable, // Jika tidak di-edit, disable
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF547FB2),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'orang@example.com',
                          filled: true,
                          fillColor: Colors.transparent,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: const BorderSide(
                                color: Color(0xFFC2E8FF),
                                width: 2), // Border 2px
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: const BorderSide(
                                color: Color(0xFF547FB2),
                                width: 2), // Border saat fokus
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 20),
                        ),
                        enabled: _isEditable, // Jika tidak di-edit, disable
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF547FB2),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                          hintText: '*****',
                          filled: true,
                          fillColor: Colors.transparent,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: const BorderSide(
                                color: Color(0xFFC2E8FF),
                                width: 2), // Border 2px
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: const BorderSide(
                                color: Color(0xFF547FB2),
                                width: 2), // Border saat fokus
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 20),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                        ),
                        enabled: _isEditable, // Jika tidak di-edit, disable
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Row untuk tombol Edit dan Simpan
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 20), // Margin horizontal 20px
                child: Row(
                  children: [
                    Expanded(
                      flex: 25,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isEditable = !_isEditable; // Toggle edit mode
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0XFF507CA9),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Edit',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                        flex: 75,
                        child: ElevatedButton(
                          onPressed: _isEditable
                              ? () {
                                  setState(() {
                                    _isEditable = false; // Nonaktifkan edit mode setelah simpan
                                  });
                                  // Tindakan simpan
                                }
                              : null, // Tombol simpan hanya aktif saat editable
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _isEditable
                                ? const Color(0XFF052659)
                                : Color(0XFF7DA0CA), // Warna saat aktif dan disable
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Simpan',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        )),
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
            _selectedIndex = index; // Update index yang dipilih
          });
        },
        pages: pages, // Kirim daftar halaman ke BottomBar
      ),
    );
  }
}
