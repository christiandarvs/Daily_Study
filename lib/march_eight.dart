import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

int basketCount = 0;

class March8 extends StatefulWidget {
  const March8({super.key});

  @override
  State<March8> createState() => _March8State();
}

class _March8State extends State<March8> {
  int notifNumber = 0;
  int followerRequests = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopee'),
        backgroundColor: Colors.orange.shade700,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: IconButton(
                onPressed: (() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return SecondPage(
                      itemQuantity: basketCount,
                    );
                  })));
                }),
                icon: Badge(
                  position: BadgePosition.custom(start: 15, bottom: 5),
                  showBadge: basketCount > 0 ? true : false,
                  badgeStyle: const BadgeStyle(
                    badgeColor: Colors.red,
                  ),
                  badgeAnimation: const BadgeAnimation.size(toAnimate: false),
                  badgeContent: Text(
                    '$basketCount',
                    style: const TextStyle(color: Colors.white),
                  ),
                  child: const Icon(
                    Icons.shopping_bag_outlined,
                    size: 25,
                  ),
                )),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: Image.network(
                    'https://cf.shopee.ph/file/4e9b29f378bdeb72bf313429e2d2223d'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: (() {
                        setState(() {
                          basketCount--;
                        });
                      }),
                      child: const Text(
                        'Remove',
                        style: TextStyle(color: Colors.red),
                      )),
                  TextButton(
                      onPressed: (() {
                        setState(() {
                          basketCount++;
                        });
                      }),
                      child: const Text(
                        'Add Item',
                        style: TextStyle(),
                      ))
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Badge(
                badgeStyle: const BadgeStyle(
                  badgeColor: Colors.blue,
                ),
                badgeContent: Text(
                  '$notifNumber',
                  style: const TextStyle(color: Colors.white),
                ),
                badgeAnimation: const BadgeAnimation.scale(
                    curve: Curves.easeInOut,
                    toAnimate: false,
                    animationDuration: Duration(milliseconds: 250)),
                showBadge: notifNumber > 0 ? true : false,
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  size: 70,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: (() {
                        setState(() {
                          notifNumber--;
                        });
                      }),
                      child: const Text(
                        'Remove',
                        style: TextStyle(color: Colors.red),
                      )),
                  TextButton(
                      onPressed: (() {
                        setState(() {
                          notifNumber++;
                        });
                      }),
                      child: const Text(
                        'Add Item',
                        style: TextStyle(),
                      ))
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Badge(
                showBadge: followerRequests > 0 ? true : false,
                badgeContent: Text(
                  '$followerRequests',
                  style: const TextStyle(color: Colors.white),
                ),
                badgeAnimation: const BadgeAnimation.scale(
                    curve: Curves.easeInOut,
                    animationDuration: Duration(milliseconds: 250)),
                child: const Icon(
                  Icons.person,
                  size: 50,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: (() {
                        setState(() {
                          followerRequests--;
                        });
                      }),
                      child: const Text(
                        'Decline',
                        style: TextStyle(color: Colors.red),
                      )),
                  TextButton(
                      onPressed: (() {
                        setState(() {
                          followerRequests--;
                        });
                      }),
                      child: const Text(
                        'Accept',
                        style: TextStyle(),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  int itemQuantity;
  SecondPage({super.key, required this.itemQuantity});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basket'),
        backgroundColor: Colors.orange,
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            basketCount > 0
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                          'https://cf.shopee.ph/file/4e9b29f378bdeb72bf313429e2d2223d'),
                      Text('${widget.itemQuantity}')
                    ],
                  )
                : const Text(''),
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            basketCount = 0;
            widget.itemQuantity = 0;
          });
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.remove),
      ),
    );
  }
}
