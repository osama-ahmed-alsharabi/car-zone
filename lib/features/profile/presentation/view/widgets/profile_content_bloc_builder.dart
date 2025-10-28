import 'package:car_zone/core/database/dao/user_dao.dart';
import 'package:car_zone/core/helpers/secure_token_storage.dart';
import 'package:car_zone/core/helpers/service_locator.dart';
import 'package:car_zone/core/router/app_router_const.dart';
import 'package:car_zone/core/widgets/custom_button_widget.dart';
import 'package:car_zone/core/widgets/custom_dialog.dart';
import 'package:car_zone/features/home/presentation/view_model/user_view_model.dart/user_view_model_cubit.dart';
import 'package:car_zone/features/home/presentation/view_model/user_view_model.dart/user_view_model_state.dart';
import 'package:car_zone/features/profile/presentation/view/widgets/setting_setion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileContentBlocBuilder extends StatelessWidget {
  const ProfileContentBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserViewModelCubit, UserViewModelState>(
      builder: (context, state) {
        return state is UserViewModelHasData
            ? Column(
                children: [
                  SettingsSection(),
                  SizedBox(height: 40),
                  CustomButtonWidget(
                    text: "تسجيل الخروج",
                    onPressed: () => CustomDialog.showCustomDialog(
                      dismissible: true,
                      context: context,
                      title: "تسجيل الخروج",
                      message: "هل تريد تسجيل الخروج بالفعل",
                      icon: Icons.logout,
                      confirmText: "تأكيد",
                      cancelText: "الغاء",
                      onConfirm: () async {
                        await getIt.get<SecureTokenStorage>().clearToken();
                        await getIt.get<UserDao>().deleteUser();
                        if (!context.mounted) return;
                        BlocProvider.of<UserViewModelCubit>(
                          context,
                        ).getUserData();
                        context.goNamed(AppRouterConst.loginViewRouteName);
                      },
                    ),
                  ),
                ],
              )
            : SizedBox();
      },
    );
  }
}
