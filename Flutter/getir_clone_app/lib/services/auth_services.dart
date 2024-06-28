import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getir_clone_app/view/login_page.dart';
import 'package:getir_clone_app/view/tab_view.dart';

class AuthServices{
  final userCollection = FirebaseFirestore.instance.collection("users");
  final firebaseAuth = FirebaseAuth.instance;

  Future<void> signUp(BuildContext context ,{required String name, required String email, required String password, required String number}) async {

    final navigator = Navigator.of(context);
    
    try{
      UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;
      
      if(userCredential.user != null && user != null){
        await _registerUser(user.uid,name: name,email: email,password: password,number: number);

        navigator.pushReplacement(MaterialPageRoute(builder: (context) => const LoginPage()));
        Fluttertoast.showToast(msg: "Kayıt başarılı!");
      }

    }on FirebaseAuthException catch (error){
      Fluttertoast.showToast(msg: error.message!,toastLength: Toast.LENGTH_LONG);
    }

  }

  Future<void> signIn(BuildContext context,{required String email, required String password}) async {
    final navigator = Navigator.of(context);
    try{
      UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

      if(userCredential.user != null){
        navigator.pushReplacement(MaterialPageRoute(builder: (context) => const TabView()));
      }
    } on FirebaseAuthException catch(error) {
      Fluttertoast.showToast(msg: error.message!,toastLength: Toast.LENGTH_LONG);
    }
  }

  Future<void> signOut(BuildContext context) async {
    final navigator = Navigator.of(context);
    await firebaseAuth.signOut();
    
    navigator.pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoginPage()), (route) => false);
  }

  Future<void> _registerUser(String userId,{required String name, required String email, required String password, required String number}) async {
    
    await userCollection.doc(userId).set({
      "name" : name,
      "email" : email,
      "password" : password,
      "number" : number
    });
  
  }
}
