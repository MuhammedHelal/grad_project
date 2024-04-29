import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:health_care/core/constants/text_styles.dart';
import 'package:health_care/core/functions/navigation.dart';
import 'package:health_care/core/utils/strings.dart';
import 'package:health_care/features/profile/cubit/profile_cubit.dart';
import 'package:health_care/features/profile/cubit/profile_state.dart';
import 'package:health_care/features/profile/widgets/add_observer.dart';
import 'package:health_care/features/profile/widgets/profile_item_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileCubit profileCubit = BlocProvider.of(context);
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is ObserverError) {
              Fluttertoast.showToast(
                msg: state.error,
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
            if (state is ProfileSuccess || state is ObserverSuccess) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(50),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hello,',
                          style: MyTextStyles.blackBold20,
                        ),
                        Text(
                          profileCubit.userProfile[FirebaseStrings.name],
                          style: MyTextStyles.blackBold20,
                        ),
                      ],
                    ),
                    const Gap(50),
                    Column(
                      children: [
                        ProfileItemContainer(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.phone,
                              ),
                              const Gap(10),
                              Text(profileCubit.userProfile[FirebaseStrings.phone]),
                            ],
                          ),
                        ),
                        const Gap(12),
                        ProfileItemContainer(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.email,
                              ),
                              const Gap(10),
                              Text(profileCubit.user.email!),
                            ],
                          ),
                        ),
                        const Gap(12),
                        ProfileItemContainer(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.remove_red_eye_outlined,
                              ),
                              const Gap(10),
                              profileCubit.observers.isNotEmpty
                                  ? Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        for (final observer in profileCubit.observers) Text(observer),
                                      ],
                                    )
                                  : const Text('No observers ')
                            ],
                          ),
                        ),
                        const Gap(5),
                        !profileCubit.isObserver ? const AddObserver() : const SizedBox.shrink(),
                      ],
                    ),
                    const Gap(50),
                    GestureDetector(
                      onTap: () async {
                        customPopAllandNavigate(context, AppStrings.signInRoute);
                        await FirebaseAuth.instance.signOut();
                      },
                      child: const ProfileItemContainer(
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout,
                            ),
                            Gap(10),
                            Text('Log out!'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is ProfileError) {
              return Center(
                child: Text(
                  state.error,
                  style: MyTextStyles.blackBold24,
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
