import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wheather_api/screen/model/wheather_model.dart';


class ApiHelper {
  Future<WheatherModel> wheatherApi() async {
    String link = "https://api.openweathermap.org/data/2.5/weather?lat=21.1702&lon=72.8311&appid=0883637b00b449c808ba083b3c550e8b";
    Uri uri = Uri.parse(link);
    var responce = await http.get(uri);
    var json = jsonDecode(responce.body);
    WheatherModel wheatherModel = WheatherModel.fromJson(json);
    return wheatherModel;
  }
}