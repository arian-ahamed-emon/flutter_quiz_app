import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/ui/widgets/screen_background.dart';

class LeaderBoardScreen extends StatefulWidget {
  const LeaderBoardScreen({super.key});

  @override
  State<LeaderBoardScreen> createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends State<LeaderBoardScreen> {
  String _selectedValue = 'All';
  final List<String> _filterOptions = ['All', 'Monthly', 'Daily'];

  final List<Map<String, dynamic>> players = [
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
    final restPlayers = sortedPlayers.sublist(3);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF7D39E4),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Leaderboard',
              style: GoogleFonts.lato(fontSize: 20, color: Colors.white),
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _selectedValue,
                dropdownColor: Colors.deepPurple,
                style: GoogleFonts.lato(color: Colors.white),
                icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                items: _filterOptions
                    .map(
                      (val) => DropdownMenuItem(value: val, child: Text(val)),
                    )
                    .toList(),
                onChanged: (newValue) =>
                    setState(() => _selectedValue = newValue!),
              ),
            ),
          ],
        ),
      ),
      body: ScreenBackground(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildTopCard(top3[1], 2),
                  buildTopCard(top3[0], 1, isCenter: true),
                  buildTopCard(top3[2], 3),
                ],
              ),
            ),
            const Divider(color: Colors.white70),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Rank", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Player", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Points", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: restPlayers.length,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemBuilder: (context, index) {
                  final player = restPlayers[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.orange,
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        player['name'],
                        style: GoogleFonts.lato(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text('Rank ${index + 1}'),
                      trailing: Text(
                        '${player['points']}',
                        style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                      ),
                      tileColor: Colors.white,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTopCard(
    Map<String, dynamic> player,
    int rank, {
    bool isCenter = false,
  }) {
    return Column(
      children: [
        Container(
          width: isCenter ? 110 : 90,
          height: isCenter ? 180 : 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  CircleAvatar(
                    radius: isCenter ? 35 : 30,
                    backgroundColor: Colors.deepPurple.shade200,
                    child: Icon(
                      Icons.person,
                      size: isCenter ? 36 : 30,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    right: 4,
                    top: 4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '#$rank',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
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
                style: GoogleFonts.lato(
                  fontSize: isCenter ? 14 : 12,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
