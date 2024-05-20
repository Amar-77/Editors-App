import 'package:flutter/material.dart';
import 'package:practice1/components/pshoptile.dart';
import 'package:practice1/models/cart.dart';
import 'package:practice1/models/photolist.dart';
import 'package:provider/provider.dart';
import 'package:practice1/models/phcart.dart';
import '../components/shoe_tile.dart';
import '../models/shoe.dart';
class Pshop extends StatefulWidget {
  const Pshop({Key? key}) : super(key: key);


  @override
  State<Pshop> createState() => _PshopState();
}

class _PshopState extends State<Pshop> {
  void addShoeToCart(Shoe shoe){
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);
    showDialog(context: context, builder: (context) => AlertDialog(title: Text(' This Killadi is Added!!'),
      content: Text('     Check your Selected Team.'),));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: SafeArea(
        child: Consumer<Cart>(builder: (context, value , child) => Column(
          children: [
            Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(color: Colors.grey[100],borderRadius: BorderRadius.circular(8),),
                child:const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Search for ps tools',style: TextStyle(color: Colors.grey),),
                    Icon(Icons.search,color: Colors.grey,),
                  ],
                )

            ),

            Padding(padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Text(' ',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [Text('Trending Works! ',style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 24,),
                ),
                  Text('See All',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),)
                ],),
            ),
            const SizedBox(height: 6,),

            Expanded(child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index)
                {
                 PhotoList pl=value.getPhotoList()[index] as PhotoList;
                  return PShopTile(
                    pl: pl,
                    onTap: () => addShoeToCart(pl as Shoe),
                  );
                }
                )
            ),



          ],
        ),),
      ),
    );

  }
}




