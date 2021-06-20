import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:tradexa/listdata.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController searchcontroller = new TextEditingController();
  List<object> use  = list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  //  loadthedata();
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Home", style: TextStyle(
                    color: Colors.black.withOpacity(0.65),
                    fontWeight: FontWeight.w900,
                    fontSize: 25.0
                ),),
                Padding(
                    padding: EdgeInsets.only(right: 20, top: 20),
                    child: TextField(
                      controller: searchcontroller,
                      onTap: (){
                        searchcontroller.addListener(() {
                          setState(() {
                            searchengine();
                          });

                        });
                      },
                      cursorColor: Colors.black.withOpacity(0.5),
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.search, color: Colors.black,),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.7), width: 2.0),
                          ),
                          contentPadding: const EdgeInsets.all(15),
                          border: OutlineInputBorder(
                          ),
                          hintText: 'Search for movie'
                      ),
                    )
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10, right: 10,),
                        child: SizedBox(
                          height: 225,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(

                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.20,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width/2,

                                  decoration: BoxDecoration(

                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.blueGrey.withOpacity(0.5),
                                          spreadRadius: 7,
                                          blurRadius: 10,
                                          offset: Offset(0, 3), // changes position of shadow
                                        ),
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                        bottomRight:  Radius.circular(10),
                                      )
                                  ),
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.20,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width/2,

                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 15),
                                          child: Text(list[index].name,
                                            style: TextStyle(color: Colors.black,
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20.0),),
                                        ),
                                        SizedBox(
                                          height: 1,
                                        ),
                                        Text(list[index].type, style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12.0,
                                            color: Colors.black.withOpacity(
                                                0.5)),),
                                        SizedBox(
                                          height: 1,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: double.parse(list[index].rating) >  8
                                                  ? Colors.green
                                                  : Colors.blue,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(18.0))
                                          ),

                                          height: MediaQuery
                                              .of(context)
                                              .size
                                              .height * 0.04,
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width * 0.2,
                                          child: Center(
                                              child: Text(list[index].rating)),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.lightBlueAccent.withOpacity(0.2),
                                            spreadRadius: 7,
                                            blurRadius: 7,
                                            offset: Offset(0, 3), // changes position of shadow
                                          ),
                                        ],
                                        image: DecorationImage(
                                          image: AssetImage(list[index].image),
                                          fit: BoxFit.fill,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))
                                    ),
                                    height: 200,
                                    width: 160,

                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )


              ],
            ),
          ),
        )

    );
  }

/* void loadthedata() async  {
    Map<String, String> requestHeaders = {
      'x-rapidapi-key': 'api',
      'x-rapidapi-host': 'imdb8.p.rapidapi.com',
      'useQueryString': 'true'
    };
  var response = await http.get(
  'https://imdb8.p.rapidapi.com/actors/get-all-images',
      headers: requestHeaders);
    print(response.body);
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Map<String, dynamic> map = json.decode(response.body);

      print(map);

     // for (var u in data) {

      //  Album user = Album(u["title"], u["description"], u["name"], u["urlToImage"],u["url"],u["publishedAt"]);
       // users.add(user);



    //  print(users);


   // }
  }*/
  void searchengine() {
    List<object> _contacts = [];
    _contacts.addAll(use);
    if (searchcontroller.text.isNotEmpty) {
      _contacts.retainWhere((list) {
        String searchTerm = searchcontroller.text.toLowerCase();
        String contactName = list.name.toLowerCase();
        return contactName.contains(searchTerm);
      });
      setState(()
      {
        list = _contacts;

      });
    }
  }
//}
}
