import 'package:flutter/material.dart';

class March13 extends StatelessWidget {
  const March13({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Center(
        child: ListView(
          children: const [RadioButtonForm(), Calculator(), CSITJobs()],
        ),
      )),
    );
  }
}

// Toggleable - allows the radio button to be selected/unselected

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  double input = 0;
  double input2 = 0;
  double result = 0;
  void add() {
    result = input + input2;
  }

  void subtract() {
    result = input - input2;
  }

  void multiply() {
    result = input * input2;
  }

  void divide() {
    result = (input / input2);
  }

  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
              textInputAction: TextInputAction.next,
              controller: num1,
              keyboardType: TextInputType.number,
              onChanged: (text) {
                input = double.tryParse(text) ?? 0;
              },
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: (() {
                        setState(() {
                          num1.clear();
                          num2.clear();
                          result = 0;
                          input = 0;
                          input2 = 0;
                        });
                      }),
                      icon: const Icon(Icons.close)),
                  labelText: 'Enter First Number',
                  border: const OutlineInputBorder())),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
              keyboardType: TextInputType.number,
              controller: num2,
              onChanged: (text) {
                setState(() {
                  input2 = double.tryParse(text) ?? 0;
                });
              },
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: (() {
                        setState(() {
                          num2.clear();
                          num1.clear();
                          result = 0;
                          input = 0;
                          input2 = 0;
                        });
                      }),
                      icon: const Icon(Icons.close)),
                  labelText: 'Enter Second Number',
                  border: const OutlineInputBorder())),
        ),
        Row(
          children: [
            Expanded(
                child: TextButton(
                    onPressed: (() {
                      setState(() {
                        add();
                      });
                    }),
                    child: const Text('Add'))),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                child: TextButton(
                    onPressed: (() {
                      setState(() {
                        subtract();
                      });
                    }),
                    child: const Text('Subtract'))),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                child: TextButton(
                    onPressed: (() {
                      setState(() {
                        multiply();
                      });
                    }),
                    child: const Text('Multiply'))),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                child: TextButton(
                    onPressed: (() {
                      setState(() {
                        divide();
                      });
                    }),
                    child: const Text('Divide')))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Result: $result',
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          thickness: 2,
          color: Colors.grey,
        ),
      ],
    );
  }
}

class RadioButtonForm extends StatefulWidget {
  const RadioButtonForm({super.key});

  @override
  State<RadioButtonForm> createState() => _RadioButtonFormState();
}

class _RadioButtonFormState extends State<RadioButtonForm> {
  String? gender;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        const Text(
          'What\'s your gender?',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          thickness: 2,
          color: Colors.grey,
        ),
        RadioListTile(
            value: 'Male',
            groupValue: gender,
            title: const Text('Male'),
            toggleable: true,
            onChanged: ((value) {
              setState(() {
                gender = value.toString();
              });
            })),
        RadioListTile(
            value: 'Female',
            title: const Text('Female'),
            groupValue: gender,
            toggleable: true,
            onChanged: ((value) {
              setState(() {
                gender = value.toString();
              });
            })),
        RadioListTile(
            value: 'Other',
            title: const Text('Other'),
            groupValue: gender,
            toggleable: true,
            onChanged: ((value) {
              setState(() {
                gender = value.toString();
              });
            })),
        ElevatedButton(
            onPressed: (() {
              debugPrint('$gender');
            }),
            child: const Text('Submit')),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          thickness: 2,
          color: Colors.grey,
        ),
      ],
    );
  }
}

class CSITJobs extends StatefulWidget {
  const CSITJobs({super.key});

  @override
  State<CSITJobs> createState() => _CSITJobsState();
}

class _CSITJobsState extends State<CSITJobs> {
  String? job;
  List<String> availableJobs = [
    'IT Technician',
    'Web Developer',
    'Mobile Developer',
    'Data Scientist',
    'UI/UX Designer',
    'Cloud Engineer',
    'Database Analyst',
    'IT Professor',
    'Systems Developer'
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: availableJobs.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: ((context, index) {
          return RadioListTile(
              title: Text(availableJobs[index]),
              toggleable: true,
              value: availableJobs[index],
              groupValue: job,
              onChanged: ((value) {
                setState(() {
                  job = value.toString();
                  debugPrint(job);
                });
              }));
        }));
  }
}
