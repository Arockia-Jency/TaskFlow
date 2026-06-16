import 'package:flutter/material.dart';

class EditTaskDialog extends StatefulWidget {
  final String initialTitle;

  const EditTaskDialog({
    super.key,
    required this.initialTitle,
  });

  @override
  State<EditTaskDialog> createState() =>
      _EditTaskDialogState();
}

class _EditTaskDialogState
    extends State<EditTaskDialog> {

  late TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller =
        TextEditingController(text: widget.initialTitle);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Edit Task"),
      content: TextField(
        controller: controller,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(
              context,
              controller.text.trim(),
            );
          },
          child: const Text("Update"),
        ),

      ],
    );
  }
}