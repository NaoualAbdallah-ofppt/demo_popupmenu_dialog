import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
  void _showDialog(BuildContext context, value) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Votre choix"),
          content: Text("Vous savez choisi " + value),
          actions: [
            MaterialButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: PopupMenuButton(
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                value: "a",
                child: Text('Item 1'),
              ),
              PopupMenuItem(
                value: "b",
                child: Text('Item 2'),),
              PopupMenuItem(
                value: "c",
                child: Text('Item 3'),
              ),
            ];
          },
          initialValue: "b",
          onSelected: (value) {
            setState(() {
              // if value 1 show dialog
              switch (value)
              {
                case "a":
                  _showDialog(context,"aa");break;
                case "b":
                  _showDialog(context,"bb");break;
                case "c":
                  _showDialog(context,"cc");break;
              }
            });
          },
        ),
      ),
    );
  }
}
