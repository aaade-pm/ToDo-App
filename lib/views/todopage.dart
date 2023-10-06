import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoPage extends StatelessWidget {
  final String description;
  final String taskName;
  const TodoPage({
    super.key,
    required this.description,
    required this.taskName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'TASK',
          style: GoogleFonts.ptSerif(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'TASK NAME',
              style: GoogleFonts.ptSerif(
                fontWeight: FontWeight.bold,
                fontSize: 21,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              //padding: EdgeInsets.all(20),
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.purple[300],
                borderRadius: BorderRadius.circular(80),
              ),
              child: Center(
                child: Text(
                  taskName,
                  style: GoogleFonts.ptSerif(
                    fontWeight: FontWeight.w700,
                    fontSize: 21,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'DESCRIPTION',
              style: GoogleFonts.ptSerif(
                fontWeight: FontWeight.bold,
                fontSize: 21,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(20),

                // height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.purple[300],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  description,
                  style: GoogleFonts.ptSerif(
                    fontWeight: FontWeight.w400,
                    fontSize: 21,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
