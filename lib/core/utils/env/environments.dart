import 'package:injectable/injectable.dart';

class Environments {
  static const String develop = 'develop';
  static const String staging = 'staging';
  static const String production = 'production';
}

const dummy = Environment(Environments.develop);
