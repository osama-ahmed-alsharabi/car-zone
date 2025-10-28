import 'package:car_zone/features/home/presentation/view/widgets/brand_list_view_widget.dart';
import 'package:car_zone/features/home/presentation/view_model/get_data/get_data_cubit.dart';
import 'package:car_zone/features/home/presentation/view_model/get_data/get_data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BrandBlocBuilderWidget extends StatelessWidget {
  const BrandBlocBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDataCubit, GetDataState>(
      builder: (context, state) {
        if (state is GetDataSuccess) {
          return BrandListViewWidget(brands: state.brands);
        } else if (state is GetDataFauiler) {
          return Center(child: Text("state.errorMessage"));
        } else if (state is GetDataLoading) {
          return const Skeletonizer(
            enabled: true,
            child: BrandListViewWidget(),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
