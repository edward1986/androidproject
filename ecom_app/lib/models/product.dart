class Product {
  int id;
  String name;
  String photo;
  int price;
  int discount;
  String detail;
  int quantity;

  toMap() {
    var map = Map<String, dynamic>();
    map['productId'] = id;
    map['productName'] = name;
    map['productPhoto'] = photo;
    map['detail'] = detail;
    map['productPrice'] = price;
    map['productDiscount'] = discount;
    map['productQuantity'] = quantity;
    return map;
  }

  toJson() {
    return {
      'productId': id.toString(),
      'productName': name.toString(),
      'productPhoto': photo.toString(),
      'productPrice': price.toString(),
      'productDiscount': discount.toString(),
      'productQuantity': quantity.toString(),
      'detail': detail.toString(),
    };
  }
}