import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sql_flutter/pages/direcciones_page.dart';
import 'package:sql_flutter/pages/mapas_page.dart';
import 'package:sql_flutter/providers/list_scan_provider.dart';
import 'package:sql_flutter/providers/ui_provider.dart';
import 'package:sql_flutter/widgets/custom_navigationbar.dart';
import 'package:sql_flutter/widgets/scan_button.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR App"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {
              Provider.of<ListScanProvider>(context, listen: false)
                  .borrarTodos();
            },
          )
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    //Cambiar para mostrar la página respectiva
    final currentIndex = uiProvider.selectedMenuOpt;
    //
    final listScanProvider =
        Provider.of<ListScanProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        listScanProvider.cargarScansPorTipo('geo');
        return MapasPage();
      case 1:
        listScanProvider.cargarScansPorTipo('http');
        return DireccionesPage();
      default:
        return MapasPage();
    }
  }
}
