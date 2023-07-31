/*
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'), // 'const' keywordunu kaldırın
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
  int intValue = 0;
  double busVoltage = 0.0;
  double current_mA = 0.0;
  double loadVoltage = 0.0;
  double power_mW = 0.0;
  double shuntVoltage = 0.0;
  double value = 0.0;

  @override
  void initState() {
    super.initState();
    // Firebase verilerini dinleyin ve güncellemeleri gösterin
    databaseReference.child('test').onValue.listen((event) {
      DataSnapshot dataValues = event.snapshot;
      if (dataValues.value is Map<String, dynamic>?) {
        Map<String, dynamic>? values = dataValues.value as Map<String, dynamic>?;

        if (values != null) {
          setState(() {
            intValue = values['int'] ?? 0;
            busVoltage = values['busvoltage'] ?? 0.0;
            current_mA = values['current_mA'] ?? 0.0;
            loadVoltage = values['loadvoltage'] ?? 0.0;
            power_mW = values['power_mW'] ?? 0.0;
            shuntVoltage = values['shuntvoltage'] ?? 0.0;
            value = values['value'] ?? 0.0; // Düzeltme: value değerini double olarak al
          });
        }
      } else {
        // Veriler uyumsuz türde, hata işleme yapabilirsiniz.
        // Örneğin, print veya loglama yapabilirsiniz.
        print("Hata: Veri türü uyumsuz.");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('int Veri: $intValue'),
            Text('busvoltage Veri: $busVoltage'),
            Text('current_mA Veri: $current_mA'),
            Text('loadvoltage Veri: $loadVoltage'),
            Text('power_mW Veri: $power_mW'),
            Text('shuntvoltage Veri: $shuntVoltage'),
            Text('value Veri: $value'),
          ],
        ),
      ),
    );
  }
}

 */


import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
  int intValue = 0;
  double busVoltage = 0.0;
  double current_mA = 0.0;
  double loadVoltage = 0.0;
  int power_mW = 0;
  int shuntVoltage = 0;
  double value = 0;

  @override
  void initState() {
    super.initState();
    // Firebase verilerini dinleyin ve güncellemeleri gösterin
    databaseReference.child('test').onValue.listen((event) {
      DataSnapshot dataValues = event.snapshot;
      if (dataValues.value is Map<dynamic, dynamic>?) {
        Map<dynamic, dynamic>? values =
        dataValues.value as Map<dynamic, dynamic>?;

        if (values != null) {
          setState(() {
            intValue = values['int'] ?? 0;
            busVoltage = values['busvoltage'] ?? 0.0;
            current_mA = values['current_mA'] ?? 0.0;
            loadVoltage = values['loadvoltage'] ?? 0.0;
            power_mW = values['power_mW'] ?? 0.0;
            shuntVoltage = values['shuntvoltage'] ?? 0.0;
            value = values['shuntvoltage']?.toDouble() ?? 0.0; // Düzeltme: value değerini double olarak al
          });
        }
      } else {
        // Veriler uyumsuz türde, hata işleme yapabilirsiniz.
        // Örneğin, print veya loglama yapabilirsiniz.
        print("Hata: Veri türü uyumsuz.");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('int : $intValue'),
            Text('busvoltage: $busVoltage'),
            Text('current_mA: $current_mA'),
            Text('loadvoltage: $loadVoltage'),
            Text('power_mW: $power_mW'),
            Text('shuntvoltage: $shuntVoltage'),
            Text('value: $value'), // Düzeltme: value değişkenini de göster
          ],
        ),
      ),
    );
  }
}


