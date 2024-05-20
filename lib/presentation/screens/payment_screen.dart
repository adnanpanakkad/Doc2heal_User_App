import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPay {
  final Razorpay _razorpay = Razorpay();
  razorPay(String amount) {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);

    var options = {
      'key': 'rzp_test_l4AJq5EzdjhjvL',
      'amount': amount,
      'name': 'Quick Book',
      'description': "",
      'prefill': {'contact': "9656650450", 'email': 'adnanadnan98271@gmail.com'}
    };

    _razorpay.open(options);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    Fluttertoast.showToast(
        msg: "Success Payment :${response.paymentId}", timeInSecForIosWeb: 4);
  }

  void _handlePaymentError(PaymentFailureResponse response) async {
    Fluttertoast.showToast(
        msg: "Error Here :${response.code}", timeInSecForIosWeb: 4);
  }
}
