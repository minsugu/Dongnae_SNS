
import 'package:dongnae/auth_servide.dart';
import 'package:dongnae/signupup.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
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
  final _authentication = FirebaseAuth.instance;
/*
  final _formKey = GlobalKey<FormState>();
  String userName = '';
  String userEmail = '';
  String userPassword = '';

  void _tryValidation() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }*/
  @override
  Widget build(BuildContext context) {

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
              child: Column(
                children: [
                  TextFormField(
                    key: ValueKey(1),
                    validator: (value){

                      if(value!.isEmpty){
                        return '제발 살려줘 제발';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: '이메일을 입력하세요'
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: '비밀번호를 입력하세요'
                    ),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                  ),
                  SizedBox(
                    height:40,
                  ),Container(child:
                  ElevatedButton(
                    onPressed: (){},
                    child: Text('Sign IN',style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: 'tmoney'
                    )),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.deepOrangeAccent),
                        minimumSize: MaterialStateProperty.all(Size(150, 40)),

                        padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(0, 10, 0, 0))),
                  ),margin: EdgeInsets.all(10),),
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
                    child: Text('Sign UP',style: TextStyle(
                        fontFamily: 'tmoney',
                        fontWeight: FontWeight.w700
                    )),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.deepOrangeAccent),
                        minimumSize: MaterialStateProperty.all(Size(150, 40)),

                        padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(0, 10, 0, 0))),
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
                            image:DecorationImage(image: AssetImage('assets/google.png'),

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
                ],
              ),
            ),),
          ),
        ],
      ),
    );
  }
}

