import 'dart:typed_data';
import 'package:codeshastra/screens/global.dart';
import 'package:http/http.dart' as http;

class ApiConsumer {
  Future<Uint8List> removeImageBackgroundApi(String imagePath) async {
    //request
    var requestApi = http.MultipartRequest("POST", Uri.parse("https://api.remove.bg/v1.0/removebg"));

    //which image file to send - define
    requestApi.files.add(await http.MultipartFile.fromPath("image_file", imagePath));

    //api header - communicate with help of apiKey
    requestApi.headers.addAll({"X-API-Key": apiKeyRemoveImageBackground});

    //send request and receive response
    final responseFromApi = await requestApi.send();

    if (responseFromApi.statusCode == 200) {
      http.Response getTransparentImageFromResponse = await http.Response.fromStream(responseFromApi);
      return getTransparentImageFromResponse.bodyBytes;
    } else {
      throw Exception("Error Occured:: " + responseFromApi.statusCode.toString());
    }
  }
}
