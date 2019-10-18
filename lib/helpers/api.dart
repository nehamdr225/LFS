import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../state/store.dart';

const String URL = "https://lfscards.herokuapp.com";
String method = "GET";

logout() async {
  try {
    await delKeyVal("token");
    return "success";
  } catch (err) {
    return "failed";
  }
}

login(String email, String password) async {
  try {
    var response = await fetch(uri: '$URL/users/login', method: "POST", body: {
      'email': email,
      'password': password,
    });
    if (response['error'] != null) {
      return {"error": response['error']};
    }
    savekeyVal('token', response['token']);
    return {"token": response['token']};
  } catch (err) {
    return {"error": err};
  }
}

verifyCard(String cardId) async {
  try {
    var response = await fetch(uri: '$URL/users/card/verify/$cardId');
    return response;
  } catch (err) {
    return {"error": err};
  }
}

signup(String email, String password, String name, String cardId) async {
  try {
    var response = await fetch(uri: '$URL/users/signup', method: "POST", body: {
      'email': email,
      'password': password,
      'name': name,
      'card_id': cardId
    });
    return response;
  } catch (err) {
    return {'error': err};
  }
}

getOffers({result = 10, page = 1}) async {
  try {
    var response = await fetch(
      uri: '$URL/cards?result=$result&page=$page',
    );
    return response['products'];
  } catch (err) {
    return err;
  }
}

getOffersByCategory({category = "Hotels", result = 10, page = 1}) async {
  fetch(
    uri: '$URL/offers/category/$category?result=$result&page=$page',
  ).then((response) {
    return response['products'];
  });
}

getUser(token) async {
  if (headers['X-Access-Token'] == null) updateAccessToken(token);
  try {
    var response = await fetch(uri: "$URL/user");
    if (response['message'] != null) return "token expired";
    return response['result'];
  } catch (err) {
    return err;
  }
}

getMerchants() async {
  try {
    return await fetch(uri: "$URL/merchants");
  } catch (err) {
    return {"error": "Error ocurred"};
  }
}

Map<String, String> headers = {
  HttpHeaders.contentTypeHeader: 'application/json',
};

fetch({uri, method: "GET", body: ''}) async {
  try {
    print(uri);
    switch (method) {
      case "GET":
        var response = await http.get(uri, headers: headers);
        return json.decode(response.body);
      case "POST":
        var response =
            await http.post(uri, headers: headers, body: json.encode(body));
        if (response.statusCode <= 400)
          return json.decode(response.body);
        else
          return {"error": "A problem occured while registering User"};
        break;
      case "PUT":
        var response =
            await http.put(uri, headers: headers, body: json.encode(body));
        return json.decode(response.body);
      default:
        var response = await http.get(uri, headers: headers);
        return json.decode(response.body);
    }
  } catch (err) {
    throw err;
  }
}

updateAccessToken(token) async {
  try {
    headers['X-Access-Token'] = token;
  } catch (err) {
    throw err;
  }
}
