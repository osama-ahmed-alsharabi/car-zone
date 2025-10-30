import 'package:car_zone/features/home/presentation/view/widgets/car_item_widget.dart';
import 'package:car_zone/features/home/presentation/view/widgets/car_loading_skeletonizer_widget.dart';
import 'package:car_zone/features/profile/presentation/view_model/get_user_cars/get_user_cars_cubit.dart';
import 'package:car_zone/features/profile/presentation/view_model/get_user_cars/get_user_cars_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetUserCarsBodyBlocBuilder extends StatelessWidget {
  const GetUserCarsBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserCarsCubit, GetUserCarsState>(
      builder: (context, state) {
        if (state is GetUserCarsSuccess) {
          return state.carModel.isEmpty
              ? Center(child: Text('لاتوجد سيارات بعد'))
              : ListView.builder(
                  itemCount: state.carModel.length,
                  itemBuilder: (context, index) {
                    return CarItemWidget(car: state.carModel[index]);
                  },
                );
        } else if (state is GetUserCarsLoading) {
          return CarLoadingSkeletonizerWidget();
        } else if (state is GetUserCarsFauiler) {
          return state.carModel.isEmpty
              ? Center(child: Text('لاتوجد سيارات بعد'))
              : ListView.builder(
                  itemCount: state.carModel.length,
                  itemBuilder: (context, index) {
                    return CarItemWidget(car: state.carModel[index]);
                  },
                );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
