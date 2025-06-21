import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'overview_screen.dart';
import 'eagle_eye_view.dart'; // 👈 Add this line

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List<String> _carFacts = [];
  String _currentFact = "Loading a cool car fact...";
  bool _isFlipped = false;

  @override
  void initState() {
    super.initState();
    loadCarFacts();
  }

  Future<void> loadCarFacts() async {
    try {
      final String data = await rootBundle.loadString('assets/car_facts.json');
      final List<dynamic> jsonResult = json.decode(data);
      setState(() {
        _carFacts = List<String>.from(jsonResult);
        _currentFact = getRandomFact();
      });

      Timer.periodic(const Duration(seconds: 30), (timer) {
        if (_carFacts.isNotEmpty) {
          setState(() {
            _currentFact = getRandomFact();
            _isFlipped = !_isFlipped;
          });
        }
      });
    } catch (e) {
      setState(() {
        _currentFact = "Oops! Couldn't load any facts.";
      });
    }
  }

  String getRandomFact() {
    final random = Random();
    return _carFacts[random.nextInt(_carFacts.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            // ✅ To prevent overflow on small screens
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 💡 Did You Know
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedRotation(
                        turns: _isFlipped ? 1 : 0,
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.easeInOut,
                        child: const Icon(Icons.lightbulb, color: Colors.amber),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          child: SelectableText(
                            _currentFact,
                            key: ValueKey(_currentFact),
                            style: const TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                              color: Colors.white70,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // 🚗 Lottie animation
                Lottie.asset(
                  'assets/home_animation.json',
                  width: 300,
                  height: 300,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 20),
                const Text(
                  'Welcome to GearHead Learn!',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Learn how vehicles think, sense, and act.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 30),

                // 🚀 Start Learning Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => OverviewScreen()),
                    );
                  },
                  child: const Text(
                    'Start Learning 🚗',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),

                const SizedBox(height: 20),

                // 🦅 Eagle's Eye View Button
                ElevatedButton.icon(
                  icon: const Icon(Icons.remove_red_eye),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const FalconViewScreen()),
                    );
                  },
                  label: const Text(
                    "Eagle's Eye View 🦅",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
