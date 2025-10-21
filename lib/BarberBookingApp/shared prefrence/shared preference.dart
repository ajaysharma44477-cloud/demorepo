import 'package:shared_preferences/shared_preferences.dart';
class SharedPrefrenceHelper{
  static String useridkey="USERIDKEY";
  static String userNameKey="USERNAMEKEY";
  static String userEmailkey="USEREMAILKEY";


  Future<bool>saveuserid(String getUserId)async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    return preferences.setString(useridkey,getUserId );
  }

  Future<bool>saveemail(String getuseremail)async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    return preferences.setString(userEmailkey, getuseremail);
  }
  Future<bool>saveusername(String getusername)async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    return preferences.setString(userNameKey, getusername);

  }

}