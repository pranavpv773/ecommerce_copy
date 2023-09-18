import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/backend/api_urls.dart';
import 'package:ecommerce/module/shop/model/category_model.dart';
import 'package:ecommerce/module/shop/services/shop_service.dart';
import 'package:equatable/equatable.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> with Endpoints {
  ShopServices services = ShopServices();
  ShopCubit() : super(ShopState.initial());

  getCategoryFn() async {
    emit(state.copyWith(categoryStatus: CategoryStatus.loading));
    try {
      final list = await services.getcategoryList();
      print("CATEGORY LENGTH${list.data!.categories!.length}");
      emit(
        state.copyWith(
            categoryStatus: CategoryStatus.loaded,
            categoryDataList: list.data!.categories),
      );
      // ignore: deprecated_member_use
    } on DioError catch (_) {
      emit(state.copyWith(
        categoryStatus: CategoryStatus.error,
      ));
    }
  }
}
