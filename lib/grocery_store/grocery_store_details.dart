import 'package:flutter/material.dart';
import 'package:store_app/grocery_store/grocery_products.dart';

class GroceryStoreDetails extends StatefulWidget {
  const GroceryStoreDetails({Key key, this.product, this.onProductAdded})
      : super(key: key);

  final GroceryProduct product;
  final VoidCallback onProductAdded;

  @override
  _GroceryStoreDetailsState createState() => _GroceryStoreDetailsState();
}

class _GroceryStoreDetailsState extends State<GroceryStoreDetails> {
  String heroTag = '';

  void _addToCart(BuildContext context) {
    setState(() {
      heroTag = 'details';
    });
    widget.onProductAdded();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Hero(
                      tag: 'List_${widget.product.name}_$heroTag',
                      child: Image.asset(
                        widget.product.image,
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height * 0.36,
                      ),
                    ),
                  ),
                  Text(
                    widget.product.name,
                    style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.product.weight,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(color: Colors.grey),
                  ),
                  Row(
                    children: [
                      Spacer(),
                      Text(
                        '\$${widget.product.price}',
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'About the product',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.product.description,
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w200),
                  ),
                ],
              ),
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: IconButton(
                      icon: Icon(Icons.favorite_border, color: Colors.black),
                      onPressed: () => null),
                ),
                Expanded(
                  flex: 4,
                  child: RaisedButton(
                      color: Colors.amberAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      onPressed: () => _addToCart(context)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
