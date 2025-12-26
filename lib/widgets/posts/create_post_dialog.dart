import 'package:flutter/material.dart';
import 'package:frago/widgets/general/gaps.dart';
import 'package:frago/widgets/general/text.dart';

class CreatePostDialog extends StatelessWidget {
  final void Function(String) onTitleChanged;
  final VoidCallback onPostCreated;

  const CreatePostDialog({
    super.key, 
    required this.onTitleChanged,
    required this.onPostCreated,
  });

  @override
  Widget build(BuildContext context) => Dialog(
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          NothingText(
            'Create New Post',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          const GapV(20),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Post Title',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) => onTitleChanged(value),
          ),
          const GapV(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              const GapH(16),
              ElevatedButton(
                onPressed: () {
                  onPostCreated();
                  Navigator.of(context).pop();
                },
                child: const Text('Create'),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}