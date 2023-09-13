import 'package:auth_button_kit/auth_button_kit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home: const Example(),
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class Example extends StatefulWidget {
  const Example({
    Key? key,
  }) : super(key: key);

  @override
  State<Example> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<Example> {
  Method? brandSelected;

  void toogle(Method brand) {
    setState(() {
      brandSelected = brand;
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          brandSelected = null;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth Buttons Example'),
      ),
      body: IgnorePointer(
        ignoring: brandSelected != null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Single button ↓
            AuthButton(
              onPressed: (b) => toogle(b),
              brand: Method.tiktok,
              text: 'Continue with {brand}',
              backgroundColor: Theme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: const BorderSide(color: Colors.transparent),
              ),
              fontFamily: 'Inter',
              showLoader: brandSelected == Method.tiktok,
            ),
            // Group of buttons ↓
            AuthMultiButtons(
              onPressed: (b) => toogle(b),
              brands: const [
                Method.google,
                Method.apple,
              ],
              text: 'Sign in with {brand}',
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(
                    color: Theme.of(context).brightness == Brightness.light
                        ? const Color(0xFFAFBCC7)
                        : Colors.transparent,
                    width: 1.5),
              ),
              fontFamily: 'Inter',
              showLoader: brandSelected,
            ),
            // Custom button ↓
            AuthButton(
              onPressed: (b) => toogle(b),
              brand: Method.custom,
              text: 'Custom',
              textCentering: Centering.independent,
              textColor: const Color(0xFF46c5fb),
              backgroundColor: const Color(0xFF171106),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.transparent
                      : const Color(0xFF46c5fb),
                  width: 1.5,
                ),
              ),
              fontFamily: 'Inter',
              showLoader: brandSelected == Method.custom,
              loaderColor: const Color(0xFF46c5fb),
              splashEffect: false,
              customImage: Image.asset('assets/images/Flutter.png'),
              padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 12),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
