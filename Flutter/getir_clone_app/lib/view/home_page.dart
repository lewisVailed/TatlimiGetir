import 'package:flutter/material.dart';
import 'package:getir_clone_app/product/color/color_schema.dart';
import 'package:getir_clone_app/product/extensions/build_context_extension.dart';
import 'package:getir_clone_app/product/packages/self_scrolling_images.dart';
import 'package:getir_clone_app/product/view_mixin/home_page_mixin.dart';
import 'package:getir_clone_app/view/category_detail_page.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomePageMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _Richtext(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SelfScrollingImages(),
            Padding(
              padding: context.paddingColumnHorizontalLow,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: context.paddingColumnVerticalLow,
                      child: Text("Merhaba Mustafa!",style: context.textTheme().titleLarge?.copyWith(color: ProjectColors.statusBarColor,fontWeight: FontWeight.bold),),
                    ),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1/1),
                      itemCount: category.length,
                      itemBuilder: (context,index){
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryDetailPage(category: category[index])));
                          },
                          child: Card(
                            color: ProjectColors.cardColor,
                            elevation: 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.width/5,
                                  width: MediaQuery.of(context).size.width/5,
                                  child: Image.asset("images/category/${category[index].imageName}.png",fit: BoxFit.contain,)),
                                Text(category[index].name,style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.black,fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),
                        );
                      })
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  RichText _Richtext() {
    return RichText(
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
  );
  }
}