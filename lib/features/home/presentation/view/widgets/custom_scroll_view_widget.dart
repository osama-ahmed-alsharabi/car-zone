import 'package:car_zone/features/home/presentation/view/widgets/brand_bloc_builder_widget.dart';
import 'package:car_zone/features/home/presentation/view/widgets/car_bloc_builder_widget.dart';
import 'package:car_zone/features/home/presentation/view/widgets/search_app_bar_widget.dart';
import 'package:car_zone/features/home/presentation/view_model/get_data/get_data_cubit.dart';
import 'package:car_zone/features/home/presentation/view_model/get_data/get_data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomScrollViewWidget extends StatelessWidget {
  const CustomScrollViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            scrolledUnderElevation: 0,
            elevation: 0,
            floating: true,
            snap: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            expandedHeight: 280,
            flexibleSpace: FlexibleSpaceBar(
              background: BlocBuilder<GetDataCubit, GetDataState>(
                builder: (context, state) {
                  return Skeletonizer(
                    enabled: state is GetDataLoading,
                    child: Column(
                      children: const [
                        SearchBarAppWidget(),
                        BrandBlocBuilderWidget(),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          const CarBlocBuilderWidget(),
        ],
      ),
    );
  }
}
