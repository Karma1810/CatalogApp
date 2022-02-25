import 'dart:convert';

class CatalogModel {
  static List<Item> items = [];

//Get By ID
  Item getById(int id) => items.firstWhere((element) => element.id == id);

//Get By position
  Item getByposition(int index) => items[index];
}

class Item {
  int id;
  String name;
  String desc;
  num price;
  String color;
  String image;
  String info;

  Item(this.id, this.name, this.desc, this.price, this.color, this.image,
      this.info);

  Item copyWith({
    int? id,
    String? name,
    String? desc,
    num? price,
    String? color,
    String? image,
    String? info,
  }) {
    return Item(
      id ?? this.id,
      name ?? this.name,
      desc ?? this.desc,
      price ?? this.price,
      color ?? this.color,
      image ?? this.image,
      info ?? this.info,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
      'info': info,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      map['id']?.toInt() ?? 0,
      map['name'] ?? '',
      map['desc'] ?? '',
      map['price'] ?? 0,
      map['color'] ?? '',
      map['image'] ?? '',
      map['info'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, price: $price, color: $color, image: $image,info:$info)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.color == color &&
        other.image == image &&
        other.info == info;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        color.hashCode ^
        image.hashCode ^
        info.hashCode;
  }
}
