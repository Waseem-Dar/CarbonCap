import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mvvm_riverpod_task/res/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../res/app_icons.dart';
import '../utils/routes/app_routes.dart';

// A provider to manage OTP input state
final otpProvider = StateProvider<List<String>>((ref) => ["", "", "", ""]);

class OTPScreen extends ConsumerWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otp = ref.watch(otpProvider); // Watching the OTP state

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () {
                context.goNamed(AppRoutesConstant.signUpRouteName);
              }, icon: const Icon(Icons.arrow_left_sharp,size: 50,)),
              Image.asset(AppIcons.appName,width: 138,),
              const SizedBox(),
              const SizedBox(),
              const SizedBox(),

            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  "Verification Code",
                  style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w700,color: AppColors.black),
                ),
                const SizedBox(height: 10),
                Text(
                  "We have sent the 4-digit verification code to your Phone Number and Email Address",
                  style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.black),
                ),
                const SizedBox(height: 5),
                Text(
                  "abc@gmail.com and 0349*****32",
                  style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w600,color: AppColors.green),
                ),
                const SizedBox(height: 20),

                // OTP Input Fields
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    4,
                        (index) => _buildOtpField(context, ref, index),
                  ),
                ),
                const SizedBox(height: 30),

                // Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Handle resend logic
                      },
                      child: const Text("Resend"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                       context.goNamed(AppRoutesConstant.dashBoardRouteName);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      ),
                      child: const Text("Verify"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper Widget to Build Individual OTP Field
  Widget _buildOtpField(BuildContext context, WidgetRef ref, int index) {
    final otp = ref.watch(otpProvider);
    return SizedBox(
      height: 65,
      width: 60,
      child: TextField(
        onChanged: (value) {
          if (value.length == 1) {
            ref.read(otpProvider.notifier).update((state) {
              state[index] = value;
              return [...state];
            });
            if (index < 3) {
              FocusScope.of(context).nextFocus();
            }
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context).previousFocus();
          }
        },
        cursorColor: AppColors.green,
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          counterText: "",

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: AppColors.grey1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: AppColors.grey1,
              width: 1
            )
          ),
        ),
      ),
    );
  }
}
