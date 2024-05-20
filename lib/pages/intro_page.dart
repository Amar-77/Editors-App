import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey[300],
      body: Center
        (

          child:Padding
            (
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column
                  (
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>
                      [
                                const SizedBox(height: 200,),

                                Padding(
                                  padding: const EdgeInsets.all(22.0),

                                  child: Image.asset('lib/images/logo.png',height: 370,),
                                ),

                                const SizedBox(height: 100,),

                                GestureDetector(
                                  onTap:() => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomePage(),
                                    ),
                                  ) ,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[900],
                                      borderRadius: BorderRadius.circular(15),
                                    ),


                                    child: Padding(
                                      padding: const EdgeInsets.all(25.0),
                                      child: Center(child: const Text('Enter as Guest',style: TextStyle(color: Colors.white,fontSize: 20),)),
                                    ),
                                  ),
                                ),



                                const SizedBox(height: 60,),

                                Text(
                                      'Refine your works!',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                    ),
                                    ),

                                const SizedBox(height: 1,),

                                Text(
                                  'Beta v0.1',
                                  style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.grey,
                                  ),
                                ),
                      ],
                ),
          )
      )
    );
  }
}
