import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample1/features/auth/screens/screen_login.dart';
import 'package:riverpod_sample1/sample/sample_screen.dart';
import 'package:riverpod_sample1/theme.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(options:const FirebaseOptions(
        apiKey: "AIzaSyCah2PgHc65IIpQcSdTxNLNPWNSxuD9FHQ",
        projectId: "riverpod-sample-9fe30",
        messagingSenderId: "479078790969",
        appId: "1:479078790969:web:3cf6a08d4e8bd9c7d15ae8",
    ));
  }
  else {
    await Firebase.initializeApp().whenComplete(() => print("success firbase"));
  }
runApp(
   const ProviderScope(child:  MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "sample reddit",
      theme:Pallete.darkModeAppTheme,
      home:const ScreenLogin() ,
    );
  }
}
