import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class March1 extends StatelessWidget {
  const March1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                'https://images.pexels.com/photos/5214413/pexels-photo-5214413.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Center(
              child: Column(
                children: [
                  const Spacer(),
                  Text(
                    'cardata',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  const InfoField(
                    label1: 'Username',
                    label2: 'Password',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 330,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: (() {
                        _showDialog(context);
                      }),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff8c2bd2),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Text(
                        'Log In',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: (() {}),
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Spacer(),
                  const ContactSupport(),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InfoField extends StatelessWidget {
  final String label1;
  final String label2;
  const InfoField({super.key, required this.label1, required this.label2});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label1,
            style: const TextStyle(color: Colors.white, fontSize: 17),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                hintText: 'Samni',
                hintStyle: const TextStyle(color: Colors.grey),
                fillColor: Colors.white,
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            label2,
            style: const TextStyle(color: Colors.white, fontSize: 17),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: const TextStyle(color: Colors.grey),
                fillColor: Colors.white,
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Colors.black,
                ),
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ],
      ),
    );
  }
}

class ContactSupport extends StatelessWidget {
  const ContactSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Contact Support',
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                  onPressed: (() {}),
                  icon: const Icon(
                    Icons.phone,
                    color: Colors.grey,
                  ),
                  label: const Text(
                    'Phone',
                    style: TextStyle(color: Colors.grey),
                  )),
              const VerticalDivider(
                thickness: 2,
                color: Colors.grey,
              ),
              TextButton.icon(
                  onPressed: (() {}),
                  icon: const Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                  label: const Text(
                    'Email',
                    style: TextStyle(color: Colors.grey),
                  ))
            ],
          ),
        )
      ],
    );
  }
}

void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Alert!!"),
        content: const Text("You are awesome!"),
        actions: <Widget>[
          TextButton(
            child: const Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
