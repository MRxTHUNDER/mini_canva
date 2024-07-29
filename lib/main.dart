import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'editor_provider.dart';
import 'editor_sidebar.dart';
import 'workspace.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EditorProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Canva Clone',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CanvaClonePage(),
      ),
    );
  }
}

class CanvaClonePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Canva Clone"),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        elevation: 0.00,
        backgroundColor: Color.fromARGB(255, 220, 232, 251),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: EditorSidebar(),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(16.0),
              // decoration: BoxDecoration(
              //   border: Border.all(color: Color.fromARGB(255, 9, 26, 40),),
              //   borderRadius: BorderRadius.circular(8.0),
              // ),
              child: Workspace(),
            ),
          ),
        ],
      ),
    );
  }
}
