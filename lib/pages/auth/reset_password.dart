import 'package:flutter/material.dart';
import 'package:signify/pages/auth/forgot.dart';
import '../onboarding/onboarding3.dart';
import 'register.dart';
import '../home/home.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  Color _forgotPasswordColor = Colors.blue; // Warna awal
  Color _registerNowColor = Colors.blue; // Warna awal untuk "Daftar Sekarang!"
  bool _isPasswordVisible = false; // State untuk visibilitas password
  bool _isConfirmationPasswordVisible = false; // State untuk visibilitas password
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmationPasswordController = TextEditingController();

  void _onForgotPasswordTap() {
    setState(() {
      _forgotPasswordColor = Colors.red; // Ubah warna saat diklik
    });

    // Navigasi ke halaman selanjutnya
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Forgot()),
    );
  }

  void _onRegisterNowTap() {
    // Navigasi ke halaman yang sesuai untuk pendaftaran
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Register())); // Ganti dengan halaman pendaftaran yang sesuai
  }

  void _resetFields() {
    _passwordController.clear();
    _confirmationPasswordController.clear();
    setState(() {
      _isPasswordVisible = false;
      _isConfirmationPasswordVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Mendapatkan tinggi layar
    final screenHeight = MediaQuery.of(context).size.height;
    // Menghitung tinggi maksimum untuk konten
    final contentHeight = screenHeight - AppBar().preferredSize.height - 48;

    // Halaman aktif
    int currentPage = 4;
    return Scaffold(
      backgroundColor: const Color(0xFFC2E8FF),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Reset Password',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 20),
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
                      // Indikator Halaman
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(4, (index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            height: 12,
                            width: 12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: index == currentPage - 1
                                  ? Color(0xFF052659)
                                  : Color(0XFF5481B2),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 20),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),
              const Text(
                'Masukkan Password baru akunmu',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              // Baris 2: Gambar
              Center(
                child: Container(
                  height: contentHeight * 0.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/your_image.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: const Center(child: Text('Ini Gambar!')),
                ),
              ),
              SizedBox(height: 32),
              // Form Email dan Password
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(0, 4),
                          blurRadius: 4,
                        )
                      ],
                    ),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        labelText: 'Password Baru',
                        filled: true,
                        fillColor: Colors.transparent,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible =
                                  !_isPasswordVisible; // Toggle visibility
                            });
                          },
                        ),
                      ),
                    ),
                  ),SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(0, 4),
                          blurRadius: 4,
                        )
                      ],
                    ),
                    child: TextField(
                      controller: _confirmationPasswordController,
                      obscureText: !_isConfirmationPasswordVisible,
                      decoration: InputDecoration(
                        labelText: 'Konfirmasi Password Baru',
                        filled: true,
                        fillColor: Colors.transparent,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isConfirmationPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isConfirmationPasswordVisible =
                                  !_isConfirmationPasswordVisible; // Toggle visibility
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
              // Baris 3: Tombol
              Row(
                children: [
                  Expanded(
                    flex: 25,
                    child: ElevatedButton(
                      onPressed: () {
                        _resetFields(); // Reset inputan
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF258BD6),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Reset',
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0F6BAC),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Simpan Perubahan',
                        style: TextStyle(
                          fontSize: 16,
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
