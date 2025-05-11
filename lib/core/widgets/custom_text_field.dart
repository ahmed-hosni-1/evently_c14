import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final bool isPassword;
  final String? text;
  final String? hint;
  final double? hight;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const CustomTextField(
      {super.key,
      this.isPassword = false,
      this.text,
      this.hight,
      this.controller,
      this.hint,
      this.prefixIcon,
      this.validator,
      this.suffixIcon});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = false;
  @override
  void initState() {
    obscureText = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.hight ?? 60,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.top,
        validator: widget.validator,
        controller: widget.controller,
        obscureText: obscureText,
        maxLines: null,
        minLines: null,
        //
        expands: true,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        style: const TextStyle(fontSize: 16),
        decoration: InputDecoration(
          hintText: widget.hint,
          errorStyle: TextStyle(color: Colors.red, fontSize: 12),
          labelText: widget.text,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.isPassword
              ? InkWell(
                  onTap: () {
                    obscureText = !obscureText;
                    setState(() {});
                  },
                  child: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off))
              : widget.suffixIcon,
        ),
      ),
    );
  }
}
