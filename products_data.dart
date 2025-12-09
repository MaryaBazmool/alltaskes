import '../models/product.dart';

// قائمة المنتجات التجريبية
List<Product> demoProducts = [
  Product(
      name: 'وردة حمراء',
      price: 10,
      description: 'وردة حمراء جميلة وعطرة.',
      image: 'assets/images/rose_red.png'),
  Product(
      name: 'وردة زرقاء',
      price: 12,
      description: 'وردة زرقاء نادرة.',
      image: 'assets/images/rose_blue.png'),
  Product(
      name: 'وردة بيضاء',
      price: 8,
      description: 'وردة بيضاء نقية.',
      image: 'assets/images/rose_white.png'),
  Product(
      name: 'باقة مختارة',
      price: 20,
      description: 'باقة مختارة من الزهور.',
      image: 'assets/images/bouquet.png'),
  Product(
      name: 'زهور صغيرة',
      price: 5,
      description: 'مجموعة من الزهور الصغيرة.',
      image: 'assets/images/daisy.png'),
  Product(
      name: 'توليب',
      price: 7,
      description: 'زهرة توليب ملونة وجميلة.',
      image: 'assets/images/tulip.png'),
];

// قائمة العربة
List<Product> cart = [];
