import 'package:flutter/material.dart';
import 'package:flutter_mvvm_riverpod_task/main.dart';
import 'package:flutter_mvvm_riverpod_task/res/app_colors.dart';
import 'package:flutter_mvvm_riverpod_task/res/componnents/rounded_button.dart';
import 'package:flutter_mvvm_riverpod_task/res/componnents/social_button.dart';
import 'package:flutter_mvvm_riverpod_task/utils/routes/app_routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_mvvm_riverpod_task/res/app_icons.dart';
import 'package:flutter_mvvm_riverpod_task/providers/app_providers.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double size = MediaQuery.of(context).size.width;
    final isChecked = ref.watch(checkboxProvider);
    final visibility = ref.watch(visibilityProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset(
                AppIcons.loginImage,
                width: size * 0.67,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 190),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome to",
                        style: GoogleFonts.poppins(
                            fontSize: 38,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black),
                      ),
                      Image.asset(
                        AppIcons.appName,
                        width: 138,
                      )
                    ],
                  ),
                  const SizedBox(height: 25),
                  Text(
                    'Please Sign in or Sign Up in CarbonCap',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      'Sign in',
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppColors.black),
                    ),
                  ),
                  const SizedBox(height: 26),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter Your Email',
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black.withOpacity(0.55)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                            color: Color(0xFFDADADA), width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                            color: Color(0xFFDADADA), width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide:
                            BorderSide(color: AppColors.green, width: 2),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 28,
                      ),
                    ),
                  ),
                  const SizedBox(height: 26),
                  TextFormField(
                    obscureText: visibility ? true : false,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      hintText: 'Enter Your Password',
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black.withOpacity(0.55)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                            color: Color(0xFFDADADA), width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                            color: Color(0xFFDADADA), width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide:
                            BorderSide(color: AppColors.green, width: 2),
                      ),
                      suffixIcon: InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          ref.read(visibilityProvider.notifier).state =
                              !visibility;
                        },
                        child: Icon(
                          visibility
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_rounded,
                          color: AppColors.grey1,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 28,
                      ),
                    ),
                  ),
                  // const SizedBox(height: 26),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Remember Password',
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black),
                      ),
                      // const SizedBox(width: 18),
                      Checkbox(
                        side: BorderSide(color: AppColors.purple),
                        value: isChecked,
                        onChanged: (value) {
                          ref.read(checkboxProvider.notifier).state = value!;
                        },
                      ),
                      const Spacer(),
                      Text(
                        'Forget Password?',
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.blue1,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Center(child: RoundedButton(onTap: () {}, text: "Sign in")),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        'New in CarbonCap?',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black),
                      ),
                      InkWell(
                        onTap: () {
                          context.goNamed(AppRoutesConstant.signUpRouteName);
                        },
                        child: Text(
                          'Sign Up',
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.green),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 37),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 50,
                          child: SocialButton(image: AppIcons.shareIcon)),
                      SocialButton(image: AppIcons.facebookIcon),
                      SocialButton(image: AppIcons.whatsappIcon),
                      SocialButton(image: AppIcons.linkedinIcon),
                      SocialButton(image: AppIcons.instagramIcon),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final checkboxProvider = StateProvider<bool>((ref) => false);
final visibilityProvider = StateProvider<bool>((ref) => false);
