import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppProvider{
  final checkboxProvider = StateProvider<bool>((ref) => false);
}