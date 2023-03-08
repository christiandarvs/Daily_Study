import 'package:flutter/material.dart';

class March8 extends StatefulWidget {
  const March8({super.key});

  @override
  State<March8> createState() => _March8State();
}

class _March8State extends State<March8> {
  List<String> programmingLanguages = [
    'Java',
    'Dart',
    'Kotlin',
    'Swift',
    'Python',
    'Javascript',
    'C',
    'C++',
    'C#',
    'Go',
    'Rust',
  ];
  List<bool> checkBoxValues = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  void showCompletionPrompt(BuildContext context) {
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: Row(
              children: const [
                Icon(
                  Icons.celebration,
                  color: Colors.orange,
                ),
                SizedBox(
                  width: 15,
                ),
                Text('Well done!'),
              ],
            ),
            content: const Text('You did great today!'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView.builder(
              itemCount: programmingLanguages.length,
              itemBuilder: ((context, index) {
                return CheckboxListTile(
                    selected: checkBoxValues[index],
                    activeColor: Colors.green,
                    subtitle: const Text('Programming Language'),
                    secondary: const Icon(Icons.code),
                    title: Text(programmingLanguages[index]),
                    value: checkBoxValues[index],
                    onChanged: ((value) {
                      setState(() {
                        checkBoxValues[index] = value!;
                        var checkIfDone =
                            checkBoxValues.every((element) => element == true);
                        if (checkIfDone) {
                          showCompletionPrompt(context);
                        }
                      });
                    }));
              }))),
    );
  }
}
