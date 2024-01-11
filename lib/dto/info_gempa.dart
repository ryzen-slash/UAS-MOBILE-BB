import 'gempa.dart';

class Infogempa {
  final List<Gempa> gempa;

  @override
  String toString() {
    return 'Infogempa{gempa: $gempa}';
  }

  Infogempa.fromJson(Map<String, dynamic> json)
      : gempa = (json['gempa'] as List).map((i) => Gempa.fromJson(i)).toList();
}
