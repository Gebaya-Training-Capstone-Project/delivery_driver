import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:delivery_driver/features/DeliveryDriver/domain/entity/delivery_request_entity.dart';
import 'package:delivery_driver/features/DeliveryDriver/domain/usecase/get_delivery_requests.dart';

part 'delivery_request_event.dart';
part 'delivery_request_state.dart';

class DeliveryRequestBloc extends Bloc<DeliveryRequestEvent, DeliveryRequestState> {
  final GetDeliveryRequestsUseCase getDeliveryRequestsUseCase;

  DeliveryRequestBloc(this.getDeliveryRequestsUseCase) : super(DeliveryRequestInitial()) {
    on<FetchDeliveryRequests>((event, emit) async {
      emit(DeliveryRequestLoading());

      try {
        final requests = await getDeliveryRequestsUseCase.execute();
        emit(DeliveryRequestLoaded(requests));
      } catch (e) {
        emit(DeliveryRequestError(e.toString()));
      }
    });
  }
}
