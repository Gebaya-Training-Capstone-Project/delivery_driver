class DeliveryRequestEntity {
  final String customerName;
  final String restaurantName;
  final String orderId;
  final String dropOffLocation;
  final String pickupLocation;
  final int estimatedTimeMinutes;
  final double earnings;
  final String paymentMethod;

  const DeliveryRequestEntity({
    required this.customerName,
    required this.restaurantName,
    required this.orderId,
    required this.dropOffLocation,
    required this.pickupLocation,
    required this.estimatedTimeMinutes,
    required this.earnings,
    required this.paymentMethod,
  });
}
