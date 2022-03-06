import '../data/product.dart';

class MockService {
  Future<List<Product>> getProducts() {
    return Future.delayed(
        const Duration(seconds: 2), () => _fetchProductsList());
  }

  List<Product> _fetchProductsList() {
    return [
      const Product(
          name: 'Pizza',
          description: ' description',
          thumbnail:
              'https://img3.mashed.com/img/gallery/you-should-never-fold-pizza-slices-heres-why/l-intro-1602105889.jpg',
          rating: 7.6),
      const Product(
          name: 'Cream Cheese Potato Soup',
          description:
              ' "Instead of using cubed potatoes, bake whole potatoes, scoop out the flesh and add to the stock. Then rebake the shells to get them crispy and serve the soup in the potato skins."',
          thumbnail:
              'https://img.sndimg.com/food/image/upload/w_621,h_349,c_fill,fl_progressive,q_80/v1/img/recipes/15/08/63/zbOVaZ4MSAO81CYiVyZK_panera-baked-potato-cream-cheese-soup-3763.jpg',
          rating: 8.6),
      const Product(
          name: 'Best Banana Bread',
          description: ' description',
          thumbnail:
              'https://img.sndimg.com/food/image/upload/w_621,h_349,c_fill,fl_progressive,q_80/v1/img/recipes/28/86/AQkX6bvQwGirGmRdr4KV_0S9A9368.jpg',
          rating: 5.1),
      const Product(
          name: 'Bourbon Chicken',
          description: ' description',
          thumbnail:
              'https://img.sndimg.com/food/image/upload/w_621,h_349,c_fill,fl_progressive,q_80/v1/img/recipes/45/80/9/MwuCd6HpQ5mDvn4OLRkA_0S9A9886.jpg',
          rating: 10.0),
      const Product(
          name: 'Creamy Cajun Chicken Pasta',
          description:
              ' "Instead of using cubed potatoes, bake whole potatoes, scoop out the flesh and add to the stock. Then rebake the shells to get them crispy and serve the soup in the potato skins."',
          thumbnail:
              'https://img.sndimg.com/food/image/upload/w_621,h_349,c_fill,fl_progressive,q_80/v1/img/recipes/39/08/7/VPeSMiYHRce4BWsyj7Nl_0S9A5582.jpg',
          rating: 8.6),
      const Product(
          name: 'Easy & Delicious Meatloaf',
          description: ' description',
          thumbnail:
              'https://img.sndimg.com/food/image/upload/w_621,h_349,c_fill,fl_progressive,q_80/v1/img/recipes/54/25/7/1O1KC1wTKTskFlseYbws_0S9A6432.jpg',
          rating: 3.1),
    ];
  }
}
