import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/ui/%20screens/book_mark_screen.dart';
import 'package:quiz_app/ui/%20screens/invite_friends_screen.dart';
import 'package:quiz_app/ui/%20screens/sign_in_screen.dart';
import 'package:quiz_app/ui/%20screens/statistics_screen.dart';
import 'package:quiz_app/ui/utils/assets_path.dart';
import 'package:quiz_app/ui/widgets/screen_background.dart';

import 'leader_board_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isEditable = false;

  final TextEditingController nameController = TextEditingController(text: "Md Remon Sheikh");
  final TextEditingController phoneController = TextEditingController(text: "01328123424");
  final TextEditingController emailController = TextEditingController(text: "dev.emon.bd@gmail.com");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2EAFE), // Light background
      appBar: AppBar(
        backgroundColor: const Color(0xFF7335E2),
        elevation: 0,
        title: Text(
          'User Profile',
          style: GoogleFonts.lato(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(isEditable ? Icons.check : Icons.edit, color: Colors.white),
            onPressed: () {
              setState(() {
                isEditable = !isEditable;
              });
            },
          )
        ],
      ),
      body: ScreenBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Picture with Badge
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage(AssetPath.profileImage),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text("Expert", style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Text Fields (Editable if isEditable == true)
              _buildProfileField(Icons.person, 'Full Name', nameController, isEditable),
              _buildProfileField(Icons.smartphone, 'Phone', phoneController, isEditable),
              _buildProfileField(Icons.email, 'Email', emailController, isEditable),

              const SizedBox(height: 20),

              // Action Buttons
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _buildActionButton('Statistics', Icons.bar_chart, _onTapStatisticsButton),
                  _buildActionButton('Leaderboard', Icons.emoji_events, _onTapLeaderBoardButton),
                  _buildActionButton('Bookmark', Icons.bookmark, _onTapBookmarkButton),
                  _buildActionButton('Invite Friends', Icons.group_add, _onTapInviteFriendsButton),
                ],
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.logout),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => SignInScreen()),
                          (_) => false,
                    );
                  },
                  label: Text("Log Out", style: GoogleFonts.lato(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileField(IconData icon, String label, TextEditingController controller, bool isEditable) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        controller: controller,
        enabled: isEditable,
        style: GoogleFonts.lato(color: Colors.deepPurple),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.deepPurple),
          filled: true,
          fillColor: Colors.white,
          hintText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(String label, IconData icon, VoidCallback onTap) {
    return ElevatedButton.icon(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(160, 45),
        backgroundColor: Colors.white,
        foregroundColor: Colors.deepPurple,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      icon: Icon(icon, size: 20),
      label: Text(label, style: GoogleFonts.lato(fontSize: 14)),
    );
  }


  void _onTapLeaderBoardButton() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const LeaderBoardScreen()));
  }
  void _onTapBookmarkButton() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const BookMarkScreen()));
  }
  void _onTapInviteFriendsButton() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const InviteFriendsScreen()));
  }
  void _onTapStatisticsButton() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const StatisticsScreen()));
  }
}
