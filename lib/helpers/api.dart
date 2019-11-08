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

login(String email, String password, bool remember) async {
  try {
    var response = await fetch(uri: '$URL/users/login', method: "POST", body: {
      'email': email,
      'password': password,
    });
    if (response['error'] != null) {
      return {"error": response['error']};
    }
    if (remember == true) savekeyVal('token', response['token']);
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

activationCodeResend(String userId) async {
  try {
    final response = await fetch(uri: '$URL/users/resend/activation/$userId');
    print(response);
    return response;
  } catch (err) {
    return {"error": err};
  }
}

activateUser(code, id) async {
  try {
    final response = await fetch(uri: '$URL/users/verify/$id/by/$code');
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
    var response = await fetch(uri: "$URL/users");
    if (response['message'] != null) return "token expired";
    return response['result'];
  } catch (err) {
    return {"nerror": "Network error"};
  }
}

getMerchants(page) async {
  try {
    return await fetch(uri: "$URL/merchants/$page");
  } catch (err) {
    return {"error": "Error ocurred"};
  }
}

setFavourites(id, token) async {
  try {
    if (headers['X-Access-Token'] == null) updateAccessToken(token);
    return await fetch(
        uri: "$URL/users/update/favourites", method: "PUT", body: {'id': id});
  } catch (err) {
    return {"error": "Error ocurred"};
  }
}

deleteFavourites(id, token) async {
  try {
    if (headers['X-Access-Token'] == null) updateAccessToken(token);
    return await fetch(
        uri: "$URL/users/remove/favourites/$id", method: "DELETE");
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
      case "DELETE":
        var response = await http.delete(uri, headers: headers);
        return json.decode(response.body);
        break;
      default:
        var response = await http.get(uri, headers: headers);
        return json.decode(response.body);
    }
  } catch (err) {
    return {'error': err};
  }
}

updateAccessToken(token) async {
  try {
    headers['X-Access-Token'] = token;
  } catch (err) {
    throw err;
  }
}
