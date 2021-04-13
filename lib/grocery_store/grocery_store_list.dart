import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/grocery_store/grocery_provider.dart';
import 'package:store_app/grocery_store/grocery_store_details.dart';
import 'package:store_app/screens/fruits_and_vegetables.dart';
import 'package:store_app/staggerd_dual_view.dart';

class GrocerySoreList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = GroceryProvider.of(context).bloc;

    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.only(top: cartBarHeight, left: 10, right: 10),
      child: StaggeredDualView(
        spacing: 20,
        aspectRatio: 0.7,
        itemBuilder: (context, index) {
          final product = bloc.catalog[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 500),
                  pageBuilder: (context, animation, _) {
                    return FadeTransition(
                        opacity: animation,
                        child: GroceryStoreDetails(
                            product: product,
                            onProductAdded: () {
                              bloc.addProduct(product);
                            }));
                  },
                ),
              );
            },
            child: Card(
              elevation: 8,
              shadowColor: Colors.black45,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.white,
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            product.image,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    '\$${product.price}',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${product.name}',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    '\$${product.weight}',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: bloc.catalog.length,
      ),
    );

/*
    return ListView.builder(
        padding: const EdgeInsets.only(top: cartBarHeight),
        itemCount: bloc.catalog.length,
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            width: 100,
            color: Colors.primaries[index % Colors.primaries.length],
          );
        });
 */
  }
}
