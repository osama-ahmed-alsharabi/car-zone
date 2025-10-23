import 'package:car_zone/features/home/presentation/view/widgets/brand_list_view_widget.dart';
import 'package:car_zone/features/home/presentation/view_model/brands/brands_cubit.dart';
import 'package:car_zone/features/home/presentation/view_model/brands/brands_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrandBlocBuilderWidget extends StatelessWidget {
  const BrandBlocBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandsCubit, BrandsState>(
      builder: (context, state) {
        if (state is BrandsSuccess) {
          return BrandListViewWidget(brands: state.brands);
        } else if (state is BrandsFauiler) {
          return Text(state.errorMessage);
        } else {
          return SizedBox();
        }
      },
    );
  }
}
