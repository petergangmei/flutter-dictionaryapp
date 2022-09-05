import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Page'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Image(
                  image: AssetImage('images/logo.png'),
                  height: 60,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Ruangmei Dictionary'),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Mei application hei ruanglat english transcation sulou mei tuan platform na de. ,',
              style: TextStyle(
                letterSpacing: 0,
                height: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
