import 'package:flutter_riverpod/flutter_riverpod.dart';

// 화면에 누를때마다 보이는 숫자
final firstNumberProvider = StateProvider<String>((ref) => '0');
// 결과물
final secondNumberProvider = StateProvider<double>((ref) => 0);
// 기억용
final operatorProvider = StateProvider<String>((ref) => '');