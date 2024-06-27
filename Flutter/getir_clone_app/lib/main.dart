import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getir_clone_app/product/color/color_schema.dart';
import 'package:getir_clone_app/product/extensions/build_context_extension.dart';
import 'package:getir_clone_app/view/login_page.dart';
import 'package:getir_clone_app/view/profile_page.dart';
import 'package:getir_clone_app/view/tab_view.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
    apiKey: "AIzaSyDu4xGydvgdhp4F9toT1dvblbPMuSbZK3Y",
    appId: "1:21310468702:android:99f8f4ca910eeb23013acf",
    messagingSenderId: "21310468702",
    projectId: "getir-233a6",
    storageBucket: "getir-233a6.appspot.com",
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
      home:  const AuthCheck(),
    );
  }
}

class AuthCheck extends StatelessWidget {
  const AuthCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasData) {
          return const TabView(); // Kullanıcı giriş yapmışsa ana sayfaya yönlendirin
        } else {
          return const LoginPage(); // Kullanıcı giriş yapmamışsa giriş sayfasına yönlendirin
        }
      },
    );
  }
}