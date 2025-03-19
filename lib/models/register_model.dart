import 'package:flutter/cupertino.dart';
class RegisterModel {
  String title;
  String iconPath;
  String weight;
  String points;
  String hours;
  Color boxColor;
  bool boxIsSelected;

  RegisterModel({
    required this.title,
    required this.iconPath,
    required this.weight,
    required this.points,
    required this.hours,
    required this.boxColor,
    required this.boxIsSelected
    
    
  });

  
  static List < RegisterModel > getRegister() {
    List <RegisterModel > register = [];

    register.add(
      RegisterModel(
        title: 'Plastic collection',
        iconPath: 'assets/icons/green-salad-svgrepo-com.svg',
        weight: '3.5kg',
        points: '+ 07 points',
        hours: '2 hours ago',
        boxColor: Color(0xffC58BF2),
        boxIsSelected: false,
        
      )
    );

     register.add(
      RegisterModel(
        title: 'Plastic collection',
        iconPath: 'assets/icons/green-salad-svgrepo-com.svg',
        weight: '3.5kg',
        points: '+ 07 points',
        hours: '2 hours ago',
        boxColor: Color(0xffC58BF2),
        boxIsSelected: false,
        
      )
    );

   
    return register;
  }
}