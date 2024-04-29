import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:health_care/core/constants/text_styles.dart';
import 'package:health_care/core/functions/navigation.dart';
import 'package:health_care/core/utils/strings.dart';
import 'package:health_care/features/auth/auth_cubit/auth_cubit.dart';
import 'package:health_care/features/auth/auth_cubit/auth_cubit_state.dart';
import 'package:health_care/features/auth/functions/validate_textformfield.dart';
import 'package:health_care/generated/l10n.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);

    return BlocConsumer<AuthCubit, AuthCubitState>(
      listener: (context, state) async {
        if (state is SignInSuccessState) {
          if (FirebaseAuth.instance.currentUser!.emailVerified) {
            if (authCubit.isObserver) {
              customPopAllandNavigate(context, AppStrings.observerNavBarRoute);
            } else {
              customPopAllandNavigate(context, AppStrings.navBarRouteString);
            }
          } else {
            Fluttertoast.showToast(
              msg: S.of(context).pleaseVerifyAcc,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        } else if (state is SignInFailState) {
          Fluttertoast.showToast(
            msg: state.errMessage,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
      builder: (context, state) {
        final S local = S.of(context);
        return Form(
          key: authCubit.signinFormKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  return validateTextFormField(value, context: context);
                },
                onChanged: (value) {
                  authCubit.email = value;
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  labelText: local.email,
                  hintText: local.enterEmail,
                ),
              ),
              const Gap(25),
              TextFormField(
                onChanged: (value) {
                  authCubit.password = value;
                },
                validator: (value) {
                  return validateTextFormField(value, context: context);
                },
                obscureText: authCubit.securePassword,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: authCubit.toggleSecurePassword,
                    icon: const Icon(
                      Icons.remove_red_eye_outlined,
                    ),
                  ),
                  prefixIcon: const Icon(
                    (Icons.lock),
                  ),
                  labelText: local.password,
                  hintText: local.enterPassword,
                ),
              ),
              const Gap(15),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    customNavigation(context, AppStrings.forgetPassRouteString);
                  },
                  child: Text(local.forgetPassword),
                ),
              ),
              state is SignInLoadingState
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (authCubit.signinFormKey.currentState!.validate()) {
                            await authCubit.signInWithEmailAndPassword();
                          }
                        },
                        child: const Text(
                          'SIGN IN',
                          style: MyTextStyles.whiteBold18,
                        ),
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}
