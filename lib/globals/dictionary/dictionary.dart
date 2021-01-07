import 'package:get/route_manager.dart';

class Dictionary extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en": {
          "homeScreenTitle": "Home",
          "dimensions": "Dimensions",
          "author": "Author",
          "site": "VISIT SITE",
          "back": "Back",
          "addToFavorite": "ADD",
          "removeFromFavorite": "REMOVE",
          "photoOf": "Photo of",
          "addedToFavorite": "Added to favourite!",
          "removedFromFavorite": "Removed from favourite!",
          "favouriteScreenTitle": "Favourite",
          "noFavourite": "No Favourites yet!",
        },
        "ar": {
          "homeScreenTitle": "الرئيسية",
          "dimensions": "الأبعاد",
          "author": "المصور",
          "site": "زيارة الصفحة",
          "back": "رجوع",
          "addToFavorite": "إضافة",
          "removeFromFavorite": "إزالة",
          "photoOf": "صورة ",
          "addedToFavorite": "تمت الإضافة",
          "removedFromFavorite": "تمت الإزالة",
          "favouriteScreenTitle": "المفضلة",
          "noFavourite": "لا يوجد مفضلات بعد!",
        },
      };
}
