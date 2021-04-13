class GroceryProduct {
  const GroceryProduct({
    this.price,
    this.name,
    this.description,
    this.image,
    this.weight,
  });

  final double price;
  final String name;
  final String description;
  final String image;
  final String weight;
}

const groceryProducts = <GroceryProduct>[
  GroceryProduct(
    price: 99.00,
    name: 'Apple',
    weight: '1000g',
    description:
        'Agave plant (Agave americana) growing in the Atacama Desert, Chile. Most agaves are monocarpic, meaning that they die after flowering.',
    image: 'assets/apple.jpg',
  ),
  GroceryProduct(
    price: 89.00,
    name: 'Coconut',
    weight: '500g',
    description:
        'Agave plant (Agave americana) growing in the Atacama Desert, Chile. Most agaves are monocarpic, meaning that they die after flowering.',
    image: 'assets/coco.jpg',
  ),
  GroceryProduct(
    price: 75.00,
    name: 'Kiwi',
    weight: '700g',
    description:
        'Agave plant (Agave americana) growing in the Atacama Desert, Chile. Most agaves are monocarpic, meaning that they die after flowering.',
    image: 'assets/kiwi.jpg',
  ),
  GroceryProduct(
    price: 90.00,
    name: 'Orange',
    weight: '1000g',
    description:
        'Agave plant (Agave americana) growing in the Atacama Desert, Chile. Most agaves are monocarpic, meaning that they die after flowering.',
    image: 'assets/orng.jpg',
  ),
  GroceryProduct(
    price: 99.00,
    name: 'Pineapple',
    weight: '1000g',
    description:
        'Agave plant (Agave americana) growing in the Atacama Desert, Chile. Most agaves are monocarpic, meaning that they die after flowering.',
    image: 'assets/pinapple.jpg',
  ),
  GroceryProduct(
    price: 89.00,
    name: 'Watermelon',
    weight: '2500g',
    description:
        'Agave plant (Agave americana) growing in the Atacama Desert, Chile. Most agaves are monocarpic, meaning that they die after flowering.',
    image: 'assets/watermln.jpg',
  ),
  GroceryProduct(
    price: 89.00,
    name: 'AGAVE',
    weight: '1000g',
    description:
        'Agave plant (Agave americana) growing in the Atacama Desert, Chile. Most agaves are monocarpic, meaning that they die after flowering.',
    image: 'assets/1.jpg',
  ),
];
