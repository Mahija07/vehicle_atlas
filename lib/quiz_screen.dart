import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuizScreen extends StatefulWidget {
  final String title;
  final String fileName;

  const QuizScreen({required this.title, required this.fileName});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Map<String, String>> _cards = [];
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    loadCards();
  }

  void loadCards() async {
    final String data =
        await rootBundle.loadString('assets/flashcards/${widget.fileName}');
    final List<dynamic> jsonData = json.decode(data);

    setState(() {
      _cards = jsonData
          .map((e) => {
                'question': e['question'].toString(),
                'answer': e['answer'].toString(),
                'layman': e['layman'].toString(),
              })
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _cards.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : PageView.builder(
              controller: _pageController,
              itemCount: _cards.length,
              itemBuilder: (context, index) {
                final card = _cards[index];
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    color: Colors.red[100],
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: ListView(
                        children: [
                          const Text("Q:",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink)),
                          Text(card['question']!,
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.black)),
                          const SizedBox(height: 20),
                          const Text("A:",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink)),
                          Text(card['answer']!,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.black)),
                          const SizedBox(height: 20),
                          const Text("💡 Layman Logic:",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink)),
                          Text(card['layman']!,
                              style: const TextStyle(
                                  fontSize: 17,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
