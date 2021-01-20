import 'dart:io';
import 'dart:convert';

void main(List<String> args) {
  List holidayList = [];
  // 2020
  holidayList.add(HolidayInfo("20200101", HolidayInfo.HOLIDAY, "元旦"));
  holidayList.add(HolidayInfo("20200119", HolidayInfo.WORK, ""));
  holidayList.add(HolidayInfo("20200124", HolidayInfo.HOLIDAY, "春节"));
  holidayList.add(HolidayInfo("20200125", HolidayInfo.HOLIDAY, "春节"));
  holidayList.add(HolidayInfo("20200126", HolidayInfo.HOLIDAY, "春节"));
  holidayList.add(HolidayInfo("20200127", HolidayInfo.HOLIDAY, "春节"));
  holidayList.add(HolidayInfo("20200128", HolidayInfo.HOLIDAY, "春节"));
  holidayList.add(HolidayInfo("20200129", HolidayInfo.HOLIDAY, "春节"));
  holidayList.add(HolidayInfo("20200130", HolidayInfo.HOLIDAY, "春节"));
  holidayList.add(HolidayInfo("20200131", HolidayInfo.HOLIDAY, "春节"));
  holidayList.add(HolidayInfo("20200201", HolidayInfo.HOLIDAY, "春节"));
  holidayList.add(HolidayInfo("20200202", HolidayInfo.HOLIDAY, "春节"));
  holidayList.add(HolidayInfo("20200404", HolidayInfo.HOLIDAY, "清明"));
  holidayList.add(HolidayInfo("20200405", HolidayInfo.HOLIDAY, "清明"));
  holidayList.add(HolidayInfo("20200406", HolidayInfo.HOLIDAY, "清明"));
  holidayList.add(HolidayInfo("20200426", HolidayInfo.WORK, ""));
  holidayList.add(HolidayInfo("20200501", HolidayInfo.HOLIDAY, "五一"));
  holidayList.add(HolidayInfo("20200502", HolidayInfo.HOLIDAY, "五一"));
  holidayList.add(HolidayInfo("20200503", HolidayInfo.HOLIDAY, "五一"));
  holidayList.add(HolidayInfo("20200504", HolidayInfo.HOLIDAY, "五一"));
  holidayList.add(HolidayInfo("20200505", HolidayInfo.HOLIDAY, "五一"));
  holidayList.add(HolidayInfo("20200509", HolidayInfo.WORK, ""));
  holidayList.add(HolidayInfo("20200625", HolidayInfo.HOLIDAY, "端午"));
  holidayList.add(HolidayInfo("20200626", HolidayInfo.HOLIDAY, "端午"));
  holidayList.add(HolidayInfo("20200627", HolidayInfo.HOLIDAY, "端午"));
  holidayList.add(HolidayInfo("20200628", HolidayInfo.WORK, ""));
  holidayList.add(HolidayInfo("20200927", HolidayInfo.WORK, ""));
  holidayList.add(HolidayInfo("20201001", HolidayInfo.HOLIDAY, "国庆"));
  holidayList.add(HolidayInfo("20201002", HolidayInfo.HOLIDAY, "国庆"));
  holidayList.add(HolidayInfo("20201003", HolidayInfo.HOLIDAY, "国庆"));
  holidayList.add(HolidayInfo("20201004", HolidayInfo.HOLIDAY, "国庆"));
  holidayList.add(HolidayInfo("20201005", HolidayInfo.HOLIDAY, "国庆"));
  holidayList.add(HolidayInfo("20201006", HolidayInfo.HOLIDAY, "国庆"));
  holidayList.add(HolidayInfo("20201007", HolidayInfo.HOLIDAY, "国庆"));
  holidayList.add(HolidayInfo("20201008", HolidayInfo.HOLIDAY, "国庆"));
  holidayList.add(HolidayInfo("20201010", HolidayInfo.WORK, ""));

  // 2021
  holidayList.add(HolidayInfo("20210101", HolidayInfo.HOLIDAY, "元旦"));
  holidayList.add(HolidayInfo("20210102", HolidayInfo.HOLIDAY, "元旦"));
  holidayList.add(HolidayInfo("20210103", HolidayInfo.HOLIDAY, "元旦"));
  holidayList.add(HolidayInfo("20210207", HolidayInfo.WORK, ""));
  holidayList.add(HolidayInfo("20210211", HolidayInfo.HOLIDAY, "春节"));
  holidayList.add(HolidayInfo("20210212", HolidayInfo.HOLIDAY, "春节"));
  holidayList.add(HolidayInfo("20210213", HolidayInfo.HOLIDAY, "春节"));
  holidayList.add(HolidayInfo("20210214", HolidayInfo.HOLIDAY, "春节"));
  holidayList.add(HolidayInfo("20210215", HolidayInfo.HOLIDAY, "春节"));
  holidayList.add(HolidayInfo("20210216", HolidayInfo.HOLIDAY, "春节"));
  holidayList.add(HolidayInfo("20210217", HolidayInfo.HOLIDAY, "春节"));
  holidayList.add(HolidayInfo("20210220", HolidayInfo.WORK, ""));
  holidayList.add(HolidayInfo("20210403", HolidayInfo.HOLIDAY, "清明"));
  holidayList.add(HolidayInfo("20210404", HolidayInfo.HOLIDAY, "清明"));
  holidayList.add(HolidayInfo("20210405", HolidayInfo.HOLIDAY, "清明"));
  holidayList.add(HolidayInfo("20210425", HolidayInfo.WORK, ""));
  holidayList.add(HolidayInfo("20210501", HolidayInfo.HOLIDAY, "五一"));
  holidayList.add(HolidayInfo("20210502", HolidayInfo.HOLIDAY, "五一"));
  holidayList.add(HolidayInfo("20210503", HolidayInfo.HOLIDAY, "五一"));
  holidayList.add(HolidayInfo("20210504", HolidayInfo.HOLIDAY, "五一"));
  holidayList.add(HolidayInfo("20210505", HolidayInfo.HOLIDAY, "五一"));
  holidayList.add(HolidayInfo("20210508", HolidayInfo.WORK, ""));

  Map resp = {
    "update_time": DateTime.now().millisecondsSinceEpoch,
    "date_list": holidayList
  };

  Directory('api/v1/').create(recursive: true).then((Directory directory) {
    print(directory.absolute.path);
    try {
      File file = new File(directory.absolute.path + "date_list.json");
      file.writeAsString(jsonEncode(resp));
    } catch (e) {
      print(e);
    }
  });
}

class HolidayInfo {
  static const int WORK = 1;
  static const int HOLIDAY = 2;
  String date;
  int type;
  String holiday;
  HolidayInfo(this.date, this.type, this.holiday) {}

  Map toJson() {
    return {"date": date, "type": type, "holiday": holiday};
  }
}
