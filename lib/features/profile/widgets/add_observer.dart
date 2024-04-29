import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:health_care/features/profile/cubit/profile_cubit.dart';

class AddObserver extends StatelessWidget {
  const AddObserver({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileCubit profileCubit = BlocProvider.of(context);

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          await showCupertinoDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Email'),
                content: TextFormField(
                  onTapOutside: (event) {
                    Navigator.of(context).pop();
                  },
                  onFieldSubmitted: (value) async {
                    if (value.isEmpty) {
                      Fluttertoast.showToast(
                        msg: "Empty field",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    } else if (!value.contains('@')) {
                      Fluttertoast.showToast(
                        msg: "Incorrect email address",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    } else if (value.isNotEmpty) {
                      Navigator.of(context).pop();

                      await profileCubit.addObserver();
                    }
                  },
                  decoration: const InputDecoration(hintText: 'Observer email'),
                  onChanged: (value) {
                    profileCubit.observer = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
              );
            },
          );
        },
        child: const Text('Add Observer'),
      ),
    );
  }
}
