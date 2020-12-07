import 'package:flutter/material.dart';
import 'package:sql_flutter/widgets/scans_tiles.dart';

class MapasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScanTiles(tipo: 'geo');
  }
}
