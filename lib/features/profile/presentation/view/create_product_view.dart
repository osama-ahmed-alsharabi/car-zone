import 'package:car_zone/core/helpers/service_locator.dart';
import 'package:car_zone/features/profile/data/repo/profile_repo.dart';
import 'package:car_zone/features/profile/presentation/view/widgets/create_product_bloc_consumer.dart';
import 'package:car_zone/features/profile/presentation/view_model/add_car/add_car_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateProductView extends StatelessWidget {
  const CreateProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCarCubit(getIt.get<ProfileRepo>()),
      child: CreateProductBlocConsumer(),
    );
  }
}
