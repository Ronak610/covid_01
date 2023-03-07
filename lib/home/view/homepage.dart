import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../until/api_Http.dart';
import '../contoller/homeCotroller.dart';
import '../modal/homemodal.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Homecontroller homecontroller = Get.put(Homecontroller());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu),
            ),
          ],
          backgroundColor: Colors.lightBlue,
          title: Text("Covid19"),
        ),
        body: Stack(
          children: [
            Image.asset("assets/image/covid011.jpg",fit: BoxFit.cover,width: double.infinity,),
            GetBuilder<Homecontroller>(
              builder: (controller) => FutureBuilder(
                future: Api_http().coviddata(homecontroller.name == ""
                    ? "india"
                    : "${homecontroller.name}"),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("${snapshot.hasError}"),
                    );
                  } else if (snapshot.hasData) {
                    Homemodel? h1 = snapshot.data;
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                              textInputAction: TextInputAction.next,
                              controller: homecontroller.txtname,
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 2.5),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 2.5),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.search, color: Colors.white),
                                  onPressed: () {
                                    homecontroller.asign();
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Center(
                              child: Text(
                                "Country Data",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600,color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "  Country           : ${h1!.countryText}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600,color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "  Last Update    : ${h1.lastUpdate}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600,color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "  Total Cases     : ${h1.totalCasesText}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600,color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "  Total Deaths   : ${h1.totalDeathsText}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600,color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "  Total Recover : ${h1.totalRecoveredText}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600,color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(
                    color: Colors.black,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}