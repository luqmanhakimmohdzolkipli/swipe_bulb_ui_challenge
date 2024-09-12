import 'package:flutter/material.dart';
import 'package:swipe_bulb_challenge/constants/size_constant.dart';

class ContainerBackgroundImageWidget extends StatelessWidget {
  const ContainerBackgroundImageWidget({
    super.key,
    required this.backgroundImage,
    this.child,
    this.childPadding,
    this.childBackgroundColor,
    this.width,
    this.height,
    this.margin,
  });

  final String backgroundImage;
  final Widget? child;
  final double? childPadding;
  final Color? childBackgroundColor;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.only(right: 10),
      width: width ?? MediaQuery.sizeOf(context).width * 0.91,
      height: height ?? 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(childPadding ?? SizeConstant.kDefaultPadding),
        decoration: BoxDecoration(
          color: childBackgroundColor,
          borderRadius: BorderRadius.circular(15),
          gradient: childBackgroundColor == null ? LinearGradient(
            colors: [
              Colors.black.withOpacity(0.5),
              Colors.transparent,
            ],
            stops: const [0.0, 0.8],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ) : null,
        ),
        child: child,
      ),
    );
  }
}
