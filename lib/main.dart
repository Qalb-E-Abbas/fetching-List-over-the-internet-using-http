import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: homePage(),
    );
  }
}



class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {


  // Url for api got from https://thegrowingdeveloper.org/developer-apis
  final String url = 'https://thegrowingdeveloper.org/apiview?id=1';

  String data;

  @override
  void initState() {
    getJeasonData();
    super.initState();
  }


  Future<String> getJeasonData() async {

    http.Response response;

    response = await http.get(url);

    if(response.statusCode == 200){
      setState(() {
        data = response.body;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: new AppBar(title: Text('Http get'),),

      body: new ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index){
            return Container(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(child:
                    Container(
                        padding: EdgeInsets.all(10),
                        child: Text(data.toString(), style: TextStyle(fontSize: 20),)))
                  ],
                ),
              ),
            );
          }),
    );
  }
}
