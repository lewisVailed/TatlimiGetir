import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var kategoriler = ["Dondurma","Şerbetli","Pasta","Çikolata","Kurabiye","Vanilya","Çilek","Muz","Kivi","Portakal","Ananas","Fıstık"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tatlımı Getir"),
      ),
      body: GridView.builder(
            gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1/1),
            itemCount: kategoriler.length,
            itemBuilder: (context,index){
              return Card(
                color: Colors.purple[200],
                elevation: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(kategoriler[index])
                  ],
                ),
              );
            }) 
    );
  }
}
