import 'package:dongnae/signup.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

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
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text('우리동네 깐부찾기',
        style: TextStyle(fontSize: 20,
        fontFamily:'tmonry')),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Login_body(),

      );
  }
}


class Login_body extends StatelessWidget {
  const Login_body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,


        children: [
          Container(

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
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50)),
                boxShadow: [
              BoxShadow(
              color: Colors.grey,
                offset: Offset(4.0, 4.0),
                blurRadius: 15.0,
                spreadRadius: 1.0,
              )],),

              padding: EdgeInsets.all(40.0),
              child: Column(
                children: [
                  TextField(
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
                        fontFamily: 'tmoney'
                    )),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amber),
                        minimumSize: MaterialStateProperty.all(Size(150, 40)),

                        padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(0, 10, 0, 0))),
                  ),margin: EdgeInsets.all(10),),
                  ElevatedButton(
                    onPressed: (
                        ){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Sign_up())
                      );
                    },
                    child: Text('Sign UP',style: TextStyle(
                      fontFamily: 'tmoney'
                    )),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amber),
                    minimumSize: MaterialStateProperty.all(Size(150, 40)),

                    padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(0, 10, 0, 0))),
                  ),
                  
                  Container(width: double.infinity,
                    padding:EdgeInsets.fromLTRB(0, 50,0,0),
                    height: 150,child: Container(color: Colors.blue,child: 
                    Text('광고주 구함 급함',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,

                    ),)),)
                ],
              ),
            ),),
          ),
        ],
      ),
    );
  }
}
