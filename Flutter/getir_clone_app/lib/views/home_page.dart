import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getir_clone_app/views/category%20detail_page.dart';
import 'package:google_fonts/google_fonts.dart';

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
        title: RichText(
      text: TextSpan(
        text: "tatlımı",
        
        style:  GoogleFonts.workSans().copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 26,
          color: Colors.white,
             ),
        children:  <TextSpan>[
          TextSpan(
            text: "getir",
            style: GoogleFonts.workSans().copyWith(
              color: Colors.amber,
            )
          ),
        ]
        
      )
    ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height/3.2,
              child: AnotherCarousel(
                animationCurve: Curves.ease,
                animationDuration: const Duration(milliseconds: 800) ,
                autoplayDuration: const Duration(seconds: 4),
                indicatorBgPadding: 0,
                showIndicator: true,
                dotSize: 6,
                dotSpacing: 20,
                dotColor: Colors.white60,
                dotIncreasedColor: Colors.white,
                dotPosition: DotPosition.bottomRight,
                dotHorizontalPadding: 20,
                dotBgColor: Colors.transparent,
                images: [
                  Image.asset("images/indirim.jpg",fit: BoxFit.fill,),         
                  Image.asset("images/indirim2.jpg",fit: BoxFit.fill),
                  Image.asset("images/indirim3.jpg",fit: BoxFit.fill),
                  Image.asset("images/indirim4.jpg",fit: BoxFit.fill),
                  Image.asset("images/indirim5.jpg",fit: BoxFit.fill)
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
                    child: Text("Merhaba Mustafa!",style: Theme.of(context).textTheme.titleLarge?.copyWith(color: const Color(0xff5a189a),fontWeight: FontWeight.bold),),
                  ),
                  GridView.builder(
                    
                    shrinkWrap: true,
                    gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 1/1),
                    itemCount: kategoriler.length,
                    itemBuilder: (context,index){
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryDetailPage(category_name: kategoriler[index])));
                        },
                        child: Card(
                          color: const Color(0xff7b2cbf),
                          elevation: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(kategoriler[index],style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white))
                            ],
                          ),
                        ),
                      );
                    })  
                ],
              ),
            )
            
          ],
          ),
      ) 
    );
  }
}
