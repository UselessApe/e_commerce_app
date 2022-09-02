import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class PaymentHandler {
  final String? payIntentId;
  final bool isError;
  final String message;

  PaymentHandler({
    this.payIntentId,
    required this.isError,
    required this.message,
  });
}

class PaymentService {
  PaymentService();
  Future<PaymentHandler> initPaymentSheet(User user, double totalAmount) async {
    try {
      final response = await http.post(
          Uri.parse(
              'https://us-central1-useless-ape-e-commerce-app.cloudfunctions.net/stripePaymentIntentRequest'),
          body: {
            'email': user.email,
            'amount': (totalAmount * 100).toString(),
          });

      final jsonResponse = jsonDecode(response.body);

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: jsonResponse['paymentIntent'],
          merchantDisplayName: 'Flutter Stripe Store Demo',
          customerId: jsonResponse['customer'],
          customerEphemeralKeySecret: jsonResponse['ephemeralKey'],
          style: ThemeMode.light,
        ),
      );

      await Stripe.instance.presentPaymentSheet();
      return PaymentHandler(
          isError: false,
          message: "Success",
          payIntentId:
              jsonResponse['paymentIntent']); //TODO use cloud function instead

    } catch (e) {
      if (e is StripeException) {
        return PaymentHandler(
            isError: true,
            message: 'Error from Stripe: ${e.error.localizedMessage}');
      } else {
        return PaymentHandler(isError: true, message: 'Error: ${e}');
      }
    }
  }
}
