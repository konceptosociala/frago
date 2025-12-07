import 'package:flutter/material.dart';

class WorkspacePage extends StatelessWidget {
  final bool online;

  const WorkspacePage({
    super.key,
    required this.online,
  });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workspace'),
      ),
      body: Center(
        child: Text('Welcome to the Workspace Page!'),
      ),
    );
  }
}