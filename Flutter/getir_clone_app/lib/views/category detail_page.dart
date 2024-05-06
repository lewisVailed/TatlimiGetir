import 'package:flutter/material.dart';

class CategoryDetailPage extends StatefulWidget {
  const CategoryDetailPage({super.key});

  @override
  State<CategoryDetailPage> createState() => ccategoryDetailStatePage();
}

class ccategoryDetailStatePage extends State<CategoryDetailPage> {

  List<int> imageNumber = [1,2,3,4,5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2/3,
        ),
        itemCount: imageNumber.length,
         itemBuilder: (context,index){
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Image.asset("images/tatli${imageNumber[index]}.png"),
              ],
            )
           
          );
         }),
    );
  }
}