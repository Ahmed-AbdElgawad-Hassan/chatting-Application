import 'package:flutter/material.dart';

class Startscreen extends StatelessWidget {
  const Startscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          const Image(
            image: AssetImage('assets/download.png'),
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(child: Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'LoginScreen');
              },
              child: Container(
                alignment: Alignment.center,
                margin:const EdgeInsets.only(top: 700),
                width: 250,
                height: 60,
                 decoration:const BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.black,blurRadius: 10,offset: Offset(2, 10))],
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.white,
                  
                 ),
                 child:const Text("-----   Start   -----",style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                 ),),
              ),
            ),
          ),)
        ],
      ),
    );
  }
}
