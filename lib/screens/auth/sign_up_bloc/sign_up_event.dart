part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();
}


class SignUpRequired extends SignUpEvent {

  final MyUser user;

  const SignUpRequired(this.user);

  @override
  List<Object> get props => [user];
}