import 'package:flutter/material.dart';

class Feb28 extends StatelessWidget {
  const Feb28({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0097A7),
        title: const Text('Feb 28, 2023'),
      ),
      body: SafeArea(
          child: ListView(
        children: const [Count(), Landing(), AnimatedCon(), SliderExample()],
      )),
    );
  }
}

class Count extends StatefulWidget {
  const Count({super.key});

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffB2DFDB),
      height: 180,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$value',
            style: const TextStyle(fontSize: 25),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                  child: IconButton(
                      onPressed: (() {
                        setState(() {
                          value--;
                        });
                        if (value.isNegative) {
                          debugPrint('Invalid Number');
                        }
                      }),
                      icon: const Icon(
                        Icons.remove,
                        color: Colors.white,
                      ))),
              CircleAvatar(
                  child: IconButton(
                      onPressed: (() {
                        setState(() {
                          value++;
                        });
                      }),
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ))),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: (() {
              setState(() {
                value = 0;
              });
            }),
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffFF5252)),
            child: const Text(
              'Reset',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPressed = !isPressed;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOut,
        width: double.infinity,
        height: isPressed ? 200 : 150,
        color: const Color(0xffBA68C8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 350,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              padding: const EdgeInsets.all(30),
              child: Column(
                children: const [
                  Text(
                    'Flutter Development',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Created by Christian Darvs',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontStyle: FontStyle.italic),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedCon extends StatefulWidget {
  const AnimatedCon({super.key});

  @override
  State<AnimatedCon> createState() => _AnimatedConState();
}

class _AnimatedConState extends State<AnimatedCon> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          color: Colors.lightBlue,
          height: 100,
          child: const Icon(
            Icons.fast_rewind,
            color: Colors.white,
          ),
        )),
        Expanded(
            child: Container(
                color: Colors.amber,
                height: 100,
                child: IconButton(
                    onPressed: (() {
                      setState(() {
                        isPressed = !isPressed;
                      });
                    }),
                    icon: isPressed
                        ? const Icon(Icons.play_arrow, color: Colors.white)
                        : const Icon(
                            Icons.pause,
                            color: Colors.white,
                          )))),
        Expanded(
            child: Container(
          color: Colors.green,
          height: 100,
          child: const Icon(
            Icons.fast_forward,
            color: Colors.white,
          ),
        ))
      ],
    );
  }
}

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double _value = 1.0;
  double secondValue = 1.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.teal.shade100,
      width: double.infinity,
      child: Column(
        children: [
          Slider(
            divisions: 10,
            label: '${_value.round()}',
            value: _value,
            onChanged: ((value) {
              setState(() {
                _value = value;
              });
            }),
            min: 0,
            max: 10,
          ),
          Text(
            'Slider Widget: ${_value.toInt()}',
            style: const TextStyle(fontSize: 18),
          ),
          const Text('This Slider has a label and divisions'),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
                activeTickMarkColor: Colors.white,
                trackShape: const RoundedRectSliderTrackShape(),
                trackHeight: 15,
                thumbColor: Colors.teal,
                inactiveTrackColor: Colors.white,
                activeTrackColor: Colors.deepPurple),
            child: Slider(
              label: '${secondValue.round()}',
              divisions: 10,
              min: 0,
              max: 20,
              value: secondValue,
              onChanged: ((value) {
                setState(() {
                  secondValue = value;
                });
              }),
            ),
          ),
          Text(
            'Slider Theme Widget: ${secondValue.toInt()}',
            style: const TextStyle(fontSize: 18),
          ),
          const Text('This Slider has a customed properties'),
        ],
      ),
    );
  }
}
