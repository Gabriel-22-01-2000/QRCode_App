import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sql_flutter/providers/list_scan_provider.dart';

class MapasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final listScanProvider = Provider.of<ListScanProvider>(context);
    final scans = listScanProvider.scans;

    return ListView.builder(
      itemBuilder: (_, i) => ListTile(
        leading: Icon(
          Icons.map,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(scans[i].valor),
        subtitle: Text(scans[i].id.toString()),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.grey,
        ),
        onTap: () => print('Click'),
      ),
      itemCount: scans.length,
    );
  }
}
