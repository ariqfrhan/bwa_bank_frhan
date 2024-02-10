import 'package:bwa_bank_frhan/blocs/operator_card/operator_card_bloc.dart';
import 'package:bwa_bank_frhan/models/data_plan_model.dart';
import 'package:bwa_bank_frhan/models/operatorcard_model.dart';
import 'package:bwa_bank_frhan/routes.dart';
import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:bwa_bank_frhan/views/widgets/buttons.dart';
import 'package:bwa_bank_frhan/views/widgets/forms.dart';
import 'package:bwa_bank_frhan/views/widgets/package_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class BuydataPaketPage extends StatefulWidget {
  const BuydataPaketPage({super.key});

  @override
  State<BuydataPaketPage> createState() => _BuydataPaketPageState();
}

class _BuydataPaketPageState extends State<BuydataPaketPage> {
  OperatorCardModel? operatorCard;
  late DataPlanModel data;
  final phoneController = TextEditingController(text: '');
  DataPlanModel? isSelected;

  @override
  void initState() {
    super.initState();

    data = Get.arguments as DataPlanModel;

    fetchOperatorCards();
  }

  void fetchOperatorCards() async {
    context.read<OperatorCardBloc>().add(OperatorCardGet());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text('Buy Package'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Phone Number',
            style: blackText.copyWith(fontSize: 16, fontWeight: semibold),
          ),
          const SizedBox(
            height: 14,
          ),
          CustomFormField(
            controller: phoneController,
            title: "",
            hint: '+62',
            isShowTitle: false,
          ),
          // recentUsers(),
          resultUsers(),
          const SizedBox(
            height: 85,
          ),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () async {
              if (await Get.toNamed(Routes.pin)) {
                Get.toNamed(Routes.buydataSuccess);
              }
            },
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }

  Widget resultUsers() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Package',
            style: blackText.copyWith(fontSize: 16, fontWeight: semibold),
          ),
          const SizedBox(
            height: 14,
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: BlocBuilder<OperatorCardBloc, OperatorCardState>(
              builder: (context, state) {
                return state is OperatorCardSuccess
                    ? Wrap(
                        spacing: 17,
                        runSpacing: 17,
                        children: [
                          for (var e in state.operatorCard
                              .where((card) => card.id == data.operatorCardId)
                              .expand((card) => card.dataPlan ?? []))
                            ZoomTapAnimation(
                              child: PackageItem(
                                dataPlan: e,
                                isSelected: e.id == isSelected?.id,
                              ),
                            )
                        ],
                      )
                    : const CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }
}
