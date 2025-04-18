class DeliveryEntity {
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

  const DeliveryEntity({
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
}
