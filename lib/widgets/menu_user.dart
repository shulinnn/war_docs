import 'package:flutter/material.dart';

class MenuUser extends StatefulWidget {
  const MenuUser({super.key});

  @override
  State createState() => _MenuUserState();
}

class _MenuUserState extends State<MenuUser> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 50,
          height: 50,
          child: CircleAvatar(
            backgroundColor: Colors.brown.shade800,
            child: const Text('AH'),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "username",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              Text(
                "user@user.cz",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w200),
              )
            ],
          ),
        )
      ],
    );
  }
}
