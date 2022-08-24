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
      appBar: AppBar(title: const Text('About Page'),),
      body:Container(
        padding: const EdgeInsets.all(20),
        child: Column(
      children: [
        const SizedBox(height: 30,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Image.network('https://image.winudf.com/v2/image1/Y29tLnJvbmdtZWlkaWN0aW9uYXJ5LmJldGFfaWNvbl8xNjE2NzM5NjcwXzA0MQ/icon.png?w=184&fakeurl=1',height: 100,),
             const Text(''),],
        ),
        const SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
              Text('Ruangmei Dictionary'), ],
        ),
        const SizedBox(height: 30,),
        const Text('Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias nulla eum voluptatem, eveniet quidem exercitationem animi totam laborum possimus enim iure ducimus ipsum doloribus dolorem.', style: TextStyle(letterSpacing: 0,height: 2,),)
        
      ],    
      ),
    ),
    );
  }
}