
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
            children: [
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: Image.network(
                      'https://image.winudf.com/v2/image1/Y29tLnJvbmdtZWlkaWN0aW9uYXJ5LmJldGFfaWNvbl8xNjE2NzM5NjcwXzA0MQ/icon.png?w=184&fakeurl=1')),
              const SizedBox(
                height: 20,
              ),
              const Text('Ruangmei Dictionary'),
            ],
          ),
        ),
        const ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('Profile'),
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
