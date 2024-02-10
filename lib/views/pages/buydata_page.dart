import 'package:bwa_bank_frhan/blocs/bloc/auth_bloc.dart';
import 'package:bwa_bank_frhan/blocs/operator_card/operator_card_bloc.dart';
import 'package:bwa_bank_frhan/models/data_plan_model.dart';
import 'package:bwa_bank_frhan/models/operatorcard_model.dart';
import 'package:bwa_bank_frhan/routes.dart';
import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:bwa_bank_frhan/shared/utils.dart';
import 'package:bwa_bank_frhan/views/widgets/buttons.dart';
import 'package:bwa_bank_frhan/views/widgets/provider_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class BuydataPage extends StatefulWidget {
  const BuydataPage({super.key});

  @override
  State<BuydataPage> createState() => _BuydataPageState();
}

class _BuydataPageState extends State<BuydataPage> {
  OperatorCardModel? selectedOperatorCard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text('Select Provider'),
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
                              Utils.formatCardNumber(state.user.cardNumber!),
                              style: blackText.copyWith(
                                  fontSize: 16, fontWeight: medium),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              state.user.name!,
                              style: greyText.copyWith(
                                fontSize: 14,
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  : const Center(child: CircularProgressIndicator());
            },
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Select Provider',
            style: blackText.copyWith(fontSize: 16, fontWeight: semibold),
          ),
          const SizedBox(
            height: 14,
          ),
          BlocProvider(
            create: (context) => OperatorCardBloc()..add(OperatorCardGet()),
            child: BlocBuilder<OperatorCardBloc, OperatorCardState>(
              builder: (context, state) {
                return state is OperatorCardSuccess
                    ? Column(
                        children: state.operatorCard.map((operators) {
                          return ZoomTapAnimation(
                              onTap: () {
                                setState(() {
                                  selectedOperatorCard = operators;
                                });
                              },
                              child: ProviderItem(
                                operator: operators,
                                isSelected:
                                    operators.id == selectedOperatorCard?.id,
                              ));
                        }).toList(),
                      )
                    : const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
      floatingActionButton: selectedOperatorCard == null
          ? Container()
          : Container(
            margin: const EdgeInsets.all(24),
            child: CustomFilledButton(
                title: 'Continue',
                onPressed: () {
                  Get.toNamed(Routes.buydataPaket, arguments: DataPlanModel(
                    operatorCardId: selectedOperatorCard!.id
                  ));
                },
              ),
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
