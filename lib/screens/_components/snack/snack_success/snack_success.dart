import 'package:flutter/material.dart';

import '../../keys/globals.dart';

class SnackSuccess {
  SnackSuccess({
    required String title,
    required String message,
  }) {
    snackbarKey.currentState?.showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          side: BorderSide(width: 2, color: Colors.grey.shade200),
        ),
        backgroundColor: Colors.white,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
        content: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color:
                    Colors.green, // GlobalState<AppColors>().current.success,
                borderRadius: BorderRadius.circular(44),
              ),
              alignment: Alignment.center,
              child: const Icon(
                Icons.check, color: Colors.green,
                // IconsApp.success,
                // color: GlobalState<AppColors>().current.secondary,
                size: 30,
              ),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors
                        .green, // GlobalState<AppColors>().current.success,
                  ),
                ),
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors
                        .grey, // GlobalState<AppColors>().current.details,
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
