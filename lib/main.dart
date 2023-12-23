import 'package:flutter/material.dart';
import 'package:order/order.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Welcome',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget{

  
  @override
  Widget build(BuildContext context){

    // double width = MediaQuery. of(context). size. width ;
    // double heightofscreen = MediaQuery. of(context). size. height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome to ShopZ',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.orangeAccent,
                fontSize: 50,
                
              ),
            
            ),
            SizedBox( height: 20,),
            
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> Food() )
                  );
              },
              child: Text('Start Eating'),
            ),
        
        
          ],
        ),
      ),
    );
  }
}