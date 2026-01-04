import 'package:intl/intl.dart';
import 'package:islami_app2/model/prayer_Response.dart';

class DateFormatter{
  static String formatGregorian(Gregorian date){
    return '${date.day} ${date.month!.en!.substring(0,3)} \n ${date.year}';
  }
  static String formatHijri(Hijri date){
    return '${date.day} ${date.month!.en!.substring(0,3)} \n ${date.year}';
  }
}


class TimeConverter{
  static String to12Hours(String time){
    DateTime dateTime = DateFormat("HH:mm").parse(time);
    return DateFormat("hh:mm a").format(dateTime);
  }
}