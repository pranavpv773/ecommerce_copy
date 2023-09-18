part of 'shop_cubit.dart';

enum CategoryStatus {
  initial,
  loading,
  loaded,
  error,
}

class ShopState extends Equatable {
  final CategoryStatus categoryStatus;
  final List<Category> categoryDataList;
  const ShopState({
    required this.categoryStatus,
    required this.categoryDataList,
  });

  factory ShopState.initial() {
    return const ShopState(
      categoryStatus: CategoryStatus.initial,
      categoryDataList: [],
    );
  }

  ShopState copyWith({
    CategoryStatus? categoryStatus,
    List<Category>? categoryDataList,
  }) {
    return ShopState(
      categoryStatus: categoryStatus ?? this.categoryStatus,
      categoryDataList: categoryDataList ?? this.categoryDataList,
    );
  }

  @override
  List<Object> get props {
    return [
      categoryStatus,
      categoryDataList,
    ];
  }
}
