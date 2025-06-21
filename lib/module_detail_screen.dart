import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ModuleDetailScreen extends StatefulWidget {
  final String fileName;
  final String title;

  const ModuleDetailScreen({required this.fileName, required this.title});

  @override
  _ModuleDetailScreenState createState() => _ModuleDetailScreenState();
}

class _ModuleDetailScreenState extends State<ModuleDetailScreen> {
  String markdownData = "";

  @override
  void initState() {
    super.initState();
    loadMarkdown();
  }

  void loadMarkdown() async {
    final text =
        await rootBundle.loadString('assets/content/${widget.fileName}');
    setState(() {
      markdownData = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: markdownData.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Markdown(
              data: markdownData,
              selectable: true, // ✅ Make entire Markdown text selectable
              styleSheet:
                  MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
                p: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
    );
  }
}
