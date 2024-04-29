import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:health_care/core/constants/images.dart';
import 'package:health_care/core/functions/navigation.dart';
import 'package:health_care/core/utils/strings.dart';
import 'package:health_care/features/auth/auth_cubit/auth_cubit.dart';
import 'package:health_care/features/auth/auth_cubit/auth_cubit_state.dart';
import 'package:health_care/features/auth/functions/validate_textformfield.dart';
import 'package:health_care/generated/l10n.dart';

class ForgetPassSendEmail extends StatelessWidget {
  const ForgetPassSendEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    final S local = S.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SendEmailHeader(),
            const Gap(20),
            BlocConsumer<AuthCubit, AuthCubitState>(
              listener: (context, state) {
                if (state is ResetPassWithLinkSuccessState) {
                  Fluttertoast.showToast(
                    msg: S.of(context).sentResetLinkSuccess,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                  customPopAllandNavigate(context, AppStrings.signInRoute);
                } else if (state is ResetPassWithLinkFailState) {
                  Fluttertoast.showToast(
                    msg: state.errorMessage,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                }
              },
              builder: (context, state) {
                return Form(
                  key: authCubit.sendEmailFormKey,
                  child: Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFormField(
                          controller: TextEditingController(),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            labelText: local.email,
                            hintText: local.enterEmail,
                          ),
                          onChanged: (value) {
                            authCubit.email = value;
                          },
                          autocorrect: false,
                          validator: (value) {
                            return validateTextFormField(value, context: context);
                          },
                        ),
                        state is ResetPassWithLinkLoadingState
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : ElevatedButton(
                                onPressed: () {
                                  authCubit.resetPassWithLink();
                                },
                                child: Text(local.sendEmailResetPassword),
                              )
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SendEmailHeader extends StatelessWidget {
  const SendEmailHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final S local = S.of(context);
    final ThemeData myTheme = Theme.of(context);
    return Column(
      children: [
        SizedBox(
          child: Image.asset(Assets.assetsImagesResetPassSendEmail),
        ),
        const Gap(10),
        Text(
          local.resetPassword,
          style: myTheme.textTheme.headlineLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Text(
          local.typeYourEmailAndClickTheButton,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
