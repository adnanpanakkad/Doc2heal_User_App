part of 'payment_bloc.dart';

abstract class PaymentEvent {}

class OpenPaymentEvent extends PaymentEvent {
  // final String mobileNumber;
  // final String propertyName;
  // final int total;
  // final int userId;
  // final int driverId;

  OpenPaymentEvent(
      // required this.mobileNumber,
      // required this.propertyName,
      // required this.total,
      // required this.driverId,
      // required this.userId{}
      );
}

class PaymentSuccessEvent extends PaymentEvent {}

class PaymentFailedEvent extends PaymentEvent {}
