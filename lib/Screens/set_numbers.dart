import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:validators/validators.dart' as validator;
import 'package:fluttertoast/fluttertoast.dart';

class SetNumber extends StatefulWidget {
  const SetNumber({Key? key}) : super(key: key);

  @override
  State<SetNumber> createState() => _SetNumberState();
}

class _SetNumberState extends State<SetNumber> {
  bool isLoading = true;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    readNumber();
  }

  SharedPreferences? prefs;
  int? policenumber = 0;
  int? ambulancenumber = 0;
  int? firefighternumber = 0;

  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Emergency',
      home: Scaffold(
        resizeToAvoidBottomInset : false,
        appBar: AppBar(
          title: Text('Set Numbers'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          ),
        ),
        body: !isLoading
            ? Container(

                padding: EdgeInsets.all(10.0),

                child: Column(

                  children: [
                    Container(
                      child: Image.asset(
                        'images/telephone.png',
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Textfields(
                            numbers: policenumber,
                            label: "Police",
                            method: (String value) {
                              policenumber = int.parse(value);
                            },
                          ),
                          Textfields(
                            numbers: ambulancenumber,
                            label: "Ambulance",
                            method: (String value) {
                              ambulancenumber = int.parse(value);
                            },
                          ),
                          Textfields(
                            numbers: firefighternumber,
                            label: "Firefighter",
                            method: (String value) {
                              firefighternumber = int.parse(value);
                            },
                          ),

                          SizedBox(height: 20.0),
                          ElevatedButton(
                            style: TextButton.styleFrom(
                              primary: Colors.blue,
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                saveNumber();
                              }

                              //                  print(policenumber);
                            },
                            child: Text(
                              'Set',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : Center(
                child: Text("Loading..."),
              ),
      ),
    );
  }

  saveNumber() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs?.setInt('police', policenumber!);
      prefs?.setInt('ambulance', ambulancenumber!);
      prefs?.setInt('firefighter', firefighternumber!);
    });
    Fluttertoast.showToast(
        msg: "Phone number successfully saved",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  readNumber() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      policenumber = prefs!.getInt('police');
      ambulancenumber = prefs!.getInt('ambulance');
      firefighternumber = prefs!.getInt('firefighter');
      isLoading = false;
    });
  }
}

class Textfields extends StatelessWidget {
  Textfields({this.numbers, this.method, this.label});
  int? numbers;
  String? label;
  void Function(String)? method;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      initialValue: numbers.toString(),
      decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: label,
          hintText: "Enter a phone number"),
      validator: (value) {
        if (value!.isEmpty) {
          return "This field can't be empty";
        } else if (!value.isValidPhone) {
          return "Please enter a valid phone number";
        }
      },
      onChanged: method,
    );
  }
}

extension extString on String {
  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?98[0-9]{8}$");
    return phoneRegExp.hasMatch(this);
  }
}
