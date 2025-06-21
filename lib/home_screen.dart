import 'dart:io';
import 'package:flutter/material.dart';
import 'section_card.dart';
import 'module_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GearHead Learn'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: modules.length,
        itemBuilder: (context, index) {
          final module = modules[index];
          return SectionCard(
              title: module['title']!,
              description: module['desc']!,
              fileName: module['file']!);
        },
      ),
    );
  }
}
