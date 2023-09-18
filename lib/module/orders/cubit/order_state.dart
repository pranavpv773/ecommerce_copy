part of 'order_cubit.dart';

enum GetOrderStatus {
  initial,
  loading,
  loaded,
  error,
}

class OrderState extends Equatable {
  final GetOrderStatus orderStatus;
  final List<OrderData> orderDataList;
  const OrderState({
    required this.orderStatus,
    required this.orderDataList,
  });

  factory OrderState.initial() {
    return const OrderState(
      orderStatus: GetOrderStatus.initial,
      orderDataList: [],
    );
  }

  OrderState copyWith({
    GetOrderStatus? orderStatus,
    List<OrderData>? orderDataList,
  }) {
    return OrderState(
      orderStatus: orderStatus ?? this.orderStatus,
      orderDataList: orderDataList ?? this.orderDataList,
    );
  }

  @override
  List<Object> get props {
    return [
      orderStatus,
      orderDataList,
    ];
  }
}
