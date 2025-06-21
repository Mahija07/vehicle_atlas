import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FalconViewScreen extends StatelessWidget {
  const FalconViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("🦅 Falcon View"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/coming_soon.json', // Make sure this Lottie file exists in assets
                width: 250,
                height: 250,
              ),
              const SizedBox(height: 30),
              const Text(
                "Falcon View Coming Soon!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "We're working on an interactive 360° vehicle visualization "
                "that will let you explore systems like ECUs, Sensors, CAN, and more!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Stay tuned 🛠️🚗",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.redAccent,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
