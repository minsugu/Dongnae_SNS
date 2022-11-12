import 'package:dongnae/auth_servide.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:dongnae/for_tabbar.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? user = FirebaseAuth.instance.currentUser!.email ?? FirebaseAuth.instance.currentUser!.displayName;

  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(color: Colors.greenAccent),

          scaffoldBackgroundColor:Colors.white),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar:AppBar(title: Text('우리동네 깐부찾기',
              style: TextStyle(fontWeight: FontWeight.w700 )),
            leading: IconButton(
              icon: Icon(Icons.menu,size: 40), // 햄버거버튼 아이콘 생성
              onPressed: () {
                // 아이콘 버튼 실행
                print('menu button is clicked');
              },),
            /*actions: <Widget>[
              IconButton(onPressed: (){
                print('User Btn Clicked');
              },
                  icon:Icon(Icons.account_circle_rounded,size: 40)),
            ],*/
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children:[
                ListView(
              children: [story_home(),feed_home()
              ]),


                Center(
                  child: Text("add"),
                ),
                Center(
                  child: Text("serch"),
                ),
                Center(
                child: Text("user"),
                ),
              ],
          ),
          extendBodyBehindAppBar: true, // add this line

          bottomNavigationBar: bottomnavi()
        ),
      ),
    );
  }
}

class bottomnavi extends StatelessWidget {
  const bottomnavi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child: Container(
        height: 70,
        padding: EdgeInsets.only(bottom: 10, top: 5),
        child: const TabBar(
          //tab 하단 indicator size -> .label = label의 길이
          //tab 하단 indicator size -> .tab = tab의 길이
          indicatorSize: TabBarIndicatorSize.label,
          //tab 하단 indicator color
          indicatorColor: Colors.deepOrange,
          //tab 하단 indicator weight
          indicatorWeight: 2,
          labelColor: Colors.deepOrange,
          unselectedLabelColor: Colors.black38,

          tabs: [
            Tab(
              icon: Icon(
                  Icons.home_outlined,
                  size: 30),
            ),
            Tab(
                icon: Icon(
                    Icons.add_box_outlined,
                    size: 30)
            ),
            Tab(
              icon: Icon(
                  Icons.search,
                  size: 30),
            ),
            Tab(
              icon: Icon(
                  Icons.account_circle_rounded,
                  size: 30),
            )
          ],
        ),
      ),
    );
  }
}

