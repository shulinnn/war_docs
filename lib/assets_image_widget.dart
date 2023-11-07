import 'package:flutter/material.dart';

class AssetsImageWidget extends StatelessWidget {
  const AssetsImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asset Image'),
      ),
      body: Container(
        color: Colors.white,
        child: Image.asset(
          'images/cover.png',
        ),
      ),
    );
  }
}
