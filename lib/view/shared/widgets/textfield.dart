import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gema/view/theme/theme.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.prefixIcon,
    this.hintText,
    this.suffixOnTap,
    this.controller,
    this.keyboardType,
    this.focusNode,
    this.validator,
    this.fillColor,
    this.readOnly = false,
    this.showCursor = true,
    this.obscureText = false,
    this.noBottom = false,
    this.showSuffix = false,
    this.width,
    this.height,
    this.fontSSize,
    this.horizontalContentPadding,
    this.verticalContentPadding,
    this.onTap,
    this.onChange,
    this.suffixIcon,
    this.inputFormatters,
    this.enabled = true,  this.autoFocus =false,
  });

  final Icon? prefixIcon, suffixIcon;
  final String? hintText;
  final VoidCallback? suffixOnTap;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final Color? fillColor;
  final double? width;
  final double? height;
  final double? fontSSize;
  final double? horizontalContentPadding;
  final double? verticalContentPadding;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChange;
  final bool readOnly;
  final bool showCursor;
  final bool obscureText;
  final bool noBottom;
  final bool showSuffix;
  final bool enabled;
  final bool autoFocus;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization = TextCapitalization.none;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseContainer(
      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      backgroundColor: fillColor ?? Theme.of(context).colorScheme.surface,
      borderRadius: 8,
      child: Row(
        children: [
          if (prefixIcon != null)
            Row(
              children: [
                const SizedBox(width: 10),
                prefixIcon!
              ],
            ),
          Expanded(
            child: TextFormField(
              autofocus: autoFocus,
              keyboardType: keyboardType,
              controller: controller,
              cursorColor: Colors.black,
              cursorHeight: 15,
              cursorWidth: 2,
              onTap: onTap,
              onChanged: onChange,
              readOnly: readOnly,
              obscureText: obscureText,
              showCursor: showCursor,
              focusNode: focusNode,
              validator: validator,
              inputFormatters: inputFormatters,
              textCapitalization: textCapitalization,
              enabled: enabled,
              style: TextStyle(
                color: theme.colorScheme.onSurface,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.bold,
                fontSize: fontSSize,
              ),
              decoration: InputDecoration(
                errorStyle: const TextStyle(fontSize: 10),
                suffixIcon: showSuffix
                    ? IconButton(
                  icon: suffixIcon ??
                      Icon(
                        obscureText
                            ? Icons.visibility_off
                            : Icons.visibility,
                        size: 20,
                      ),
                  onPressed: suffixOnTap,
                )
                    : null,
                border: InputBorder.none, // Remove all borders
                enabledBorder: InputBorder.none, // Remove enabled state border
                focusedBorder: InputBorder.none, // Remove focused state border
                disabledBorder: InputBorder.none, // Remove disabled state border
                errorBorder: InputBorder.none, // Remove error state border
                focusedErrorBorder: InputBorder.none, // Remove focused error state border
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: AppColors.greyColor,
                  fontFamily: "Montserrat",
                  fontSize: 11,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: horizontalContentPadding ?? 15,
                  vertical: verticalContentPadding ?? 5,
                ),
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BaseContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final Color? backgroundColor;
  final Border? border;
  final bool circular;
  final double? width;
  final double? height;

  const BaseContainer({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius,
    this.backgroundColor,
    this.border,
    this.circular = false,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: border,
        borderRadius: circular ? null : BorderRadius.circular(50),
        shape: circular ? BoxShape.circle : BoxShape.rectangle,
      ),
      child: child,
    );
  }
}