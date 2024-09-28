import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';


class Helper{

  static String userIdKey = "userId";
  static String userDataKey = "userDataId";
  static String RecentSearchhey = "recentSerach";




  setUserId(String userKey) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(userIdKey, userKey);
  }

  getUsetId() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userIdKey);
  }



  setUserData(Map data) async{
    String dd = "";
    try {
      dd = jsonEncode(data);
    }
    catch(e){

    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(userDataKey, dd);
  }

  getUserData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? a = prefs.getString(userDataKey);
    if(a == null || a.isEmpty){
      return null;
    }
    Map data = jsonDecode(a);
    return data;
  }

  setRecentSearch(String s) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List searhes = [];
    try{
      String? ss = prefs.getString(RecentSearchhey);
      searhes = jsonDecode(ss!);
    }
    catch(e){

    }

    searhes.add(s);
   //
   // print(searhes);
    prefs.setString(RecentSearchhey, jsonEncode(searhes));
  }

  getrecentSearch() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List searches = [];
    try{
      String? ss = prefs.getString(RecentSearchhey);
     // print(ss);
      searches = jsonDecode(ss!);
    }
    catch(e){

    }
  //  print(searches);
    return searches;
  }




}