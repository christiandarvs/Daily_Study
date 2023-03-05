import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class March5 extends StatelessWidget {
  const March5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ListTileCheckBoxWidget(taskTitle: 'Self Study - Flutter'),
            const ListTileCheckBoxWidget(taskTitle: 'Read 48 Laws of Power'),
            const ListTileCheckBoxWidget(taskTitle: 'Do schoolworks'),
            const ListTileCheckBoxWidget(taskTitle: 'Take a bath'),
            const ListTileCheckBoxWidget(taskTitle: 'Review ITCS123 & CSPC121'),
            const ListTileCheckBoxWidget(taskTitle: 'Social Media Break'),
            const ListTileCheckBoxWidget(taskTitle: 'Prepare Coffee'),
            const ListTileCheckBoxWidget(taskTitle: 'Watch Movie'),
            TextButton(
                onPressed: (() {
                  showFinish(context);
                }),
                child: const Text('Finished?')),
            TextButton(
                onPressed: (() {
                  SystemNavigator.pop();
                }),
                child: Text(
                  'Exit App',
                  style: TextStyle(color: Colors.red.shade300),
                ))
          ],
        ),
      )),
    );
  }

  void showFinish(BuildContext context) {
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: const Text('Well done!'),
            actions: [
              TextButton(
                  onPressed: (() {
                    Navigator.pop(context);
                  }),
                  child: const Text('OK'))
            ],
          );
        }));
  }
}

class ListTileCheckBoxWidget extends StatefulWidget {
  final String taskTitle;
  const ListTileCheckBoxWidget({super.key, required this.taskTitle});

  @override
  State<ListTileCheckBoxWidget> createState() => _ListTileCheckBoxWidgetState();
}

class _ListTileCheckBoxWidgetState extends State<ListTileCheckBoxWidget> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      activeColor: Colors.blueGrey,
      value: isPressed,
      onChanged: ((value) {
        setState(() {
          isPressed = !isPressed;
        });
      }),
      title: isPressed
          ? Text(
              widget.taskTitle,
              style: const TextStyle(
                decoration: TextDecoration.lineThrough,
                decorationThickness: 1.5,
              ),
            )
          : Text(widget.taskTitle),
    );
  }
}
