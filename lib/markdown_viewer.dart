import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MarkdownViewer extends StatefulWidget {
  final String fileName;

  const MarkdownViewer({super.key, required this.fileName});

  @override
  State<MarkdownViewer> createState() => _MarkdownViewerState();
}

class _MarkdownViewerState extends State<MarkdownViewer> {
  String _content = "";

  @override
  void initState() {
    super.initState();
    loadMarkdown();
  }

  Future<void> loadMarkdown() async {
    try {
      final data =
          await rootBundle.loadString('assets/content/${widget.fileName}');
      setState(() {
        _content = data;
      });
    } catch (e) {
      setState(() {
        _content = "Oops! Couldn't load this file.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text(widget.fileName.replaceAll('.md', ''))),
      body: _content.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: SelectableText(
                _content,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
    );
  }
}
