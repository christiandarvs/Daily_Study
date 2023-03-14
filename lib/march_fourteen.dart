import 'package:badges/badges.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class March14 extends StatelessWidget {
  const March14({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Center(
          child: PageView(
            scrollDirection: Axis.vertical,
            allowImplicitScrolling: true,
            dragStartBehavior: DragStartBehavior.start,
            pageSnapping: true,
            children: const [
              Sliders(),
              CheckBoxs(),
              Switches(),
              Badges(),
              RadioButtons()
            ],
          ),
        ),
      ),
    );
  }
}

class Sliders extends StatefulWidget {
  const Sliders({super.key});

  @override
  State<Sliders> createState() => _SlidersState();
}

class _SlidersState extends State<Sliders> {
  double sliderVal = 1.0;
  double sliderVal2 = 1.0;
  double sliderVal3 = 1.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            'Sliders',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        const Text('Normal Slider'),
        Slider(
            min: 0,
            max: 20,
            value: sliderVal,
            onChanged: ((value) {
              setState(() {
                sliderVal = value;
              });
            })),
        const Text('Slider with Label and Divisions'),
        Slider(
            min: 0,
            max: 30,
            activeColor: Colors.teal.shade300,
            divisions: 15,
            thumbColor: Colors.blueGrey,
            label: '${sliderVal2.toInt()}',
            value: sliderVal2,
            onChanged: ((value) {
              setState(() {
                sliderVal2 = value;
              });
            })),
        const Text('Custom Slider'),
        SliderTheme(
            data: SliderThemeData(
              trackHeight: 10,
              valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
              valueIndicatorColor: Colors.purple.shade300,
              activeTrackColor: Colors.teal,
            ),
            child: Slider(
                min: 0,
                label: '${sliderVal3.toInt()}',
                divisions: 5,
                max: 15,
                value: sliderVal3,
                onChanged: ((value) {
                  setState(() {
                    sliderVal3 = value;
                  });
                }))),
        const Spacer(),
        const Icon(
          Icons.arrow_downward_rounded,
          size: 50,
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}

class CheckBoxs extends StatefulWidget {
  const CheckBoxs({super.key});

  @override
  State<CheckBoxs> createState() => _CheckBoxsState();
}

class _CheckBoxsState extends State<CheckBoxs> {
  bool pressed1 = false;
  bool pressed2 = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            'Checkboxs',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        CheckboxListTile(
            title: const Text('Checkbox List Tile'),
            secondary: const Icon(Icons.list_alt_outlined),
            value: pressed1,
            activeColor: Colors.green,
            subtitle: const Text('Example 1'),
            onChanged: ((value) {
              setState(() {
                pressed1 = !pressed1;
              });
            })),
        Row(
          children: [
            Checkbox(
                value: pressed2,
                onChanged: ((value) {
                  setState(() {
                    pressed2 = !pressed2;
                  });
                })),
            const SizedBox(
              width: 25,
            ),
            const Text('Normal Checkbox')
          ],
        ),
        const Spacer(),
        const Icon(
          Icons.arrow_downward_rounded,
          size: 50,
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}

class Switches extends StatefulWidget {
  const Switches({super.key});

  @override
  State<Switches> createState() => _SwitchesState();
}

class _SwitchesState extends State<Switches> {
  bool pressed1 = false;
  bool pressed2 = false;
  bool pressed3 = false;
  bool pressed4 = false;
  bool pressed5 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            'Switches',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        Card(
          child: SwitchListTile(
              value: pressed1,
              title: const Text('Switch List Tile'),
              subtitle: const Text('Example 1'),
              secondary: const Icon(Icons.toggle_off_outlined),
              activeColor: Colors.deepPurple,
              onChanged: ((value) {
                setState(() {
                  pressed1 = !pressed1;
                });
              })),
        ),
        Card(
          color: pressed2 ? Colors.blueGrey : null,
          child: SwitchListTile(
              value: pressed2,
              title: const Text('Switch List Tile'),
              subtitle: const Text('Example 2'),
              secondary: pressed2
                  ? const Icon(Icons.toggle_on_outlined)
                  : const Icon(Icons.toggle_off_outlined),
              activeColor: Colors.white,
              onChanged: ((value) {
                setState(() {
                  pressed2 = !pressed2;
                });
              })),
        ),
        SwitchListTile(
            secondary: const Icon(Icons.toggle_off_outlined),
            title: const Text('Image Switch List Tile'),
            value: pressed4,
            subtitle: const Text('Example 3'),
            inactiveThumbImage: const NetworkImage(
                'https://www.vhv.rs/dpng/d/200-2007563_react-native-logo-png-transparent-png.png'),
            activeThumbImage: const NetworkImage(
                'https://cdn-images-1.medium.com/max/1200/1*5-aoK8IBmXve5whBQM90GA.png'),
            onChanged: ((value) {
              setState(() {
                pressed4 = !pressed4;
              });
            })),
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text('Normal Switch Button'),
            ),
            Switch(
                value: pressed3,
                onChanged: ((value) {
                  setState(() {
                    pressed3 = !pressed3;
                  });
                })),
          ],
        ),
        Card(
          child: SwitchListTile(
              value: pressed5,
              title: const Text('Activate Animated Container'),
              subtitle: const Text('Example 4'),
              secondary: const Icon(Icons.toggle_off_outlined),
              activeColor: Colors.green,
              onChanged: ((value) {
                setState(() {
                  pressed5 = !pressed5;
                });
              })),
        ),
        const SizedBox(
          height: 20,
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          height: 170,
          width: pressed5 ? 350 : 150,
          decoration: BoxDecoration(
              color:
                  pressed5 ? const Color(0xff3F51B5) : const Color(0xff607D8B),
              borderRadius: BorderRadius.circular(25)),
        ),
        const Spacer(),
        const Icon(
          Icons.arrow_downward_rounded,
          size: 50,
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}

class Badges extends StatefulWidget {
  const Badges({super.key});

  @override
  State<Badges> createState() => _BadgesState();
}

class _BadgesState extends State<Badges> {
  int quantity = 0;
  int followRequests = 20;
  int count = 16;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            'Badges',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Badge(
          badgeAnimation: const BadgeAnimation.fade(
              toAnimate: false, curve: Curves.easeInOut),
          badgeContent: Text(
            '$quantity',
            style: const TextStyle(color: Colors.white),
          ),
          child: const Icon(
            Icons.shopping_cart_outlined,
            size: 40,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: (() {
                  setState(() {
                    if (quantity == 0) {
                    } else {
                      quantity--;
                    }
                  });
                }),
                child: const Text(
                  'Remove',
                  style: TextStyle(color: Colors.red),
                )),
            TextButton(
                onPressed: (() {
                  setState(() {
                    quantity++;
                  });
                }),
                child: const Text('Add To Cart')),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Badge(
          showBadge: followRequests > 0 ? true : false,
          badgeAnimation: const BadgeAnimation.fade(toAnimate: false),
          badgeContent: Text(
            '$followRequests',
            style: const TextStyle(color: Colors.white),
          ),
          child: const Icon(
            Icons.person,
            size: 40,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: (() {
                  setState(() {
                    if (followRequests > 0) {
                      followRequests--;
                    }
                  });
                }),
                child: const Text(
                  'Remove',
                  style: TextStyle(color: Colors.red),
                )),
            TextButton(
                onPressed: (() {
                  setState(() {
                    if (followRequests > 0) {
                      followRequests--;
                    }
                  });
                }),
                child: const Text('Accept')),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Badge(
          badgeAnimation: const BadgeAnimation.fade(toAnimate: false),
          badgeContent: Text(
            '$count',
            style: const TextStyle(color: Colors.white),
          ),
          child: const Icon(
            Icons.notifications_none_sharp,
            size: 40,
          ),
        ),
        TextButton(
            onPressed: (() {
              setState(() {
                if (count == 0) {
                } else {
                  count--;
                }
              });
            }),
            child: const Text(
              'Remove',
              style: TextStyle(color: Colors.red),
            )),
        const SizedBox(
          height: 60,
        ),
        TextButton(
            onPressed: (() {
              setState(() {
                quantity = 0;
                followRequests = 20;
                count = 16;
              });
            }),
            child: const Text('Reset Count')),
        const Spacer(),
        const Icon(
          Icons.arrow_downward_rounded,
          size: 50,
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}

class RadioButtons extends StatefulWidget {
  const RadioButtons({super.key});

  @override
  State<RadioButtons> createState() => _RadioButtonsState();
}

class _RadioButtonsState extends State<RadioButtons> {
  String? gender;
  String? option;
  String? output;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            'Radio Button',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        RadioListTile(
            title: const Text('Male'),
            value: 'Male',
            toggleable: true,
            activeColor: Colors.red.shade200,
            groupValue: gender,
            onChanged: ((value) {
              setState(() {
                gender = value;
              });
            })),
        RadioListTile(
            title: const Text('Female'),
            value: 'Female',
            toggleable: true,
            groupValue: gender,
            activeColor: Colors.red.shade200,
            onChanged: ((value) {
              setState(() {
                gender = value;
              });
            })),
        RadioListTile(
            title: const Text('Others'),
            value: 'Others',
            toggleable: true,
            groupValue: gender,
            activeColor: Colors.red.shade200,
            onChanged: ((value) {
              setState(() {
                gender = value;
              });
            })),
        Row(
          children: [
            Radio(
                value: 'Example 1',
                toggleable: true,
                groupValue: option,
                onChanged: ((value) {
                  setState(() {
                    option = value;
                  });
                })),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Normal Radio Button'),
            ),
          ],
        ),
        TextButton(
            onPressed: (() {
              setState(() {
                debugPrint(gender);
                output = gender;
                gender = null;
              });
            }),
            child: const Text('Submit Info')),
        const SizedBox(
          height: 30,
        ),
        output == null
            ? const Text('')
            : Text(
                'Gender: $output',
                style: const TextStyle(fontSize: 20),
              ),
      ],
    );
  }
}
