import 'package:get/route_manager.dart';

class Dictionary extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en": {
          "homeScreenTitle": "Home",
          "test": "TEST",
        },
        "ar": {
          "homeScreenTitle": "الرئيسية",
        },
      };
}
