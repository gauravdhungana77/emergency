import 'package:flutter/material.dart';

class screen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
     children: [
       Container(
         child :Image.asset(
           'images/ambulance.png',
           width: 200.0,
           height: 200.0,
           fit: BoxFit.contain,
         ),
       ),

       Column(
         children: [
           Container(
             padding: EdgeInsets.all(20.0),
             margin: EdgeInsets.only(left: 10.0,right: 10.0,bottom: 10.0),

             decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(5)
             ),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Container(
                   child: Text("Ambulance",style: TextStyle(fontSize: 20),),

                 ),
                 Container(
                   child: Row(
                     children: [
                       Icon(Icons.call,color: Colors.blue,),
                       SizedBox(width: 10.0,),
                       Icon(Icons.messenger,color: Colors.blue,),
                     ],
                   ),
                 ),
               ],
             ),
           ),
           Container(
             padding: EdgeInsets.all(20.0),
             margin: EdgeInsets.only(left: 10.0,right: 10.0,bottom: 10.0),
             decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(5)
             ),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Container(
                   child: Text("Firefighter",style: TextStyle(fontSize: 20),),

                 ),
                 Container(
                   child: Row(
                     children: [
                       Icon(Icons.call,color: Colors.blue,),
                       SizedBox(width: 10.0,),
                       Icon(Icons.messenger,color: Colors.blue,),
                     ],
                   ),
                 ),
               ],
             ),
           ),
           Container(
             padding: EdgeInsets.all(20.0),
             margin: EdgeInsets.only(left: 10.0,right: 10.0,bottom: 10.0),
             decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(5)
             ),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Container(
                   child: Text("Police",style: TextStyle(fontSize: 20),),

                 ),
                 Container(
                   child: Row(
                     children: [
                       Icon(Icons.call,color: Colors.blue,),
                       SizedBox(width: 10.0,),
                       Icon(Icons.messenger,color: Colors.blue,),
                     ],
                   ),
                 ),
               ],
             ),
           ),
         ],
       )


     ],
   );
  }

}