import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:shoping_pp/config/root/app_root.dart';
import 'package:shoping_pp/config/status.dart';
import 'package:shoping_pp/data/api/prodect_api.dart';
import 'package:shoping_pp/data/model/prodects_model.dart';
import 'package:shoping_pp/data/model/result_api.dart';
import 'package:shoping_pp/data/repo/prodects_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit()
      : super(SearchState(
          editingController: TextEditingController(),
        ));
  void onTapOkOnDialog() {
    emit(state.copyWith(
      loadingType: LoadingType.initi,
      errorMessage: "",
    ));
  }

  Future<void> searchText() async {
    emit(state.copyWith(
      loadingType: LoadingType.loading,
    ));
    String search = state.editingController.text.trim();
    ProdectsApiRepo prodectsApiRepo = ProdectsApiRepo(
      dataProdectsApi: DataProdectsApi(),
    );
    ResultApi resultApi = await prodectsApiRepo.getNewsSearch(search);
    if (resultApi.isDone) {
      List<Prodects> news = List.from(resultApi.resultOrError);
      if (isClosed) return;
      emit(
        state.copyWith(loadingType: LoadingType.successful, newsList: news),
      );
    } else {
      if (isClosed) return;
      emit(state.copyWith(
        errorMessage: resultApi.resultOrError,
        loadingType: LoadingType.error,
      ));
    }
  }
  void onTapNews(Prodects newsModel,BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoot.showProdectContent,
      arguments: newsModel,
    );
  }
}
