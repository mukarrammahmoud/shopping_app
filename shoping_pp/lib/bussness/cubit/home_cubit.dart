import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shoping_pp/config/root/app_root.dart';
import 'package:shoping_pp/config/status.dart';
import 'package:shoping_pp/data/model/prodects_model.dart';
import 'package:shoping_pp/data/model/result_api.dart';
import 'package:shoping_pp/data/repo/prodects_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.prodectsApiRepo,
  }) : super(const HomeState()) {
    getAllProdects();
  }

  ProdectsApiRepo prodectsApiRepo;
  getAllProdects() async {
    emit(state.copyWith(
      loadingType: LoadingType.loading,
    ));
    ResultApi resultApi = await prodectsApiRepo.getProdects();

    if (resultApi.isDone) {
      List<Prodects> listprodects = List.from(resultApi.resultOrError);
      emit(state.copyWith(
        listProdects: listprodects,
        loadingType: LoadingType.successful,
      ));
    }
  }

  navigetToDetailsProdects(BuildContext context, Prodects prodects) {
    Navigator.of(context).pushNamed(
      AppRoot.showProdectContent,
      arguments: prodects,
    );
  }
}
