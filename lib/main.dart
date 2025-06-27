import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'welcome_screen.dart';
import 'eagle_eye_view.dart'; // if you're using it

void main() {
  runApp(GearHeadApp());
}

class GearHeadApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GearHead Learn',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(
          ThemeData.dark().textTheme,
        ),
        scaffoldBackgroundColor: Colors.black,
        cardColor: Colors.grey[900],
        colorScheme: const ColorScheme.dark(
          primary: Colors.redAccent,
          secondary: Colors.yellowAccent,
        ),
      ),
      home: WelcomeScreen(),
    );
  }
}
