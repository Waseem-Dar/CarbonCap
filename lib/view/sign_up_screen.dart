import 'package:flutter/material.dart';
import 'package:flutter_mvvm_riverpod_task/res/componnents/rounded_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../res/app_colors.dart';
import '../res/app_icons.dart';
import '../res/componnents/text_feild.dart';
import '../utils/routes/app_routes.dart';



class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = ref.watch(formKeyProvider);
    final visibility = ref.watch(visibilityProvider);
    final visibility1 = ref.watch(visibilityProvider1);
    final isChecked = ref.watch(checkboxProvider);
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          context.goNamed(AppRoutesConstant.signInRouteName);
                        },
                        icon: const Icon(
                          Icons.arrow_left_sharp,
                          size: 50,
                        )),
                    Image.asset(
                      AppIcons.appName,
                      width: 138,
                    ),
                    const SizedBox(),
                    const SizedBox(),
                    const SizedBox(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Center(
                          child: Text(
                            "Sign up",
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: AppColors.black),
                          ),
                        ),
                        const SizedBox(height: 8),
                        MyTextField(
                          hint: "First Name*",
                          validator: (value) =>
                              value!.isEmpty ? "This Field is Required" : null,
                        ),
                        const SizedBox(height: 8),
                        MyTextField(
                          hint: "Last Name*",
                          validator: (value) =>
                              value!.isEmpty ? "This Field is Required" : null,
                        ),
                        const SizedBox(height: 8),
                        MyTextField(
                          hint: "Enter Your Email*",
                          validator: (value) =>
                              value!.isEmpty ? "Email is Required" : null,
                        ),
                        const SizedBox(height: 8),
                        MyTextField(
                          hint: "Enter Your Phone Number*",
                          validator: (value) => value!.isEmpty
                              ? "Phone Number is Required"
                              : null,
                        ),
                        const SizedBox(height: 8),
                        MyTextField(
                          hint: "Enter Your Address*",
                          validator: (value) =>
                              value!.isEmpty ? "Address is Required" : null,
                        ),
                        const SizedBox(height: 8),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: AppColors.grey2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: AppColors.green),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(color: Colors.red),
                            ),
                          ),
                          hint: Text("Select Gender*",
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black.withOpacity(0.50))),
                          items: ["Male", "Female", "Other"]
                              .map((e) => DropdownMenuItem(
                                    child: Text(e),
                                    value: e,
                                  ))
                              .toList(),
                          validator: (value) =>
                              value == null ? "Please select a gender" : null,
                          onChanged: (_) {},
                        ),
                        const SizedBox(height: 8),
                        MyTextField(
                          hint: "Create Your Password*",
                          obscureText: visibility ? true : false,
                          validator: (value) =>
                              value!.isEmpty ? "Password is Required" : null,
                          suffix: InkWell(
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
                        ),
                        const SizedBox(height: 8),
                        MyTextField(
                          hint: "Confirm Password*",
                          obscureText: visibility1 ? true : false,
                          validator: (value) => value!.isEmpty
                              ? "Confirmation is Required"
                              : null,
                          suffix: InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              ref.read(visibilityProvider1.notifier).state =
                                  !visibility1;
                            },
                            child: Icon(
                              visibility1
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_rounded,
                              color: AppColors.grey1,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Checkbox(
                              value: isChecked,
                              onChanged: (value) {
                                ref.read(checkboxProvider.notifier).state =
                                    value!;
                              },
                            ),
                            const Expanded(
                              child: Text("I agree with terms and conditions"),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: RoundedButton(
                              onTap: () {
                                // if (formKey.currentState!.validate() &&
                                //     ref.read(checkboxProvider)) {
                                //   // Process submission
                                //
                                // } else if (!ref.read(checkboxProvider)) {
                                //   Utils.flushBarErrorMessage("Please agree with terms and condition", context);
                                // }
                                context.goNamed(AppRoutesConstant.otpRouteName);
                              },
                              text: "Next"),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black),
                            ),
                            InkWell(
                              onTap: () {
                                context
                                    .goNamed(AppRoutesConstant.signInRouteName);
                              },
                              child: Text(
                                'Sign in',
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.green),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

final formKeyProvider = Provider.autoDispose((ref) => GlobalKey<FormState>());

final checkboxProvider = StateProvider<bool>((ref) => false);
final visibilityProvider = StateProvider<bool>((ref) => false);
final visibilityProvider1 = StateProvider<bool>((ref) => false);
