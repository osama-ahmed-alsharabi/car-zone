import 'package:car_zone/core/helpers/service_locator.dart';
import 'package:car_zone/features/favorite/presentation/view/favorite_view.dart';
import 'package:car_zone/features/home/data/repo/home_repo.dart';
import 'package:car_zone/features/home/presentation/view/widgets/home_view_body_widget.dart';
import 'package:car_zone/features/home/presentation/view_model/get_data/get_data_cubit.dart';
import 'package:car_zone/features/home/presentation/view_model/home_ui/home_ui_cubit.dart';
import 'package:car_zone/features/home/presentation/view_model/home_ui/home_ui_state.dart';
import 'package:car_zone/features/profile/presentation/view/profile_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBlocBuilderWidget extends StatelessWidget {
  const HomeBlocBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => GetDataCubit(getIt.get<HomeRepo>())..getGetData(),
        child: BlocBuilder<HomeUiCubit, HomeUiState>(
          builder: (context, state) {
            if (state is HomeUiHome || state is HomeUiInitial) {
              return HomeViewBodyWidget();
            } else if (state is HomeUiFavorite) {
              return FavoriteView();
            } else {
              return ProfileView();
            }
          },
        ),
      ),
    );
  }
}
