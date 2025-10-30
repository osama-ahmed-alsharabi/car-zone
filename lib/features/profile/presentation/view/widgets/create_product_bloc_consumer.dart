import 'package:car_zone/core/utils/app_colors.dart';
import 'package:car_zone/core/widgets/custom_app_bar_widget.dart';
import 'package:car_zone/core/widgets/custom_snack_bar.dart';
import 'package:car_zone/core/widgets/loading_widget.dart';
import 'package:car_zone/features/profile/presentation/view/widgets/create_product_body.dart';
import 'package:car_zone/features/profile/presentation/view_model/add_car/add_car_cubit.dart';
import 'package:car_zone/features/profile/presentation/view_model/add_car/add_car_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CreateProductBlocConsumer extends StatelessWidget {
  const CreateProductBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddCarCubit, AddCarState>(
      listener: (context, state) {
        if (state is AddCarSuccess) {
          context.pop();
          CustomSnackBar.customSnackBar(
            context: context,
            title: state.message,
            color: AppColors.successColor,
          );
        }
        if (state is AddCarFailure) {
          CustomSnackBar.customSnackBar(
            context: context,
            title: state.error,
            color: AppColors.errorColor,
          );
        }
      },
      builder: (context, state) {
        return PopScope(
          canPop: state is! AddCarLoading,
          child: LoadingWidget(
            isLoading: state is AddCarLoading,
            child: Scaffold(
              appBar: CustomAppBarWidget(
                context: context,
                titleText: "اضافة سيارة للبيع",
              ),
              body: CreateProductBody(),
            ),
          ),
        );
      },
    );
  }
}
