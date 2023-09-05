
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample1/core/constants/asset_constants.dart';
import 'package:riverpod_sample1/features/auth/controller/auth_controller.dart';
import 'package:riverpod_sample1/theme.dart';

class SignInButton extends ConsumerWidget {
  const SignInButton({Key? key}) : super(key: key);
  
  void signInWithGoogle(WidgetRef ref,BuildContext context){
    ref.read(authControllerProvider).signInWithGoogle(context);
  }

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton.icon(
        onPressed: () =>signInWithGoogle(ref,context),
        icon: Image.asset(
          AssetConst.googlePath,
          width: 35,
        ),
        label: const Text(
          "Continue with Google",
          style: TextStyle(fontSize: 18),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: Pallete.greyColor,
            minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        )),
      ),
    );
  }
}
