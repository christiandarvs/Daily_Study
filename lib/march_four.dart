import 'package:flutter/material.dart';

class March4 extends StatelessWidget {
  const March4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xff7F7FD5),
          Color(0xff86A8E7),
          Color(0xff91eae4)
        ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [UserInfo()],
        ),
      )),
    );
  }
}

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  bool isUsernameEmpty = true;
  bool isPasswordEmpty = true;
  bool isUsernameEmptyError = false;
  bool isPasswordEmptyError = false;
  String usernameInput = '';
  String passwordInput = '';
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            onChanged: (username) {
              setState(() {
                isUsernameEmpty = false;
                isUsernameEmptyError = false;
                usernameInput = username.toString();
              });
            },
            controller: username,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                labelText: 'Username',
                fillColor: Colors.white,
                filled: true,
                errorText:
                    isUsernameEmptyError ? 'Username cannot be empty' : null,
                prefixIcon: const Icon(Icons.person),
                border: const OutlineInputBorder(),
                suffixIcon: isUsernameEmpty
                    ? null
                    : IconButton(
                        onPressed: (() {
                          setState(() {
                            username.clear();
                            isUsernameEmpty = true;
                            usernameInput = '';
                          });
                        }),
                        icon: const Icon(Icons.close))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            onChanged: (password) {
              setState(() {
                isPasswordEmpty = false;
                isPasswordEmptyError = false;
                passwordInput = password.toString();
              });
            },
            controller: password,
            // textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                labelText: 'Password',
                errorText:
                    isPasswordEmptyError ? 'Password cannot be empty' : null,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.lock),
                filled: true,
                border: const OutlineInputBorder(),
                suffixIcon: isPasswordEmpty
                    ? null
                    : IconButton(
                        onPressed: (() {
                          setState(() {
                            password.clear();
                            isPasswordEmpty = true;
                            passwordInput = '';
                          });
                        }),
                        icon: const Icon(Icons.close))),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 200,
          child: ElevatedButton(
              onPressed: (() {
                debugPrint('Username: $usernameInput');
                debugPrint('Password: $passwordInput');
                if (usernameInput == 'itsmedarvs' &&
                    passwordInput == 'helloworld') {
                  showGreeting(context);
                }
                setState(() {
                  if (usernameInput.isEmpty && passwordInput.isEmpty) {
                    isUsernameEmptyError = true;
                    isPasswordEmptyError = true;
                  } else if (usernameInput.isEmpty) {
                    isUsernameEmptyError = true;
                  } else if (passwordInput.isEmpty) {
                    isPasswordEmptyError = true;
                  }
                });
              }),
              child: const Text('Log In')),
        ),
        TextButton(
            onPressed: (() {
              showCredentials(context);
            }),
            child: const Text(
              'Forgot Account?',
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}

void showCredentials(BuildContext context) {
  showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          title: const Text('Account Details'),
          actions: [
            TextButton(
                onPressed: (() {
                  Navigator.pop(context);
                }),
                child: const Text('OK'))
          ],
          content: const Text('Username: itsmedarvs\nPassword: helloworld'),
        );
      }));
}

void showGreeting(BuildContext context) {
  showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          title: const Text('Welcome Back!'),
          content: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
                'https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExNWJlNGI5Y2ZjNDdhZDYzNjBkYzcxOTQxMTU3YmRjOTM5NzExZWNmZCZjdD1n/L1R1tvI9svkIWwpVYr/giphy.gif'),
          ),
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
