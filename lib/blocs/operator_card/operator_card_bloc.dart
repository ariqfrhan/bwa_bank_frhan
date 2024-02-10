import 'package:bloc/bloc.dart';
import 'package:bwa_bank_frhan/models/operatorcard_model.dart';
import 'package:bwa_bank_frhan/services/operatorcard_services.dart';
import 'package:equatable/equatable.dart';

part 'operator_card_event.dart';
part 'operator_card_state.dart';

class OperatorCardBloc extends Bloc<OperatorCardEvent, OperatorCardState> {
  OperatorCardBloc() : super(OperatorCardInitial()) {
    on<OperatorCardEvent>((event, emit) async{
      if (event is OperatorCardGet) {
        try {
          emit(OperatorCardLoading());

          final operatorCard = await OperatorCardServices().getOperatorCards();

          emit(OperatorCardSuccess(operatorCard));
        } catch (e) {
          emit(OperatorCardFailed(e.toString()));
        }
      }
    });
  }
}
