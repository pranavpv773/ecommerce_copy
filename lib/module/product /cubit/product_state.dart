part of 'product_cubit.dart';

enum AllProductStatus {
  initial,
  loading,
  loaded,
  error,
}

enum ProductDescrStatus {
  initial,
  loading,
  loaded,
  error,
}

class ProductState extends Equatable {
  final AllProductStatus allProductStatus;
  final ProductDescrStatus productDescrStatus;
  final List<Product> allProductDataList;
  final ProductDescriptionData productDescriptionData;
  const ProductState({
    required this.allProductStatus,
    required this.allProductDataList,
    required this.productDescrStatus,
    required this.productDescriptionData,
  });

  factory ProductState.initial() {
    return ProductState(
        allProductStatus: AllProductStatus.initial,
        allProductDataList: const [],
        productDescrStatus: ProductDescrStatus.initial,
        productDescriptionData: ProductDescriptionData());
  }

  ProductState copyWith(
      {AllProductStatus? allProductStatus,
      List<Product>? allProductDataList,
      ProductDescrStatus? productDescrStatus,
      ProductDescriptionData? productDescriptionData}) {
    return ProductState(
      allProductStatus: allProductStatus ?? this.allProductStatus,
      allProductDataList: allProductDataList ?? this.allProductDataList,
      productDescrStatus: productDescrStatus ?? this.productDescrStatus,
      productDescriptionData:
          productDescriptionData ?? this.productDescriptionData,
    );
  }

  @override
  List<Object> get props {
    return [
      allProductStatus,
      allProductDataList,
      productDescrStatus,
      productDescriptionData,
    ];
  }
}
