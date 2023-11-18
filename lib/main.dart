import 'package:flutter/material.dart';
import 'package:grass/models/user.dart';
import 'package:grass/page_viewer.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
        if(!User.loaded){
      User.putDummyData();}
    return const MaterialApp(
      title: 'Grass',
      color: Colors.black,

      home: PageViewer()
          
        
      
    );
  }
}
