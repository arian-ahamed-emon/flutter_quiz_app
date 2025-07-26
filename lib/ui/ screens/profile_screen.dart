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
        children: [SizedBox(height: 30), CircleAvatar(radius: 50,backgroundImage: AssetImage(AssetPath.signInLogo),),

        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Md Remon Sheikh',
              prefixIcon: Icon(Icons.person,color: Colors.white,),
              border: OutlineInputBorder()
            ),
          ),
        ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Md Remon Sheikh',
                  prefixIcon: Icon(Icons.person,color: Colors.white,),
                  border: OutlineInputBorder()
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Md Remon Sheikh',
                  prefixIcon: Icon(Icons.person,color: Colors.white,),
                  border: OutlineInputBorder()
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(200, 40)
              ),
                onPressed: (){}, child: Text('')),
              SizedBox(width: 10,),
              ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(200, 40)
              ),
                onPressed: (){}, child: Text('')),
            ],
            ),
          ),
          SizedBox(height: 10,),
       (
                fixedSize: Size(200, 40)
              ),
                onPressed: (){}, child: Text('')),
            ],
            ),
          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: (){}, child: Text('Log Out'))
        ],
      ),
    );
  }
}
