import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:quiz_app/ui/%20screens/profile_screen.dart';
import 'package:quiz_app/ui/utils/assets_path.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Color.fromRGBO(115, 53, 226, 1.0),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundImage: AssetImage(AssetPath.profileImage),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfileScreen(),));
              },
              child: Column(
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomRight: Radius.circular(10))
                    ),
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
            ),
            Spacer(),
            LiteRollingSwitch(
              value: false,
              onChanged: (bool state) {},
              onDoubleTap: () {},
              onSwipe: () {},
              onTap: () {},
              width: 105,
              textOffColor: Colors.white,
              textOnColor: Colors.white,
              iconOff: Icons.flash_on,
              iconOn: Icons.flash_off,
              colorOff: Colors.orange,
              colorOn: Colors.orange,
              textOff: '1500',
              textOn: 'Points',
              textSize: 18,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(78);
}
