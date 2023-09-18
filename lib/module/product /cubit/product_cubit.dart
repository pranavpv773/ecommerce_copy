import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/module/product%20/model/allProduct_model.dart';
import 'package:ecommerce/module/product%20/services/product_service.dart';
import 'package:equatable/equatable.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductServices services = ProductServices();
  ProductCubit() : super(ProductState.initial());

  getAllProductsFn({required String categoryId}) async {
    emit(state.copyWith(allProductStatus: AllProductStatus.loading));
    try {
      final list = await services.getAllProductsApi(categoryId: categoryId);
      print("Product length: ${list.data.products.length}");
      emit(
        state.copyWith(
            allProductStatus: AllProductStatus.loaded,
            allProductDataList: list.data.products),
      );
      // ignore: deprecated_member_use
    } on DioError catch (_) {
      emit(state.copyWith(
        allProductStatus: AllProductStatus.error,
      ));
    }
  }
}
