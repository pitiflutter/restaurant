part of 'detail_bloc.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

class DetailLoading extends DetailState {}

class DetailSuccess extends DetailState {
  final FoodDetail foodDetail;

  DetailSuccess(this.foodDetail);

  @override
  List<Object> get props => [foodDetail];
}

class DetailError extends DetailState {
  final AppExeptions appExeption;

  DetailError(this.appExeption);

 
  @override
  List<Object> get props => [appExeption];
}
