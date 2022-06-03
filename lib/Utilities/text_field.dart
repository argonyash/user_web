import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Constants/color_constant.dart';
import '../Constants/sizeConstant.dart';

TextFormField getTextField({
  String? hintText,
  TextEditingController? textEditingController,
  Widget? prefixIcon,
  double? borderRadius,
  Widget? suffixIcon,
  bool? isFillColor = true,
  int maxLine = 1,
  double? size = 52,
  Widget? suffix,
  bool textVisible = false,
  bool isEnable = true,
  VoidCallback? onTap,
  bool isOnlyRead = false,
}) {
  return TextFormField(
    enabled: isEnable,
    controller: textEditingController,
    obscureText: textVisible,
    maxLines: maxLine,
    textInputAction: TextInputAction.next,
    keyboardType: TextInputType.name,
    cursorColor: appTheme.primaryTheme,
    onTap: onTap,
    readOnly: isOnlyRead,
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: appTheme.borderColor),
        borderRadius: BorderRadius.circular(
            (borderRadius == null) ? MySize.size4! : borderRadius),
      ),
      filled: isFillColor,
      fillColor: appTheme.fillColor,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
            (borderRadius == null) ? MySize.size4! : borderRadius),
        borderSide: BorderSide(color: BaseTheme().borderColor),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
            (borderRadius == null) ? MySize.size4! : borderRadius),
      ),
      contentPadding: EdgeInsets.only(
        left: MySize.size20!,
        right: MySize.size10!,
        bottom: size! / 2, // HERE THE IMPORTANT PART
      ),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      suffix: suffix,
      hintText: hintText,
      hintStyle: TextStyle(
        fontSize: MySize.size15!,
      ),
    ),
  );
}

TextFormField getTextFormField(
    {TextEditingController? textEditingController,
    FormFieldValidator<String>? validation,
    TextInputType? textInputType,
    Function? ontap,
    double? size = 52,
    Widget? suffix,
    Widget? suffixIcon,
    bool textVisible = false,
    double? borderRadius,
    Color? borderColor,
    bool? isFillColor = false,
    Widget? prefixIcon,
    List<TextInputFormatter>? formator,
    bool isReadOnly = false,
    Function(String)? onChanged,
    bool enable = true,
    String? hintText,
    int? maxLine = 1}) {
  return TextFormField(
    controller: textEditingController,
    cursorColor: appTheme.primaryTheme,
    readOnly: isReadOnly,
    obscureText: textVisible,
    obscuringCharacter: "*",
    enabled: enable,
    inputFormatters: formator,
    validator: validation,
    onChanged: onChanged,
    keyboardType: textInputType,
    maxLines: maxLine,
    decoration: InputDecoration(
      filled: isFillColor,
      fillColor: appTheme.borderColor.withOpacity(0.2),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: (borderColor == null) ? Colors.transparent : borderColor),
        borderRadius: BorderRadius.circular(
            (borderRadius == null) ? MySize.size100! : borderRadius),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
            (borderRadius == null) ? MySize.size100! : borderRadius),
        borderSide: BorderSide(
            color: (borderColor == null) ? Colors.transparent : borderColor),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
            color: (borderColor == null) ? Colors.transparent : borderColor),
        borderRadius: BorderRadius.circular(
            (borderRadius == null) ? MySize.size100! : borderRadius),
      ),
      contentPadding: EdgeInsets.only(
        left: MySize.size20!,
        right: MySize.size10!,
        bottom: size! / 2, // HERE THE IMPORTANT PART
      ),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      suffix: suffix,
      hintText: hintText,
      hintStyle: TextStyle(
        fontSize: MySize.size16!,
      ),
    ),
  );
}
