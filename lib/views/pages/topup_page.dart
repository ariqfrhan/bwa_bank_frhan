import 'package:bwa_bank_frhan/blocs/bloc/auth_bloc.dart';
import 'package:bwa_bank_frhan/blocs/payment_method/payment_method_bloc.dart';
import 'package:bwa_bank_frhan/models/payment_method_model.dart';
import 'package:bwa_bank_frhan/models/topup_form_model.dart';
import 'package:bwa_bank_frhan/routes.dart';
import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:bwa_bank_frhan/shared/utils.dart';
import 'package:bwa_bank_frhan/views/widgets/bank_item.dart';
import 'package:bwa_bank_frhan/views/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class TopupPage extends StatefulWidget {
  const TopupPage({super.key});

  @override
  State<TopupPage> createState() => _TopupPageState();
}

class _TopupPageState extends State<TopupPage> {
  PaymentMethodModel? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text('Top Up'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Wallet',
            style: blackText.copyWith(fontSize: 16, fontWeight: semibold),
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return state is AuthSuccessLogin
                  ? Row(
                      children: [
                        Image.asset(
                          'assets/bg_card.png',
                          width: 80,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Utils.formatCardNumber(
                                  state.user.cardNumber.toString()),
                              style: blackText.copyWith(
                                  fontSize: 16, fontWeight: medium),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              state.user.name.toString(),
                              style: greyText.copyWith(
                                fontSize: 14,
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  : Container();
            },
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Select Bank',
            style: blackText.copyWith(fontSize: 16, fontWeight: semibold),
          ),
          const SizedBox(
            height: 14,
          ),
          BlocProvider(
            create: (context) => PaymentMethodBloc()..add(PaymentMethodGet()),
            child: BlocBuilder<PaymentMethodBloc, PaymentMethodState>(
              builder: (context, state) {
                return state is PaymentMethodSuccess
                    ? Column(
                        children: state.paymentMethod.map((paymentMethods) {
                          return ZoomTapAnimation(
                            onTap: () {
                              setState(() {
                                selectedPaymentMethod = paymentMethods;
                              });
                            },
                            child: BankItem(
                              paymentMethod: paymentMethods,
                              isSelected: paymentMethods.id ==
                                  selectedPaymentMethod?.id,
                            ),
                          );
                        }).toList(),
                      )
                    : const Center(child: CircularProgressIndicator());
              },
            ),
          ),
          const SizedBox(
            height: 12,
          ),

        ],
      ),
      floatingActionButton: selectedPaymentMethod != null
          ? Container(
            margin: const EdgeInsets.all(24),
            child: CustomFilledButton(
                title: 'Continue',
                onPressed: () {
                  Get.toNamed(Routes.topupAmount,
                      arguments: TopupFormModel(
                          paymentMethodCode: selectedPaymentMethod?.code));
                },
              ),
          )
          : Container(),
    );
  }
}
