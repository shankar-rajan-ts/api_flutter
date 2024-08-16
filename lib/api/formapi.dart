import 'package:flutter/material.dart';

class zomota extends StatefulWidget {
  const zomota({super.key});

  @override
  State<zomota> createState() => _FormApiState();
}

class _FormApiState extends State<zomota> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(),
          ElevatedButton(onPressed: () {}, child: Text("Submit")),
        ],
      ),
    );
  }
}
