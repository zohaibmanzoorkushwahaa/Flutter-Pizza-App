part of 'get_pizza_bloc.dart';

sealed class GetPizzaState extends Equatable {
  const GetPizzaState();

  @override
  List<Object> get props => [];
}

final class GetPizzaInitial extends GetPizzaState { }


final class GetPizzaSuccess extends GetPizzaState {
  final List<Pizza> pizzas;

  const GetPizzaSuccess(this.pizzas);
}
final class GetPizzaLoading extends GetPizzaState { }
final class GetPizzaFailure extends GetPizzaState { }