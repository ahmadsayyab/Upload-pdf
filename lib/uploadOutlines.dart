import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:flutter_document_picker/flutter_document_picker.dart';

class UploadOutlinesPdf extends StatelessWidget {
  const UploadOutlinesPdf({super.key});

  @override
  Widget build(BuildContext context) {
    Future<firebase_storage.UploadTask> uploadFile(File file) async {
      // if (file == null) {
      //  return CircularProgressIndicator();
      // }

      firebase_storage.UploadTask uploadTask;

      // Create a Reference to the file
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('files')
          .child('/outlines_file.pdf');

      final metadata = firebase_storage.SettableMetadata(
          contentType: 'file/pdf',
          customMetadata: {'picked-file-path': file.path});
      print("Uploading..!");

      uploadTask = ref.putData(await file.readAsBytes(), metadata);

      print("done..!");
      return Future.value(uploadTask);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Uplaod Outlines'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () async {
            
            final paths = await FlutterDocumentPicker.openDocuments();

            if (paths != null && paths.isNotEmpty) {
              final path = paths.first;

              if (path != null) {
                final file = File(path);
                // Upload the file to Firebase or perform other operations with it
                firebase_storage.UploadTask task = await uploadFile(file);
                Navigator.pop(context);
              }
            }
          },
          child: const Text('Select file'),
        ),
      ),
    );
  }
}
