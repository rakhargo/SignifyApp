import 'package:flutter/material.dart';

void unavailable(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent, // Transparent background to overlay darkened background
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          color: Color(0xFF5482B3),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.zero,
            bottomRight: Radius.zero,
          ),
        ),
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Shorter white horizontal line with rounded ends
            Container(
              width: 160, // Set a specific width for the line
              height: 2, // Increased height for better visibility
              decoration: BoxDecoration(
                color: Colors.white, // Color of the line
                borderRadius: BorderRadius.circular(2), // Rounded ends with half height for full roundness
              ),
              margin: const EdgeInsets.symmetric(vertical: 10), // Margin around the line
            ),
            const SizedBox(height: 32),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Column containing the text with 60% width
                Flexible(
                  flex: 60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Maaf Fitur Belum Tersedia!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 5), // Space between the texts
                      const Text(
                        'Kembalilah Kesini Apabila Fitur Sudah Tersedia Lagi!',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16), // Slightly smaller font size
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10), // Space between the image and text
                // Image next to the text with 40% width
                Flexible(
                  flex: 40,
                  child: Image.asset(
                    'assets/images/your_image.png', // Change this to your image path
                    width: 40, // Set the width of the image
                    height: 40, // Set the height of the image
                    fit: BoxFit.contain, // Ensure the image fits within the space
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            // Custom button with gradient and shadow
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF01A9F2), Color(0xFF172D9D)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25), // Shadow color
                    offset: Offset(0, 4), // Shadow offset
                    blurRadius: 4, // Shadow blur
                  ),
                ],
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the snackbar
                },
                child: const Text(
                  'Kembali Ke Halaman Sebelumnya',
                  style: TextStyle(
                    color: Colors.white, // Button text color
                    fontSize: 12, // Button text size
                  ),
                ),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32), // Padding for the button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Match button's border radius
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
