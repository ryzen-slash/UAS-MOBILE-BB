import 'dart:core';

class Gempa {
  final String Tanggal;
  final String Jam;
  final DateTime Datetime;
  final String Coordinates;
  final String Lintang;
  final String Bujur;
  final double Magnitude;
  final String Kedalaman;
  final String Wilayah;
  final String Potensi;

  Gempa.fromJson(Map<String, dynamic> json)
      : Tanggal = json['Tanggal'],
        Jam = json['Jam'],
        Datetime = DateTime.parse(json['DateTime']),
        Coordinates = json['Coordinates'],
        Lintang = json['Lintang'],
        Bujur = json['Bujur'],
        Magnitude = double.parse(json['Magnitude']),
        Kedalaman = json['Kedalaman'],
        Wilayah = json['Wilayah'],
        Potensi = json['Potensi'];

  @override
  String toString() {
    return 'Gempa{Tanggal: $Tanggal, Jam: $Jam, Datetime: $Datetime, Coordinates: $Coordinates, Lintang: $Lintang, Bujur: $Bujur, Magnitude: $Magnitude, Kedalaman: $Kedalaman, Wilayah: $Wilayah, Potensi: $Potensi}';
  }
}
