import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getir_clone_app/views/home_page.dart';
import 'package:getir_clone_app/views/log_in_page.dart';
import 'package:getir_clone_app/views/sign_in_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: const Color(0xff7b2cbf),
          centerTitle: true,
          elevation: 0,
          systemOverlayStyle:const SystemUiOverlayStyle(statusBarColor: Color(0xff5a189a)),
          titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.white
          )
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4))
          )
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

