import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/module/orders/model/orders_model.dart';
import 'package:ecommerce/module/orders/services/order_services.dart';
import 'package:ecommerce/utils/apppref.dart';
import 'package:equatable/equatable.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderServices services = OrderServices();
  OrderCubit() : super(OrderState.initial());

  getMyOrdersFn() async {
    emit(state.copyWith(orderStatus: GetOrderStatus.loading));
    try {
      final list = await services.getAllOrdersAPi();
      print(AppPref.userToken);
      emit(
        state.copyWith(
          orderStatus: GetOrderStatus.loaded,
          orderDataList: list.data,
        ),
      );
      // ignore: deprecated_member_use
    } on DioError catch (_) {
      emit(state.copyWith(
        orderStatus: GetOrderStatus.error,
      ));
    }
  }
}
