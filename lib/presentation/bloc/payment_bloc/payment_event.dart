part of 'payment_bloc.dart';

abstract class PaymentEvent {}

class OpenPaymentEvent extends PaymentEvent {}

class PaymentSuccessEvent extends PaymentEvent {}

class PaymentFailedEvent extends PaymentEvent {}
