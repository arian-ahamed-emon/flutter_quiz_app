import 'package:flutter/material.dart';
import 'package:quiz_app/ui/utils/assets_path.dart';

class ScreenBackground extends StatelessWidget {
  const ScreenBackground({super.key, required this.child});
final Widget child;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
          children: [
            Image.asset(
                AssetPath.screenBackground,
              width: screenSize.width,
              height: screenSize.height,
              fit: BoxFit.cover,
            ),
            SafeArea(child: child)
          ]
      ),
    );
  }
}
