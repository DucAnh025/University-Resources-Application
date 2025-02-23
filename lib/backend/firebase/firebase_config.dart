import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAL6N30T8jeppJtw888VhUz0kk5HwHeBlE",
            authDomain: "u-s-t-h-resources-4dhb63.firebaseapp.com",
            projectId: "u-s-t-h-resources-4dhb63",
            storageBucket: "u-s-t-h-resources-4dhb63.appspot.com",
            messagingSenderId: "303626282827",
            appId: "1:303626282827:web:53c8aac2d405d822f72ace"));
  } else {
    await Firebase.initializeApp();
  }
}
