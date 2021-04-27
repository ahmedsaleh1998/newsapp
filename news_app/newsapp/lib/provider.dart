import 'package:flutter/cupertino.dart';

// class myprovider extends ChangeNotifier {
//   String categoryname;
//   String language;
//   changecategoryname(String cname) {
//     categoryname = cname;
//     notifyListeners();
//   }

//   changecatelanguage(String lang) {
//     language = lang;
//     notifyListeners();
//   }
// }
class Newsprovider extends InheritedWidget {
  String categoryname = 'sports';
  final Widget child;
  Newsprovider({this.categoryname, this.child});
  static Newsprovider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Newsprovider>();
  }

  @override
  bool updateShouldNotify(Newsprovider oldWidget) {
    return oldWidget.categoryname != categoryname;
  }
}
