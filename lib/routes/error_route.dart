import 'package:flutter/material.dart';

class ErrorRoute extends StatefulWidget {
  const ErrorRoute({super.key});

  @override
  State createState() => _ErrorRouteState();
}

class _ErrorRouteState extends State<ErrorRoute> {
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
          child: const Center(
            child: Text(
              "Route not found :(",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          )),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: FloatingActionButton.small(
          onPressed: () => {Navigator.of(context).pop()},
          backgroundColor: Colors.white,
          child: const Icon(
            Icons.chevron_left,
            color: Colors.black,
            size: 24,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}
