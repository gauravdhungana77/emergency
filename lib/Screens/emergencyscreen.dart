import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_sms/flutter_sms.dart';

class screen extends StatelessWidget {
  @override
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
            MainRow(text: "Ambulance"),
            MainRow(text: "Firefighter"),
            MainRow(text: "Police"),
          ],
        )
      ],
    );
  }
}

class MainRow extends StatelessWidget {
  MainRow({this.text});
  String? text;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Row(
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
                      _callNumber();
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
      ),
    );
  }
}



_callNumber() async {
  String number = "9804332283";
  await FlutterPhoneDirectCaller.callNumber(number);
}

 sending_SMS() async {
  String msg = "Test Message";
  List<String> list_receipents = ["9804079529"];
  String send_result = await sendSMS(message: msg, recipients: list_receipents)
      .catchError((err) {
    print(err);
  });
  print(send_result);
}
