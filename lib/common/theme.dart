import "package:flutter/widgets.dart";

class AppTheme {
  AppTheme._();

  /*
   * Common
   */
  static const Color commonGrey = Color(0xFF8B8B8B);
  static const Color darkGrey = Color.fromARGB(255, 73, 73, 73);
  static const Color waveBlue = Color.fromARGB(255, 29, 120, 255);

  /*
   * Pink Theme
   */
  static const String pinkWallpaper = "assets/pink_wallpaper.jpg";
  static const String lightningLogoWhite = "assets/lightning_logo_white.png";
  static const String lightningLogoPink = "assets/lightning_logo_pink.png";

  static const Color pinkDarkRed = Color(0xFF642121);
  static const Gradient gradientPink = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFFFFFFF),
      Color(0xFFFFDED7),
    ],
  );
  static const Color pinkGreen = Color(0xFF266F24);
  static const Color pinkGreenSub = Color(0xFF058538);
  static const Color pinkMint = Color(0xFFCAF0E2);
  static const Color pinkDarkGrey = Color(0xFF3F3F3F);
  static const Color pinkDarkPink = Color(0xFFE2B9B9);
  static const Color pinkStrongPink = Color(0xFFFF7070);
  static const Color pinkLightPink = Color(0xFFFFDED7);

  /*
   * Indigo Theme
   */
  static const String indigoWallpaper = "assets/indigo_wallpaper.jpg";
  static const String lightningLogoOrigin = "assets/lightning_logo_origin.png";
  static const Color indigoLightBlue = Color(0xFFB2B9FE);
  static const Color indigoDarkBlue = Color(0xFF736798);
  static const Gradient gradientIndigo = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFFFFFFF),
      Color(0xFF384086),
    ],
  );
  static const Color indigoYellow = Color(0xFFE4CD52);
  static const Color indigoDarkGrey = Color(0xFF333131);
  static const Color indigoMiddleBlue = Color(0xFF6E71B8);
  static const Color indigoDeepBlue = Color(0xFF384086);
}
