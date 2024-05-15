import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Arama"),
      ),
      body:  Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/12,
              child: const Card(
                color: Colors.white,
                elevation: 5,
                shadowColor: Colors.white,
                shape: RoundedRectangleBorder(),
                child: TextField(
                  cursorColor: Colors.amber,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: "Ürün ara",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.search_rounded,color: Color(0xff7b2cbf),size: 30,),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                      gapPadding: 0,
                      borderSide: BorderSide.none
                    ),
                    
                  ),
                ),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}