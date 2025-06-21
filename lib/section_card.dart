import 'package:flutter/material.dart';
import 'module_detail_screen.dart';
import 'package:gearhead_learn/markdown_viewer.dart';

class SectionCard extends StatelessWidget {
  final String title;
  final String description;
  final String fileName;

  const SectionCard({
    required this.title,
    required this.description,
    required this.fileName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(description),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.redAccent),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => MarkdownViewer(
                fileName: fileName,
              ),
            ),
          );
        },
      ),
    );
  }
}
