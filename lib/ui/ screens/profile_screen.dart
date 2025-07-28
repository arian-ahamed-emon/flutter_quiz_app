import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/ui/%20screens/sign_in_screen.dart';
import 'package:quiz_app/ui/utils/assets_path.dart';
import 'package:quiz_app/ui/widgets/screen_background.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(115, 53, 226, 1.0),
        title: Text(
          'User Profile',
          style: GoogleFonts.lato(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit, color: Colors.white),
          ),
        ],
      ),
      body: ScreenBackground(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(AssetPath.profileImage),

            ),

            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(5),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabled: false,
                  prefixIcon: Icon(Icons.person, color: Colors.deepPurple),
                  hintText: 'Md Remon Sheikh',
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintStyle: TextStyle(color: Colors.deepPurple),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabled: false,
                  prefixIcon: Icon(Icons.smartphone, color: Colors.deepPurple),
                  hintText: '01328123424',
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintStyle: TextStyle(color: Colors.deepPurple),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabled: false,
                  prefixIcon: Icon(Icons.email, color: Colors.deepPurple),
                  hintText: 'dev.emon.bd@gmail.com',
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintStyle: TextStyle(color: Colors.deepPurple),
                ),
              ),
            ),
            SizedBox(height: 5,),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(fixedSize: Size(190, 45)),
                    onPressed: () {},
                    child: Text('Statistics',style: GoogleFonts.lato(fontSize: 16),),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(fixedSize: Size(190, 45)),
                    onPressed: () {},
                    child: Text('Leaderboard',style: GoogleFonts.lato(fontSize: 16),),
                  ),
                ],
              ),

            SizedBox(height: 10),
           Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(fixedSize: Size(190, 45)),
                    onPressed: () {},
                    child: Text('Bookmark',style: GoogleFonts.lato(fontSize: 16),),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(fixedSize: Size(190, 45)),
                    onPressed: () {},
                    child: Text('Invite Friends',style: GoogleFonts.lato(fontSize: 16),),
                  ),
                ],
              ),

            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(fixedSize: Size(330, 45)),
                onPressed: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SignInScreen(),),(_) => true);
                }, child: Text('Log Out')),
          ],
        ),
      ),
    );
  }
}
