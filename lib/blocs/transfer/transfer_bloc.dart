import 'package:bloc/bloc.dart';
import 'package:bwa_bank_frhan/blocs/bloc/auth_bloc.dart';
import 'package:bwa_bank_frhan/models/transfer_form_model.dart';
import 'package:bwa_bank_frhan/services/transaction_services.dart';
import 'package:equatable/equatable.dart';

part 'transfer_event.dart';
part 'transfer_state.dart';

class TransferBloc extends Bloc<TransferEvent, TransferState> {
  TransferBloc() : super(TransferInitial()) {
    on<TransferEvent>((event, emit) async{
      if (event is TransferPost) {
        try {
          emit(TransferLoading());

          await TransactionServices().transfer(event.data);

          emit(TransferSuccess());
        } catch (e) {
          emit(TransferFailed(e.toString()));
        }
      }
    });
  }
}
