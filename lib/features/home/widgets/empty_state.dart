import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final VoidCallback onPick;
  const EmptyState({super.key, required this.onPick});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: onPick,
        icon: const Icon(Icons.upload_file),
        label: const Text('اختر ملف PDF'),
      ),
    );
  }
}