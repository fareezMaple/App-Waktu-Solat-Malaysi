import 'package:intl/intl.dart';
import 'package:waktusolatmalaysia/models/azanproapi.dart';
import 'package:waktusolatmalaysia/models/waktusolatappapi.dart';
import 'package:waktusolatmalaysia/networking/ApiProvider.dart';

var now = DateTime.now();
var currentMonthFormatter = DateFormat('MM');
var currentYearFormatter = DateFormat('y');

class AzanTimesTodayRepository {
  String currentMonth = currentMonthFormatter.format(now);
  String currentYear = currentYearFormatter.format(now);
  ApiProvider _provider = ApiProvider();

  Future<AzanPro> fetchAzanToday(String category, String format) async {
    final response =
        await _provider.get("times/today.json?zone=" + category + format);
    return AzanPro.fromJson(response);
  }

  Future<WaktuSolatApp> fetchAzanTodayWSA(
      String category, String format) async {
    final response = await _provider
        .get("?month=$currentMonth&year=$currentYear&zone=$category");
    return WaktuSolatApp.fromJson(response);
  }
}