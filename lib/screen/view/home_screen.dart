import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wheather_api/screen/model/wheather_model.dart';

import '../provider/home_provider.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  HomeProvider? homeProviderT;
  HomeProvider? homeProviderF;

  @override
  Widget build(BuildContext context) {
    homeProviderT = Provider.of<HomeProvider>(context, listen: true);
    homeProviderF = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
          centerTitle: true,
          title: Text("Api Data"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  homeProviderF!.wheatherData();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade900),
                child: Text("Wheather Api"),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                builder: (context, snapshot) {
                  if(snapshot.hasError)
                    {
                      return Text("${snapshot.error}");
                    }
                  else if(snapshot.hasData)
                    {
                      WheatherModel? wheathermodel =snapshot.data;
                      return ListTile(
                        title: Text("${wheathermodel!.name}"),
                        subtitle: Text("${wheathermodel!.wind.speed}"),
                        trailing: Text("${wheathermodel!.wind.deg}"),
                      );
                    }
                  return CircularProgressIndicator(

                  );
                },
                future: homeProviderF!.wheatherData()

              )
            ),
          ],
        ),
      ),
    );
  }
}
