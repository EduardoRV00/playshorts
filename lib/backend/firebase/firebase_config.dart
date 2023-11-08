import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
          apiKey: "AIzaSyAVluBdJUqCOEbW5NJ4_AjdPITibctzmNs",
          authDomain: "play-shorts-3026d.firebaseapp.com",
          databaseURL: "https://play-shorts-3026d-default-rtdb.firebaseio.com",
          projectId: "play-shorts-3026d",
          storageBucket: "play-shorts-3026d.appspot.com",
          messagingSenderId: "216472393939",
          appId: "1:216472393939:web:e29c905f7992ebc32f1c26",

        ));
  } else {
    await Firebase.initializeApp();
  }
}
