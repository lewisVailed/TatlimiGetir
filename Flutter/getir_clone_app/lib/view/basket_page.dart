import 'package:flutter/material.dart';
import 'package:getir_clone_app/view_model/basket_view_model.dart';
import 'package:provider/provider.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sepet"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: context.watch<BasketViewModel>().items.length,
                itemBuilder:(context, index) {
                  return  ListTile(
                    title: Text(context.watch<BasketViewModel>().items[index],style: const TextStyle(color: Colors.black),),
                    trailing: Consumer<BasketViewModel>(
                      builder: (BuildContext context, value, Widget? child) { 
                        return IconButton(
                        onPressed: () {

                          value.AddBasket(context.read<BasketViewModel>().items[index]);
                        },
                        icon: const Icon(Icons.favorite,color: Colors.red,),
                      );
                      },
                      
                    ),
                  );
                },)
            ],),
        ),
      );
  }
}