import 'package:recenth_posts/src/utils/style/hex_method.dart';

class AppColors extends HexColor {
  AppColors(super.hexColor);

  // static final kWhiteColor = HexColor('#FFFFFF');
  // static final kblackColor = HexColor('#000000');
  static final kwineColor = HexColor('#B76E79');
  static final klightBlackColor = HexColor('#263238');
  static final kdotGrey = HexColor('#D9D9D9');
  static final kpouchBlue = HexColor('#00C4CC');

  ///  STANDARD COLOR

  static final kblackColor = HexColor('#0B0B0B');
  static final kWhiteColor = HexColor('#FFFFF');

  /// ERROR DESIGN COLORS
  static final kerrorColor50 = HexColor('#FDE9EA');
  static final kerrorColor100 = HexColor('#FAD4D6');
  static final kerrorColor200 = HexColor('#F6A9AC');
  static final kerrorColor300 = HexColor('#F17E83');
  static final kerrorColor400 = HexColor('#ED5359');
  static final kerrorColor500 = HexColor('#E82830');
  static final kerrorColor600 = HexColor('#BA2026');
  static final kerrorColor700 = HexColor('#8B181D');
  static final kerrorColor800 = HexColor('#5D1013');
  static final kerrorColor900 = HexColor('#2E080A');

  /// WARNING DESIGN COLORS
  static final kwarningColor50 = HexColor('#FEF6E7');
  static final kwarningColor100 = HexColor('#FFF1D7');
  static final kwarningColor200 = HexColor('#FBDAA1');
  static final kwarningColor300 = HexColor('#FAC772');
  static final kwarningColor400 = HexColor('#FAC772');
  static final kwarningColor500 = HexColor('#F8B543');
  static final kwarningColor600 = HexColor('#C58210');
  static final kwarningColor700 = HexColor('#94610C');
  static final kwarningColor800 = HexColor('#624108');
  static final kwarningColor900 = HexColor('#312004');

  /// PRIMARY DESIGN COLORS
  static final kprimaryColor50 = HexColor('#FEF8F8');
  static final kprimaryColor100 = HexColor('#FDF0F2');
  static final kprimaryColor200 = HexColor('#FADADE');
  static final kprimaryColor300 = HexColor('#FFC3CB');
  static final kprimaryColor400 = HexColor('#FFB6BF');
  static final kprimaryColor500 = HexColor('#F9A7B2');
  static final kprimaryColor600 = HexColor('#F48C99');
  static final kprimaryColor700 = HexColor('#D85B6B');
  static final kprimaryColor800 = HexColor('#C93B4D');
  static final kprimaryColor900 = HexColor('#960618');

  /// SECONDARY DESIGN COLORS
  static final ksecondaryColor50 = HexColor('#F5FFFF');
  static final ksecondaryColor100 = HexColor('#DCF9FA');
  static final ksecondaryColor200 = HexColor('#C4F3F5');
  static final ksecondaryColor300 = HexColor('#93E7EB');
  static final ksecondaryColor400 = HexColor('#62DCE0');
  static final ksecondaryColor500 = HexColor('#00C4CC');
  static final ksecondaryColor600 = HexColor('#00767A');
  static final ksecondaryColor700 = HexColor('#004E52');
  static final ksecondaryColor800 = HexColor('#003B3D');
  static final ksecondaryColor900 = HexColor('#002325');

  /// GRAY DESIGN COLORS
  static final kgrayColor50 = HexColor('#F7F7F7');
  static final kgrayColor100 = HexColor('#EFEFEF');
  static final kgrayColor200 = HexColor('#DFDFDF');
  static final kgrayColor300 = HexColor('#D0D0D0');
  static final kgrayColor400 = HexColor('#C0C0C0');
  static final kgrayColor500 = HexColor('#B0B0B0');
  static final kgrayColor600 = HexColor('#8D8D8D');
  static final kgrayColor700 = HexColor('#6A6A6A');
  static final kgrayColor800 = HexColor('#464646');
  static final kgrayColor900 = HexColor('#232323');

  /// SUCCESS DESIGN COLORS
  static final ksuccessColor50 = HexColor('#E5F7F2');
  static final ksuccessColor100 = HexColor('#CCEEE6');
  static final ksuccessColor200 = HexColor('#99DDCD');
  static final ksuccessColor300 = HexColor('#66CDB3');
  static final ksuccessColor400 = HexColor('#33BC9A');
  static final ksuccessColor500 = HexColor('#00AB81');
  static final ksuccessColor600 = HexColor('#008967');
  static final ksuccessColor700 = HexColor('#00674D');
  static final ksuccessColor800 = HexColor('#004434');
  static final ksuccessColor900 = HexColor('#00221A');

  static final kbrandWhite = HexColor('#FFFFFF');
  static final kbrandGrey100 = HexColor('#EFEFEF');
  static final kbrandsubtitleGrey = HexColor('FF6A6A6A');

  /// NEW COLOR
  static dynamic useHex(String hex) => HexColor(hex);
}
