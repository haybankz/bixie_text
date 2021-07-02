import 'dart:convert';

import 'package:flutter/material.dart';

/// id : 14557
/// name : "Flat White"
/// price : 125
/// before_sale_price : null
/// description : "Freshly-ground beans and steamed milk"
/// full_description : "Freshly-ground beans and steamed milk"
/// order : 1
/// category : {"id":1727,"name":"Coffee"}
/// images : {"full_size":"https://res.cloudinary.com/ginja-co-ltd/image/upload/s--zHcUzne6--/c_fill,h_300,q_jpegmini,w_485/v1/vendors/the-coffee-club-205/products/flat-white-mug-14557","thumbnail":"https://res.cloudinary.com/ginja-co-ltd/image/upload/s--sVm4XF-z--/c_fill,h_70,q_jpegmini,w_103/v1/vendors/the-coffee-club-205/products/flat-white-mug-14557"}
/// extras : [{"id":1535,"name":"Milk Option","min":"1","max":"1"}]
/// extra_items : [{"id":6631,"name":"Full Milk","extra_id":1535,"price":"0"},{"id":6632,"name":"Skim Milk","extra_id":1535,"price":"0"},{"id":6633,"name":"Soy Milk","extra_id":1535,"price":"20"}]
/// tags : []
/// availability : "available"

class Product {
  int? id;
  String? name;
  int? price;
  int? beforeSalePrice;
  String? description;
  String? fullDescription;
  int? order;
  Category? category;
  Images? images;
  List<Extras>? extras;
  List<Extra_items>? extraItems;
  List<String>? tags;
  String? availability;

  Product({
      this.id, 
      this.name, 
      this.price, 
      this.beforeSalePrice, 
      this.description, 
      this.fullDescription, 
      this.order, 
      this.category, 
      this.images, 
      this.extras, 
      this.extraItems, 
      this.tags, 
      this.availability});

  Product.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    price = json["price"];
    beforeSalePrice = json["before_sale_price"];
    description = json["description"];
    fullDescription = json["full_description"];
    order = json["order"];
    category = json["category"] != null ? Category.fromJson(json["category"]) : null;
    images = json["images"] != null ? Images.fromJson(json["images"]) : null;
    if (json["extras"] != null) {
      extras = [];
      json["extras"].forEach((v) {
        extras?.add(Extras.fromJson(v));
      });
    }
    if (json["extra_items"] != null) {
      extraItems = [];
      json["extra_items"].forEach((v) {
        extraItems?.add(Extra_items.fromJson(v));
      });
    }
    if (json["tags"] != null) {
      tags = [];
      json["tags"].forEach((v) {
        tags?.add(v);
      });
    }
    availability = json["availability"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["price"] = price;
    map["before_sale_price"] = beforeSalePrice;
    map["description"] = description;
    map["full_description"] = fullDescription;
    map["order"] = order;
    if (category != null) {
      map["category"] = category?.toJson();
    }
    if (images != null) {
      map["images"] = images?.toJson();
    }
    if (extras != null) {
      map["extras"] = extras?.map((v) => v.toJson()).toList();
    }
    if (extraItems != null) {
      map["extra_items"] = extraItems?.map((v) => v.toJson()).toList();
    }
    if (tags != null) {
      map["tags"] = tags?.map((v) => v).toList();
    }
    map["availability"] = availability;
    return map;
  }

}

/// id : 6631
/// name : "Full Milk"
/// extra_id : 1535
/// price : "0"

class Extra_items {
  int? id;
  String? name;
  int? extraId;
  String? price;

  Extra_items({
      this.id, 
      this.name, 
      this.extraId, 
      this.price});

  Extra_items.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    extraId = json["extra_id"];
    price = json["price"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["extra_id"] = extraId;
    map["price"] = price;
    return map;
  }

}

/// id : 1535
/// name : "Milk Option"
/// min : "1"
/// max : "1"

class Extras {
  int? id;
  String? name;
  String? min;
  String? max;

  Extras({
      this.id, 
      this.name, 
      this.min, 
      this.max});

  Extras.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    min = json["min"];
    max = json["max"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["min"] = min;
    map["max"] = max;
    return map;
  }

}

/// full_size : "https://res.cloudinary.com/ginja-co-ltd/image/upload/s--zHcUzne6--/c_fill,h_300,q_jpegmini,w_485/v1/vendors/the-coffee-club-205/products/flat-white-mug-14557"
/// thumbnail : "https://res.cloudinary.com/ginja-co-ltd/image/upload/s--sVm4XF-z--/c_fill,h_70,q_jpegmini,w_103/v1/vendors/the-coffee-club-205/products/flat-white-mug-14557"

class Images {
  String? fullSize;
  String? thumbnail;

  Images({
      this.fullSize, 
      this.thumbnail});

  Images.fromJson(dynamic json) {
    fullSize = json["full_size"];
    thumbnail = json["thumbnail"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["full_size"] = fullSize;
    map["thumbnail"] = thumbnail;
    return map;
  }

}

/// id : 1727
/// name : "Coffee"

class Category {
  int? id;
  String? name;

  Category({
      this.id, 
      this.name});

  Category.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    return map;
  }




}

Future<Product> getProduct(BuildContext context) async {
  String data = await DefaultAssetBundle.of(context).loadString("assets/json/product.json");
  final jsonResult = json.decode(data);
   return Product.fromJson(jsonResult);
}