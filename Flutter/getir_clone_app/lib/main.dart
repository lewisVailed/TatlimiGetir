import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getir_clone_app/product/color/color_schema.dart';
import 'package:getir_clone_app/product/extensions/build_context_extension.dart';
import 'package:getir_clone_app/view/login_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
    apiKey: 'key',
    appId: 'id',
    messagingSenderId: 'sendid',
    projectId: 'myapp',
    storageBucket: 'myapp-b9yt18.appspot.com',
  )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tatlımı Getir',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: ProjectColors.appbarColor,
          centerTitle: true,
          elevation: 0,
          systemOverlayStyle:const SystemUiOverlayStyle(statusBarColor: ProjectColors.statusBarColor),
          titleTextStyle: context.textTheme().titleLarge?.copyWith(
            color: Colors.white
          )
        ),
        scaffoldBackgroundColor: ProjectColors.scafoldColor,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))
          )
        ),
       // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}

