import 'dart:convert';

import 'package:currencypro/core/utils/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../error/failures/failure.dart';
import '../error/failures/local_failure.dart';
import '../error/failures/server_failure.dart';
import '../network/network_status.dart';
import 'app_colors.dart';
import 'app_strings.dart';

class AppConstants {
  static const int slideAnimation = 350;
  static const int fadInAnimation = 350;

  static Future<bool> isConnected() async {
    final NetworkStatus networkStatus = sl();
    return await networkStatus.isConnected;
  }

  static void showErrorDialog(
    BuildContext context, {
    required String message,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            message,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  static void showToast({
    required String message,
    ToastGravity? gravity,
    Color? color,
    Color? textColor,
  }) {
    Fluttertoast.showToast(
      msg: message,
      gravity: gravity ?? ToastGravity.BOTTOM,
      backgroundColor: color ?? AppColors.primaryColor,
      textColor: textColor,
    );
  }

  static dynamic handleResponseAsJson(Response<dynamic> response) {
    final responseJson = jsonDecode(response.data.toString());
    return responseJson;
  }

  static String dateFormat(DateTime date) {
    String result = DateFormat('yyyy-MM-dd').format(date);
    return result;
  }

  static String currencyNumberPercentFormat(num number) {
    String formattedNumber;
    if (number >= 0) {
      formattedNumber = '+(${number.toStringAsFixed(2)})';
    } else {
      formattedNumber = '-(${number.abs().toStringAsFixed(2)})';
    }
    return formattedNumber;
  }

  static String getCurrencyNameBySymbol(String symbol) {
    switch (symbol) {
      case 'EGP':
        return 'Egyptian Pound';
      case 'USD':
        return 'US Dollar';
      case 'GBP':
        return 'British Pound';
      case 'JPY':
        return 'Japanese Yen';
      case 'CHF':
        return 'Swiss Franc';
      case 'KWD':
        return 'Kuwaiti Dinar';
      case 'EUR':
        return 'Euro';
      case 'SAR':
        return 'Saudi Riyal';
      case 'AED':
        return 'Emirati Dirham';
      case 'QAR':
        return 'Qatari Riyal';
      case 'SGD':
        return 'Singapore Dollar';
      case 'OMR':
        return 'Omani Rial';
      case 'CAD':
        return 'Canadian Dollar';
      case 'INR':
        return 'Indian Rupee';
      default:
        return 'Unknown Currency';
    }
  }

  static String mapFailureMsg(Failure failure) {
    if (failure is ServerFailure) {
      return failure.message ?? AppStrings.unexpectedError;
    } else if (failure is LocalFailure) {
      return AppStrings.localFailure;
    } else {
      return AppStrings.unexpectedError;
    }
  }

  static List<String> getCurrenciesCode() {
    return [
      'EGP',
      'USD',
      'GBP',
      'JPY',
      'CHF',
      'KWD',
      'SAR',
      'AED',
      'EUR',
      'QAR',
      'SGD',
      'OMR',
      'CAD',
      'INR',
    ];
  }
}
