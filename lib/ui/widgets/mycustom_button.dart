import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthcare_app/ui/utils/app_colors.dart';
import 'package:healthcare_app/ui/utils/text_style.dart';

class MycustomButton extends StatelessWidget {
  final String title;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final double? borderRadius;
  final bool? isLoader;
  final void Function()? onPressed;
  final TextStyle? titleTextStyle;
  final bool hasBorder;
  final Color? borderColor;
  final List<BoxShadow>? boxShadow;
  final IconData? leadingIcon; // IconData instead of Widget
  final Color? leadingIconColor; // Icon color

  const MycustomButton({
    Key? key,
    required this.title,
    this.width,
    this.height,
    this.backgroundColor,
    this.borderRadius,
    this.titleTextStyle,
    this.hasBorder = false,
    this.borderColor,
    this.boxShadow,
    required this.onPressed,
    this.isLoader,
    this.leadingIcon,
    this.leadingIconColor, // New icon color parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textColor =
        titleTextStyle?.color ??
        Colors.white; // Default white if no text color is provided

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.redColor,
        minimumSize: Size(width ?? 375.w, height ?? 52.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
          side: hasBorder
              ? BorderSide(color: borderColor ?? AppColors.whiteColor)
              : BorderSide.none,
        ),
      ),
      child: isLoader == true
          ? CircularProgressIndicator()
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (leadingIcon != null) ...[
                  Icon(
                    leadingIcon,
                    color:
                        leadingIconColor ??
                        textColor, // Icon color same as title color
                  ),
                  SizedBox(width: 8.w),
                ],
                Text(title, style: titleTextStyle ?? AppTextStyles.popBoldbt14),
              ],
            ),
    );
  }
}
