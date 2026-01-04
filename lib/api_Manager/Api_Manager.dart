import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:islami_app2/model/RadioResponse.dart';
import 'package:islami_app2/model/RecitersResponse.dart';
import 'package:islami_app2/model/prayer_Response.dart';

class ApiManager{
  static Future<RadioResponse> getRadioResponse()async{
    try{
    Uri uri = Uri.parse("https://mp3quran.net/api/v3/radios?language=ar");
    var response = await http.get(uri);
    var jsonResponse = jsonDecode(response.body);
    return RadioResponse.fromJson(jsonResponse);
  }
  catch(e) {
    throw e;
  }

  }
  
  static Future<RecitersResponse> getRecitersResponse()async{
    try{
      Uri url = Uri.parse("https://mp3quran.net/api/v3/reciters");
      var response = await http.get(url);
      var jsonResponse = await jsonDecode(response.body);
      return RecitersResponse.fromJson(jsonResponse);
    } catch(e){
      throw e;
    }
  }
  
  static Future<PrayerResponse> getPrayingDate()async{
    try{
      var date =DateFormat("dd-MM-yyyy").format(DateTime.now());
      Uri uri = Uri.parse("https://api.aladhan.com/v1/timingsByCity/$date?city=cairo&country=egypt");
      var response =await http.get(uri);
      var jsonResponse = await jsonDecode(response.body);
      return PrayerResponse.fromJson(jsonResponse);
    }catch(e) {
      throw e ; }
  }
}