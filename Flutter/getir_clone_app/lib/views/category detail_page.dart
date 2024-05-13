import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getir_clone_app/data/category.dart';
import 'package:getir_clone_app/data/dessert_model.dart';
import 'package:getir_clone_app/views/home_page.dart';

class CategoryDetailPage extends StatefulWidget {
  const CategoryDetailPage({super.key, required this.category});
  final Category category;
  @override
  State<CategoryDetailPage> createState() => ccategoryDetailStatePage();
}

class ccategoryDetailStatePage extends State<CategoryDetailPage> {

  late final List<Dessert> _desserts;

  @override
  void initState() {
    super.initState();
    _desserts = DessertItems().desserts;
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          childAspectRatio: 2/2.8,
        ),
        itemCount: _desserts.length,
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
                            color: Colors.black12
                          )
                        ),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.width/4,
                          width: MediaQuery.of(context).size.width/4,
                          child: Image.asset("images/${_desserts[index].imageName}.png",fit: BoxFit.cover,),)),
                           Positioned(
                          left: MediaQuery.of(context).size.width/6,
                          bottom: MediaQuery.of(context).size.width/4.5,
                          child: IconButton(
                          onPressed: (){}, 
                          icon: const Icon(Icons.add_box,color: Colors.purple,size: 30,)),),
                      ],
                       
                     ),
                   ),
                    Text("₺${_desserts[index].price}",style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.purple,fontWeight: FontWeight.bold),),
                    Text(_desserts[index].name,style: Theme.of(context).textTheme.labelLarge,)
                    
                ],
              ),
            )
           
          );
         }),
    );
  }
}

class DessertItems {
  late final List<Dessert> desserts;

  DessertItems(){
    desserts = [
      Dessert(name: "Cheesecake", price: 110.00, imageName: "tatli1"),
      Dessert(name: "Damat Pastası", price: 149.90, imageName: "tatli2"),
      Dessert(name: "Brownie", price: 99.90, imageName: "tatli3"),
      Dessert(name: "Çikoaltalı Kek", price: 120.00, imageName: "tatli4"),
      Dessert(name: "Krem Karamel", price: 110.00, imageName: "tatli5"),
      Dessert(name: "Cheesecake", price: 110.00, imageName: "tatli1"),
      Dessert(name: "Damat Pastası", price: 149.90, imageName: "tatli2"),
      Dessert(name: "Brownie", price: 99.90, imageName: "tatli3"),
      Dessert(name: "Çikoaltalı Kek", price: 120.00, imageName: "tatli4"),
      Dessert(name: "Krem Karamel", price: 110.00, imageName: "tatli5"),
      Dessert(name: "Cheesecake", price: 110.00, imageName: "tatli1"),
      Dessert(name: "Damat Pastası", price: 149.90, imageName: "tatli2"),
      Dessert(name: "Brownie", price: 99.90, imageName: "tatli3"),
      Dessert(name: "Çikoaltalı Kek", price: 120.00, imageName: "tatli4"),
      Dessert(name: "Krem Karamel", price: 110.00, imageName: "tatli5")
    ];
  }
}