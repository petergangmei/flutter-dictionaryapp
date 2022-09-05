import 'package:flutter/material.dart';

import '../pages/about_page.dart';
import '../pages/setting_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                height: 20,
              ),
              Expanded(child: Image(image: AssetImage('images/logo.png'))),
              SizedBox(
                height: 20,
              ),
              Text('Ruangmei Dictionary'),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SettingPage(),
            ));
          },
        ),
        ListTile(
          leading: const Icon(Icons.photo_album_outlined),
          title: const Text('About'),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AboutPage(),
            ));
          },
        ),
      ],
    ));
  }
}
