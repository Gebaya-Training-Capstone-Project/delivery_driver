part of 'delivery_request_bloc.dart';

abstract class DeliveryRequestState extends Equatable {
  const DeliveryRequestState();

  @override
  List<Object> get props => [];
}

class DeliveryRequestInitial extends DeliveryRequestState {}

class DeliveryRequestLoading extends DeliveryRequestState {}

class DeliveryRequestLoaded extends DeliveryRequestState {
  final List<DeliveryRequestEntity> deliveryRequests;

  const DeliveryRequestLoaded(this.deliveryRequests);

  @override
  List<Object> get props => [deliveryRequests];
}

class DeliveryRequestError extends DeliveryRequestState {
  final String message;

  const DeliveryRequestError(this.message);

  @override
  List<Object> get props => [message];
}
