import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

@pragma('vm:entry-point')
void checkListPage(){
  runZonedGuarded(() {
    runApp(MyApp(color: Colors.green),);
    ///屏幕刷新率和显示率不一致时的优化，必须挪动到 runApp 之后
    GestureBinding.instance.resamplingEnabled = true;
  }, (Object obj, StackTrace stack) {
    print(obj);
    print(stack);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.color});

  final MaterialColor color;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorSchemeSeed: color,
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: color,
          foregroundColor: Colors.white,
          elevation: 8,
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? _counter = 0;
  late MethodChannel _channel;

  @override
  void initState() {
    super.initState();
    _channel = const MethodChannel('saas-merchants-android');
    _channel.setMethodCallHandler((call) async {
      if (call.method == "setCount") {
        // A notification that the host platform's data model has been updated.
        setState(() {
          _counter = call.arguments as int?;
        });
      } else {
        throw Exception('not implemented ${call.method}');
      }
    });
  }

  void _incrementCounter() {
    // Mutations to the data model are forwarded to the host platform.
    _channel.invokeMethod<void>("incrementCount", _counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextButton(
              onPressed: _incrementCounter,
              child: const Text('Add'),
            ),
            TextButton(
              onPressed: () {
                _channel.invokeMethod<void>("next", _counter);
              },
              child: const Text('Next'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Use the url_launcher plugin to open the Flutter docs in
                // a browser.
                final url = Uri.parse('https://flutter.dev/docs');
                if (await launcher.canLaunchUrl(url)) {
                  await launcher.launchUrl(url);
                }
              },
              child: const Text('Open Flutter Docs'),
            ),
          ],
        ),
      ),
    );
  }
}