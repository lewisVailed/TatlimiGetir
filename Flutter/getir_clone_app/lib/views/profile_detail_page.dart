import 'package:flutter/material.dart';

class ProfileDetailPage extends StatefulWidget {
  const ProfileDetailPage({super.key, required this.tfText, required this.labelText, required this.appBarTitle});

  final String tfText;
  final String labelText;
  final String appBarTitle;

  @override
  State<ProfileDetailPage> createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {

  late final TextEditingController tfController;

  @override
  void initState() {
    super.initState();
    tfController = TextEditingController();
    tfController.text = widget.tfText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.90),
      appBar: AppBar(
        title: Text("${widget.appBarTitle} Düzenle"),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_backspace_rounded,color: Colors.white,),
         onPressed: () { 
          Navigator.pop(context);
          },
        ),
      ),
      body:  Column(
        children: [
          const Spacer(flex: 5,),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: tfController,
                decoration: InputDecoration(
                  labelText: widget.labelText,
                  suffixIcon: IconButton(
                    onPressed: (){
                      tfController.clear();
                    }, 
                    icon: const Icon(Icons.cancel_rounded))
                ),
              ),
            ),
          ),
          const Spacer(flex: 95,),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height/15,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff7b2cbf),
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                ), 
                child:  Text("Değişiklikleri Kaydet",style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
                ),
            ),
          )
        ],
      ),
    );
  }
}