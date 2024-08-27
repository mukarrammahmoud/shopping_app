import 'package:flutter/material.dart';
import 'package:shoping_pp/config/root/app_root.dart';
import 'package:shoping_pp/data/model/prodects_model.dart';
import 'package:shoping_pp/view/home/home.dart';
import 'package:shoping_pp/view/show_details_prodect/search/search_page.dart';
import 'package:shoping_pp/view/show_details_prodect/show_details.dart';

class OnGenerateRoot {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoot.home:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case AppRoot.searchPage:
        return MaterialPageRoute(
          builder: (context) => const SearchPage(),
        );
  
    
      case AppRoot.showProdectContent:
        Prodects prodectsModel = routeSettings.arguments as Prodects;
        return MaterialPageRoute(
          builder: (context) => ShowDetailsNews(
            prodects: prodectsModel,
          ),
        );
    }
    return null;
  }
}
