import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialButton extends StatelessWidget {

  final String image;
  const SocialButton({super.key,required this.image});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      child: SizedBox(
          width: 60,
          height: 60,
          child: SvgPicture.asset(image,fit: BoxFit.contain,)),
    );
  }
}
