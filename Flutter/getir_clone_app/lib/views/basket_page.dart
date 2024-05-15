// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {

  int cheescakeConter = 1;
  int cakeCounter = 1;
  int brownieCounter = 1;

  void cheesecakeCounterPlus(){
    setState(() {
      cheescakeConter++;
    });
  }

  void cheesecakeCounterMinus(){
    if(cheescakeConter != 0){
      setState(() {
      cheescakeConter--;
    });
    }
  }
  void cakeCounterCounterPlus(){
    setState(() {
      cakeCounter++;
    });
  }

  void cakeCounterCounterMinus(){
    if(cakeCounter != 0){
      setState(() {
      cakeCounter--;
    });
    }
  }
  void brownieCounterPlus(){
    setState(() {
      brownieCounter++;
    });
  }

  void brownieCounterMinus(){
    if(brownieCounter != 0){
      setState(() {
      brownieCounter--;
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sepetim"),
      ),
      body:  Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 10,),
        child: Column(
          children: [
            _RowBasketItem(imageName: "tatli1",dessertName: "Cheesecake",dessertPrice: 110.0,onPressedPlus: cheesecakeCounterPlus,onPressedMinus: cheesecakeCounterMinus,itemConter: cheescakeConter, ),
            _RowBasketItem(imageName: "tatli4", dessertName: "Çikolatalı kek", dessertPrice: 120.0,onPressedPlus: cakeCounterCounterPlus,onPressedMinus: cakeCounterCounterMinus,itemConter: cakeCounter,),
            _RowBasketItem(imageName: "tatli3", dessertName: "Brownie", dessertPrice: 99.9,onPressedPlus: brownieCounterPlus,onPressedMinus: brownieCounterMinus,itemConter: brownieCounter,),
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  backgroundColor: const Color(0xff7b2cbf)),
                onPressed: (){}, 
                child:  Text("Sipariş Ver",style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),)),
            ),
            const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}

class _RowBasketItem extends StatelessWidget {
  const _RowBasketItem({
    super.key,
    required this.imageName,
    required this.dessertName,
    required this.dessertPrice,
    this.onPressedPlus, this.onPressedMinus, required this.itemConter,
  });
  final String imageName;
  final String dessertName;
  final double dessertPrice;
  final void Function()? onPressedPlus;
  final void Function()? onPressedMinus;
  final int itemConter;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height/8,
      child: Card(
        elevation: 0,
        color: Colors.white,
        child: Row(
          children: [
            const Divider(color: Colors.black,height: 10,),
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
                      child: Image.asset("images/$imageName.png",fit: BoxFit.cover,),)),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                 Text(dessertName,style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),),
                Text("$dessertPrice",style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.purple,fontWeight: FontWeight.bold),),
              ],
            ),
            const Spacer(),
            Card(
              color: const Color(0xff7b2cbf),
              child: Row(
                children: [
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: IconButton(
                        color: const Color(0xff7b2cbf),
                        onPressed: onPressedMinus, 
                        icon: const Icon(Icons.remove_rounded)),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width/10,
                    child: Text("$itemConter",textAlign: TextAlign.center,style: const TextStyle(color: Colors.white),)),
                  Container(
                    color: Colors.white,
                    child: IconButton(
                      color: const Color(0xff7b2cbf),
                      onPressed: onPressedPlus, 
                      icon: const Icon(Icons.add_rounded)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
