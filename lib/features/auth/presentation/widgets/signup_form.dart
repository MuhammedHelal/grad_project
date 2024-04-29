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

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);

    return BlocConsumer<AuthCubit, AuthCubitState>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          Fluttertoast.showToast(
            msg: S.of(context).verifyAcc,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Theme.of(context).colorScheme.primary,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          customReplacmentNavigation(context, AppStrings.signInRoute);
        } else if (state is SignUpFailState) {
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
        return Form(
          key: authCubit.signUpFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                validator: (value) {
                  return validateTextFormField(value, context: context);
                },
                onChanged: (value) {
                  authCubit.name = value;
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline_rounded),
                  labelText: 'Name',
                  hintText: 'Enter your name',
                ),
              ),
              const Gap(12),
              TextFormField(
                validator: (value) {
                  return validateTextFormField(value, context: context);
                },
                onChanged: (value) {
                  authCubit.phone = value;
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone,
                  ),
                  labelText: 'Phone',
                  hintText: 'Enter your phone number',
                ),
              ),
              const Gap(12),
              TextFormField(
                validator: (value) {
                  return validateTextFormField(value, context: context);
                },
                onChanged: (value) {
                  authCubit.email = value;
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                  ),
                  labelText: 'Email',
                  hintText: 'Enter your email address',
                ),
              ),
              const Gap(12),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                  if (value != authCubit.reEnterPassword) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                onChanged: (value) {
                  authCubit.password = value;
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
                    Icons.lock,
                  ),
                  labelText: 'Password',
                  hintText: 'Enter your password',
                ),
              ),
              const Gap(12),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                  if (value != authCubit.password) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                onChanged: (value) {
                  authCubit.reEnterPassword = value;
                },
                obscureText: authCubit.securePassword,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: authCubit.toggleSecurePassword,
                    icon: const Icon(
                      Icons.remove_red_eye_outlined,
                    ),
                  ),
                  prefixIcon: const Icon(Icons.lock),
                  labelText: 'Re-enter Password',
                  hintText: 'Enter your password again',
                ),
              ),
              const Gap(15),
              state is SignUpLoadingState
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (authCubit.signUpFormKey.currentState!.validate()) {
                            await authCubit.signUpWithEmailAndPass();
                          }
                        },
                        child: const Text(
                          'SIGN UP',
                          style: MyTextStyles.whiteBold18,
                        ),
                      ),
                    ),
              const Gap(15),
              /*  const Center(child: Text('OR')),
              const Gap(15),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                      backgroundColor: const MaterialStatePropertyAll(
                        AppColors.lightBlue,
                      ),
                      foregroundColor: const MaterialStatePropertyAll(Colors.black)),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Assets.assetsImagesGlogo,
                        height: 40,
                        width: 40,
                      ),
                      const Gap(15),
                      const Text('SIGN IN WITH GOOGLE'),
                    ],
                  ),
                ),
              ),*/
            ],
          ),
        );
      },
    );
  }
}
