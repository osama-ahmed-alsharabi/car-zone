import 'package:car_zone/core/helpers/service_locator.dart';
import 'package:car_zone/features/auth/register/data/repo/register_repo.dart';
import 'package:car_zone/features/auth/register/presentation/view/widgets/register_bloc_consumer_widget.dart';
import 'package:car_zone/features/auth/register/presentation/view_model/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(getIt<RegisterRepo>()),
      child: const RegisterBlocConsumerWidget(),
    );
  }
}
