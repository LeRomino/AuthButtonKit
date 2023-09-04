import 'package:auth_button_kit/enum.dart';
import 'package:flutter/material.dart';

export 'enum.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.onPressed,
    required this.brand,
    this.text = 'Continue with {brand}',
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.textColor = Colors.black,
    this.borderRadius,
    this.fontFamily,
    this.fontWeight = FontWeight.w500,
    this.showLoader = false,
    this.loaderColor = Colors.black,
    this.splashEffect = true,
    this.customImage,
  });

  final Function(Method) onPressed;
  final Method brand;
  final String text;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final BorderRadiusGeometry? borderRadius;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final bool showLoader;
  final Color loaderColor;
  final bool splashEffect;
  final Image? customImage;

  String getContrastColor(Color color) {
    return color.red * 0.299 + color.green * 0.587 + color.blue * 0.114 > 186
        ? "dark"
        : "light";
  }

  @override
  Widget build(BuildContext context) {
    final response = getContrastColor(backgroundColor);

    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20),
      child: SizedBox(
        width: double.infinity,
        child: TextButton(
          onPressed: () => onPressed(brand),
          style: TextButton.styleFrom(
            foregroundColor: splashEffect ? Colors.black : backgroundColor,
            backgroundColor: backgroundColor,
            padding: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(30),
              side: BorderSide(color: borderColor, width: 1.5),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 7, right: 7),
            child: SizedBox(
              height: 21,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: customImage != null && brand == Method.custom ||
                                customImage == null && brand != Method.custom
                            ? 20
                            : 0),
                    child: Center(
                      child: showLoader
                          ? SizedBox(
                              width: 21,
                              child: CircularProgressIndicator(
                                color: loaderColor == Colors.black
                                    ? response == "dark"
                                        ? Colors.black
                                        : Colors.white
                                    : loaderColor,
                              ))
                          : Text(
                              text.replaceFirst('{brand}', brand.name),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 18,
                                color: textColor == Colors.black
                                    ? response == "dark"
                                        ? Colors.black
                                        : Colors.white
                                    : textColor,
                                fontWeight: fontWeight,
                                fontFamily: fontFamily,
                              ),
                            ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      brand == Method.custom
                          ? (customImage != null
                              ? Image(
                                  image: customImage!.image,
                                )
                              : Container())
                          : Image.asset(
                              "packages/auth_button_kit/assets/logos${brand.isAdaptive ? "/$response" : ""}/${brand.name}.png"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AuthMultiButtons extends StatelessWidget {
  const AuthMultiButtons({
    super.key,
    required this.onPressed,
    required this.brands,
    this.text = 'Continue with {brand}',
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.textColor = Colors.black,
    this.fontFamily,
    this.fontWeight = FontWeight.w500,
    this.showLoader,
    this.loaderColor = Colors.black,
    this.splashEffect = true,
  });

  final Function(Method) onPressed;
  final List<Method> brands;
  final String text;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final Method? showLoader;
  final Color loaderColor;
  final bool splashEffect;

  MaterialStateProperty<Color?>? getOverlayColor(BuildContext context) {
    return MaterialStateProperty.resolveWith((states) => Colors.red
        .withOpacity(states.contains(MaterialState.pressed) ? 0.5 : 0));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var brand in brands)
          AuthButton(
            onPressed: (b) => onPressed(b),
            brand: brand,
            text: text,
            backgroundColor: backgroundColor,
            borderColor: borderColor,
            textColor: textColor,
            fontFamily: fontFamily,
            fontWeight: fontWeight,
            showLoader: showLoader == brand,
            loaderColor: loaderColor,
            splashEffect: splashEffect,
          ),
      ],
    );
  }
}
