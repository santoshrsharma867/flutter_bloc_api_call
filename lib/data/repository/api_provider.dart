import 'dart:convert';
import 'dart:io';

import 'package:api_bloc/error/app_exception.dart';

import 'package:http/http.dart' as http;

class ApiProvider {
  final String _baseUrl = "https://reqres.in/api/users";

  // Future<UserModel> getJoke() async {
  //   final response = await http.get(Uri.parse(_baseUrl));
  //   var dataResponse = jsonDecode(response.body.toString());
  //   print(dataResponse);
  //   if (response.statusCode == 200) {
  //     return UserModel.fromJson(dataResponse);
  //   } else {
  //     throw Exception("Failed to load joke");
  //   }
  // }

  Future<dynamic> getJoke() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      return dynamicResponProcess(response);
    } on SocketException {}
  }
}

dynamicResponProcess(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var decode = jsonDecode(response.body.toString());
      return decode;

    case 404:
      throw BadRequestException('Page not Found');
  }
}


// Future<void> showMyDialog() async {
//   return showDialog<void>(
//     context: context,
//     barrierDismissible: false, // user must tap button!
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: const Text('AlertDialog Title'),
//         content: SingleChildScrollView(
//           child: ListBody(
//             children: const <Widget>[
//               Text('This is a demo alert dialog.'),
//               Text('Would you like to approve of this message?'),
//             ],
//           ),
//         ),
//         actions: <Widget>[
//           TextButton(
//             child: const Text('Approve'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       );
//     },
//   );
// }
 