
import '../../domain/entity/delivery_entity.dart';

class Delivery {
  final String customerName;
  final String customerNumber;
  final String restaurantName;
  final String restaurantNumber;
  final String orderId;
  final String dropOffLocation;
  final String pickupLocation;
  final int estimatedTimeMinutes;
  final String itemDescription;
  final String paymentMethod;

  Delivery({
    required this.customerName,
    required this.customerNumber,
    required this.restaurantName,
    required this.restaurantNumber,
    required this.orderId,
    required this.dropOffLocation,
    required this.pickupLocation,
    required this.estimatedTimeMinutes,
    required this.itemDescription,
    required this.paymentMethod,
  });

  factory Delivery.fromJson(Map<String, dynamic> json) {
    return Delivery(
      customerName: json['customerName'],
      customerNumber: json['customerNumber'],
      restaurantName: json['restaurantName'],
      restaurantNumber: json['restaurantNumber'],
      orderId: json['orderId'],
      dropOffLocation: json['dropOffLocation'],
      pickupLocation: json['pickupLocation'],
      estimatedTimeMinutes: json['estimatedTimeMinutes'],
      itemDescription: json['itemDescription'],
      paymentMethod: json['paymentMethod'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'customerName': customerName,
      'customerNumber': customerNumber,
      'restaurantName': restaurantName,
      'restaurantNumber': restaurantNumber,
      'orderId': orderId,
      'dropOffLocation': dropOffLocation,
      'pickupLocation': pickupLocation,
      'estimatedTimeMinutes': estimatedTimeMinutes,
      'itemDescription': itemDescription,
      'paymentMethod': paymentMethod,
    };
  }

  DeliveryEntity toEntity() {
    return DeliveryEntity(
      customerName: customerName,
      customerNumber: customerNumber,
      restaurantName: restaurantName,
      restaurantNumber: restaurantNumber,
      orderId: orderId,
      dropOffLocation: dropOffLocation,
      pickupLocation: pickupLocation,
      estimatedTimeMinutes: estimatedTimeMinutes,
      itemDescription: itemDescription,
      paymentMethod: paymentMethod,
    );
  }}

