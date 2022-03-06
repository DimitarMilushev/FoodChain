import 'package:flutter/material.dart';
import 'package:food_chain/common/constants.dart';
import 'package:food_chain/state/cart_state.dart';
import 'package:food_chain/ui/cart/cart_button.dart';
import 'package:food_chain/ui/screens/products_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_chain/utility/mock_api.dart';

import 'data/product.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.brown),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

final Provider productsRepository = Provider((ref) => MockService());
final FutureProvider productsProvider = FutureProvider((ref) async {
  return ref.watch(productsRepository).getProducts();
});
final cartProvider =
    StateNotifierProvider<CartState, List<Product>>((ref) => CartState());

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  bool showCartButton = false;
  @override
  Widget build(BuildContext context) {
    //Listen for changes on cart
    ref.listen(cartProvider, (previous, curr) {
      _onCartChange();
    });
    return Scaffold(
      backgroundColor: primaryBackground,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const ProductsScreen(),
      floatingActionButton: showCartButton
          ? FloatingCartButton(
              onPressed: () {}, amount: ref.watch(cartProvider).length)
          : null,
    );
  }

  void _onCartChange() {
    setState(() {
      showCartButton = ref.watch(cartProvider).isNotEmpty;
    });
  }
}
