import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthCustomTextfield extends StatelessWidget {
  final String hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final IconData? prefcon;
  final IconData? suffixIc;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final VoidCallback? visibility;

  final ValueChanged<String>? onChanged; // called when text changes
  final FocusNode? focusNode; // current field focus
  final FocusNode? nextFocus; // next field to focus

  const AuthCustomTextfield({
    super.key,
    required this.hintText,
    this.validator,
    this.labelText,
    this.prefcon,
    this.suffixIc,
    this.visibility,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onChanged,
    this.focusNode,
    this.nextFocus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: keyboardType,
        validator: validator,
        obscureText: obscureText,
        onChanged: (value) {
          onChanged?.call(value);
        },
        textInputAction: nextFocus != null
            ? TextInputAction.next
            : TextInputAction.done,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          labelText: labelText,
          hintStyle: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontSize: 13.sp,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
          ),
          prefixIcon: prefcon != null
              ? Icon(prefcon, color: Colors.black)
              : null,
          suffixIcon: suffixIc != null
              ? InkWell(
                  onTap: visibility,
                  child: Icon(suffixIc, color: Colors.black),
                )
              : null,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 14,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.black.withOpacity(0.5),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.blue, width: 0.9),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
