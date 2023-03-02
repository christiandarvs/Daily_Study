import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class March2 extends StatefulWidget {
  const March2({super.key});

  @override
  State<March2> createState() => _March2State();
}

class _March2State extends State<March2> {
  String message = '';
  bool messageEmpty = false;
  final TextEditingController myMessage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: (message) {
                setState(() {
                  if (message.isNotEmpty) {
                    messageEmpty = false;
                  }
                });
              },
              controller: myMessage,
              decoration: InputDecoration(
                  errorText: messageEmpty ? 'Please enter your message' : null,
                  label: const Text('Enter Message'),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        myMessage.clear();
                        message = '';
                      });
                    },
                    icon: const Icon(Icons.close),
                  ),
                  border: const OutlineInputBorder()),
            ),
          ),
          ElevatedButton(
              onPressed: (() {
                setState(() {
                  message = myMessage.text;
                });
                if (message.isEmpty) {
                  messageEmpty = true;
                }
              }),
              child: const Text('Add input')),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Message: $message',
            style: GoogleFonts.poppins(fontSize: 20),
          )
        ],
      )),
    );
  }
}
