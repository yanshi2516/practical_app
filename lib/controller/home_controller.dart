import 'package:get/get.dart';
import 'package:practical_app/model/product_model.dart';

///Controller defined for the home screen
class HomeController extends GetxController {
  RxList<Product> productsList = RxList();

  List<String> subList = [
    "Collection",
    "Best Selling",
    "Seasonal Offers",
    "Occasion Offer",
    "Deals",
  ];

  RxInt selectedIndex = (-1).obs;

  @override
  void onInit() {
    productsList.addAll([
      Product(
        imgUrl: "https://i.ibb.co/HgjT1rt/Image.png",
        name: "Natural Diamonds",
      ),
      Product(
        imgUrl: "https://i.ibb.co/HgjT1rt/Image.png",
        name: "Lab-grown Diamonds",
      ),
      Product(
        imgUrl: "https://i.ibb.co/HgjT1rt/Image.png",
        name: "Gemstone",
      ),
      Product(
        imgUrl: "https://i.ibb.co/HgjT1rt/Image.png",
        name: "Jewellery",
      ),
      Product(
        imgUrl: "https://i.ibb.co/HgjT1rt/Image.png",
        name: "Do It Yourself",
      ),
      Product(
        imgUrl: "https://i.ibb.co/HgjT1rt/Image.png",
        name: "About Us",
      ),
      Product(
        imgUrl: "https://i.ibb.co/HgjT1rt/Image.png",
        name: "Education",
      ),

    ]);
    super.onInit();
  }

  ///Method to update the selected Index
  void updateIndex(int index) {
    if (selectedIndex.value == index) {
      selectedIndex.value = -1;
    } else {
      selectedIndex.value = index;
    }
  }
}
