import 'package:shop_app/Module/login/shop_login_screen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';

void SignOut(context,key)
{
  CacheHelper.removeData(key: key).then((value) {
    NavigateTo(context, ShopLoginScreen());
  });
}

void printFullText(String text)
{
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

String? token ='';