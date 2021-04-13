import 'package:flutter/material.dart';
import 'package:store_app/grocery_store/grocery_provider.dart';
import 'package:store_app/grocery_store/grocery_store_bloc.dart';
import 'package:store_app/grocery_store/grocery_store_cart.dart';
import 'package:store_app/grocery_store/grocery_store_list.dart';

const cartBarHeight = 100.0;
const _myColor = Color(0xff000000);
const _panelTransition = Duration(milliseconds: 500);

class StoreHome extends StatelessWidget {
  final bloc = GroceryStoreBloc();

  void _onVerticalGesture(DragUpdateDetails details) {
    if (details.primaryDelta < -7) {
      bloc.changeToCart();
    } else if (details.primaryDelta > 12) {
      bloc.changeToNormal();
    }
  }

  double _getTopForWhitePanel(GroceryState state, Size size) {
    if (state == GroceryState.normal) {
      return -cartBarHeight + kToolbarHeight;
    } else if (state == GroceryState.cart) {
      return -(size.height - kToolbarHeight - cartBarHeight / 2);
    }
    return 0.0;
  }

  double _getTopForBlackPanel(GroceryState state, Size size) {
    if (state == GroceryState.normal) {
      return size.height - cartBarHeight;
    } else if (state == GroceryState.cart) {
      return cartBarHeight / 2;
    }
    return 0.0;
  }

  double _getTopForAppBar(GroceryState state, Size size) {
    if (state == GroceryState.normal) {
      return 0.0;
    } else if (state == GroceryState.cart) {
      return -cartBarHeight;
    }
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GroceryProvider(
      bloc: bloc,
      child: AnimatedBuilder(
        animation: bloc,
        builder: (context, _) {
          return Scaffold(
            backgroundColor: _myColor,
            body: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        duration: _panelTransition,
                        curve: Curves.decelerate,
                        top: _getTopForWhitePanel(bloc.groceryState, size),
                        left: 0,
                        right: 0,
                        height: size.height - kToolbarHeight,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30))),
                          child: GrocerySoreList(),
                        ),
                      ),
                      AnimatedPositioned(
                        duration: _panelTransition,
                        curve: Curves.decelerate,
                        left: 0,
                        right: 0,
                        top: _getTopForBlackPanel(bloc.groceryState, size),
                        height: size.height - kToolbarHeight,
                        child: GestureDetector(
                          onVerticalDragUpdate: _onVerticalGesture,
                          child: Container(
                            color: Colors.black,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: AnimatedSwitcher(
                                    duration: _panelTransition,
                                    child:
                                        bloc.groceryState == GroceryState.normal
                                            ? Row(
                                                children: [
                                                  Text(
                                                    'Cart  ',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: AnimatedSwitcher(
                                                      duration:
                                                          _panelTransition,
                                                      child:
                                                          SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Row(
                                                          children:
                                                              List.generate(
                                                            bloc.cart.length,
                                                            (index) => Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        8),
                                                                child: Stack(
                                                                  children: [
                                                                    Hero(
                                                                      tag:
                                                                          'List_${bloc.cart[index].product.name}details',
                                                                      child:
                                                                          CircleAvatar(
                                                                        backgroundImage:
                                                                            AssetImage(
                                                                          bloc
                                                                              .cart[index]
                                                                              .product
                                                                              .image,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Positioned(
                                                                      right: 0,
                                                                      child:
                                                                          CircleAvatar(
                                                                        radius:
                                                                            10,
                                                                        backgroundColor:
                                                                            Colors.red,
                                                                        child:
                                                                            Text(
                                                                          bloc.cart[index]
                                                                              .quantity
                                                                              .toString(),
                                                                          style:
                                                                              TextStyle(color: Colors.white),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                )),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  CircleAvatar(
                                                    backgroundColor:
                                                        Colors.amberAccent,
                                                    child: Text(bloc
                                                        .totalCartElements()
                                                        .toString()),
                                                  )
                                                ],
                                              )
                                            : SizedBox.shrink(),
                                  ),
                                ),
                                Expanded(child: GroceryStoreCart()),
                              ],
                            ),
                          ),
                        ),
                      ),
                      AnimatedPositioned(
                        curve: Curves.decelerate,
                        duration: _panelTransition,
                        left: 0,
                        right: 0,
                        top: _getTopForAppBar(bloc.groceryState, size),
                        child: _AppBarGrocery(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _AppBarGrocery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.grey[200],
      child: Row(
        children: [
          BackButton(
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              'Fruits and Vegetables',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              onPressed: () {})
        ],
      ),
    );
  }
}
