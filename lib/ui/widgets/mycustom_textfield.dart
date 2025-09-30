import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';
import '../utils/text_style.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String titleText;
  final bool obscureText;
  final TextStyle? hintTextStyle;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Function(String)? onSubmitted;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final bool readOnly;

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? isBorder;
  final Color borderColor;
  final Color textColor;
  final Color hintColor;
  final Color fillColor;
  final double? width;
  final EdgeInsetsGeometry? contentPadding;
  final double? height;
  final BorderRadiusGeometry? borderRadius;

  final TextInputAction textInputAction;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.titleText,
    this.readOnly = false,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.borderColor = const Color(0xff4DBBAE),
    this.textColor = Colors.black,
    this.hintColor = Colors.grey,
    this.fillColor = Colors.grey,
    this.width,
    this.height,
    this.hintTextStyle,
    this.isBorder = false,
    this.contentPadding,
    this.borderRadius,
    this.onSubmitted,
    this.focusNode,
    this.onChanged,
    this.textInputAction = TextInputAction.next,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderRadius effectiveBorderRadius =
        (borderRadius as BorderRadius?) ?? BorderRadius.circular(6.r);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titleText, style: AppTextStyles.popRegular12),
        SizedBox(height: 5.h),
        Container(
          height: height ?? 39.h,
          width: width ?? 315.w,
          decoration: BoxDecoration(
            border: isBorder == true
                ? Border.all(color: const Color(0xFFB1B1B1), width: 1)
                : null,
            borderRadius: effectiveBorderRadius,
            color: AppColors.lightGrey,
          ),
          child: ClipRRect(
            borderRadius: effectiveBorderRadius,
            child: TextFormField(
              readOnly: readOnly,
              cursorColor: AppColors.blackColor,
              controller: controller,
              obscureText: obscureText,
              textAlign: TextAlign.start,
              focusNode: focusNode,
              onChanged: onChanged,
              textInputAction: textInputAction,
              keyboardType: keyboardType,
              onFieldSubmitted:
                  onSubmitted ??
                  (value) {
                    if (textInputAction == TextInputAction.next) {
                      FocusScope.of(context).nextFocus();
                    } else {
                      FocusScope.of(context).unfocus();
                    }
                  },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: effectiveBorderRadius,
                  borderSide: BorderSide.none,
                ),
                prefixIcon: prefixIcon, // Added prefixIcon usage here
                suffixIcon: suffixIcon,
                hintText: hintText,
                hintStyle:
                    hintTextStyle ??
                    AppTextStyles.popRegular10.copyWith(height: 3.0.h),
                contentPadding:
                    contentPadding ??
                    EdgeInsets.symmetric(
                      vertical: 0.10.h,
                      horizontal: 10.w,
                    ), // Default content padding
                filled: true,
                fillColor: AppColors.whiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
