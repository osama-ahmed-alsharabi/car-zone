import 'package:car_zone/core/helpers/api_helper.dart';
import 'package:car_zone/core/helpers/secure_token_storage.dart';
import 'package:car_zone/core/helpers/service_locator.dart';
import 'package:car_zone/core/widgets/custom_app_bar_widget.dart';
import 'package:car_zone/features/profile/data/repo/profile_repo.dart';
import 'package:car_zone/features/profile/presentation/view/widgets/get_user_cars_body_bloc_builder.dart';
import 'package:car_zone/features/profile/presentation/view_model/user_cars/user_cars_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCarsListView extends StatelessWidget {
  const UserCarsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCarsCubit(
        getIt.get<ProfileRepo>(),
        getIt.get<ApiHelper>(),
        getIt.get<SecureTokenStorage>(),
      )..getUserCars(),
      child: Scaffold(
        appBar: CustomAppBarWidget(context: context, titleText: "معرض سياراتي"),
        body: GetUserCarsBodyBlocBuilder(),
      ),
    );
  }
}
