<p align="center">
    <a href="https://github.com/LeRomino/AuthButtonKit"><img width="700" src="https://github.com/LeRomino/AuthButtonKit/blob/main/assets/preview/example.jpg?raw=true" alt="Example of AuthButtonKit"></a>
</p>

<h1 align="center">
    AuthButtonKit
</h1>

<p align="center">
    A Flutter Package to easily create beautiful auth buttons
    <br/>
    Specially designed for IOS/Android
</p>

<img align="right" width="300" src="https://github.com/LeRomino/AuthButtonKit/blob/main/assets/preview/facebook.png?raw=true" alt="Example of Facebook button">

```dart
import 'package:auth_button_kit/auth_button_kit.dart';

// for a single button
AuthButton(
  onPressed: (method) => print('you pressed $method'),
  brand: Method.facebook,
),

// for a group of buttons
AuthMultiButtons(
  onPressed: (method) => print('you pressed $method'),
  brands: [Method.google, Method.apple],
),
```

```AuthButtonKit``` is a Flutter front end package for Android and IOS that allows you to easily create beautiful login buttons.
The buttons are designed to be beautiful and to please the user, they are specially designed for mobile devices and it is not recommended to use them on computers screens.
It will automatically adapt the colors of the logo, the text and the loader to the background color to ensure a good contrast.

## Usages

You have two ways to use this package (like the example above):

- **AuthButton**: A single button
- **AuthMultiButtons**: A group of buttons

## Customization

You can customize the buttons with the following properties:

| Property | Type | Description |
| --- | --- | --- |
| onPressed | Function(Method) | The function called when the button is pressed, the brand (ex: Method.google) is passed as a parameter |
| brand | Method | The brand of the button (ex: Method.google), you can use a list of brands for AuthMultiButtons |
| text | String | The text of the button, you can use {brand} to display the brand name |
| backgroundColor | Color | The background color of the button |
| shape | OutlinedBorder | The button's shape with options to specify borders (color, width) and corner radius |
| textColor | Color | The text color of the button, adapts to contrast with background by default |
| fontFamily | String | The font family of the button |
| fontWeight | FontWeight | The font weight of the button |
| showLoader | bool | Show a loader when you want |
| loaderColor | Color | The color of the loader, adapts to contrast with background by default |
| splashEffect | bool | Show a splash effect when the button is pressed, does not work with a dark background |
| customImage | Image | Change the default logo of the button, works only with AuthButton class and Method.custom |

## Supported brands (to use like Method.brand)

- Apple
- Custom (you can use your own logo)
- Discord
- Dribbble
- Facebook
- Github
- Google
- Linkedin
- Medium
- Microsoft
- Pinterest
- Reddit
- Spotify
- Tiktok
- Twitter