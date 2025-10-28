import 'package:car_zone/features/home/presentation/view/widgets/car_loading_skeletonizer_widget.dart';
import 'package:car_zone/features/home/presentation/view/widgets/home_car_list_view_widget.dart';
import 'package:car_zone/features/home/presentation/view_model/get_data/get_data_cubit.dart';
import 'package:car_zone/features/home/presentation/view_model/get_data/get_data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarBlocBuilderWidget extends StatelessWidget {
  const CarBlocBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDataCubit, GetDataState>(
      builder: (context, state) {
        if (state is GetDataSuccess) {
          return HomeCarListViewWidget(cars: state.cars);
        } else if (state is GetDataFauiler) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.errorMessage)),
          );
        } else {
          return SliverToBoxAdapter(child: CarLoadingSkeletonizerWidget());
        }
      },
    );
  }
}
