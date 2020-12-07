import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sql_flutter/providers/list_scan_provider.dart';
import 'package:sql_flutter/utils/utils.dart';

class ScanTiles extends StatelessWidget {
  final String tipo;

  const ScanTiles({this.tipo});

  @override
  Widget build(BuildContext context) {
    final listScanProvider = Provider.of<ListScanProvider>(context);
    final scans = listScanProvider.scans;

    return ListView.builder(
      itemBuilder: (_, i) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (DismissDirection direction) {
          Provider.of<ListScanProvider>(context, listen: false)
              .borrarScanPorId(scans[i].id);
        },
        child: ListTile(
          leading: Icon(
            this.tipo == 'http' ? Icons.web_outlined : Icons.map_outlined,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(scans[i].valor),
          subtitle: Text(scans[i].id.toString()),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey,
          ),
          onTap: () => launchURL(context, scans[i]),
        ),
      ),
      itemCount: scans.length,
    );
  }
}
