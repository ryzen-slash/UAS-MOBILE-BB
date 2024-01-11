import 'dart:convert';
import 'package:http/http.dart' as http;
import 'info_gempa.dart';

main() async {
  var bmkgStatusGempa = await BMKGStatusGempa.getBMKGStatusGempa();
  print(bmkgStatusGempa);
}

class BMKGStatusGempa {
  final Infogempa infogempa;

  const BMKGStatusGempa({
    required this.infogempa,
  });

  BMKGStatusGempa.fromJson(Map<String, dynamic> json)
      : infogempa = Infogempa.fromJson(json['Infogempa']);

  @override
  String toString() {
    return 'BMKGStatusGempa{infogempa: $infogempa}';
  }

  static Future<BMKGStatusGempa> getBMKGStatusGempa() async {
    var url =
        Uri.parse('https://data.bmkg.go.id/DataMKG/TEWS/gempaterkini.json');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return BMKGStatusGempa.fromJson(json);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
