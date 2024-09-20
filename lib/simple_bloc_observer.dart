import 'dart:developer';
import 'package:bloc/bloc.dart';

class AppBlocObserver extends BlocObserver {

  ///We can run something, when we create our Bloc
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    ///We can check, if the BlocBase is a Bloc or a Cubit
    if (bloc is Cubit) {
      print("This is a Cubit");
    } else {
      print("This is a Bloc");
    }
    log('onCreate -- bloc ${bloc.runtimeType}');
  }

  ///We can react to events
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log("an event Happened in $bloc the event is $event");
  }

  ///We can even react to transitions
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    /// With this we can specifically know, when and what changed in our Bloc
    log("There was a transition from ${transition.currentState} to ${transition.nextState}");
  }

  ///We can react to errors, and we will know the error and the StackTrace
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log("Error happened in $bloc with error $error and the stacktrace is $stackTrace");
  }

  ///We can even run something, when we close our Bloc
  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log("BLOC is closed");
  }
}