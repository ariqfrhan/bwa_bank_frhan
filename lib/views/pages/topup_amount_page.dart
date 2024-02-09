import 'package:bwa_bank_frhan/blocs/bloc/auth_bloc.dart';
import 'package:bwa_bank_frhan/blocs/topup/topup_bloc.dart';
import 'package:bwa_bank_frhan/models/topup_form_model.dart';
import 'package:bwa_bank_frhan/routes.dart';
import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:bwa_bank_frhan/shared/utils.dart';
import 'package:bwa_bank_frhan/views/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TopupAmountPage extends StatefulWidget {
  const TopupAmountPage({super.key});

  @override
  State<TopupAmountPage> createState() => _TopupAmountPageState();
}

class _TopupAmountPageState extends State<TopupAmountPage> {
  late TopupFormModel data;

  final TextEditingController amountController =
      TextEditingController(text: '0');

  @override
  void initState() {
    super.initState();

    data = Get.arguments as TopupFormModel;

    amountController.addListener(() {
      final text = amountController.text;

      if (text.isNotEmpty) {
        try {
          final numericValue = int.parse(text.replaceAll('.', ''));
          amountController.value = amountController.value.copyWith(
            text: NumberFormat.currency(
              locale: 'id',
              decimalDigits: 0,
              symbol: '',
            ).format(numericValue),
          );
        } catch (e) {
          // Handle the exception, e.g., log or set a default value
        }
      }
    });
  }

  addAmount(String number) {
    if (amountController.text == '0') {
      amountController.text = '';
    }
    setState(() {
      amountController.text = amountController.text + number;
    });
  }

  deleteAmount() {
    if (amountController.text.isNotEmpty) {
      setState(() {
        amountController.text = amountController.text
            .substring(0, amountController.text.length - 1);
        if (amountController.text == '') {
          amountController.text = '0';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBg,
      body: BlocProvider(
        create: (context) => TopupBloc(),
        child: BlocConsumer<TopupBloc, TopupState>(
          listener: (context, state) async {
            if (state is TopupFailed) {
              Utils.getSnackBar(state.e);
            }

            if (state is TopupSuccess) {
              await launchUrlString(state.redirectUrl);

              context.read<AuthBloc>().add(AuthUpdateBalance(
                  int.parse(amountController.text.replaceAll('.', ''))));

              Get.offNamed(Routes.topupSuccess);
            }
          },
          builder: (context, state) {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 58),
              children: [
                const SizedBox(
                  height: 60,
                ),
                Center(
                  child: Text(
                    'Top Up Amount',
                    style:
                        whiteText.copyWith(fontSize: 20, fontWeight: semibold),
                  ),
                ),
                const SizedBox(
                  height: 67,
                ),
                Align(
                  child: SizedBox(
                    width: 200,
                    child: TextFormField(
                      controller: amountController,
                      cursorColor: greyColor,
                      enabled: false,
                      style:
                          whiteText.copyWith(fontSize: 36, fontWeight: medium),
                      decoration: InputDecoration(
                        prefixIcon: Text(
                          'Rp',
                          style: whiteText.copyWith(
                              fontSize: 36, fontWeight: medium),
                        ),
                        disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: greyColor)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: greyColor)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 66,
                ),
                Wrap(
                  spacing: 40,
                  runSpacing: 40,
                  children: [
                    CustomInputButton(
                      title: '1',
                      onTap: () {
                        addAmount('1');
                      },
                    ),
                    CustomInputButton(
                      title: '2',
                      onTap: () {
                        addAmount('2');
                      },
                    ),
                    CustomInputButton(
                      title: '3',
                      onTap: () {
                        addAmount('3');
                      },
                    ),
                    CustomInputButton(
                      title: '4',
                      onTap: () {
                        addAmount('4');
                      },
                    ),
                    CustomInputButton(
                      title: '5',
                      onTap: () {
                        addAmount('5');
                      },
                    ),
                    CustomInputButton(
                      title: '6',
                      onTap: () {
                        addAmount('6');
                      },
                    ),
                    CustomInputButton(
                      title: '7',
                      onTap: () {
                        addAmount('7');
                      },
                    ),
                    CustomInputButton(
                      title: '8',
                      onTap: () {
                        addAmount('8');
                      },
                    ),
                    CustomInputButton(
                      title: '9',
                      onTap: () {
                        addAmount('9');
                      },
                    ),
                    const SizedBox(
                      height: 60,
                      width: 60,
                    ),
                    CustomInputButton(
                      title: '0',
                      onTap: () {
                        addAmount('0');
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        deleteAmount();
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: numberColor),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomFilledButton(
                  title: 'Checkout Now',
                  onPressed: () async {
                    if (await Get.toNamed(Routes.pin)) {
                      // ignore: use_build_context_synchronously
                      final authState = context.read<AuthBloc>().state;
                      String pin = '';
                      if (authState is AuthSuccessLogin) {
                        pin = authState.user.pin!;
                      }

                      // ignore: use_build_context_synchronously
                      context.read<TopupBloc>().add(TopupPost(data.copyWith(
                          pin: pin,
                          amount: amountController.text.replaceAll('.', ''))));
                    }
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Terms & Conditions',
                      style: greyText,
                    ))
              ],
            );
          },
        ),
      ),
    );
  }
}
