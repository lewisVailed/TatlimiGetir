import 'package:flutter/material.dart';

class PasswordTextfield extends StatefulWidget {
  const PasswordTextfield({
    super.key, required this.controller, required this.hintText, required this.keyboardType
  });
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;

  @override
  State<PasswordTextfield> createState() => _PasswordTextfieldState();
}

class _PasswordTextfieldState extends State<PasswordTextfield> {
  bool _isSecure = true;

  void _changeSecure(){
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
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