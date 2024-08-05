import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
final String? label;
  final String? hintText;
   final double width;
    

  final TextEditingController? controller;
  final int? maxInputLength;

  const CustomTextField({
    super.key,
     this.label,
    this.hintText,
    this.width = double.infinity,
     this.controller, 
    this.maxInputLength,
    this.label,
 

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isVisable = false;
  @override
  Widget build(BuildContext context) {
return TextFormField(
      inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(widget.maxInputLength),
        ],
      controller: widget.controller,
      validator: (value) {
        if (value!.isEmpty && widget.label == 'Email') {
          return 'Please enter your email';
        } else if (value.isEmpty && widget.label == 'Password') {
          return 'Please enter your password';
        } else {
          return null;
        }
      },
      obscureText: widget.label != "Password" ? false : !isVisable,
      decoration: InputDecoration(
    return SizedBox(
      width: widget.width,
      child: TextFormField(
        controller: widget.controller,
        validator: validateMessage,
        obscureText: widget.label != "Password" ? false : !isVisable,
        decoration: InputDecoration(
          prefixIcon: widget.label == 'Phone number'
              ? Image.asset('assets/images/egypt.png', scale: 12)
              : null,
          suffixIcon: widget.label != "Password"
              ? null
              : IconButton(
                  onPressed: () {
                    isVisable = !isVisable;
                    setState(() {});
                  },
                  icon: isVisable
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                ),
          contentPadding:  const EdgeInsets.all(12),
          labelText: widget.label,
          hintText: widget.hintText,
          labelStyle: const TextStyle(fontSize: 15),
          floatingLabelStyle:
              const TextStyle(fontSize: 18, color: Colors.black),
          focusedBorder: customBorder(),
          border: customBorder(),
        ),
        keyboardType: widget.label == 'Phone number'
            ? TextInputType.phone
            : TextInputType.text,
      ),
    );
  }

  OutlineInputBorder customBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.black));
  }

  String? validateMessage(value) {
    if (value!.isEmpty && widget.label == 'Email') {
      return 'Please enter your email';
    } else if (value.isEmpty && widget.label == 'Password') {
      return 'Please enter your password';
    } else if (value.isEmpty && widget.label == 'Phone number') {
      return 'Please enter your phone num';
    } else if (value.isEmpty && widget.label == 'First name') {
      return 'Required';
    } else if (value.isEmpty && widget.label == 'Last name') {
      return 'Required';
    } else {
      return null;
    }
  }
}
