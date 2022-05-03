import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  bool valuefirst = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              width: 360,
              height: 700,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/pho.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.6,
                ),
              ),
            ),
            Column(
              children: <Widget>[
                titleText1(),
                titleText2(),
                phoneNumber(),
                password(),
                Row(
                  children: [
                    checkbox(),
                    textForgotInfor(),
                  ],
                ),
                buttonLogin(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  titleText1() {
    return Container(
      child: const Text('Đăng nhập',
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,
          )),
      alignment: Alignment.center,
      margin: const EdgeInsets.only(
        top: 100,
      ),
    );
  }
  titleText2() {
    return Container(
      child: const Text('Bạn cần sử dụng tài khoản ICAR-M '
          'service để đăng nhập vào hệ thống',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
      ),
      alignment: Alignment.center,


      color: Colors.amber,
      margin: const EdgeInsets.only(
        top: 20,
      ),
    );
  }

  phoneNumber() {
    return Container(
      width:300,
      height:50,
      child: const TextField(
        keyboardType: TextInputType.number,
        autofocus: true,
          autocorrect: true,
          textAlign: TextAlign.left,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                width: 3,
                color: Colors.cyanAccent,
              ),
            ),
            hintText: 'Số điện thoại',
         ),
          style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      alignment: Alignment.center,
    );
  }

  bool _passwordVisible = true;
  password() {
    return Container(
      width:300,
      height:50,
      child: TextField(
          obscureText: _passwordVisible,
          autocorrect: true,
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                width: 3,
                color: Colors.cyanAccent,
              ),
            ),
            hintText: 'Mật khẩu',
            suffixIcon: IconButton(
              icon: Icon(
                // Based on passwordVisible state choose the icon
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: Theme.of(context).primaryColorDark,
              ),
              onPressed: () {
                // Update the state i.e. toogle the state of passwordVisible variable
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
          ),
          style: const TextStyle(fontSize: 20, color: Colors.white)),
      margin: const EdgeInsets.only(top: 20),
    );
  }

  checkbox() {
    return Checkbox(
      checkColor: Colors.greenAccent,
      activeColor: Colors.red,
      value: valuefirst,
      onChanged: (value) {
        setState(() {
          valuefirst = value!;
        });
      },
    );
  }

  textForgotInfor() {
    return Expanded(
      child: Container(
        child: const Text('Forgot Password?'),
        alignment: Alignment.centerRight,
      ),
    );
  }

  buttonLogin() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.amber,
          onPrimary: Colors.cyanAccent,
        ),
        onPressed: () {},
        child: const Text(
          'Đăng nhập',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ));
  }


}
