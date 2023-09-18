import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/backend/api_urls.dart';
import 'package:ecommerce/module/bag/model/my_bag_model.dart';
import 'package:ecommerce/module/bag/services/my_bag_service.dart';
import 'package:equatable/equatable.dart';

part 'my_bag_state.dart';

class MyBagCubit extends Cubit<MyBagState> with Endpoints {
  CartServices services = CartServices();
  MyBagCubit() : super(MyBagState.initial());

  getAllCartItemsFn() async {
    emit(state.copyWith(cartStatus: CartStatus.loading));
    try {
      final list = await services.getAllBagItemsAPi();
      print(list);
      emit(
        state.copyWith(
            cartStatus: CartStatus.loaded,
            cartDataList: list.data!.products,
            myBagModel: list),
      );
      // ignore: deprecated_member_use
    } on DioError catch (_) {
      emit(state.copyWith(
        cartStatus: CartStatus.error,
      ));
    }
  }
}
