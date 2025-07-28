import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/ui/widgets/screen_background.dart';

class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({super.key});

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  final List<Map<String, dynamic>> allBookmarkedQuestions = [
    {
      'question': 'What language is used in Flutter?',
      'category': 'Programming',
      'date': DateTime(2025, 7, 28),
    },
    {
      'question': 'What is photosynthesis?',
      'category': 'Science',
      'date': DateTime(2025, 7, 25),
    },
    {
      'question': 'Capital of Bangladesh?',
      'category': 'GK',
      'date': DateTime(2025, 7, 20),
    },
    {
      'question': 'What is 2+2?',
      'category': 'Kids',
      'date': DateTime(2025, 7, 15),
    },
  ];

  String searchText = '';
  String selectedCategory = 'All';

  List<String> categories = ['All', 'Programming', 'Science', 'Kids', 'GK'];

  List<Map<String, dynamic>> get filteredQuestions {
    return allBookmarkedQuestions.where((q) {
      final matchCat = selectedCategory == 'All' || q['category'] == selectedCategory;
      final matchSearch = q['question'].toString().toLowerCase().contains(searchText.toLowerCase());
      return matchCat && matchSearch;
    }).toList();
  }

  void _unbookmark(Map<String, dynamic> q) {
    setState(() {
      allBookmarkedQuestions.remove(q);
    });
  }

  void _review(Map<String, dynamic> q) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => QuestionDetailScreen(question: q)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF7335E2),
        elevation: 0,
        title: Text('Bookmarks', style: GoogleFonts.lato(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: true,
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              _buildSearchBar(),
              const SizedBox(height: 10),
              _buildCategoryDropdown(),
              const SizedBox(height: 10),
              Expanded(child: _buildBookmarkList()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: "Search bookmarked questions...",
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      onChanged: (val) {
        setState(() => searchText = val);
      },
    );
  }

  Widget _buildCategoryDropdown() {
    return Row(
      children: [
        Text('Filter:', style: GoogleFonts.lato(fontWeight: FontWeight.w600)),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedCategory,
                isExpanded: true,
                items: categories.map((cat) {
                  return DropdownMenuItem(
                    value: cat,
                    child: Text(cat, style: GoogleFonts.lato()),
                  );
                }).toList(),
                onChanged: (val) {
                  if (val != null) {
                    setState(() => selectedCategory = val);
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBookmarkList() {
    if (filteredQuestions.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.bookmark_border, size: 80, color: Colors.grey),
            const SizedBox(height: 8),
            Text("No bookmarks found", style: GoogleFonts.lato(fontSize: 18, color: Colors.grey[700])),
            Text("Try bookmarking questions during quiz play!",
                style: GoogleFonts.lato(fontSize: 14, color: Colors.grey[500])),
          ],
        ),
      );
    }

    return ListView.separated(
      itemCount: filteredQuestions.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final q = filteredQuestions[index];
        return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "❓ ${q['question']}",
                  style: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.deepPurple[800]),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _buildIconText(Icons.category, " ${q['category']}"),
                    const Spacer(),
                    _buildIconText(Icons.calendar_today, " ${_formatDate(q['date'])}"),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                      onPressed: () => _review(q),
                      icon: const Icon(Icons.visibility, color: Colors.deepPurple),
                      label: const Text("Review", style: TextStyle(color: Colors.deepPurple)),
                    ),
                    const SizedBox(width: 8),
                    TextButton.icon(
                      onPressed: () => _unbookmark(q),
                      icon: const Icon(Icons.delete_forever, color: Colors.redAccent),
                      label: const Text("Unbookmark", style: TextStyle(color: Colors.redAccent)),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildIconText(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.deepPurple),
        const SizedBox(width: 4),
        Text(text, style: GoogleFonts.lato(color: Colors.deepPurple[700], fontSize: 13)),
      ],
    );
  }

  String _formatDate(DateTime dt) {
    return "${dt.day} ${_monthName(dt.month)}";
  }

  String _monthName(int month) {
    const names = [
      '', 'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return names[month];
  }
}

class QuestionDetailScreen extends StatelessWidget {
  final Map<String, dynamic> question;
  const QuestionDetailScreen({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Question Detail', style: GoogleFonts.lato()),
        backgroundColor: const Color(0xFF7335E2),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          question['question'],
          style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
