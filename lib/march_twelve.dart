import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class March12 extends StatefulWidget {
  const March12({super.key});

  @override
  State<March12> createState() => _March12State();
}

class _March12State extends State<March12> {
  bool pressed = false;
  bool pressed1 = false;
  bool pressed2 = false;
  bool pressed3 = false;
  bool pressed4 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Normal Switch'),
            Switch(
              value: pressed,
              dragStartBehavior: DragStartBehavior.start,
              // DragStartBehavior.start - makes the animation smoother
              // DragStartBehavior.down - makes the drag more reactive
              inactiveTrackColor: Colors.red.shade400,
              activeColor: const Color(0xff3F51B5),
              onChanged: (value) {
                HapticFeedback.heavyImpact();
                setState(() {
                  pressed = !pressed;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            SwitchListTile(
              secondary: const Icon(
                Icons.alarm,
                size: 35,
              ),
              title: const Text('Switch List Tile'),
              subtitle: const Text('Ideal for labels and options'),
              value: pressed1,
              tileColor: Colors.teal.shade200,
              enableFeedback: true,
              onChanged: (value) {
                HapticFeedback.heavyImpact();

                setState(() {
                  pressed1 = !pressed1;
                });
              },
            ),
            SwitchListTile(
                tileColor: Colors.deepPurple.shade200,
                secondary: const Icon(
                  Icons.image_outlined,
                  size: 35,
                ),
                title: const Text('Image Switch List Tile'),
                value: pressed2,
                inactiveThumbImage: const NetworkImage(
                    'https://th.bing.com/th/id/OIP.FNx8zNSGAWV306j1BsocDAHaHk?pid=ImgDet&rs=1'),
                activeThumbImage: const NetworkImage(
                    'https://th.bing.com/th/id/R.f0c35f827d946292944be691effe7aba?rik=ndSpvV5KAo3XGg&riu=http%3a%2f%2fcdn.shopify.com%2fs%2ffiles%2f1%2f1061%2f1924%2fproducts%2fEmoji_Icon_-_Happy_grande.png%3fv%3d1571606093&ehk=YcWo6t%2bIMqARbRLmBVIe%2bRPVvwOZdxNaUUVOm7DB%2fZY%3d&risl=&pid=ImgRaw&r=0'),
                onChanged: ((value) {
                  HapticFeedback.heavyImpact();

                  setState(() {
                    pressed2 = !pressed2;
                  });
                })),
            SwitchListTile(
                value: pressed4,
                secondary: const Icon(
                  Icons.tiktok,
                  size: 35,
                ),
                tileColor: pressed4 ? Colors.green.shade300 : Colors.grey,
                title: const Text('Change List Tile Color'),
                onChanged: ((value) {
                  HapticFeedback.heavyImpact();

                  setState(() {
                    pressed4 = !pressed4;
                  });
                })),
            SwitchListTile(
                title: const Text('Change Container Color'),
                secondary: const Icon(
                  Icons.color_lens_outlined,
                  size: 35,
                ),
                value: pressed3,
                onChanged: ((value) {
                  HapticFeedback.heavyImpact();

                  setState(() {
                    pressed3 = !pressed3;
                  });
                })),
            const SizedBox(
              height: 30,
            ),
            AnimatedContainer(
              height: 150,
              width: 150,
              duration: const Duration(milliseconds: 250),
              decoration: BoxDecoration(
                  color: pressed3 ? Colors.red.shade300 : Colors.blueGrey,
                  borderRadius: BorderRadius.circular(20)),
            ),
          ],
        ),
      )),
    );
  }
}

// Use switches to toggle a single item on or off, on mobile and tablet
// Immediately activate or deactivate something