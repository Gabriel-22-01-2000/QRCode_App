import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:sql_flutter/providers/list_scan_provider.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        final barcodeScanRes = 'https://google.com.mx';
        print(barcodeScanRes);

        final listScanProvider =
            Provider.of<ListScanProvider>(context, listen: false);
        listScanProvider.nuevoScan(barcodeScanRes);
        listScanProvider.nuevoScan('geo:15.33.15,15.66');
      },
      child: Icon(Icons.filter_center_focus),
    );
  }
}
