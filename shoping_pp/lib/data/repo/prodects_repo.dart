import 'dart:convert';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shoping_pp/data/api/prodect_api.dart';
import 'package:shoping_pp/data/model/prodects_model.dart';
import 'package:shoping_pp/data/model/result_api.dart';

class ProdectsApiRepo {
  ProdectsApiRepo({required this.dataProdectsApi});
  final DataProdectsApi dataProdectsApi;
  Future<ResultApi> getProdects() async {
    bool result = await InternetConnectionChecker().hasConnection;

    if (result == true) {
      ResultApi resultApi = await dataProdectsApi.getDataprodects();
      if (resultApi.isDone) {
        List data = jsonDecode(resultApi.resultOrError);
        List dataJsonList = List.from(data);
        List<Prodects> listprodects = [];
        for (var element in dataJsonList) {
          listprodects.add(Prodects.fromJson(element));
        }
        return ResultApi(isDone: true, resultOrError: listprodects);
      } else {
        return resultApi;
      }
    } else {
      return ResultApi(isDone: false, resultOrError: "No Internet Access");
    }
  }

  Future<ResultApi> getOnProdect(
    int id,
  ) async {
    bool result = await InternetConnectionChecker().hasConnection;

    if (result == true) {
      ResultApi resultApi = await dataProdectsApi.getDataOneprodect(id);
      if (resultApi.isDone) {
        Map<String, dynamic> data = jsonDecode(resultApi.resultOrError);

        List<Prodects> listprodects = [];

        Prodects.fromJson(data);

        return ResultApi(isDone: true, resultOrError: listprodects);
      } else {
        return resultApi;
      }
    } else {
      return ResultApi(isDone: false, resultOrError: "No Internet Access");
    }
  }

  Future<ResultApi> getNewsSearch(
    String name,
  ) async {
    bool result = await InternetConnectionChecker().hasConnection;

    if (result == true) {
      ResultApi resultApi = await dataProdectsApi.getsearch(name);
      if (resultApi.isDone) {
        List data = jsonDecode(resultApi.resultOrError);
        List dataJsonList = List.from(data);
        List<Prodects> listprodects = [];
        for (var element in dataJsonList) {
          listprodects.add(Prodects.fromJson(element));
        }

        return ResultApi(isDone: true, resultOrError: listprodects);
      } else {
        return resultApi;
      }
    } else {
      return ResultApi(isDone: false, resultOrError: "No Internet Access");
    }
  }

//   Future<ResultApi> getNewsSearch({
//     required String searchText,
//   }) async {
//     bool result = await InternetConnectionChecker().hasConnection;

//     // final List<ConnectivityResult> connectivityResult =
//     //     await (Connectivity().checkConnectivity());
//     if (result == true) {
//       ResultApi resultApi = await newsApi.getNewsSearch(searchText: searchText);
//       if (resultApi.isDone) {
//         Map<String, dynamic> data = jsonDecode(resultApi.resultOrError);
//         List dataJsonList = List.from(data['articles']);
//         List<NewsModel> listNews = [];
//         for (var element in dataJsonList) {
//           listNews.add(NewsModel.fromJson(element));
//         }

//         return ResultApi(isDone: true, resultOrError: listNews);
//       } else {
//         return resultApi;
//       }
//     } else {
//       return ResultApi(isDone: false, resultOrError: "No Internet Access");
//     }
//   }
}
