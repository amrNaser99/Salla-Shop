class ChangeFavouriteModel
{
  bool? status ;
  String? message ;
  Data? data ;


  ChangeFavouriteModel(this.status, this.message);

  ChangeFavouriteModel.fromJson(Map<String, dynamic> json)
  {
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

}
class Data
{
  int? id ;
  Product? product ;

  Data.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    product = Product.fromJson(json['product']);

  }

}


class Product
{
  int? id ;
  int? price ;
  int? oldPrice ;
  int? discount ;
  String? image ;

  Product.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    image = json['image'];
  }
}