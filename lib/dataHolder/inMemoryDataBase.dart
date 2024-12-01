import '../models/items.dart';
class InMemoryDatabase {
  static List<Item> items = [
    Item(
      id: 1,
      name: 'Black Coat',
      image: 'assets/blackCoat.jpg',
      description: 'A black man with a black coat',
      price: 159.99,
    ),
    Item(
      id: 2,
      name: 'White Coat',
      image: 'assets/whiteCoat.jpg',
      description: 'A black man with a white coat',
      price: 159.99,
    ),
    Item(
      id: 3,
      name: 'Denim Jacket',
      image: 'assets/denimJacket.jpg',
      description: 'A black man with a denim jacket',
      price: 89.99,
    ),
    Item(
      id: 4,
      name: 'Leather Jacket',
      image: 'assets/leatherJacket.jpg',
      description: 'A black man with a leather jacket',
      price: 69.99,
    ),
    Item(
      id: 5,
      name: 'Puffer Jacket',
      image: 'assets/pufferJacket.jpg',
      description: 'A black man with a puffer jacket',
      price: 99.99,
    ),
  ];
}
