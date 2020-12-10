import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:sql_flutter/providers/list_scan_provider.dart';
import 'package:sql_flutter/utils/utils.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3D8BEF', 'Cancelar', false, ScanMode.QR);
        if (barcodeScanRes == '-1') {
          return;
        }

        final listScanProvider =
            Provider.of<ListScanProvider>(context, listen: false);

        final nuevoScan = await listScanProvider.nuevoScan(barcodeScanRes);
        launchURL(context, nuevoScan);
      },
      child: Icon(Icons.filter_center_focus),
    );
  }
}
