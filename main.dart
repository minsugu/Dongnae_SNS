
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dongnae/auth_servide.dart';
import 'package:dongnae/home_page.dart';
import 'package:dongnae/signupup.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void openSnackbar() {
  Get.snackbar(
    'Snackbar',
    'This is a snackbar',
    snackPosition: SnackPosition.BOTTOM,
    forwardAnimationCurve: Curves.elasticInOut,
    reverseAnimationCurve: Curves.easeOut,
  );
}



void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  var logger = Logger();

  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: 'Dongnae',

      theme: ThemeData(
        fontFamily: 'tmoney',
        scaffoldBackgroundColor:Colors.greenAccent
      ),
      home: Scaffold(

        body: LogIn(),
      ),
    );
  }}


class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  FirebaseFirestore firestore=FirebaseFirestore.instance;
  final _formkey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';



  @override
  Widget build(BuildContext context) {

    void _tryValidation() {
      final isValid = _formkey.currentState!.validate();
      if(isValid){
        _formkey.currentState!.save();
      }
    }

    return SingleChildScrollView(
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,


        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0,30,0,30),
            width: double.infinity,
            child: Text('Dong\nNae',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'tmoney',
                  fontSize: 50,
                  fontWeight: FontWeight.w700
              ),),
          ),
          Form(child: Theme(
            data: ThemeData(

              primaryColor: Colors.black,
              inputDecorationTheme: InputDecorationTheme(
                  labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0
                  )
              ),
            ),
            child: Container(
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50)),
                ),

              padding: EdgeInsets.all(40.0),
              child: Form(
                key: _formkey,
                child: Column(
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    key :ValueKey(1),
                    validator: (value){
                      if(value!.isEmpty || !value.contains('@')){
                        return '올바른 이메일형식이 아니에요';
                      }
                      return null;
                    },
                    onSaved: (value){
                      email = value!;
                    },
                    onChanged: (value){
                      email=value;
                    },
                    decoration: InputDecoration(
                        labelText: '이메일을 입력하세요'
                    ),

                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    key: ValueKey(3),
                    validator: (value){
                      if(value!.isEmpty || value.length<8){
                        return '패스워드가 너무 짧거나 틀렸어요';
                      }
                      return null;
                    },
                    onSaved: (value){
                      password=value!;
                    },
                    onChanged: (value){
                      password=value;
                    },
                    decoration: InputDecoration(
                        labelText: '비밀번호를 입력하세요',
                    ),

                  ),
                  SizedBox(
                    height:40,
                  ),Container(margin: EdgeInsets.all(10),child:
                  GestureDetector(
                      onTap: () async {
                        try {
                          UserCredential userCredential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                              email: email,
                              password: password) //아이디와 비밀번호로 로그인 시도
                              .then((value) {
                            print(value);
                            value.user!.emailVerified == true //이메일 인증 여부
                                ? Navigator.push(context,
                                MaterialPageRoute(builder: (_) => HomePage()))
                                : print('이메일 확인 안댐');
                            return value;
                          });
                        } on FirebaseAuthException catch (e) {
                          //로그인 예외처리
                          if (e.code == 'user-not-found') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('등록된 이메일이 아니에요.'),
                                duration: Duration(seconds: 3),
                              ),
                            );
                          } else if (e.code == 'wrong-password') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('비밀번호가 틀려요.'),
                                duration: Duration(seconds: 3),
                              ),
                            );
                          } else {
                            _tryValidation();
                          }
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent,
                            borderRadius: BorderRadius.circular(4)),
                        width: 150,
                        height: 40,
                        child: Center(
                          child: Text(
                            'Sign IN',
                            style: TextStyle(color: Colors.white,
                            fontFamily: 'tmoney',
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                          ),
                        ),
                        //color: Colors.deepOrange,
                      )),),
                  ElevatedButton(
                    onPressed: (
                        ){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) =>Sign_up() )
                        //LoginSignupScreen
                        //SignUp
                      );
                    },
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.deepOrangeAccent),
                        minimumSize: MaterialStateProperty.all(Size(150, 40)),

                        padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(0, 10, 0, 0))),
                    child: Text('Sign UP',style: TextStyle(
                        fontFamily: 'tmoney',
                        fontSize: 15,
                        fontWeight: FontWeight.w700
                    )),
                  ),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) =>AuthService().handleAuthState())
                          //LoginSignupScreen
                          //SignUp
                        );
                      },
                      child: Container(
                        width: 300,
                        height: 40,
                        padding: EdgeInsets.all(1),
                        margin: EdgeInsets.only(top: 30),
                        decoration: BoxDecoration(
                            image:DecorationImage(image: AssetImage('assets/images/google.png'),

                        alignment: Alignment.topLeft),
                        border: Border.all(),borderRadius: BorderRadius.circular(6)
                        ),child: Text('Sign in with google',style: TextStyle(fontWeight: FontWeight.w700,
                      fontSize: 15)),
                        alignment: Alignment.center,



                      ),),

                  /*Container(width: double.infinity,
                    padding:EdgeInsets.fromLTRB(0, 50,0,0),
                    height: 150,child: Container(color: Colors.blue,child:
                    Text('광고주 구함 급함',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,

                      ),)),)*/
                
              ]),
            ),),
          ),
        
      ),
    ]));
  }
}

