import 'package:car_zone/core/utils/app_colors.dart';
import 'package:car_zone/core/widgets/custom_dialog.dart';
import 'package:car_zone/core/widgets/custom_snack_bar.dart';
import 'package:car_zone/features/home/presentation/view/widgets/car_item_widget.dart';
import 'package:car_zone/features/home/presentation/view/widgets/car_loading_skeletonizer_widget.dart';
import 'package:car_zone/features/profile/presentation/view_model/user_cars/user_cars_cubit.dart';
import 'package:car_zone/features/profile/presentation/view_model/user_cars/user_cars_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetUserCarsBodyBlocBuilder extends StatelessWidget {
  const GetUserCarsBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCarsCubit, UserCarsState>(
      listener: (context, state) {
        if (state is UserCarsDeleted) {
          CustomSnackBar.customSnackBar(
            context: context,
            title: state.message,
            color: AppColors.successColor,
          );
        }

        if (state is UserCarsFailedToDelete) {
          CustomSnackBar.customSnackBar(
            context: context,
            title: state.errorMessage,
            color: AppColors.errorColor,
          );
        }
      },
      builder: (context, state) {
        if (state is UserCarsSuccess) {
          return state.carModel.isEmpty
              ? Center(child: Text('لاتوجد سيارات بعد'))
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        "يمكنك القيام بعمليات الحذف او التعديل على العنصر الذي تريده من خلال الضغط عليه بشكل مطول",
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.carModel.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onLongPress: () {
                              CustomDialog.showCustomDialog(
                                dismissible: true,
                                context: context,
                                title: "اختر عملية للعنصر",
                                message:
                                    "قم بأختيار عملية حذف او تعديل على العنصر",
                                cancelText: "تعديل",
                                confirmText: "حذف",
                                onConfirm: () {
                                  CustomDialog.showCustomDialog(
                                    context: context,
                                    title: "حذف العنصر",
                                    message: "هل بالفعل تريد حذف العنصر",
                                    cancelText: "الغاء",
                                    confirmText: "تأكيد",
                                    icon: Icons.delete,
                                    onConfirm: () {
                                      BlocProvider.of<UserCarsCubit>(
                                        context,
                                      ).deleteUserCar(
                                        id: state.carModel[index].id!
                                            .toString(),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                            child: CarItemWidget(car: state.carModel[index]),
                          );
                        },
                      ),
                    ),
                  ],
                );
        } else if (state is UserCarsLoading) {
          return CarLoadingSkeletonizerWidget();
        } else if (state is UserCarsFauiler) {
          return state.carModel.isEmpty
              ? Center(child: Text('لاتوجد سيارات بعد'))
              : ListView.builder(
                  itemCount: state.carModel.length,
                  itemBuilder: (context, index) {
                    return CarItemWidget(car: state.carModel[index]);
                  },
                );
        } else {
          return CarLoadingSkeletonizerWidget();
        }
      },
    );
  }
}
