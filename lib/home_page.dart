
import 'package:flutter/material.dart';
import 'package:test_app/uploadOutlines.dart';
import 'package:test_app/viewPdf.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Upload Outlines"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const UploadOutlinesPdf()),
              );
            },
            child: const Text('Upload Outlines Pdf'),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
          onPressed: (){
             Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LoadPdf()),
              );
          },
            child: const Text('Display Outlines Pdf'),
          ),
        ],
      ),
    );
  }
}
