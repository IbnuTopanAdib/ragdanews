import 'package:flutter/material.dart';

class HeaderLogin extends StatelessWidget {
  const HeaderLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/header_image.png',
              fit: BoxFit.cover,
            ),
          ),
          Opacity(
            opacity: 0.5,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Positioned(
            left: 24,
            right: 24,
            bottom:
                24, // Ubah dari top ke bottom untuk penempatan yang lebih baik
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'RAGDANews',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Please log into your account',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
