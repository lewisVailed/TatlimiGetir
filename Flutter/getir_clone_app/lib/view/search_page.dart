import 'package:flutter/material.dart';
import 'package:getir_clone_app/product/color/color_schema.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  final String _appbarTitle = "Arama";
  final String _tfHintText = "Ürün ara";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appbarTitle),
      ),
      body:  Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/12,
              child: Card(
                color: Colors.white,
                elevation: 5,
                shadowColor: ProjectColors.white,
                shape: const RoundedRectangleBorder(),
                child: TextField(
                  cursorColor: Colors.amber,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: _tfHintText,
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.search_rounded,color: ProjectColors.appbarColor,size: 30,),
                    border: const OutlineInputBorder(
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