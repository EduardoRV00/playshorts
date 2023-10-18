// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'package:firebase_storage/firebase_storage.dart';

Future downloadFromVideoCollectionFirebase(
  BuildContext context,
  String? videoUrl,
) async {
  // Download video from video collection to firebase
  if (videoUrl == null) {
    throw Exception('Video URL is null');
  }

  try {
    final Reference videoRef = FirebaseStorage.instance.refFromURL(videoUrl);
    final String fileName = videoRef.name;
    final Directory tempDir = await getTemporaryDirectory();
    final String tempPath = tempDir.path;
    final File tempFile = File('$tempPath/$fileName');

    await videoRef.writeToFile(tempFile);

    return tempFile;
  } catch (e) {
    throw Exception('Failed to download video from Firebase: $e');
  }
}
