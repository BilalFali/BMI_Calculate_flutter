


import 'dart:ui';

import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:dropdownfield/dropdownfield.dart';

import 'package:flutter/material.dart';

import 'Resultat.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
   // Map<String, dynamic> formData;
   String newval;
     
  List<String> sex = [
    'Male',
    'Femmale',
  ];
final  controller_weight = TextEditingController ();
final controller_height = TextEditingController ();
final controller_age = TextEditingController ();
final controller_gender = TextEditingController ();

bool validate_sex =false;
bool validate_weight =false;
bool validate_height =false;
bool validate_age =false;


final formKey = GlobalKey<FormState>();

String myActivate;
String myActivateres;

  @override
  void initState() {
    super.initState();
    myActivate = '';
    myActivateres  = '';
  }
  void saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        myActivateres = myActivate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromRGBO(245, 245, 245, 1),Color.fromRGBO(253, 253, 253, 1)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  ),

              ),

          child:Form(
            key: formKey,
            child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              
              Padding(
                padding: EdgeInsets.all(30),
             child:ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 35, 20, 0),
                     child:Text("CALCULATE YOUR BMI ",
                         style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontFamily: "Uniform",
                            fontWeight: FontWeight.bold,
                         ),
                         ) 
 
                  ),
                    Padding(
                  padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
                  child:
                    Column(
                      children: <Widget>[
               DropDownField(
                 labelText: "Gender",
                 labelStyle:TextStyle(
                            fontSize: 14,
                             fontFamily: "Uniform",
                            color: Color.fromRGBO(106, 106, 121, 1),
                          ) ,
                  controller: controller_gender,
                  items: sex,
           
                     ),
                   SizedBox(height: 15,),
                        TextFormField(
                          validator: (value){
                                 if (value.isEmpty) {
                                  return 'Please enter Weight';
                               }
                                return null;
                                },
                              
                          controller: controller_weight,
                           keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Enter Your Weight",
                          labelStyle:TextStyle(
                            fontSize: 14,
                             fontFamily: "Uniform",
                            color: Color.fromRGBO(106, 106, 121, 1),
                          ) ,
                          suffixText: "Kg",
                          suffixStyle: TextStyle(
                            fontSize: 12,
                            fontFamily: "Uniform",
                            color: Color.fromRGBO(193, 193, 193, 1),
                          ),
                          errorText: validate_weight ? "Please Entre Your Weight " : null ,
                          filled: true,

                        ),
                   ),
                   SizedBox(height: 15,),
                          TextFormField(
                            
                             validator: (value){
                                 if (value.isEmpty) {
                                  return 'Please enter Height';
                               }
                                return null;
                                },
                            controller: controller_height,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          filled: true,
                          labelText: "Enter Your Height",
                          labelStyle:TextStyle(
                            fontSize: 14,
                            fontFamily: "Uniform",
                            color: Color.fromRGBO(106, 106, 121, 1),
                          ) ,
                          suffixText: "cm",
                          suffixStyle: TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(193, 193, 193, 1),
                          ),
                          errorText: validate_height ? "Please Entre Your Height " : null ,
                        ),
                   ),
                   SizedBox(height: 15,),
                 
                  TextFormField(
                             validator: (value){
                                 if (value.isEmpty) {
                                  return 'Please enter Age';
                               }
                                return null;
                                },
                   controller: controller_age,
                       keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          filled: true,
                          labelText: "Enter Your Age",
                          labelStyle:TextStyle(
                            fontSize: 14,
                            fontFamily: "Uniform",
                            color: Color.fromRGBO(106, 106, 121, 1),
                          ) ,
                          suffixText: "cm",
                          suffixStyle: TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(193, 193, 193, 1),

                          ),
                          errorText: validate_age ? "Please Entre Your Age " : null ,
                          
                        ),
                   ),

                   Padding(
                     padding: EdgeInsets.fromLTRB(10, 32, 10, 10),
                     child:
                     Container(
                       width: MediaQuery.of(context).size.width-30,
                       height: 60,
                       decoration: BoxDecoration(
                          gradient: LinearGradient(
                  colors: [Color.fromRGBO(112, 112, 212, 1),Color.fromRGBO(144, 144, 215, 1)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(3),
                  boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(193, 193, 193, 1),
                        blurRadius: 5.0, // has the effect of softening the shadow
                        spreadRadius: 2.0, // has the effect of extending the shadow
                        offset: Offset(
                          3.0, // horizontal, move right 10
                          3.0, // vertical, move down 10
                        ),
                      )
                    ]
                  
                       ),
                     child: FlatButton
                     (
                       onPressed: ()
                       {  
                           setState(() {
                                
                              
                                      if (formKey.currentState.validate()) {
                                         
                                double val = calculeBmi(double.parse(controller_weight.text), double.parse(controller_height.text));
                         
                               Navigator.push(
                                   context, MaterialPageRoute(builder: (context) 
                                           =>ResultatPage(bmi_val:val,note:note(val),

                                         
                                
                              
                              )
                              ),);
                                           
                                           }
                               
                              
                               });
                            
                         
                      
                          
                         
                       },
                      child: Text("CALCULATE",
                       style: TextStyle(
                      color: Color.fromRGBO(251, 251, 251, 1),
                            fontSize: 14,
                           fontFamily: "Uniform",
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,


                       ),
                      )
                      ),
                     ),
                     
                     )
           

                   
                   
                  
                      ],

                    ) 
                 
                    ),
              ],
            )
        
    
            )

            ],
          ),  
          ),
        ),
        
      
      
    );
  }

  double calculeBmi(double w,double h){
       double res;
       double h2 = h/100;
           res = (w/(h2*h2));
    return res;
  }
  String note(double  bmiValue){

     if (bmiValue <= 18.5) {
        return "Underweight";
    }
         
    if (bmiValue >18.5 && bmiValue <=24.9) {
        return "Normal weight";
    }
    if (bmiValue >=25 && bmiValue <=29.9) {
        return "Overweight";
    }
    if (bmiValue >=30) {
        return "Obesity";
    }
   return "";
  }
}

