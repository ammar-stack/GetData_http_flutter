import 'package:getdata_http/models/get_data_model.dart';
import 'package:http/http.dart' as http;

class GetApiService {
  Future<List<CommentModel>?> getCommentsModel() async{
    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    if(response.statusCode == 200){
      var json = response.body;
      return commentModelFromJson(json);
    }
    return null;
  }
}