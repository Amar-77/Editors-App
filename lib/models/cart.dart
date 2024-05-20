
import 'package:flutter/cupertino.dart';
import 'package:practice1/models/photolist.dart';
import 'package:practice1/pages/details.dart';

import 'shoe.dart';

class Cart extends ChangeNotifier
{
  //list os people
  //static List<String> babu=["Adobe Photoshop",'Adobe Lightroom',"Adobe After Effects","Adobe Premiere Pro",'DaVinci Resolve',];

  static List<Shoe> shoeShop = [
    Shoe(name: "Adobe Photoshop", price: "   Minimal tools", imagePath: 'lib/images/pra6.jpg', description: '   Icons',route: '/ps' ),
    Shoe(name: 'Adobe Lightroom', price: ' Quality Gradings', imagePath: 'lib/images/photo1.png', description: ' Cinematic Presets', route: '/light'),
    Shoe(name: "Adobe After Effects", price: "  Project Files", imagePath: 'lib/images/photo2.png', description: '  Cinematic Luts', route: '/after'),
    Shoe(name: "Adobe Premiere Pro", price: "  Sound effects", imagePath: 'lib/images/pro5.jpg', description: '  Cinematic Luts',route: '/premiere'),
    Shoe(name: 'DaVinci Resolve', price: '  Effects Pack', imagePath: 'lib/images/dav.png', description: '  Cinematic Luts',route: '/Dav'),


  ];

  //final List<Shoe> Photo=List.generate(shoeShop.length, (index) => Shoe(name: '${shoeShop[index]}', price: '${shoeShop[index]}', imagePath: '${shoeShop[index]}', description: '${shoeShop[index]}',));




  //list in cart
  List<Shoe> userCart =[];


  //people available
  List<Shoe> getShoeList()
  {
    return shoeShop;
  }



  //get cart//
List<Shoe> getUserCart()
{
  return userCart;
}




  //add to cart
void addItemToCart(Shoe shoe)
{
  userCart.add(shoe);
  notifyListeners();
}




  //remove fom cart
void removeItemFromCart(Shoe shoe)
{
  userCart.remove(shoe);
  notifyListeners();
}

  List<Shoe> getPhotoList()
  {
    return shoeShop;
  }

}
