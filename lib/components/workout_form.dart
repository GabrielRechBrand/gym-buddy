import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddWorkoutForm extends StatefulWidget {
  final Function(String name, String description) onSave;

  const AddWorkoutForm({Key? key, required this.onSave}) : super(key: key);

  @override
  _AddWorkoutFormState createState() => _AddWorkoutFormState();
}

class _AddWorkoutFormState extends State<AddWorkoutForm> {
  late String _name;
  late String _description;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Workout'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                _name = value;
              });
            },
            decoration: InputDecoration(
              hintText: 'Name',
            ),
          ),
          SizedBox(height: 16),
          TextField(
            onChanged: (value) {
              setState(() {
                _description = value;
              });
            },
            decoration: InputDecoration(
              hintText: 'Description',
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onSave(_name, _description);
            Navigator.of(context).pop();
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}