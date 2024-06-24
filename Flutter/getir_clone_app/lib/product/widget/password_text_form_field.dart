import 'package:flutter/material.dart';

class PasswordTextFormfieldNotEmpty extends StatefulWidget {
  const PasswordTextFormfieldNotEmpty({
    super.key,required this.validator, required this.controller, required this.hintText, required this.keyboardType, 
  });
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  @override
  State<PasswordTextFormfieldNotEmpty> createState() => _PasswordTextFormfieldNotEmptyState();
}

class _PasswordTextFormfieldNotEmptyState extends State<PasswordTextFormfieldNotEmpty> {
  bool _isSecure = true;

  void _changeSecure(){
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: _isSecure,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: IconButton(
          onPressed: _changeSecure,
          icon: AnimatedCrossFade(
          firstChild: const Icon(Icons.visibility_off_outlined),
          secondChild: const Icon(Icons.visibility_outlined),
          crossFadeState: _isSecure ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(seconds: 1),
          ),
        )
        
        
        )
      );
  }
}