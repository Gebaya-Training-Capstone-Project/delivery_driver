part of 'delivery_request_bloc.dart';

abstract class DeliveryRequestEvent extends Equatable {
  const DeliveryRequestEvent();

  @override
  List<Object> get props => [];
}

class FetchDeliveryRequests extends DeliveryRequestEvent {}
