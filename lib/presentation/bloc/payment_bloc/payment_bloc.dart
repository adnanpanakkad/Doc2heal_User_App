import 'package:doc2heal/razorpay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {

  PaymentBloc() : super(PaymentInitial()) {
    on<OpenPaymentEvent>(_paymentEvent);
    on<PaymentSuccessEvent>(_onPaymentSuccess);
    on<PaymentFailedEvent>(_onPaymentFailed);
  }
  final _razorpay = Razorpay();
  _paymentEvent(OpenPaymentEvent event, Emitter<PaymentState> emit) {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);

    // int amountInPaise = int.parse(amount) * 100;

    var options = {
      'key': 'rzp_test_l4AJq5EzdjhjvL',
      'amount': 'amountInPaise',
      'name': 'Quick Book',
      'description': "",
      'prefill': {'contact': "9656650450", 'email': 'adnanadnan98271@gmail.com'}
    };

    _razorpay.open(options);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    add(PaymentSuccessEvent());
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    add(PaymentFailedEvent());
  }

  _onPaymentSuccess(
      PaymentSuccessEvent event, Emitter<PaymentState> emit) async {
    emit(PaymentSuccessState());
  }

  _onPaymentFailed(PaymentFailedEvent event, Emitter<PaymentState> emit) async {
    emit(PaymentFailedState());
  }
}
