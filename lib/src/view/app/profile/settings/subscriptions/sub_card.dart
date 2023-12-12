import 'package:recenth_posts/src/utils/enums/enums.dart';

class Sub {
  final int id;
  final SubType subType;
  final double price;
  final double pricePerMonth;
  final int countryCount;

  Sub(
      {required this.id,
      required this.subType,
      required this.price,
      required this.pricePerMonth,
      required this.countryCount});
}
