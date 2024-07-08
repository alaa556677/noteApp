import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiRequest{
  getRequest(String url)async{
    try{
      var response = await http.get(Uri.parse(url));
      if(response.statusCode ==200){
        var responseBody = jsonDecode(response.body);
        return responseBody;
      }else{
        log("Error ${response.statusCode}");
      }
    }catch(e){
      log("Error catch $e");
    }
  }

  postRequest(String url, Map data)async{
    try{
      var response = await http.post(Uri.parse(url), body: data);
      if(response.statusCode ==200){
        var responseBody = jsonDecode(response.body);
        log("mohamed = ${responseBody["status"]}");
        return responseBody;
      }else{
        log("Error ${response.statusCode}");
      }
    }catch(e){
      log("Error catch $e");
    }
  }
}