import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(title: "Dialog", home: forgot_Dialog()));
}

class forgot_Dialog extends StatefulWidget {
  const forgot_Dialog({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _forgot_Dialog();
  }
}

class _forgot_Dialog extends State<forgot_Dialog> {
  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(child:Container(
      child: forgotPassword_Dialog,
    ),
    );
  }
  Dialog forgotPassword_Dialog = Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: Container(
      height: 400,
      width: 250,
      child: Column(
        children: [
          Container(
            child: const Text(
              "Vui lòng nhập số điện thoại/Email",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            margin: const EdgeInsets.only(top:30, bottom:15),
          ),
          Container(
            child: TextField(
              // autofocus: true,
              maxLength: 50,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white70,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    width: 3,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
                hintText: "",
                hintStyle: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            margin: const EdgeInsets.only(right: 20, left: 20),
          ),
          Container(
            width: 120,
            height:45,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrangeAccent,
                  onPrimary: Colors.cyan,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
              onPressed: () {
              },
              child: const Text('SEND', style: TextStyle(color: Colors.white),),
            ),
            // margin: const EdgeInsets.only(top:20),
          )
        ],
      ),
    ),
  );
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