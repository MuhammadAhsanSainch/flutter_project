import 'dart:io';

import 'package:flutter/material.dart';
import 'package:resume/marksheet.dart';

class Resume extends StatefulWidget {
  const Resume({super.key});
  @override
  State<Resume> createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {
  @override
  Widget build(BuildContext context) {
    // final mediaQueryData = MediaQuery.of(context);
    // final screenWidth = mediaQueryData.size.width;
    var file =
        File('''C:\\Users\\Muhammad Ahsan\\Documents\\mydescription.txt''');
    String description = file.readAsStringSync();
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Resume'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyTextWidget(title: 'Muhammad Ahsan'),
                    SizedBox(
                      height: 20,
                    ),
                    MyTextWidget(title: 'ahsansainch@gmail.com'),
                    MyTextWidget(title: '22')
                  ],
                ),
                // Image.asset(
                //   'assets/images/profile_pic.jpeg',
                //   height: 140,
                //   width: 120,
                //   fit: BoxFit.cover,
                // ),
                Image.network(
                  'https://th.bing.com/th/id/OIP.HxV79tFMPfBAIo0BBF-sOgHaEy?pid=ImgDet&rs=1',
                  width: 120,
                  height: 140,
                  fit: BoxFit.cover,
                )
              ],
            ),
            MyTextWidget(title: description.toString()),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => Marksheet()));
                },
                child: const Text('Explore me'))
          ],
        ),
      ),
    );
  }
}

class MyTextWidget extends StatelessWidget {
  final String title;
  const MyTextWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.italic),
    );
  }
}
