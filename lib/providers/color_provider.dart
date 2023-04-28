import 'package:flutter/material.dart';

class ColorsProvider extends ChangeNotifier {
  Color nathColors = Colors.white;
  Color matildeColors = Colors.white;
  Color mairaColors = Colors.white;
  bool actifNath = false;
  bool actifMatilde = false;
  bool actifMaira = false;

  Color toggleColorNath() {
    nathColors = actifNath ? Colors.white : Colors.green;
    actifNath = actifNath ? false : true;
    notifyListeners();
    return nathColors;
  }

  Color toggleColorMatilde() {
    matildeColors = actifMatilde ? Colors.white : Colors.pinkAccent;
    actifMatilde = actifMatilde ? false : true;
    notifyListeners();
    return matildeColors;
  }

  Color toggleColorMaira() {
    mairaColors = actifMaira ? Colors.white : Colors.yellow;
    actifMaira = actifMaira ? false : true;
    print(actifMaira);
    notifyListeners();
    return mairaColors;
  }
}
