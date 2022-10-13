
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {
  //show error dialog
  static void showErroDialog(
      {String title = 'Something went wrong!!',
      String? description = 'Something went wrong'}) {

        
    // Get.dialog(
    //   Dialog(
    //     child: Padding(
    //       padding: const EdgeInsets.all(16.0),
    //       child: Column(
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           Text(title),
    //           SizedBox(
    //             height: 21,
    //           ),
    //           Text(
    //             description ?? '',
    //             style: Get.textTheme.headline6,
    //           ),
    //           SizedBox(
    //             height: 17,
    //           ),
    //           ElevatedButton(
    //             onPressed: () {
    //               if (Get.isDialogOpen!) Get.back();
    //             },
    //             child: Text('Okay'),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  
  
  }

  //show toast
  //show snack bar
  //show loading
  static void showLoading([String? message]) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 8),
              Text(message ?? 'Loading...'),
            ],
          ),
        ),
      ),
    );
  }

  //hide loading
  static void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }
}