import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice1/pages/photo.dart';

import '../models/photolist.dart';
import '../models/shoe.dart';
import '../pages/details.dart';

class PShopTile extends StatelessWidget {
  final PhotoList pl;
  void Function()? onTap;
  PShopTile({Key? key, required this.pl,required this.onTap}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30,right: 30,bottom: 30),
      //height: 400,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              pl.imagePath,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30,top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pl.name,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("   "),



                Text(

                  pl.price,
                  style: TextStyle(
                    fontSize: 18,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  pl.description,
                  style: TextStyle(
                      fontSize: 18,color: Colors.grey[550]
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 9),

                SizedBox(height: 10),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Column(
                    children: [
                      Text("   "),
                      Text(" "),
                    ],

                  ),


                    GestureDetector(
                      /*onTap:() => Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => Photo(),
                      ),
                    ) ,*/


                      onTap: (){
                        //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PhotoDetail(shoeData: shoe),));
                        Navigator.pushNamed(context, pl.route);
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(color: Colors.grey[900],borderRadius: BorderRadius.only(topLeft: Radius.circular(22),bottomRight: Radius.circular(10)),),
                        child: Icon(Icons.add,color: Colors.white,size: 50,),
                      ),




                    )
                  ],
                ),



              ],
            ),
          ),

        ],
      ),
    );
  }
}

