import 'package:dongnae/auth_servide.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

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
  //String? user = FirebaseAuth.instance.currentUser!.email ?? FirebaseAuth.instance.currentUser!.displayName;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('우리동네 깐부찾기',
      style: TextStyle(fontWeight: FontWeight.w700 )),
    leading: IconButton(
    icon: Icon(Icons.menu,size: 40), // 햄버거버튼 아이콘 생성
    onPressed: () {
    // 아이콘 버튼 실행
    print('menu button is clicked');
    },),
        actions: <Widget>[
          IconButton(onPressed: (){
            print('User Btn Clicked');
          },
              icon:Icon(Icons.account_circle_rounded,size: 40)),
        ],
    )
        ,body: homepageBody(),
    );


  }
}
class homepageBody extends StatelessWidget {
  const homepageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        height: 100,
        margin: EdgeInsets.fromLTRB(30,50,30,0),
        padding:EdgeInsets.fromLTRB(30, 0, 30, 0),
        /*decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            border: Border.all(color: Colors.black),
            color: Colors.lightGreen),*/
        alignment: Alignment.center,
        child: Text('깐부를 찾아보자..',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 25)),
      ),Container(
        margin: EdgeInsets.fromLTRB(10,50,10,50),
        padding:EdgeInsets.only(bottom: 300),
        decoration: BoxDecoration(
          color: Colors.white,
          image:DecorationImage(image: AssetImage('assets/Map.png')),

          border: Border.all(color: Colors.black,width: 2)
        ),
      ),
    ],
    );
  }
}
















    /*return Scaffold(

      appBar: AppBar(title: Text(
        FirebaseAuth.instance.currentUser!.displayName!,
        style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87),
      ),),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Text(
              FirebaseAuth.instance.currentUser!.email!,
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
              padding: const EdgeInsets.all(10),
              color: Colors.green,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              child: const Text(
                'LOG OUT',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              onPressed: () {
                AuthService().signOut();
              },
            ),
          ],
        ),
      ),
    );*/
