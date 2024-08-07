import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:doc2heal/presentation/view/bottombar_screens.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<void> archivePopup(BuildContext context) async {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.success,
    animType: AnimType.bottomSlide,
    title: 'Payment succsefull!',
    btnOkText: 'Okay',
    btnOkOnPress: () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => BottombarScreens()));
    },
  ).show();
}

class RazorPay {
  final Razorpay _razorpay = Razorpay();

  void razorPay(BuildContext context, String amount) {
    int amountInPaise = int.parse(amount) * 100;

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
        (response) => _handlePaymentSuccess(context, response));
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
        (response) => _handlePaymentError(context, response));

    var options = {
      'key': 'rzp_test_l4AJq5EzdjhjvL',
      'amount': amountInPaise,
      'name': 'Quick Book',
      'description': "",
      'prefill': {'contact': "9656650450", 'email': 'adnanadnan98271@gmail.com'}
    };

    _razorpay.open(options);
  }

  void _handlePaymentSuccess(
      BuildContext context, PaymentSuccessResponse response) async {
    await archivePopup(context);
  }

  void _handlePaymentError(
      BuildContext context, PaymentFailureResponse response) {
    Fluttertoast.showToast(
      msg: "Payment Failed: ${response.code}",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 4,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
