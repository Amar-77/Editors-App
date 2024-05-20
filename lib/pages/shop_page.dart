import 'package:flutter/material.dart';
import 'package:practice1/models/cart.dart';
import 'package:provider/provider.dart';

import '../components/shoe_tile.dart';
import '../models/shoe.dart';
class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addShoeToCart(Shoe shoe){
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);
    showDialog(context: context, builder: (context) => AlertDialog(title: Text(' This item is Added!!'),
    content: Text('     Check your Cart.'),));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, value , child) => Column(
      children: [
        Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(color: Colors.grey[100],borderRadius: BorderRadius.circular(8),),
            child:const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Search',style: TextStyle(color: Colors.grey),),
                Icon(Icons.search,color: Colors.grey,),
              ],
            )

        ),

        Padding(padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Text('Templates / luts / presets / project files',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [Text('Popular Softwares ',style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 24,),
            ),
              Text('See All',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),)
            ],),
        ),
        const SizedBox(height: 6,),

        Expanded(child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index){
              Shoe shoe=value.getShoeList()[index];
              return ShoeTile(
                shoe: shoe,
                onTap: () => addShoeToCart(shoe),
              );
            })
        ),



      ],
    ),);

  }
}
