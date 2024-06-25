import 'package:flutter/material.dart';
import 'package:getir_clone_app/model/category.dart';
import 'package:getir_clone_app/product/color/color_schema.dart';
import 'package:getir_clone_app/product/extensions/build_context_extension.dart';
import 'package:getir_clone_app/product/view_mixin/category_detail_mixin.dart';


class CategoryDetailPage extends StatefulWidget {
  const CategoryDetailPage({super.key, required this.category});
  final Category category;
  @override
  State<CategoryDetailPage> createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState extends State<CategoryDetailPage> with CategoryDetailMixin {

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      appBar: AppBar(
        title: Text(widget.category.name),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_backspace_rounded,color: Colors.white,),
         onPressed: () { 
          Navigator.pop(context);
          },
          
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2/3.1, // Eski Ayar 2.8 pastaneyi silince
        ),
        itemCount: desserts.length,
         itemBuilder: (context,index){
          
          return Card(
            color: Colors.white,
            elevation: 0,
            child: Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Expanded(
                     child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Card(
                        color: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                            color: ProjectColors.black12
                          )
                        ),
                        child: SizedBox(
                          height: context.dessertImageSize,
                          width: context.dessertImageSize,
                          child: Image.asset("images/${desserts[index].imageName}.png",fit: BoxFit.cover,),)),
                           Positioned(
                          left: MediaQuery.of(context).size.width/6,
                          bottom: MediaQuery.of(context).size.width/4.5,
                          child: IconButton(
                          onPressed: (){}, 
                          icon: const Icon(Icons.add_box,color: ProjectColors.purple,size: 30,)),),
                      ],
                       
                     ),
                   ),
                    Text("₺${desserts[index].price}",style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.purple,fontWeight: FontWeight.bold),),
                    Text(desserts[index].name,style: Theme.of(context).textTheme.labelLarge,),
                    Text(desserts[index].sweetshop,style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.grey))
                    
                ],
              ),
            )
           
          );
         }),
    );
  }
}

