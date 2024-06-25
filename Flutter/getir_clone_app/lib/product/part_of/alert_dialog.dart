

part of '../../view/profile_page.dart';

class _AlertDialog extends StatelessWidget {
  const _AlertDialog({
    super.key,
    });
  final String titleText = "Hesabından çıkmak üzeresin!";
  final String noButtonText = "Hayır";
  final String yesButtonText = "Evet";
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
    title: Text(titleText),
    actions: [
    ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: ProjectColors.appbarColor),
      onPressed: (){
        Navigator.pop(context);
      }, 
      child: Text(noButtonText,style: const TextStyle(color: ProjectColors.white),)),
    TextButton(
      onPressed: (){
        Navigator.of(context).pop<bool>(true);
      }, 
      child: Text(yesButtonText,style: const TextStyle(color: ProjectColors.appbarColor,)))
    ],
    );
  }
}