import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:delivery_driver/features/DeliveryDriver/domain/entity/delivery_entity.dart';
import 'package:delivery_driver/features/DeliveryDriver/domain/usecase/get_delivery.dart';

part 'delivery_event.dart';
part 'delivery_state.dart';

class DeliveryBloc extends Bloc<DeliveryEvent, DeliveryState> {
  final GetDeliveryUseCase getDeliveryUseCase;

  DeliveryBloc(this.getDeliveryUseCase) : super(DeliveryInitial()) {
    on<FetchDelivery>((event, emit) async {
      emit(DeliveryLoading());

      try {
        final s = await getDeliveryUseCase.execute();
        emit(DeliveryLoaded(s));
      } catch (e) {
        emit(DeliveryError(e.toString()));
      }
    });
  }
}
