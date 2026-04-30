import 'package:delivery_live_tracking/gen/assets.gen.dart';
import 'package:delivery_live_tracking/global/extensions/color_extension.dart';
import 'package:delivery_live_tracking/global/extensions/context_extension.dart';
import 'package:delivery_live_tracking/global/extensions/text_style_extension.dart';
import 'package:delivery_live_tracking/global/theme/colors.dart';
import 'package:delivery_live_tracking/global/widgets/space.dart';
import 'package:flutter/material.dart';

class DeliveryDetails extends StatelessWidget {
  const DeliveryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: context.eqW(13.0),
        vertical: context.eqH(18.0),
      ),
      padding: EdgeInsets.fromLTRB(
        context.eqW(12.0),
        context.eqH(16.0),
        context.eqW(12.0),
        context.eqH(21.0),
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      width: double.infinity,
      height: context.eqH(369.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.eqW(17.5)),
            child: Row(
              children: [
                Assets.images.clock.svg(),
                HorizontalSpacing(12.0),
                Flexible(
                  child: Text(
                    'The package is estimated to arrive within the next 25 minutes.',
                    style: context.textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),
          VerticalSpacing(context.eqH(14.0)),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.neutralColorLight.o(15),
                borderRadius: BorderRadius.circular(15.0),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: context.eqW(17.0),
                vertical: context.eqH(19.0),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Assets.images.presley.image(
                            width: 50.0,
                            height: 50.0,
                          ),
                          HorizontalSpacing(14.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Presley Williams',
                                style: context.textTheme.bodyLarge,
                              ),
                              VerticalSpacing(6.0),
                              Text('Courier'),
                            ],
                          ),
                        ],
                      ),
                      HorizontalSpacing(8.0),
                      Container(
                        padding: EdgeInsets.fromLTRB(13.0, 4.0, 11.29, 4.75),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: AppColors.primary,
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 12.0,
                              backgroundColor: AppColors.white,
                              child: Assets.images.phone.svg(),
                            ),
                            HorizontalSpacing(5.0),
                            Text(
                              'Call',
                              style: context.textTheme.bodyMedium
                                  .c(AppColors.white)
                                  .w500,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  VerticalSpacing(18.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order ID',
                            style: context.textTheme.bodySmall.c(
                              AppColors.neutralColorBody,
                            ),
                          ),
                          Text(
                            'ORD-682834513',
                            style: context.textTheme.bodyMedium
                                .c(AppColors.neutralColor)
                                .w500,
                          ),
                        ],
                      ),
                      HorizontalSpacing(8.0),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.5,
                          vertical: 6.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: AppColors.orange.o(6.0),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 2.5,
                              backgroundColor: AppColors.orange,
                            ),
                            HorizontalSpacing(4.0),
                            Text(
                              'On Delivery',
                              style: context.textTheme.bodySmall.c(
                                AppColors.orange,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
