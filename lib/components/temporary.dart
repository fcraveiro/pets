import 'dart:math';

double decimalRandom() {
  double random = 1 + Random().nextDouble() * 5;
  String randomString = random.toStringAsFixed(1);
  return double.parse(randomString);
}

inteiro() {
  int random = 1 + Random().nextInt(20000);
  return random;
}
