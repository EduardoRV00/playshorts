import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBWxM3WyVybCQmXJn6zhlczNMFfeeCg3QU",
            authDomain: "playshorts-89ba1.firebaseapp.com",
            projectId: "playshorts-89ba1",
            storageBucket: "playshorts-89ba1.appspot.com",
            messagingSenderId: "834593427372",
            appId: "1:834593427372:web:714b30eb268a3029953409"));
  } else {
    await Firebase.initializeApp();
  }
}
