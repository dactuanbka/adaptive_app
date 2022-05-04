import 'package:adaptive_app/main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(title: "App", home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  bool value_first = false;
  bool _passwordVisible = true;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
        child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/pho.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.6,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  titleText1(),
                  titleText2(),
                  phoneNumber(),
                  password(),
                  Row(
                    children: [
                      checkbox(),
                      labelcheckBox(),
                      textForgotButton(),
                    ],
                  ),
                  buttonLogin(),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
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
      child: const Text(
        'Bạn cần sử dụng tài khoản ICAR-M '
        'service để đăng nhập vào hệ thống',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
      alignment: Alignment.center,
      margin: const EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
    );
  }

  phoneNumber() {
    // final FocusNode focusNode = Focus.of(context);
    // final bool hasFocus = focusNode.hasFocus;
    return Container(
      width: 300,
      height: 50,
      child: const TextField(
        maxLength: 20,
        keyboardType: TextInputType.number,
        autofocus: true,
        autocorrect: true,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black54,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              width: 3,
              color: Colors.cyanAccent,
            ),
          ),
          hintText: 'Số điện thoại',
          hintStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
      alignment: Alignment.center,
    );
  }

  password() {
    return Container(
      width: 300,
      height: 50,
      child: TextField(
          obscureText: _passwordVisible,
          autocorrect: true,
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.black54,
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                width: 3,
                color: Colors.cyanAccent,
              ),
            ),
            hintText: 'Mật khẩu',
            hintStyle: const TextStyle(
              color: Colors.white,
            ),
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
          style: const TextStyle(fontSize: 16, color: Colors.white)),
      margin: const EdgeInsets.only(top: 20),
    );
  }

  checkbox() {
    return Container(
      child: Checkbox(
        checkColor: Colors.greenAccent,
        activeColor: Colors.blue,
        value: value_first,
        onChanged: (value) {
          setState(() {
            value_first = value!;
          });
        },
      ),
      margin: const EdgeInsets.only(left: 18),
    );
  }

  textForgotButton() {
    return Expanded(
      child: Container(
        child: TextButton(
          onPressed: () {},
          child: const Text(
            'Forgot password ?',
            style: TextStyle(color: Colors.white),
          ),
        ),
        alignment: Alignment.centerRight,
        margin: const EdgeInsets.only(right: 15),
      ),
    );
  }

  buttonLogin() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.amber,
          onPrimary: Colors.cyanAccent,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Main()),
          );
        },
        child: const Text(
          'Đăng nhập',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ));
  }

  labelcheckBox() {
    return const Text("Remember me", style: TextStyle(color: Colors.white));
  }
}

class DismissKeyboard extends StatelessWidget {
  final Widget child;

  const DismissKeyboard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: child,
    );
  }
}
