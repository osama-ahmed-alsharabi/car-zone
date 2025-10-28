import 'package:car_zone/features/home/presentation/view/widgets/custom_scroll_view_widget.dart';
import 'package:car_zone/features/home/presentation/view/widgets/home_app_bar_widget.dart';
import 'package:car_zone/features/home/presentation/view_model/get_data/get_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBodyWidget extends StatelessWidget {
  const HomeViewBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await BlocProvider.of<GetDataCubit>(
          context,
        ).getGetData(forceRefresh: true);
      },
      child: Column(
        children: [
          HomeAppBarWidget(context: context),
          const CustomScrollViewWidget(),
        ],
      ),
    );
  }
}
