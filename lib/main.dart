import 'package:flutter/material.dart';

void main(){
  runApp(Profile());
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          leading: Icon(Icons.menu),
          title: Text("Profile Card"),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){
              print("pressed on search");
            }, icon: Icon(Icons.more_vert)),
            IconButton(onPressed: (){}, icon: Icon(Icons.info_outline))
          ],

        ),
      ),
    );
  }
}

