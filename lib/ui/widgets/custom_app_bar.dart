import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:quiz_app/ui/utils/assets_path.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.deepPurple,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundImage: AssetImage(AssetPath.profileImage),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Md Remon Sheikh',
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Card(
                  color: Colors.white54,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    child: Text(
                      'Expert',
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            LiteRollingSwitch(
              onTap: () {},
              onDoubleTap: () {},
              onSwipe: () {},
              textOffColor: Colors.black,
              textOnColor: Colors.black,
              width: 110,
              value: true,
              textOn: 'Points',
              textOff: '100',
              colorOn: Colors.grey,
              colorOff: Colors.orange,
              iconOn: Icons.flash_off,
              iconOff: Icons.flash_on,
              textSize: 16.0,
              onChanged: (bool state) {},
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(78);
}
