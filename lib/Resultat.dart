import 'dart:ffi';

import 'package:flutter/material.dart';
  import 'package:BMI_Calucator/MainPage.Dart';



  class ResultatPage extends StatefulWidget {

   final double bmi_val;
   final String note;
   

   ResultatPage({Key key, @required this.bmi_val, @required this.note}) : super(key: key);

    @override
    _ResultatPageState createState() => _ResultatPageState();
  }
  
  class _ResultatPageState extends State<ResultatPage> {




 


    @override
    Widget build(BuildContext context) {
      var x = widget.bmi_val.toStringAsFixed(1);
       Color c = new Color.fromRGBO(255, 255, 255, 1);
       Color cfont = new Color.fromRGBO(243, 243, 243, 1);

      if (widget.bmi_val <= 18.5) {
         c = new Color.fromRGBO(135, 177, 227, 1);
         cfont=cfont;
      }
        if (widget.bmi_val >18.5 && widget.bmi_val <=24.9) {
        c = new Color.fromRGBO(193, 232, 153, 1);
        cfont=new Color.fromRGBO(80, 79, 79, 1);
        }
    if (widget.bmi_val >=25 && widget.bmi_val <=29.9) {
         c = new Color.fromRGBO(249, 228, 133, 1);
         cfont=new Color.fromRGBO(80, 79, 79, 1);
    }
    if (widget.bmi_val >=30) {
       c = new Color.fromRGBO(242, 137, 137, 1);
       cfont=cfont;
    }
        return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color:c,
              ),

          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5),
             child:ListView(
                children: <Widget>[
               Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 320, 0),
                  child: IconButton(icon: Icon(Icons.chevron_left,size:35 ,color: cfont,),
                   onPressed: (){
                   Navigator.of(context).push(backtohome());
                   }),
 
                  ),
                   Padding(
                  padding: EdgeInsets.fromLTRB(25, 35, 20, 0),
                     child:Text("YOUR RESULT ",
                         style:  TextStyle(
                            color: cfont,
                            fontSize: 18,
                            fontFamily: "Uniform",
                            fontWeight: FontWeight.bold,
                         ),
                     )
 
                  ),
                  Padding(
                  padding: EdgeInsets.fromLTRB(25, 5, 20, 0),
                   child:Text("$x",
                  style: TextStyle(
                            color: cfont,
                            fontSize: 52,
                            fontFamily: "Uniform",
                            fontWeight: FontWeight.bold,
                         ),
                 
                 ),
                  ),
                   
                   Padding(
                     padding: EdgeInsets.fromLTRB(25, 5, 20, 0),
                     
                  child: Text(widget.note,
                  style: TextStyle(
                            color: cfont,
                            fontSize: 18,
                            fontFamily: "Uniform",
                            fontWeight: FontWeight.w300,
                         ),
                 
                 ),
                    ),


                 Padding(
                  padding: EdgeInsets.fromLTRB(10, 100, 10, 10),
                  child:
                    Column(
                      children: <Widget>[
                       Row(
                    children: <Widget>[
                      Text("Underweight ",
                      style: TextStyle(
                            color: cfont,
                            fontSize: 16,
                            fontFamily: "Uniform",
                            fontWeight: FontWeight.bold,
                         ),
                      ),
                       SizedBox(width: 114,),
                       Text("=<18.5",
                          style: TextStyle(
                            color: cfont,
                            fontSize: 16,
                            fontFamily: "Uniform",
                            fontWeight: FontWeight.bold,
                         ),
                      ),
                    ],
                  ),
                   SizedBox(height: 10,),
                  Divider(
                    color: cfont, 
                    ),
                    Row(
                    children: <Widget>[
                      Text("Normal weight ",
                      style: TextStyle(
                            color: cfont,
                            fontSize: 16,
                            fontFamily: "Uniform",
                            fontWeight: FontWeight.bold,
                         ),
                      ),
                       SizedBox(width: 100,),
                       Text("18.5–24.9",
                          style: TextStyle(
                            color: cfont,
                            fontSize: 16,
                            fontFamily: "Uniform",
                            fontWeight: FontWeight.bold,
                         ),
                      ),
                    ],
                  ),

                      SizedBox(height: 10,),
                  Divider(
                    color: cfont, 
                    ),

                  Row(
                    children: <Widget>[
                      Text("Overweight",
                      style: TextStyle(
                            color: cfont,
                            fontSize: 16,
                            fontFamily: "Uniform",
                            fontWeight: FontWeight.bold,
                         ),
                      ),
                       SizedBox(width: 130,),
                       Text("25–29.9",
                          style: TextStyle(
                            color: cfont,
                            fontSize: 16,
                            fontFamily: "Uniform",
                            fontWeight: FontWeight.bold,
                         ),
                      ),
                    ],
                  ),
                    SizedBox(height: 10,),
                  Divider(
                    color: cfont, 
                    ),

                  Row(
                    children: <Widget>[
                      Text("Obesity ",
                      style: TextStyle(
                            color: cfont,
                            fontSize: 16,
                            fontFamily: "Uniform",
                            fontWeight: FontWeight.bold,
                         ),
                      ),
                       SizedBox(width: 155,),
                       Text(">=30",
                          style: TextStyle(
                            color: cfont,
                            fontSize: 16,
                            fontFamily: "Uniform",
                            fontWeight: FontWeight.bold,
                         ),
                      ),
                    ],
                  ),

                      ]
                    )
                 )
                ]
             )
              )
            ]
          )
        )
      );
    }
    Route backtohome(){
      return PageRouteBuilder(
    pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              MainPage(),
          transitionDuration: Duration(seconds: 1),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(-1, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
        );
    }
  }