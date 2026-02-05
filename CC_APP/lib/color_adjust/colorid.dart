import 'package:flutter/material.dart';

ColorIdentify(Color color) {
  @override
  HSLColor Hcolor = HSLColor.fromColor(color);
  var hue = Hcolor.hue;
  var sat = Hcolor.saturation;
  var light = Hcolor.lightness;
  var thecolor = "";
  if (light <= 0.11) {
    thecolor = "黑色";
  } else if (light == 1) {
    thecolor = "白色";
  }
  //紅區
  else if (hue <= 60 && sat > 1 / 8 && light > 1 / 8 ||
      hue > 310 && sat > 1 / 8 && light > 1 / 8) {
    //紅
    if (hue < 18 || hue >= 344) {
      if (hue > 12 && sat <= 8 / 10) {
        if (sat > 5 / 10 && light >= 1 / 2) {
          thecolor = "橙色";
        } else {
          thecolor = "棕色";
        }
      }
      if (hue >= 10 && sat >= 6 / 10 && light < 8 / 10 && light > 6 / 10) {
        thecolor = "橙色";
      } else {
        thecolor = "紅色";
      }
    }
    //橙
    else if (hue < 50 && sat > 7 / 10 && light >= 3 / 10) {
      thecolor = "橙色";
      if (hue > 40) {
        if (light > 7 / 10) {
          thecolor = "黃色";
        } else {
          thecolor = "黃橙色";
        }
      }
    }
    //棕
    else if (hue < 50) {
      if (sat < 7 / 10&&sat >4/10&&light<=5/10) {
        thecolor = "深黃橙色";
      } else {
        thecolor = "棕色";
      }
    }
    //黃
    else if (hue <= 60 && sat > 4 / 5 && light >= 1 / 2) {
      thecolor = "黃色";
    } else if (hue <= 60) {
      thecolor = "黃綠色";
    }
    //桃紅
    else if (hue < 345 && hue > 310) {
      if (light > 5 / 10 && sat > 8 / 10 ||
          light > 45 / 100 && sat > 9 / 10 ||
          light > 30 / 100 && sat < 8 / 10 && sat >=5/10||
          light >= 7 / 10 && sat>=5/10) {
        thecolor = "桃紅色";
      } else if (light < 30 / 100 && sat <= 4 / 10 && hue >= 340) {
        thecolor = "紅棕色";
      } else {
        thecolor = "紫色";
      }
    } else {
      thecolor = "紅區未知";
    }
  }
  //綠區
  else if (hue <= 180 && sat > 1 / 8 && light > 1 / 8) {
    if (hue < 75) {
      thecolor = "黃綠色";
    } else if (hue < 150) {
      thecolor = "綠色";
    } else if (hue < 170) {
      thecolor = "藍綠色";
    } else if (hue <= 180) {
      thecolor = "青色";
    } else {
      thecolor = "綠區未知";
    }
  }
  //藍區
  else if (hue <= 310 && sat > 1 / 8 && light > 1 / 8) {
    if (hue < 220) {
      thecolor = "藍色";
    } else if (hue < 260 && light < 3 / 5) {
      thecolor = "靛色";
    } else if (hue < 270) {
      thecolor = "藍紫色";
    } else if (hue < 300 || hue < 260 && light > 3 / 5) {
      thecolor = "紫色";
    } else if (hue <= 310) {
      if (light >= 5 / 10 && sat > 6 / 10 || light > 45 / 100 && sat > 9 / 10||light >= 7 / 10 && sat>=5/10) {
        thecolor = "桃紅色";
      }
      else{
        thecolor = "紫色";
      }
    } else {
      thecolor = "藍區未知";
    }
  }

  //灰
  else {
    thecolor = "灰色";
  }
  if (light > 6 / 10 && thecolor != "白色") {
    thecolor = "淺" + thecolor;
  } else if (light < 4 / 10 && thecolor != "黑色") {
    thecolor = "深" + thecolor;
  }
  //名字更正
  if (thecolor == "淺紅色" || thecolor == "淺桃紅色") {
    thecolor = "粉色";
  }
  if (thecolor == "淺藍綠色") {
    thecolor = "淺藍色";
  }
  if (thecolor == "深青色") {
    thecolor = "深綠色";
  }
  if (thecolor == "淺青色") {
    thecolor = "淺藍色";
  }
  if (thecolor == "深桃紅色") {
    thecolor = "紫紅色";
  }
  if (thecolor == "深紅棕色") {
    thecolor = "紅棕色";
  }
  if (thecolor == "淺黃橙色") {
    thecolor = "黃橙色";
  }
  if (thecolor == "深黃橙色"||thecolor == "深深黃橙色") {
    thecolor = "土黃色";
  }

  return thecolor;
}
