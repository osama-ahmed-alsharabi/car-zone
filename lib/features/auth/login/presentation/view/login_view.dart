import 'package:car_zone/features/auth/login/data/imp/login_imp.dart';
import 'package:car_zone/features/auth/login/presentation/view/widgets/login_consumer_builder_widget.dart';
import 'package:car_zone/features/auth/login/presentation/view_model/cubit/login_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LoginCubit(LoginImp(firebaseAuth: FirebaseAuth.instance)),
      child: const LoginConsumerBuilderWidget(),
    );
  }
}
