import 'package:bloc/bloc.dart';
import 'package:bwa_bank_frhan/models/tips_model.dart';
import 'package:bwa_bank_frhan/services/tips_services.dart';
import 'package:equatable/equatable.dart';

part 'tips_event.dart';
part 'tips_state.dart';

class TipsBloc extends Bloc<TipsEvent, TipsState> {
  TipsBloc() : super(TipsInitial()) {
    on<TipsEvent>((event, emit) async {
      if (event is TipsGet) {
        try {
          emit(TipsLoading());

          final tips = await TipsServices().getTips();

          emit(TipsSuccess(tips));
        } catch (e) {
          emit(TipsFailed(e.toString()));
        }
      }
    });
  }
}
