
import '../../domain/entity/delivery_request_entity.dart';

class DeliveryRequest {
  final String customerName;
  final String restaurantName;
  final String orderId;
  final String dropOffLocation;
  final String pickupLocation;
  final int estimatedTimeMinutes;
  final double earnings;
  final String paymentMethod;

  DeliveryRequest({
    required this.customerName,
    required this.restaurantName,
    required this.orderId,
    required this.dropOffLocation,
    required this.pickupLocation,
    required this.estimatedTimeMinutes,
    required this.earnings,
    required this.paymentMethod,
  });

  factory DeliveryRequest.fromJson(Map<String, dynamic> json) {
    return DeliveryRequest(
      customerName: json['customerName'],
      restaurantName: json['restaurantName'],
      orderId: json['orderId'],
      dropOffLocation: json['dropOffLocation'],
      pickupLocation: json['pickupLocation'],
      estimatedTimeMinutes: json['estimatedTimeMinutes'],
      earnings: json['earnings'].toDouble(),
      paymentMethod: json['paymentMethod'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customerName': customerName,
      'restaurantName': restaurantName,
      'orderId': orderId,
      'dropOffLocation': dropOffLocation,
      'pickupLocation': pickupLocation,
      'estimatedTimeMinutes': estimatedTimeMinutes,
      'earnings': earnings,
      'paymentMethod': paymentMethod,
    };
  }
  DeliveryRequestEntity toEntity() {
    return DeliveryRequestEntity(
      customerName: customerName,
      restaurantName: restaurantName,
      orderId: orderId,
      dropOffLocation: dropOffLocation,
      pickupLocation: pickupLocation,
      estimatedTimeMinutes: estimatedTimeMinutes,
      earnings: earnings,
      paymentMethod: paymentMethod,
    );
  }
}
