import 'package:http/http.dart' as http;
import 'package:shoping_pp/constant/urls.dart';
import 'package:shoping_pp/data/model/result_api.dart';

class DataProdectsApi {
  getDataprodects() async {
    try {
      var url = Uri.parse(urlProdects);

      var respone = await http.get(
        url,
      );
      print(url);
      if (respone.statusCode == 200) {
        return ResultApi(isDone: true, resultOrError: respone.body);
      } else {
        return ResultApi(isDone: false, resultOrError: 'Some Error In Server');
      }
    } catch (e) {
      return ResultApi(isDone: false, resultOrError: "Some Error");
    }
  }
  getDataOneprodect( int id) async {
    try {
      var url = Uri.parse("{$urlProdects/$id}");

      var respone = await http.get(
        url,
      );
     
      if (respone.statusCode == 200) {
        return ResultApi(isDone: true, resultOrError: respone.body);
      } else {
        return ResultApi(isDone: false, resultOrError: 'Some Error In Server');
      }
    } catch (e) {
      return ResultApi(isDone: false, resultOrError: "Some Error");
    }
  }
  getsearch( String name) async {
    try {
      var url = Uri.parse("{$urlProdects/$name}");

      var respone = await http.get(
        url,
      );
     
      if (respone.statusCode == 200) {
        return ResultApi(isDone: true, resultOrError: respone.body);
      } else {
        return ResultApi(isDone: false, resultOrError: 'Some Error In Server');
      }
    } catch (e) {
      return ResultApi(isDone: false, resultOrError: "Some Error");
    }
  }
}
