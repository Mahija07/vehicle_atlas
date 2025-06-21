import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  Widget buildContactCard({
    required IconData icon,
    required String label,
    required String url,
    Color iconColor = Colors.white,
  }) {
    return InkWell(
      onTap: () => _launchURL(url),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey.shade900, Colors.grey.shade800],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
          border: Border.all(color: Colors.grey.shade700),
        ),
        child: Row(
          children: [
            FaIcon(icon, color: iconColor, size: 28),
            const SizedBox(width: 18),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded,
                color: Colors.white70, size: 18),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Contact Me"),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Let's Connect 🚀",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Explore my work, reach out or check the app:",
              style: TextStyle(color: Colors.white70, fontSize: 15),
            ),
            const SizedBox(height: 30),
            buildContactCard(
              icon: FontAwesomeIcons.github,
              label: "GitHub - github.com/Mahija07",
              url: "https://github.com/Mahija07",
            ),
            buildContactCard(
              icon: FontAwesomeIcons.linkedin,
              label: "LinkedIn - linkedin.com/in/mahija07",
              url: "https://www.linkedin.com/in/mahija07",
              iconColor: Colors.blueAccent,
            ),
            buildContactCard(
              icon: FontAwesomeIcons.mobileScreenButton,
              label: "My Flutter App - GitHub Repo",
              url: "https://github.com/Mahija07/My_First_App",
              iconColor: Colors.pinkAccent,
            ),
            const Spacer(),
            const Center(
              child: Text(
                "Made with ❤️ by Mahija",
                style: TextStyle(color: Colors.white38),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
