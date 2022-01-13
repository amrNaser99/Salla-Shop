class SearchModel {
  bool? status;
  Data? data;

  SearchModel.fromJson(Map<String, dynamic> json) {
        status = json['status'] as bool? ;
        data = Data.fromJson(json['data'] as Map<String, dynamic>);
      }
}

class Data {
  int? currentPage;
  List<Product>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    data = (json['data'] as List?)
            ?.map((dynamic e) => Product.fromJson(e as Map<String, dynamic>))
            .toList();
        firstPageUrl = json['first_page_url'];
        from = json['from'] ;
        lastPage = json['last_page'];
        lastPageUrl = json['last_page_url'];
        nextPageUrl = json['next_page_url'];
        path = json['path'] ;
        perPage = json['per_page'];
        prevPageUrl = json['prev_page_url'];
        to = json['to'] ;
        total = json['total'];
}
  }

class Product {
  int? id;
  dynamic price;
  dynamic oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'] ;
    price = json['price'] ;
    oldPrice = json['old_price'] ;
    discount = json['discount'] ;
    image = json['image'] ;
    name = json['name'] ;
    description = json['description'];
}
}


// class SearchModel {
//   final bool? status;
//   final dynamic message;
//   final Data? data;
//
//   SearchModel({
//     this.status,
//     this.message,
//     this.data,
//   });
//
//   SearchModel.fromJson(Map<String, dynamic> json)
//       : status = json['status'] as bool?,
//         message = json['message'],
//         data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null;
//
//
// }
//
// class Data {
//   final int? currentPage;
//   final List<Product>? data;
//   final String? firstPageUrl;
//   final int? from;
//   final int? lastPage;
//   final String? lastPageUrl;
//   final dynamic nextPageUrl;
//   final String? path;
//   final int? perPage;
//   final dynamic prevPageUrl;
//   final int? to;
//   final int? total;
//
//   Data({
//     this.currentPage,
//     this.data,
//     this.firstPageUrl,
//     this.from,
//     this.lastPage,
//     this.lastPageUrl,
//     this.nextPageUrl,
//     this.path,
//     this.perPage,
//     this.prevPageUrl,
//     this.to,
//     this.total,
//   });
//
//   Data.fromJson(Map<String, dynamic> json)
//       : currentPage = json['current_page'],
//         data = (json['data'] as List?)?.map((dynamic e) => Product.fromJson(e as Map<String,dynamic>)).toList(),
//         firstPageUrl = json['first_page_url'] as String?,
//         from = json['from'] ,
//         lastPage = json['last_page'],
//         lastPageUrl = json['last_page_url'] as String?,
//         nextPageUrl = json['next_page_url'],
//         path = json['path'] as String?,
//         perPage = json['per_page'] ,
//         prevPageUrl = json['prev_page_url'],
//         to = json['to'] ,
//         total = json['total'];
//
//
// }
//
// class Product {
//   final int? id;
//   final int? price;
//   final int? oldPrice;
//   final int? discount;
//   final String? image;
//   final String? name;
//   final String? description;
//   final List<String>? images;
//   final bool? inFavorites;
//   final bool? inCart;
//
//   Product({
//     this.id,
//     this.price,
//     this.oldPrice,
//     this.discount,
//     this.image,
//     this.name,
//     this.description,
//     this.images,
//     this.inFavorites,
//     this.inCart,
//   });
//
//   Product.fromJson(Map<String, dynamic> json)
//       : id = json['id'],
//         price = json['price'] ,
//         oldPrice = json['old_price'],
//         discount = json['discount'] ,
//         image = json['image'] as String?,
//         name = json['name'] as String?,
//         description = json['description'] as String?,
//         images = (json['images'] as List?)?.map((dynamic e) => e as String).toList(),
//         inFavorites = json['in_favorites'] as bool?,
//         inCart = json['in_cart'] as bool?;
//
// }