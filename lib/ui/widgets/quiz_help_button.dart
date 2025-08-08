import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizHelpButton extends StatelessWidget {
  final String? labelTop;
  final String labelBottom;
  final IconData? icon;
  final VoidCallback? onTap;

  const QuizHelpButton({
    Key? key,
    this.labelTop,
    required this.labelBottom,
    this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (icon != null) {
      content = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(height: 3),
          Text(
            labelBottom,
            style: GoogleFonts.lato(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      );
    } else if (labelTop != null) {
      // Two texts, top and bottom, no icon
      content = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            labelTop!,
            style: GoogleFonts.lato(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            labelBottom,
            style: GoogleFonts.lato(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      );
    } else {
      // Fallback: only bottom text centered
      content = Center(
        child: Text(
          labelBottom,
          style: GoogleFonts.lato(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
    }

    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 70,
        width: 90,
        child: Card(
          elevation: 4,
          color: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: content,
          ),
        ),
      ),
    );
  }
}
