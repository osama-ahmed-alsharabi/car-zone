import 'package:car_zone/core/helpers/service_locator.dart';
import 'package:car_zone/features/home/data/repo/home_repo.dart';
import 'package:car_zone/features/home/presentation/view/widgets/brand_bloc_builder_widget.dart';
import 'package:car_zone/features/home/presentation/view_model/brands/brands_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrandSectionWidget extends StatelessWidget {
  const BrandSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BrandsCubit(getIt.get<HomeRepo>())..getBrands(),
      child: BrandBlocBuilderWidget(),
    );
  }
}
