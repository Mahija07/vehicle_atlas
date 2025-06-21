import 'package:flutter/material.dart';
import 'quiz_screen.dart';

class QuizTopicScreen extends StatelessWidget {
  final List<Map<String, String>> topics = [
    {'title': 'Random', 'file': 'random_quiz.json'},
    {"title": "ECU & Electronics", "file": "ecu_and_electronics.json"},
    {
      "title": "Communication Protocols",
      "file": "communication_protocols.json"
    },
    {"title": "AUTOSAR & Software", "file": "autosar_and_software.json"},
    {"title": "Diagnostics & Testing", "file": "diagnostics_and_testing.json"},
    {
      "title": "Model-Based Development",
      "file": "model_based_development.json"
    },
    {"title": "Embedded Programming", "file": "embedded_programming.json"},
    {"title": "Vehicle Systems", "file": "vehicle_systems.json"},
    {"title": "Safety & Security", "file": "safety_and_security.json"},
    {"title": "Tools & Workflows", "file": "tools_and_workflows.json"},
    // Add more topics later
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flashcard Quiz')),
      body: ListView.builder(
        itemCount: topics.length,
        itemBuilder: (context, index) {
          final topic = topics[index];
          return ListTile(
            title: Text(topic['title']!),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => QuizScreen(
                    title: topic['title']!,
                    fileName: topic['file']!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
