import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:shared_preferences/shared_preferences.dart';


bool isLoading = true;
int? policenumber;
int? ambulancenumber;
int? firefighternumber;


class screen extends StatefulWidget {

  @override
  State<screen> createState() => _screenState();
}

class _screenState extends State<screen> {
  @override
  void initState() {
    readNumber();
  }

    Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: Image.asset(
            'images/ambulance.png',
            width: 200.0,
            height: 200.0,
            fit: BoxFit.contain,
          ),
        ),
        Column(
          children: [
            MainRow(
              text: "Ambulance",
              phonenumber: ambulancenumber.toString(),
            ),
            MainRow(
              text: "Firefighter",
              phonenumber: firefighternumber.toString(),
            ),
            MainRow(
              text: "Police",
              phonenumber: policenumber.toString(),
            ),
          ],
        )
      ],
    );
  }
}

class MainRow extends StatelessWidget {
  MainRow({this.text, this.phonenumber});
  String? text;
  String? phonenumber;


  @override

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child:
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "$text",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            _callNumber(phonenumber!);
                          },
                          icon: Icon(
                            Icons.call,
                            color: Colors.blue,
                          )),
                      SizedBox(
                        width: 10.0,
                      ),
                      IconButton(
                        onPressed: () {
                          sending_SMS();
                        },
                        icon: Icon(
                          Icons.messenger,
                          color: Colors.blue,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )

    );
  }


}
readNumber() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  policenumber = prefs.getInt('police')!;
  ambulancenumber = prefs.getInt('ambulance')!;
  firefighternumber = prefs.getInt('firefighter')!;
  isLoading = false;
  print(policenumber);
}
_callNumber(String numbers) async {
  String number = numbers;
  await FlutterPhoneDirectCaller.callNumber(number);
}

sending_SMS() async {
  String msg = "Test Message";
  List<String> listReceipents = ["9804079529"];
  String sendResult =
      await sendSMS(message: msg, recipients: listReceipents).catchError((err) {
    print(err);
  });
  print(sendResult);
}
