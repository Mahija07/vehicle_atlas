import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'home_screen.dart';
import 'bottom_nav_screen.dart';
import 'quiz_topic_screen.dart';

class OverviewScreen extends StatefulWidget {
  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  String content = '';

  @override
  void initState() {
    super.initState();
    loadMarkdown();
  }

  void loadMarkdown() async {
    final data = await rootBundle.loadString('assets/content/overview.md');
    setState(() {
      content = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Overview')),
      body: Column(
        children: [
          Expanded(
            child: content.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Markdown(data: content),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const BottomNavScreen()),
              );
            },
            child: const Text("Let's Deep Dive 🚀"),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
