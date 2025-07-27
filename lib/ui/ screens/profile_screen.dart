import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/ui/utils/assets_path.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30),
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(AssetPath.signInLogo),
          ),

          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                enabled: true,
                prefixIcon: Icon(Icons.person, color: Colors.deepPurple),
                hintText: 'Md Remon Sheikh',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),
                hintStyle: TextStyle(color: Colors.deepPurple),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                prefixIcon: Icon(Icons.smartphone, color: Colors.deepPurple),
                hintText: '01328123424',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),
                hintStyle: TextStyle(color: Colors.deepPurple),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                prefixIcon: Icon(Icons.email, color: Colors.deepPurple),
                hintText: 'dev.emon.bd@gmail.com',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),
                hintStyle: TextStyle(color: Colors.deepPurple),
              ),
            ),
          ),
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
              onPressed: () {}, child: Text('Log Out')),
        ],
      ),
    );
  }
}
