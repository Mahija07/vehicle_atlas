import 'package:flutter/material.dart';

class ExploreTopicsPage extends StatelessWidget {
  final List<Map<String, String>> topics = [
    {
      'title': 'Engine System',
      'description': 'ECUs, Sensors, Actuators',
    },
    {
      'title': 'Lighting System',
      'description': 'Ambient, DRL, Tail lamps',
    },
    {
      'title': 'CAN Protocol',
      'description': 'Vehicle data communication',
    },
    {
      'title': 'Stateflow',
      'description': 'Logic, events, states',
    },
    {
      'title': 'Simulink',
      'description': 'Model dynamic systems',
    },
    {
      'title': 'ISO 26262',
      'description': 'Functional safety levels',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Explore Topics'),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 3 / 2,
          children: topics.map((topic) {
            return GestureDetector(
              onTap: () {
                // Navigate to details page (add later)
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey[900],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      topic['title']!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.amberAccent,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      topic['description']!,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[300],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
