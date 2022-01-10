// class FavouriteModel {
//    bool? status;
//    dynamic message;
//    Data? data;
//
//   FavouriteModel.fromJson(Map<String, dynamic> json){
//       status = json['status'];
//       message = json['message'];
//       data = Data.fromJson(json['data'] );
//   }
// }
//
// class Data {
//   int? currentPage;
//   List<FavouritesData>? data;
//   String? firstPageUrl;
//   int? from;
//   int? lastPage;
//   String? lastPageUrl;
//   dynamic nextPageUrl;
//   String? path;
//   int? perPage;
//   dynamic prevPageUrl;
//   int? to;
//   int? total;
//
//   Data.fromJson(Map<String, dynamic> json){
//       currentPage = json['current_page'] ;
//         data = (json['data'] as List?)
//             ?.map((dynamic e) => FavouritesData.fromJson(e as Map<String, dynamic>))
//             .toList();
//         firstPageUrl = json['first_page_url'];
//         from = json['from'] as int?;
//         lastPage = json['last_page'];
//         lastPageUrl = json['last_page_url'] ;
//         nextPageUrl = json['next_page_url'];
//         path = json['path'] ;
//         perPage = json['per_page'];
//         prevPageUrl = json['prev_page_url'];
//         to = json['to'] ;
//         total = json['total'] ;
//   }
// }
//
// class FavouritesData {
//   int? id;
//   Product? product;
//
//   FavouritesData.fromJson(Map<String, dynamic> json){
//       id = json['id'] ;
//       product = Product.fromJson(json['product'] );
//   }
// }
//
// class Product {
//   int? id;
//   dynamic price;
//   dynamic oldPrice;
//   int? discount;
//   String? image;
//   String? name;
//   String? description;
//
//   Product.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     price = json['price'];
//     oldPrice = json['old_price'];
//     discount = json['discount'];
//     image = json['image'];
//     name = json['name'];
//     description = json['description'];
//   }
// }




class FavouriteModel {
  final bool? status;
  final dynamic message;
  final Data? data;

  FavouriteModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as bool?,
        message = json['message'],
        data = Data.fromJson(json['data'] as Map<String, dynamic>);
  // data = (json['data'] as Map<String, dynamic>?) != null
  // ? Data.fromJson(json['data'] as Map<String, dynamic>)
  //     : null ;
}

class Data {
  final int? currentPage;
  final List<FavouritesData>? data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final dynamic nextPageUrl;
  final String? path;
  final int? perPage;
  final dynamic prevPageUrl;
  final int? to;
  final int? total;

  Data.fromJson(Map<String, dynamic> json)
      : currentPage = json['current_page'] as int?,
        data = (json['data'] as List?)
            ?.map((dynamic e) => FavouritesData.fromJson(e as Map<String, dynamic>))
            .toList(),
        firstPageUrl = json['first_page_url'] as String?,
        from = json['from'] as int?,
        lastPage = json['last_page'] as int?,
        lastPageUrl = json['last_page_url'] as String?,
        nextPageUrl = json['next_page_url'],
        path = json['path'] as String?,
        perPage = json['per_page'] as int?,
        prevPageUrl = json['prev_page_url'],
        to = json['to'] as int?,
        total = json['total'] as int?;
}

class FavouritesData {
  final int? id;
  final Product? product;

  FavouritesData.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        product = (json['product'] as Map<String, dynamic>?) != null
            ? Product.fromJson(json['product'] as Map<String, dynamic>)
            : null;
}

class Product {
  final int? id;
  final dynamic price;
  final dynamic oldPrice;
  final int? discount;
  final String? image;
  final String? name;
  final String? description;

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        price = json['price'] as int?,
        oldPrice = json['old_price'] as int?,
        discount = json['discount'] as int?,
        image = json['image'] as String?,
        name = json['name'] as String?,
        description = json['description'] as String?;
}
