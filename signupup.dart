import 'package:flutter/material.dart';
import 'package:dongnae/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(Sign_up());
}


class Sign_up extends StatelessWidget {
  const Sign_up({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Dongnae',
      theme: ThemeData(
          fontFamily: 'tmoney',
          scaffoldBackgroundColor:Colors.greenAccent
      ),
      home: Scaffold( appBar: AppBar(
          title: Text('우리동네 깐부찾기',
              style: TextStyle(fontSize: 20,
                  fontFamily:'tmonry')),
          backgroundColor: Colors.green,
          centerTitle: true,
          leading: IconButton(
            icon:Icon(Icons.backspace_outlined),
            onPressed: (){Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()),);},
          )
      ),
        body: Signup_body(),


      ),
    );
  }
}
class Signup_body extends StatefulWidget {
  @override
  Signup_bodyState createState() {
    return Signup_bodyState();
  }
}
class Signup_bodyState extends State<Signup_body>{

  final _formkey = GlobalKey<FormState>();
  String userName='';
  String userEmail = '';
  String userPassword = '';


  @override
  Widget build(BuildContext context) {


    void _tryValidation() {
      final isValid = _formkey.currentState!.validate();
      if(isValid){
        _formkey.currentState!.save();
      }
    }
    return Scaffold(body:
        SingleChildScrollView(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
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
          Form(
            child: Theme(
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
                borderRadius: BorderRadius.all(Radius.circular(50)),),
              padding: EdgeInsets.all(50.0),
              child:Form(

                key: _formkey,
                child: Column(

                  children:<Widget>[
                    TextFormField(
                      keyboardType: TextInputType.text,
                      key :ValueKey(1),

                      onSaved: (value){
                        userName = value!;
                      },
                      onChanged: (value){
                        userName=value;
                      },
                      validator: (value){
                        AutovalidateMode.always;
                        if(value!.isEmpty || value.length<2){
                          return '이름을 다시 해줘잉';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: '닉네임을 입력하세요',


                      ),

                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      key :ValueKey(2),
                      validator: (value){
                        if(value!.isEmpty || !value.contains('@')){
                          return '이메일 형식이 아닙니다.';
                        }
                        return null;
                      },
                      onSaved: (value){
                        userEmail = value!;
                      },
                      onChanged: (value){
                        userEmail=value;
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
                          return '패스워드가 올바르지 않습니다';
                        }
                        return null;
                      },
                      onSaved: (value){
                        userPassword=value!;
                      },
                      onChanged: (value){
                        userPassword=value;
                      },
                      decoration: InputDecoration(
                          labelText: '비밀번호를 입력하세요',
                          hintText: '8자 이상으로 구성해주세요'
                      ),

                    ),
                    TextFormField(
                      key: ValueKey(4),
                      validator: (value){
                        if(value!.isEmpty ||value != userPassword){
                          return '비밀번호가 일치하지 않습니다.';
                        }
                      },
                      decoration: InputDecoration(
                          labelText: '비밀번호를 다시 입력하세요'
                      ),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),
                    SizedBox(
                      height:40,
                    ),Container(child:
                    ElevatedButton(
                      onPressed: (
                          ){

                        if (_formkey.currentState!.validate()) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(
                              content: Text('회원가입 완료 다시 진행해주세요 ')));

                          Navigator.pop(context);
                      }
                      },
                      child: Text('Sign UP',style: TextStyle(
                          fontFamily: 'tmoney'
                      )),
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amber),
                          minimumSize: MaterialStateProperty.all(Size(150, 40)),

                          padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(0, 10, 0, 0))),
                    ),
                    ),ElevatedButton(onPressed:(){}, child: Text('Google')),

                    Container(width: double.infinity,
                      padding:EdgeInsets.fromLTRB(0, 50,0,0),
                      height: 150,child: Container(color: Colors.blue,child:
                      Text('광고주 구함 급함',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,

                        ),)),)
                  ],),
              ),
            ),),
          ),
        ],
      ),
    ));
  }
}

