
part of 'payment_bloc.dart';

abstract class PaymentState {}

final class PaymentInitial extends PaymentState {}

final class PaymentSuccessState extends PaymentState {}

final class PaymentFailedState extends PaymentState {}