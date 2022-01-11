class ShopLoginModel {
  bool? status;
  String? message;
  Data? data;

  ShopLoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }

}

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
