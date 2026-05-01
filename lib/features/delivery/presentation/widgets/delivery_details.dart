import 'package:delivery_live_tracking/features/delivery/presentation/viewmodel/delivery_provider.dart';
import 'package:delivery_live_tracking/gen/assets.gen.dart';
import 'package:delivery_live_tracking/global/extensions/color_extension.dart';
import 'package:delivery_live_tracking/global/extensions/context_extension.dart';
import 'package:delivery_live_tracking/global/extensions/text_style_extension.dart';
import 'package:delivery_live_tracking/global/theme/colors.dart';
import 'package:delivery_live_tracking/global/widgets/progress_indicator.dart';
import 'package:delivery_live_tracking/global/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeliveryDetails extends ConsumerWidget {
  const DeliveryDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deliveryAsync = ref.watch(deliveryProvider);
    final etaAsync = ref.watch(etaProvider);
    return deliveryAsync.when(
      loading: () {
        return _Container(child: const Center(child: LoadingIndicator()));
      },
      error: (error, stack) {
        return Center(child: Text('Error: $error'));
      },
      data: (delivery) {
        return _Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(
              context.eqW(12.0),
              context.eqH(16.0),
              context.eqW(12.0),
              context.eqH(21.0),
            ),
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
                          'The package is estimated to arrive within the next ${etaAsync.when(data: (eta) => "$eta minute${eta != 1 ? 's' : ''}.", loading: () => '${delivery.etaMinutes}', error: (_, _) => '${delivery.etaMinutes}')}',
                          style: context.textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                ),
                VerticalSpacing(context.eqH(14.0)),
                Container(
                  width: double.infinity,
                  height: context.eqH(296.0),
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
                                    delivery.courierName,
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
                            padding: EdgeInsets.fromLTRB(
                              13.0,
                              4.0,
                              11.29,
                              4.75,
                            ),
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
                                delivery.orderId,
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
                                _BlinkingStatusDot(
                                  enabled:
                                      delivery.deliveryStatus == 'on_delivery',
                                  color: AppColors.orange,
                                  radius: 2.5,
                                ),
                                HorizontalSpacing(4.0),
                                Text(
                                  delivery.deliveryStatus == 'on_delivery'
                                      ? 'On Delivery'
                                      : delivery.deliveryStatus == 'arrived'
                                      ? 'Arrived'
                                      : delivery.deliveryStatus.replaceAll(
                                          '_',
                                          ' ',
                                        ),
                                  style: context.textTheme.bodySmall.c(
                                    AppColors.orange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      VerticalSpacing(18.0),
                      _DeliveryTimeline(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _BlinkingStatusDot extends StatefulWidget {
  const _BlinkingStatusDot({
    required this.enabled,
    required this.color,
    required this.radius,
  });

  final bool enabled;
  final Color color;
  final double radius;

  @override
  State<_BlinkingStatusDot> createState() => __BlinkingStatusDotState();
}

class __BlinkingStatusDotState extends State<_BlinkingStatusDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _opacity = Tween<double>(
      begin: 0.25,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    if (widget.enabled) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(covariant _BlinkingStatusDot oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.enabled == widget.enabled) return;

    if (widget.enabled) {
      _controller.repeat(reverse: true);
    } else {
      _controller
        ..stop()
        ..value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dot = Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: widget.color),
    );

    return SizedBox(
      width: widget.radius * 2,
      height: widget.radius * 2,
      child: widget.enabled
          ? FadeTransition(opacity: _opacity, child: dot)
          : dot,
    );
  }
}

class _DeliveryTimeline extends StatelessWidget {
  const _DeliveryTimeline();

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: 22.0,
                height: 22.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary),
                ),
                child: Center(
                  child: CircleAvatar(
                    radius: 8.0,
                    backgroundColor: AppColors.primary,
                  ),
                ),
              ),
              SizedBox(
                width: 2.0,
                height: context.eqH(55.0),
                child: CustomPaint(painter: _DottedLinePainter()),
              ),
              Assets.images.mapPin.svg(),
            ],
          ),
          HorizontalSpacing(12.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4.0,
                    children: [
                      Text(
                        'On Delivery',
                        style: context.textTheme.bodySmall.c(
                          AppColors.neutralColorBody,
                        ),
                      ),
                      Text(
                        'Courier is delivering the package',
                        style: context.textTheme.bodySmall
                            .c(AppColors.neutralColor)
                            .w500,
                      ),
                      Text(
                        '25 minutes destination',
                        style: context.textTheme.bodySmall.c(
                          AppColors.neutralColorBody,
                        ),
                      ),
                    ],
                  ),
                  HorizontalSpacing(17.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '10:47 AM',
                        style: context.textTheme.bodySmall.c(
                          AppColors.neutralColorBody,
                        ),
                      ),
                      VerticalSpacing(2.0),
                      Text(
                        '18 Jan, 2026',
                        style: context.textTheme.bodyMedium
                            .c(AppColors.neutralColor)
                            .w500,
                      ),
                    ],
                  ),
                ],
              ),
              VerticalSpacing(context.eqH(28.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Delivered',
                        style: context.textTheme.bodySmall.c(
                          AppColors.neutralColorBody,
                        ),
                      ),
                      VerticalSpacing(4.0),
                      Text(
                        'Akobo, Ibadan',
                        style: context.textTheme.bodyMedium
                            .c(AppColors.neutralColor)
                            .w500,
                      ),
                    ],
                  ),
                  HorizontalSpacing(context.eqW(132.0)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '----------',
                        style: context.textTheme.bodySmall.c(
                          AppColors.neutralColorBody,
                        ),
                      ),
                      VerticalSpacing(2.0),
                      Text(
                        '----------',
                        style: context.textTheme.bodyMedium
                            .c(AppColors.neutralColor)
                            .w500,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Container extends StatelessWidget {
  const _Container({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: context.eqW(13.0),
        vertical: context.eqH(18.0),
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      width: double.infinity,
      height: context.eqH(387.0),
      child: child,
    );
  }
}

class _DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.grey
      ..strokeWidth = 1.0;

    const dashHeight = 2.0;
    const dashSpace = 2.0;

    var y = 0.0;
    while (y < size.height) {
      canvas.drawLine(
        Offset(size.width / 2, y),
        Offset(size.width / 2, y + dashHeight),
        paint,
      );
      y += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
