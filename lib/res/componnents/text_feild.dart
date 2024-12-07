
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_colors.dart';

class MyTextField extends StatelessWidget {
  final String hint;
  final String? Function(String?) validator;
   final   bool obscureText ;
   final Widget suffix;

  const MyTextField({super.key, required this.hint, required this.validator,this.obscureText =false,this.suffix =const SizedBox()});

  @override
  Widget build(BuildContext context) {
    return
      TextFormField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.black.withOpacity(0.50)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius:  BorderRadius.circular(30),
            borderSide: BorderSide(color: AppColors.green),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius:  BorderRadius.circular(30),
            borderSide: BorderSide(color: AppColors.grey2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.red),
          ),
          suffixIcon: suffix
        ),
        obscureText: obscureText,
        validator: validator,

      );
  }
}
