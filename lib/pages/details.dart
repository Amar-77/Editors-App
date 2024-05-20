import 'package:flutter/material.dart';

import '../models/shoe.dart';
class PhotoDetail extends StatefulWidget {

  final Shoe shoeData;
  const PhotoDetail({Key? key,required this.shoeData}): super(key: key);

  @override
  State<PhotoDetail> createState() => _PhotoDetailState();
}

class _PhotoDetailState extends State<PhotoDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Babu"),),
        body: Text('hai'),
        );
    }
}