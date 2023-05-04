part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {
  final AppExeptions appExeption;

  HomeError(this.appExeption);

  @override
  List<Object> get props => [appExeption];
}

class HomeSuccess extends HomeState {
  final List<Food> foods;
  final List<Menu> menus;

  HomeSuccess({required this.foods,required this.menus});
}
