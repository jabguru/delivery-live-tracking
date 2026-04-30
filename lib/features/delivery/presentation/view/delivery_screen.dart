import 'package:delivery_live_tracking/features/delivery/presentation/widgets/delivery_details.dart';
import 'package:delivery_live_tracking/features/delivery/presentation/widgets/live_tracking.dart';
import 'package:delivery_live_tracking/gen/assets.gen.dart';
import 'package:delivery_live_tracking/global/extensions/context_extension.dart';
import 'package:delivery_live_tracking/global/theme/colors.dart';
import 'package:flutter/material.dart';

class DeliveryScreen extends StatelessWidget {
  const DeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        children: [LiveTracking(), DeliveryDetails()],
      ),
    );
  }
}
