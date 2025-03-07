import 'package:flutter_bootcamp_task/domain/models/products/product_data_model.dart';

/// id : 1
/// title : "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops"
/// price : 109.95
/// description : "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday"
/// category : "men's clothing"
/// image : "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"
/// rating : {"rate":3.9,"count":120}

class ProductDataModelDto {
  ProductDataModelDto({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  ProductDataModelDto.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating = json['rating'] != null ? RatingDto.fromJson(json['rating']) : null;
  }
  num? id;
  String? title;
  num? price;
  String? description;
  String? category;
  String? image;
  RatingDto? rating;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['price'] = price;
    map['description'] = description;
    map['category'] = category;
    map['image'] = image;
    if (rating != null) {
      map['rating'] = rating?.toJson();
    }
    return map;
  }

  ProductDataModel convertToProductDataModel() {
    return ProductDataModel(
        id: id,
        title: title,
        price: price,
        description: description,
        category: category,
        image: image,
        rating: rating?.convertToRating());
  }
}

/// rate : 3.9
/// count : 120

class RatingDto {
  RatingDto({
    this.rate,
    this.count,
  });

  RatingDto.fromJson(dynamic json) {
    rate = json['rate'];
    count = json['count'];
  }
  num? rate;
  num? count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rate'] = rate;
    map['count'] = count;
    return map;
  }

  Rating convertToRating() {
    return Rating(rate: rate, count: count);
  }
}
