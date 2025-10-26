import 'package:car_zone/core/utils/assets.dart';
import 'package:car_zone/features/car_details/presentation/view/widgets/app_bar_action_buttons.dart';
import 'package:car_zone/features/home/data/model/car_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CarImageHeader extends StatelessWidget {
  final CarModel car;

  const CarImageHeader({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 350,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: 'car-${car.id}',
          child: car.images.mainImage.isNotEmpty
              ? Image.network(
                  car.images.mainImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) =>
                      DefaultCarImage(),
                )
              : DefaultCarImage(),
        ),
        title: Text(
          car.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                blurRadius: 15,
                color: Colors.black87,
                offset: Offset(0, 1),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: Icon(Icons.arrow_back_ios_new),
      ),
      actions: const [AppBarActionButtons()],
    );
  }
}

class DefaultCarImage extends StatelessWidget {
  const DefaultCarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.imagesSecondImageOnboarding,
      fit: BoxFit.cover,
      width: double.infinity,
    );
  }
}
