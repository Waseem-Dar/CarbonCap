import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/routes/app_routes.dart';
import '../app_colors.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const RoundedButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.green,
        minimumSize: const Size(257, 57),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w700,color: AppColors.white),
      ),
    );
  }
}
