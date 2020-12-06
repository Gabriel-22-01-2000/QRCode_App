import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sql_flutter/pages/home_page.dart';
import 'package:sql_flutter/pages/mapa_page.dart';
import 'package:sql_flutter/providers/list_scan_provider.dart';
import 'package:sql_flutter/providers/ui_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Multiprovider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UiProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ListScanProvider(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'QR Escaner',
          initialRoute: 'home',
          theme: ThemeData(
            primaryColor: Colors.teal,
            floatingActionButtonTheme:
                FloatingActionButtonThemeData(backgroundColor: Colors.teal),
          ),
          routes: {
            'home': (_) => HomePage(),
            'mapa': (_) => MapaPage(),
          }),
    );
  }
}
