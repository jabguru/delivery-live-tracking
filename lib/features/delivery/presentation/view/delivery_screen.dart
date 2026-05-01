import 'package:delivery_live_tracking/features/delivery/presentation/widgets/delivery_details.dart';
import 'package:delivery_live_tracking/features/delivery/presentation/widgets/live_tracking.dart';
import 'package:delivery_live_tracking/gen/assets.gen.dart';
import 'package:delivery_live_tracking/global/extensions/context_extension.dart';
import 'package:delivery_live_tracking/global/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeliveryScreen extends StatelessWidget {
  const DeliveryScreen({super.key});

  static const double _detailsHeight = 387.0;
  static const double _detailsVerticalMargin = 18.0 * 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.transparent,
        leadingWidth: context.eqW(80.0),
        leading: Padding(
          padding: EdgeInsets.only(left: context.eqW(29.0)),
          child: Center(
            child: CircleAvatar(
              radius: 20.0,
              backgroundColor: AppColors.white,
              child: Assets.images.arrow.svg(),
            ),
          ),
        ),
        title: Text('Live Tracking', style: context.textTheme.titleLarge),
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          LiveTracking(
            bottomOverlayHeight: context.eqH(
              _detailsHeight + _detailsVerticalMargin,
            ),
          ),
          DeliveryDetails(),
        ],
      ),
    );
  }
}
