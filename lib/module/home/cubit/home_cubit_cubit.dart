// ignore_for_file: use_build_context_synchronously

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/backend/api_urls.dart';
import 'package:ecommerce/module/home/model/banner_model.dart';
import 'package:ecommerce/module/home/model/get_wallet_model.dart';
import 'package:ecommerce/module/home/model/post_purchase_model.dart';
import 'package:ecommerce/module/home/service/home_services.dart';
import 'package:ecommerce/module/onboarding/model/userModel.dart';
part 'home_cubit_state.dart';

class HomeCubit extends Cubit<HomeState> with Endpoints {
  HomeServices services = HomeServices();
  HomeCubit() : super(HomeState.initial());
}
