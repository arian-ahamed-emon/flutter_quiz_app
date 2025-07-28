import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:quiz_app/ui/%20screens/home_screen.dart';
import 'package:quiz_app/ui/%20screens/leader_board_screen.dart';
import 'package:quiz_app/ui/%20screens/profile_screen.dart';
import 'package:quiz_app/ui/%20screens/book_mark_screen.dart';

class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({super.key});

  @override
  State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
}

class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {
  int _selectedIndex = 0 ;
 final List<Widget> _screens =  [
  HomeScreen(),
   LeaderBoardScreen(),
    BookMarkScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
    bottomNavigationBar: GNav(
      selectedIndex: _selectedIndex,
      onTabChange: (int index){
        _selectedIndex = index;
        setState(() {});
      },
      backgroundColor: Colors.white,
      activeColor: Colors.orange,
      //tabBackgroundColor: Colors.blue,
      tabBorderRadius: 10,
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      gap: 7,
      tabs: [
        GButton(icon: Icons.home,text: 'Home',),
        GButton(icon: Icons.emoji_events,text: 'Leaderboard',),
        GButton(icon: Icons.bookmark,text: 'Bookmarks',),
        GButton(icon: Icons.person,text: 'Profile',),
      ],
    ),
    );
  }
}
