   import 'package:flutter/material.dart';

double getResponsiveFontSize(BuildContext context, {required baseFontSize}){
     double scaleFactor = getScaleFactor(context);
     double responsiveFontSize = scaleFactor * baseFontSize;

     double lowerLimit = baseFontSize * .8; 
     double upperLimit = baseFontSize * 1.2; 

     return responsiveFontSize.clamp(lowerLimit,upperLimit);
   }

   double getScaleFactor(BuildContext context){
     double screenWidth = MediaQuery.sizeOf(context).width;
     if(screenWidth < 600) {
       return screenWidth /400;
     } else if(screenWidth < 900) {
         return screenWidth /700;
     } else {
         return screenWidth /1000;
     }
     
   }