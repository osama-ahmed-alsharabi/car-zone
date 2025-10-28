import 'package:car_zone/core/utils/app_text_style.dart';
import 'package:car_zone/core/widgets/custom_app_bar_widget.dart';
import 'package:car_zone/features/home/data/model/brand_model.dart';
import 'package:car_zone/features/home/data/model/car_model.dart';
import 'package:car_zone/features/home/presentation/view/widgets/car_item_widget.dart';
import 'package:car_zone/features/home/presentation/view/widgets/car_loading_skeletonizer_widget.dart';
import 'package:car_zone/features/home/presentation/view_model/get_data/get_data_cubit.dart';
import 'package:car_zone/features/home/presentation/view_model/get_data/get_data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrandCarsView extends StatelessWidget {
  final BrandModel brand;
  const BrandCarsView({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(context: context, titleText: brand.name),
      body: BlocBuilder<GetDataCubit, GetDataState>(
        builder: (context, state) {
          if (state is GetDataSuccess) {
            List<CarModel> cars = state.cars
                .where((element) => element.brandId == brand.id)
                .toList();
            return cars.isEmpty
                ? Center(
                    child: Text(
                      "لا تتوفر سيارات لهذالبراند",
                      style: context.textStyle.text24Bold,
                    ),
                  )
                : ListView.builder(
                    itemCount: cars.length,
                    itemBuilder: (context, index) {
                      return CarItemWidget(car: cars[index]);
                    },
                  );
          } else if (state is GetDataLoading) {
            return const CarLoadingSkeletonizerWidget();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
