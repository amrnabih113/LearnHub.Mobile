import 'package:flutter/material.dart';

class MyEndDrawerButton extends StatelessWidget {
  const MyEndDrawerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return IconButton(
          tooltip: 'Menu',
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
          icon: Icon(Icons.menu),
        );
      },
    );
  }
}
