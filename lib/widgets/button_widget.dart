import 'package:flutter/material.dart';
import 'package:swipe_bulb_challenge/constants/color_constant.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
    this.textColor,
    this.backgroundColor,
    this.padding,
    this.borderRadius,
    this.borderColor,
    this.visualDensity,
  });

  final void Function()? onPressed;
  final String text;
  final Color? textColor;
  final Color? backgroundColor;
  final double? padding;
  final double? borderRadius;
  final Color? borderColor;
  final VisualDensity? visualDensity;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        visualDensity: visualDensity,
        backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
        padding: EdgeInsets.all(padding ?? 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
        ),
        side: BorderSide(
          color: borderColor ?? Theme.of(context).primaryColor,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: textColor ?? ColorConstant.textColorPrimary,
            ),
      ),
    );
  }
}
