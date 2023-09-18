part of 'product_cubit.dart';

enum AllProductStatus {
  initial,
  loading,
  loaded,
  error,
}

class ProductState extends Equatable {
  final AllProductStatus allProductStatus;
  final List<Product> allProductDataList;
  const ProductState({
    required this.allProductStatus,
    required this.allProductDataList,
  });

  factory ProductState.initial() {
    return const ProductState(
      allProductStatus: AllProductStatus.initial,
      allProductDataList: [],
    );
  }

  ProductState copyWith({
    AllProductStatus? allProductStatus,
    List<Product>? allProductDataList,
  }) {
    return ProductState(
      allProductStatus: allProductStatus ?? this.allProductStatus,
      allProductDataList: allProductDataList ?? this.allProductDataList,
    );
  }

  @override
  List<Object> get props {
    return [
      allProductStatus,
      allProductDataList,
    ];
  }
}
