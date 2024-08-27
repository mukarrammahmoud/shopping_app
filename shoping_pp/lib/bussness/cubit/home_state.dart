part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.listProdects = const [],
    this.loadingType = LoadingType.initi,
  });
  final List<Prodects> listProdects;
  final LoadingType loadingType;
  @override
  List<Object> get props => [
        listProdects,
        loadingType,
      ];

        HomeState copyWith({
    List<Prodects>? listProdects,
    LoadingType? loadingType,
    
  }) =>
      HomeState(
       
          listProdects: listProdects ?? this.listProdects,
          loadingType: loadingType ?? this.loadingType);
}
