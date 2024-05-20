
import 'package:flutter/cupertino.dart';
import 'package:practice1/pages/details.dart';

import 'photolist.dart';

class PsCart extends ChangeNotifier
{
  //list os people
  //static List<String> babu=["Adobe Photoshop",'Adobe Lightroom',"Adobe After Effects","Adobe Premiere Pro",'DaVinci Resolve',];

  static List<PhotoList> PShop = [
    PhotoList(name: "Adobe Photoshop", price: "   Minimal tools", imagePath: 'lib/images/ps.png', description: '   Icons',route: '/ps' ),
    PhotoList(name: 'Adobe Lightroom', price: ' Quality Gradings', imagePath: 'lib/images/photo1.png', description: ' Cinematic Presets', route: '/light'),
    PhotoList(name: "Adobe After Effects", price: "  Project Files", imagePath: 'lib/images/photo2.png', description: '  Cinematic Luts', route: '/after'),
    PhotoList(name: "Adobe Premiere Pro", price: "  Sound effects", imagePath: 'lib/images/pr6.jpg', description: '  Cinematic Luts',route: '/premiere'),
    PhotoList(name: 'DaVinci Resolve', price: '  Effects Pack', imagePath: 'lib/images/dav.png', description: '  Cinematic Luts',route: '/Dav'),


  ];

  //final List<Shoe> Photo=List.generate(shoeShop.length, (index) => Shoe(name: '${shoeShop[index]}', price: '${shoeShop[index]}', imagePath: '${shoeShop[index]}', description: '${shoeShop[index]}',));




   //list in cart
   List<PhotoList> userCart =[];



   List<PhotoList> getPhotoList()
   {
     return PShop;
   }


   //get cart//
   List<PhotoList> getUserCart()
   {
     return userCart;
   }




   //add to cart
   void addItemToCart(PhotoList pl)
   {
     userCart.add(pl);
     notifyListeners();
   }




   //remove fom cart
   void removeItemFromCart(PhotoList pl)
   {
     userCart.remove(pl);
     notifyListeners();
   }
}
