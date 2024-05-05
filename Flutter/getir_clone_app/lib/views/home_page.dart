import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height/2.7,
            child: AnotherCarousel(
              animationCurve: Curves.ease,
              animationDuration: const Duration(milliseconds: 800) ,
              autoplayDuration: const Duration(seconds: 4),
              indicatorBgPadding: 0,
              showIndicator: true,
              dotSize: 6,
              dotSpacing: 20,
              dotColor: Colors.black12,
              dotIncreasedColor: Colors.purple,
              dotPosition: DotPosition.bottomRight,
              dotHorizontalPadding: 20,
              dotBgColor: Colors.grey[300],
              images: [
                Image.asset("images/tatli1.png",),         
                Image.asset("images/tatli2.png",),
                Image.asset("images/tatli3.png",),
                Image.asset("images/tatli4.png",),
                Image.asset("images/tatli5.png",)
              ],
            ),
          ),
          Padding(
            padding:  const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text("Kategoriler",style: Theme.of(context).textTheme.titleLarge?.copyWith(color: const Color(0xff5a189a),fontWeight: FontWeight.bold),),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1/1),
                  itemCount: kategoriler.length,
                  itemBuilder: (context,index){
                    return Card(
                      color: const Color(0xff7b2cbf),
                      elevation: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(kategoriler[index],style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white))
                        ],
                      ),
                    );
                  })  
              ],
            ),
          )
          
        ],
        ) 
    );
  }
}
