import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil"),
      ),
      body:  const Column(
        children: [
          _ListTile(icon: Icons.person_rounded, titleText: "Mustafa Narin"),
          Divider(),
          _ListTile(icon: Icons.email_rounded, titleText: "mustafa.narin1132@gmail.com"),
          Divider(),
          _ListTile(icon: Icons.phone_rounded, titleText: "+90 555 444 33 22"),
          Divider(),
          _ListTile(icon: Icons.output_rounded, titleText: "Çıkış Yap")
        ],),
    );
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({
    super.key, required this.icon, required this.titleText, this.onTap,
  });
  final IconData icon;
  final String titleText;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon,size: 40,),
      title:  Text(titleText),
      titleTextStyle: Theme.of(context).textTheme.titleMedium,
      trailing: const Icon(Icons.chevron_right_rounded,size: 30,),
      iconColor: const Color(0xff7b2cbf),
      onTap: onTap,
      
      );
  }
}