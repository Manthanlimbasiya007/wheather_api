import 'package:flutter/cupertino.dart';
import 'package:wheather_api/screen/model/wheather_model.dart';

import '../../utils/api_helper.dart';

class HomeProvider extends ChangeNotifier
{
  Future<WheatherModel> wheatherData()
  async {
    ApiHelper apiHelper = ApiHelper();
     WheatherModel wheatherModel= await apiHelper.wheatherApi();
    return wheatherModel;
  }
}