import 'package:bwa_bank_frhan/blocs/bloc/auth_bloc.dart';
import 'package:bwa_bank_frhan/routes.dart';
import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:bwa_bank_frhan/shared/utils.dart';
import 'package:bwa_bank_frhan/views/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBg,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'My Profile',
          style: blackText.copyWith(fontSize: 18, fontWeight: semibold),
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            Utils.getSnackBar(state.e);
          }

          if (state is AuthInitial) {
            Get.offAllNamed(Routes.signin);
          }
        },
        builder: (context, state) {
          return state is AuthSuccessLogin
              ? ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 22),
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: state.user.profilePicture != null
                                        ? NetworkImage(
                                            state.user.profilePicture!)
                                        : const AssetImage('assets/photo.png')
                                            as ImageProvider)),
                            child: state.user.verified == 1
                                ? Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: greenColor,
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        child: Icon(
                                          Icons.check,
                                          color: whiteColor,
                                        )),
                                  )
                                : Container(),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            state.user.name!,
                            style: blackText.copyWith(
                                fontSize: 16, fontWeight: semibold),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          ProfileMenuItem(
                            icon: Icons.person_outline,
                            title: 'Edit Profile',
                            onTap: () async {
                              var data = await Get.toNamed(Routes.pin);
                              if (data == true) {
                                Get.toNamed(Routes.profileEdit);
                              }
                            },
                          ),
                          ProfileMenuItem(
                            icon: Icons.shield_outlined,
                            title: 'My PIN',
                            onTap: () async {
                              var data = await Get.toNamed(Routes.pin);
                              if (data == true) {
                                Get.toNamed(Routes.pinEdit);
                              }
                            },
                          ),
                          ProfileMenuItem(
                            icon: Icons.wallet_outlined,
                            title: 'Wallet Settings',
                            onTap: () {},
                          ),
                          ProfileMenuItem(
                            icon: Icons.track_changes_outlined,
                            title: 'My Rewards',
                            onTap: () {},
                          ),
                          ProfileMenuItem(
                            icon: Icons.view_sidebar_outlined,
                            title: 'Help Center',
                            onTap: () {},
                          ),
                          ProfileMenuItem(
                            icon: Icons.logout,
                            title: 'Log Out',
                            onTap: () {
                              context.read<AuthBloc>().add(AuthLogout());
                            },
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Report a Problem',
                          style: greyText.copyWith(fontSize: 16),
                        ))
                  ],
                )
              : Container();
        },
      ),
    );
  }
}
