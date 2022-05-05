import 'package:flutter/material.dart';


import 'main.dart';

void main() {
  runApp(const MaterialApp(title: "App", home: registerAccount()));
}

class registerAccount extends StatefulWidget {
  const registerAccount({Key? key}) : super(key: key);

  @override
  _registerAccount createState() => _registerAccount();
}

enum sex { Male, Female }

class _registerAccount extends State<registerAccount> {
  // bool _passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: MaterialApp(
        home: Scaffold(
          resizeToAvoidBottomInset: true,
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
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: const Text(
                              'ICAR.VN',
                              style: TextStyle(
                                  color: Colors.deepOrangeAccent,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 40),
                            ),
                            margin: const EdgeInsets.only(top: 60, bottom: 10),
                            alignment: Alignment.center,
                          ),
                        ),
                      ],
                    ),
                    Container_Text_Field("Họ và Tên"),
                    Container_Text_Field_PhonnNumber("Số điện Thoại"),
                    Container_Text_Field("Mật khẩu"),
                    Container_Text_Field("Nhập lại mật khẩu"),
                    Container_Text_Field("Email"),
                    Row(
                      children: <Widget>[
                        Container(
                          child: const Text(
                            'Giới tính:',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        RadioButton("Male", sex.Male),
                        RadioButton("Female", sex.Female),
                      ],
                    ),
                    RegisterButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container_Text_Field(String content) {
    return Container(
      height: 65,
      child: TextField(
        maxLength: 100,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white70,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              width: 3,
              color: Colors.deepOrangeAccent,
            ),
          ),
          hintText: content,
          hintStyle: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      margin: const EdgeInsets.only(
        left: 30,
        right: 30,
      ),
    );
  }

  sex? _character = sex.Male;
  RadioButton(String s, sex se) {
    return Expanded(
      child: Container(
        // color: Colors.cyanAccent,
        child: ListTile(
          title: Text(s),
          leading: Radio(
            value: se,
            groupValue: _character,
            onChanged: (sex? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        alignment: Alignment.topLeft,
      ),
    );
  }

  RegisterButton() {
    return Container(
      width: 280,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.deepOrangeAccent,
              onPrimary: Colors.cyanAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              )),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Main()),
            );
          },
          child: const Text(
            'Đăng Ký',
            style: TextStyle(fontSize: 24, color: Colors.white),
          )),
    );
  }

  Container_Text_Field_PhonnNumber(String s) {
    return Container(
      height: 60,
      child: const TextField(
        keyboardType: TextInputType.number,
        maxLength: 20,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white70,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              width: 3,
              color: Colors.deepOrangeAccent,
            ),
          ),
          hintText: 'Số điện thoại',
          hintStyle: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      margin: const EdgeInsets.only(
        left: 30,
        right: 30,
      ),
    );
  }
}

// extension TF on TextField {
//   TextField customTF(bool content) {
//     return TextField(
//       maxLength: 100,
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: Colors.white70,
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.all(Radius.circular(10)),
//           borderSide: BorderSide(
//             width: 3,
//             color: Colors.deepOrangeAccent,
//           ),
//         ),
//         hintText: content ? "" : "",
//         hintStyle: TextStyle(
//           color: Colors.black,
//         ),
//       ),
//     );
//   }
// }

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

