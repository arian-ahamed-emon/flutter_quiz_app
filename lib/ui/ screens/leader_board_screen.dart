import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/ui/utils/assets_path.dart';

class LeaderBoardScreen extends StatefulWidget {
  const LeaderBoardScreen({super.key});

  @override
  State<LeaderBoardScreen> createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends State<LeaderBoardScreen> {
  String _selectedValue = 'All';
  List<String> _filterOptions = ['All', 'Monthly', 'Daly'];

  List<Map<String, dynamic>> players = [
    {"name": "Jeff Developer", "points": 1000},
    {"name": "Arian Ahmed Emon", "points": 445},
    {"name": "Riyad", "points": 88},
    {"name": "Mahi", "points": 1000},
    {"name": "Ratul", "points": 1000},
    {"name": "Jac", "points": 900},
    {"name": "Dac", "points": 500},
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> sortedPlayers = [...players];
    sortedPlayers.sort((a, b) => b["points"].compareTo(a["points"]));

    final top3 = sortedPlayers.take(3).toList();
    final restPlayers = sortedPlayers;

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Leaderboard',
              style: GoogleFonts.lato(fontSize: 20, color: Colors.white),
            ),
            DropdownButton<String>(
              value: _selectedValue,
              underline: Container(height: 2, color: Colors.white),
              style: GoogleFonts.lato(color: Colors.white, fontSize: 16),
              icon: Icon(Icons.arrow_drop_down,color: Colors.white,),
              items: _filterOptions.map((String val) {
                return DropdownMenuItem(value: val, child: Text(val));
              }).toList(),
              onChanged: (String? newValue) {
                setState(() => _selectedValue = newValue!);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // Top 3 Cards
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildTopCard(top3[1], 2, isCenter: false),
                buildTopCard(top3[0], 1, isCenter: true),
                buildTopCard(top3[2], 3, isCenter: false),
              ],
            ),
          ),

          const Divider(color: Colors.white),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            color: Colors.white,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Rank", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Player", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Points", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: restPlayers.length,
              itemBuilder: (context, index) {
                final player = restPlayers[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.green.shade100,
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Image.asset(
                        AssetPath.profileImage,
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          player['name'],
                          style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text('${player['points']}'),
                    ],
                  ),
                );
              },
            ),
          ),
          Divider(color: Colors.white,),
          Row(
            children: [
              SizedBox(width: 15,),
              CircleAvatar(
                radius: 18,
                child: Text('${players.length}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                backgroundColor: Colors.deepPurple,
              ),
              SizedBox(width: 20,),
              CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage(AssetPath.profileImage),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Text('Md Remon Sheikh',style: GoogleFonts.lato(color: Colors.white,fontWeight: FontWeight.bold),),
              ),
              Text('1000',style: GoogleFonts.lato(color: Colors.white,fontWeight: FontWeight.bold),),
              SizedBox(width: 18,)
            ],
          ),
          SizedBox(height: 5,),
        ],
      ),
    );
  }

  Widget buildTopCard(Map<String, dynamic> player, int rank, {bool isCenter = false}) {
    return Container(
      width: isCenter ? 120 : 100,
      height: isCenter ? 200 : 170,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  CircleAvatar(
                    radius: isCenter ? 35 : 30,
                    backgroundColor: Colors.green.shade100,
                    child: Icon(Icons.person, size: isCenter ? 35 : 30, color: Colors.grey),
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '#$rank',
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                player["name"],
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: isCenter ? 16 : 14,
                ),
              ),
              Text(
                '${player["points"]} pts',
                style: GoogleFonts.lato(fontSize: isCenter ? 15 : 13),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
