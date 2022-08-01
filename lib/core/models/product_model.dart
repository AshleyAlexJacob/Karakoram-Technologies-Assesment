class ProductModel {
  String? productTitle;
  String? description;
  String? imgUrl;
  String? pricing;

  ProductModel(
      {this.description, this.imgUrl, this.pricing, this.productTitle});
}

List<ProductModel> kProducts = [
  ProductModel(
    productTitle: 'Coco Noir Channel',
    description: 'Product Short\nDescription',
    pricing: '35',
    imgUrl: 'assets/p1.jpeg',
  ),
  ProductModel(
    productTitle: 'El Classico',
    description: 'Product Short\nDescription',
    pricing: '150',
    imgUrl: 'assets/p2.jpeg',
  ),
  ProductModel(
    productTitle: 'Coco Noir Channel',
    description: 'Product Short\nDescription',
    pricing: '35',
    imgUrl: 'assets/p1.jpeg',
  ),
  ProductModel(
    productTitle: 'El Classico',
    description: 'Product Short\nDescription',
    pricing: '150',
    imgUrl: 'assets/p2.jpeg',
  ),
  ProductModel(
    productTitle: 'Coco Noir Channel',
    description: 'Product Short\nDescription',
    pricing: '35',
    imgUrl: 'assets/p1.jpeg',
  ),
  ProductModel(
    productTitle: 'El Classico',
    description: 'Product Short\nDescription',
    pricing: '150',
    imgUrl: 'assets/p2.jpeg',
  ),
  ProductModel(
    productTitle: 'Coco Noir Channel',
    description: 'Product Short\nDescription',
    pricing: '35',
    imgUrl: 'assets/p1.jpeg',
  ),
  ProductModel(
    productTitle: 'El Classico',
    description: 'Product Short\nDescription',
    pricing: '150',
    imgUrl: 'assets/p2.jpeg',
  ),
];
