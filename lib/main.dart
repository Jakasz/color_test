import 'package:flutter/material.dart';
import 'package:random_color/utils/color_randomizer.dart';

void main() {
  runApp(const RandomColor());
}

class RandomColor extends StatefulWidget {
  const RandomColor({super.key});

  @override
  State<RandomColor> createState() => _RandomColorState();
}

class _RandomColorState extends State<RandomColor> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter testApp',
      theme: ThemeData(),
      home: const MainPage(title: 'Random color'),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Color backgroundColor = Colors.black;
  bool withOpacity = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text("Use opacity"),
            Switch(
              onChanged: (value) {
                setState(() {
                  withOpacity = value;
                });
              },
              value: withOpacity,
            ),
          ],
        ),
      ),
      body: InkWell(
        onTap: () {
          setState(() {
            backgroundColor = getRandomColor(withOpacity);
          });
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: backgroundColor,
          child: const Center(
              child: Text(
            "Hey there!",
            style: TextStyle(fontSize: 25, color: Colors.white),
          )),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Color getRandomColor(bool withOpacity) {
    return ColorRandomizer.getRandomColor(withOpacity);
  }
}
