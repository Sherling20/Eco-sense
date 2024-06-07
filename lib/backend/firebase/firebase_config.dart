import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCR0kyrYf2Uq1WSnh2zCPlB6GsIIJ9l2gk",
            authDomain: "eco-sense-40670.firebaseapp.com",
            projectId: "eco-sense-40670",
            storageBucket: "eco-sense-40670.appspot.com",
            messagingSenderId: "1050639982818",
            appId: "1:1050639982818:web:24ae3f05c6f792842d7ebb",
            measurementId: "G-Q5C850JBTL"));
  } else {
    await Firebase.initializeApp();
  }
}
