part of 'my_bag_cubit.dart';

enum CartStatus {
  initial,
  loading,
  loaded,
  error,
}

class MyBagState extends Equatable {
  final CartStatus cartStatus;
  final List<CartProduct> cartDataList;
  final MyBagModel myBagModel;
  const MyBagState({
    required this.cartStatus,
    required this.cartDataList,
    required this.myBagModel,
  });

  factory MyBagState.initial() {
    return MyBagState(
        cartStatus: CartStatus.initial,
        cartDataList: const [],
        myBagModel: MyBagModel());
  }

  MyBagState copyWith({
    CartStatus? cartStatus,
    List<CartProduct>? cartDataList,
    MyBagModel? myBagModel,
  }) {
    return MyBagState(
      cartStatus: cartStatus ?? this.cartStatus,
      myBagModel: myBagModel ?? this.myBagModel,
      cartDataList: cartDataList ?? this.cartDataList,
    );
  }

  @override
  List<Object> get props {
    return [
      cartStatus,
      cartDataList,
    ];
  }
}
