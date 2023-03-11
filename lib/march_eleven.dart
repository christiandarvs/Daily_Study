import 'package:flutter/material.dart';

class March11 extends StatelessWidget {
  const March11({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text('Scrollbar'),
      ),
      body: SafeArea(
          child: Scrollbar(
        interactive: true,
        thickness: 12,
        child: ListView.builder(
            itemCount: 100,
            itemBuilder: ((context, index) {
              return Card(
                child: ListTile(
                  title: Text('Tile $index'),
                ),
              );
            })),
      )),
    );
  }
}
