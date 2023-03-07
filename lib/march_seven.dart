import 'package:flutter/material.dart';

class March7 extends StatefulWidget {
  const March7({super.key});

  @override
  State<March7> createState() => _March7State();
}

class _March7State extends State<March7> {
  String userTask = '';
  List<String> myTasks = [];
  List<bool> isDone = [];

  void taskPrompt(BuildContext context) {
    TextEditingController task = TextEditingController();
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            content: TextField(
              onChanged: (task) {
                setState(() {
                  userTask = task;
                });
              },
              controller: task,
              decoration: InputDecoration(
                  labelText: 'Enter task',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            actions: [
              TextButton(
                  onPressed: (() {
                    Navigator.pop(context);
                  }),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.red),
                  )),
              TextButton(
                  onPressed: (() {
                    setState(() {
                      if (userTask.isEmpty) {
                      } else {
                        myTasks.add(userTask);
                        isDone.add(false);
                        userTask = '';
                      }
                    });
                    Navigator.pop(context);
                  }),
                  child: const Text('Add Task')),
            ],
          );
        }));
  }

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
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('To Do List'),
        backgroundColor: const Color(0xff546E7A),
      ),
      body: SafeArea(
        child: Center(
          child: ListView.builder(
            itemCount: myTasks.length,
            itemBuilder: (context, index) {
              return Card(
                color: isDone[index] ? Colors.green : null,
                child: ListTile(
                  onLongPress: () {
                    setState(() {
                      isDone[index] = !isDone[index];
                      var checkIfDone =
                          isDone.every((element) => element == true);
                      if (checkIfDone) {
                        showCompletionPrompt(context);
                      }
                    });
                  },
                  trailing: IconButton(
                      onPressed: (() {
                        setState(() {
                          myTasks.removeAt(index);
                        });
                      }),
                      icon: const Icon(Icons.close)),
                  title: isDone[index]
                      ? Text(
                          myTasks[index],
                          style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              decorationThickness: 2),
                        )
                      : Text(myTasks[index]),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (() {
            taskPrompt(context);
          }),
          backgroundColor: const Color(0xff546E7A),
          child: const Icon(Icons.add)),
    );
  }
}
