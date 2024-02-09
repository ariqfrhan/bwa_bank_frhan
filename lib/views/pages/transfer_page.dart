import 'package:bwa_bank_frhan/blocs/user/user_bloc.dart';
import 'package:bwa_bank_frhan/models/transfer_form_model.dart';
import 'package:bwa_bank_frhan/models/user_model.dart';
import 'package:bwa_bank_frhan/routes.dart';
import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:bwa_bank_frhan/views/widgets/buttons.dart';
import 'package:bwa_bank_frhan/views/widgets/forms.dart';
import 'package:bwa_bank_frhan/views/widgets/transfer_recentuser_item.dart';
import 'package:bwa_bank_frhan/views/widgets/transfer_result_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final usernameController = TextEditingController(text: '');
  UserModel? selectedUser;

  late UserBloc userBloc;

  @override
  void initState() {
    super.initState();

    userBloc = context.read<UserBloc>()..add(UserGetRecents());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text('Transfer'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Search',
            style: blackText.copyWith(fontSize: 16, fontWeight: semibold),
          ),
          const SizedBox(
            height: 14,
          ),
          CustomFormField(
            controller: usernameController,
            onFieldSubmitted: (value) {
              if (value.isNotEmpty) {
                userBloc.add(UserGetByUsername(value));
              } else {
                selectedUser == null;
                userBloc.add(UserGetRecents());
              }

              setState(() {});
            },
            title: "",
            hint: 'By Username',
            isShowTitle: false,
          ),
          // recentUsers(),
          usernameController.text.isEmpty ? recentUsers() : resultUsers(),
          const SizedBox(
            height: 50,
          )
        ],
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.all(24),
        child: CustomFilledButton(
          title: 'Continue',
          onPressed: () {
            Get.toNamed(Routes.transferAmount, arguments: TransferFormModel(
              sendTo: selectedUser!.username
            ));
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget recentUsers() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Users',
            style: blackText.copyWith(fontSize: 16, fontWeight: semibold),
          ),
          const SizedBox(
            height: 14,
          ),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              return state is UserSuccess
                  ? Column(
                      children: state.users.map((user) {
                        return ZoomTapAnimation(
                            onTap: () {
                              setState(() {
                                selectedUser = user;
                              });
                              Get.toNamed(Routes.transferAmount, arguments: TransferFormModel(
                                sendTo: user.username
                              ));
                            },
                            child: TransferRecentUserItem(
                              user: user,
                              isSelected: user.id == selectedUser?.id,
                            ));
                      }).toList(),
                    )
                  : const Center(child: CircularProgressIndicator());
            },
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
            'Results',
            style: blackText.copyWith(fontSize: 16, fontWeight: semibold),
          ),
          const SizedBox(
            height: 14,
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                return state is UserSuccess
                    ? Wrap(
                        spacing: 17,
                        runSpacing: 17,
                        children: state.users.map((user) {
                          return ZoomTapAnimation(
                              onTap: () {
                                setState(() {
                                  selectedUser = user;
                                });
                                Get.toNamed(Routes.transferAmount, arguments: TransferFormModel(
                                sendTo: user.username
                              ));
                              },
                              child: TransferResultItem(
                                user: user,
                                isSelected: user.id == selectedUser?.id,
                              ));
                        }).toList(),
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
