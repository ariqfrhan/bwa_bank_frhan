import 'package:bwa_bank_frhan/blocs/bloc/auth_bloc.dart';
import 'package:bwa_bank_frhan/routes.dart';
import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:bwa_bank_frhan/shared/utils.dart';
import 'package:bwa_bank_frhan/views/widgets/buttons.dart';
import 'package:bwa_bank_frhan/views/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class EditPinPage extends StatefulWidget {
  const EditPinPage({super.key});

  @override
  State<EditPinPage> createState() => _EditPinPageState();
}

class _EditPinPageState extends State<EditPinPage> {
  final oldpinController = TextEditingController(text: '');
  final newpinController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailed) {
          Utils.getSnackBar('Gagal mengupdate data');
        }
        if (state is AuthSuccessLogin) {
          Get.toNamed(Routes.profileSuccess);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
                onTap: () => Get.back(),
                child: const Icon(Icons.arrow_back_ios_new)),
            title: const Text('Edit PIN'),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: whiteColor),
                child: Column(
                  children: [
                    CustomFormField(
                      controller: oldpinController,
                      title: 'Old PIN',
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomFormField(
                      controller: newpinController,
                      title: 'New PIN',
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    state is AuthLoading
                        ? const CircularProgressIndicator()
                        : CustomFilledButton(
                            title: 'Update Now',
                            onPressed: () {
                              context.read<AuthBloc>().add(AuthUpdatePIN(
                                  oldpinController.text,
                                  newpinController.text));
                            },
                          )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
