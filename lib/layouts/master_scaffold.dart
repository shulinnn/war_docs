import 'package:flutter/material.dart';

class MasterScaffold extends StatelessWidget {
  const MasterScaffold({super.key, required this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            color: Color(0xff002650),
            image: DecorationImage(
                image: AssetImage("assets/bg.jpg"),
                fit: BoxFit.cover,
                opacity: 0.1)),
        alignment: Alignment.center,
        child: child,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Navigator.of(context).canPop()
            ? FloatingActionButton.small(
                onPressed: () => {Navigator.of(context).pop()},
                backgroundColor: Colors.white,
                child: const Icon(
                  Icons.chevron_left,
                  color: Colors.black,
                  size: 24,
                ),
              )
            : null,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}
