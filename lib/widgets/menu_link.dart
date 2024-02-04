import 'package:flutter/material.dart';

class MenuLink extends StatefulWidget {
  const MenuLink({super.key, required this.linkText});

  final String linkText;

  @override
  State createState() => _MenuLinkState();
}

class _MenuLinkState extends State<MenuLink> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.linkText.toString(),
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
