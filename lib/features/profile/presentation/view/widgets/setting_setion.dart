import 'package:car_zone/core/router/app_router_const.dart';
import 'package:car_zone/core/utils/app_text_style.dart';
import 'package:car_zone/features/profile/data/model/setting_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    List<SettingModel> settingModel = [
      SettingModel(
        title: 'اضافة سيارة للبيع',
        icon: Icons.car_crash_rounded,
        onTap: () {
          context.pushNamed(AppRouterConst.createProductlViewRouteName);
        },
      ),
      SettingModel(
        title: 'الإشعارات',
        icon: Icons.notifications_none,
        onTap: () {},
      ),
      SettingModel(title: 'اللغة', icon: Icons.language, onTap: () {}),
      SettingModel(title: 'الخصوصية', icon: Icons.lock_outline, onTap: () {}),
      SettingModel(
        title: 'المساعدة والدعم',
        icon: Icons.help_outline,
        onTap: () {},
      ),
    ];

    return Column(
      children: settingModel.map((item) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(14),
          ),
          child: ListTile(
            leading: Icon(item.icon, color: Colors.white),
            title: Text(item.title, style: context.textStyle.text16Regular),
            trailing: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white54,
              size: 16,
            ),
            onTap: item.onTap,
          ),
        );
      }).toList(),
    );
  }
}
