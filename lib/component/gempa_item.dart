import 'package:flutter/material.dart';
import '../dto/gempa.dart';

class GempaItem extends StatefulWidget {
  final Gempa gempa;

  const GempaItem({Key? key, required this.gempa}) : super(key: key);

  @override
  _GempaItemState createState() => _GempaItemState();
}

class _GempaItemState extends State<GempaItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                title: Text('Date'),
                subtitle: Text(widget.gempa.Tanggal),
              ),
              ListTile(
                title: Text('Coordinate'),
                subtitle: Text(widget.gempa.Coordinates),
              ),
              ListTile(
                title: Text('Magnitude'),
                subtitle: Text(widget.gempa.Magnitude.toString()),
              ),
              ListTile(
                title: Text('Depth'),
                subtitle: Text(widget.gempa.Kedalaman),
              ),
              ListTile(
                title: Text('Region'),
                subtitle: Text(widget.gempa.Wilayah),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
