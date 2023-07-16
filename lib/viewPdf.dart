import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
//import 'package:flutter_full_pdf_viewer_null_safe/flutter_full_pdf_viewer.dart';

class LoadPdf extends StatefulWidget {
  const LoadPdf({super.key});

  @override
  State<LoadPdf> createState() => _LoadPdfState();
}

class _LoadPdfState extends State<LoadPdf> {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<void> listExample() async {
    firebase_storage.ListResult result = await firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('files')
        .listAll();

    result.items.forEach((firebase_storage.Reference ref) {
      print('Found file: $ref');
    });

    result.prefixes.forEach((firebase_storage.Reference ref) {
      print('Found directory: $ref');
    });
   
  }

  Future<void> downloadURLExample() async {
    String downloadURL = await firebase_storage.FirebaseStorage.instance
        .ref('files/outlines_file.pdf')
        .getDownloadURL();
    print(downloadURL);
    PDFDocument doc = await PDFDocument.fromURL(downloadURL);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ViewPDF(doc))); //Notice the Push Route once this is done.
  }

  @override
  void initState() {
   
    super.initState();
    listExample();
    downloadURLExample();
    print("All done!");
  }

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}

class ViewPDF extends StatelessWidget {
  //const ViewPDF(doc, {super.key});

  PDFDocument document;
  ViewPDF(this.document);

  @override
  Widget build(BuildContext context) {
   // return Center(child: PDFViewer(document: document));
   return PDFViewer(document: document);
  }
}
