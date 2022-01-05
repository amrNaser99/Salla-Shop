class ShopLoginModel {
  ShopLoginModel({
    required this.status,
    required this.message,
    required this.data,
  });
  late final bool status;
  late final String message;
  late final Data data;

  ShopLoginModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.points,
    required this.credit,
    required this.token,
  });
  late final int id;
  late final String name;
  late final String email;
  late final String phone;
  late final String image;
  late final int points;
  late final int credit;
  late final String token;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['image'] = image;
    _data['points'] = points;
    _data['credit'] = credit;
    _data['token'] = token;
    return _data;
  }
}
//
// class ShopLoginModel {
//   late bool status;
//   late String message;
//   late final UserData data ;
//
//   ShopLoginModel({required this.status,required this.message,required this.data});
//
//   ShopLoginModel.fromJson(Map<String,dynamic> json){
//     status = json['status'];
//     message = json['message'];
//     // data = json['status'] == true ? UserData.fromJson(json['data']) : null ;
//     data = UserData.fromJson(json["data"]);
//   }
// }
// class UserData {
//   late String id;
//   late String email;
//   late String phone;
//   late int points;
//   late int credit;
//   late final String token;
//
//   UserData({
//     required this.id,
//     required this.email,
//     required this.phone,
//     required this.points,
//     required this.credit,
//     required this.token,
//       });
//
//   UserData.fromJson(Map<String,dynamic> json)
//   {
//     id = json['id'];
//     email = json['email'];
//     phone = json['phone'];
//     points = json['points'];
//     credit = json['credit'];
//     token = json['token'];
//   }
//
// }