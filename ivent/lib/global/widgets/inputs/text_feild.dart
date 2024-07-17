import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GTextField extends StatefulWidget {
  final String hintText;
  final IconData prefixIcon;
  final bool isPassword;
  TextEditingController controller;
  TextInputType textInputType;
  Function(String)? onChanged;
  GTextField({
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    this.isPassword = false,
    this.textInputType = TextInputType.text,
    this.onChanged,
    super.key,
  });

  @override
  _GTextFieldState createState() => _GTextFieldState();
}

class _GTextFieldState extends State<GTextField> {
  bool _obscureText = true;
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: widget.controller,
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.prefixIcon),
          hintText: widget.hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: _togglePasswordVisibility,
                )
              : null,
        ),
        obscureText: widget.isPassword ? _obscureText : false,
        onChanged: widget.isPassword ? widget.onChanged! : null);
  }
}
