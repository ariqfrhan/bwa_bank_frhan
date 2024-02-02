import 'package:bwa_bank_frhan/blocs/bloc/auth_bloc.dart';
import 'package:bwa_bank_frhan/routes.dart';
import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:bwa_bank_frhan/shared/utils.dart';
import 'package:bwa_bank_frhan/views/widgets/home_latesttransaction_item.dart';
import 'package:bwa_bank_frhan/views/widgets/home_services_item.dart';
import 'package:bwa_bank_frhan/views/widgets/home_tips_item.dart';
import 'package:bwa_bank_frhan/views/widgets/home_useritem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 40,
          ),
          profileSection(),
          walletCard(),
          levelCard(),
          servicesCard(context),
          transactionCard(),
          sendAgainCard(),
          tipsCard()
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: whiteColor,
        clipBehavior: Clip.antiAlias,
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        elevation: 0,
        child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: whiteColor,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: blueColor,
            unselectedItemColor: greyColor,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                    size: 22,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.file_copy_outlined,
                    size: 22,
                  ),
                  label: 'History'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.bar_chart_outlined,
                    size: 22,
                  ),
                  label: 'Statistic'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.wallet_giftcard_outlined,
                    size: 22,
                  ),
                  label: 'Rewards')
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: purpleColor,
        onPressed: () {},
        child: Icon(
          Icons.add_rounded,
          size: 48,
          color: whiteColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget profileSection() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return state is AuthSuccessLogin
            ? Container(
                margin: const EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Howdy,",
                          style: greyText.copyWith(fontSize: 16),
                        ),
                        Text(
                          state.user.name!,
                          style: blackText.copyWith(
                              fontWeight: semibold, fontSize: 20),
                        )
                      ],
                    ),
                    ZoomTapAnimation(
                      onTap: () => Get.toNamed(Routes.profile),
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: state.user.profilePicture != null
                                    ? NetworkImage(state.user.profilePicture!)
                                    : const AssetImage('assets/photo.png')
                                        as ImageProvider)),
                        child: state.user.verified == 1
                            ? Align(
                                alignment: Alignment.topRight,
                                child: Icon(
                                  Icons.check_circle,
                                  color: greenColor,
                                  size: 14,
                                ),
                              )
                            : Container(),
                      ),
                    )
                  ],
                ),
              )
            : Container();
      },
    );
  }

  Widget walletCard() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return state is AuthSuccessLogin
            ? Container(
                width: double.infinity,
                height: 220,
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    image: const DecorationImage(
                        image: AssetImage('assets/bg_card.png'),
                        fit: BoxFit.cover)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.user.name!,
                      style:
                          whiteText.copyWith(fontSize: 18, fontWeight: medium),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      Utils.formatCardNumber(state.user.cardNumber.toString()),
                      style: whiteText.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                        letterSpacing: 2
                      ),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    Text(
                      'Balance',
                      style: whiteText.copyWith(fontSize: 14),
                    ),
                    Text(
                      Utils.formatCurrency(state.user.balance!),
                      style: whiteText.copyWith(
                          fontSize: 20, fontWeight: semibold),
                    )
                  ],
                ),
              )
            : Container();
      },
    );
  }

  Widget levelCard() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: whiteColor),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Level 1',
                style: blackText.copyWith(fontWeight: medium, fontSize: 14),
              ),
              const Spacer(),
              Text(
                '55%',
                style: greenText.copyWith(fontWeight: semibold),
              ),
              Text(
                ' of ${Utils.formatCurrency(20000)}',
                style: blackText,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(55),
            child: LinearProgressIndicator(
              minHeight: 5,
              value: 0.55,
              valueColor: AlwaysStoppedAnimation(greenColor),
              backgroundColor: lightBg,
            ),
          )
        ],
      ),
    );
  }

  Widget servicesCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Do Something',
            style: blackText.copyWith(fontSize: 18, fontWeight: semibold),
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeServicesItem(
                iconUrl: 'assets/ic_topup.png',
                title: 'Top Up',
                onTap: () => Get.toNamed(Routes.topup),
              ),
              HomeServicesItem(
                iconUrl: 'assets/ic_send.png',
                title: 'Send',
                onTap: () => Get.toNamed(Routes.transfer),
              ),
              HomeServicesItem(
                iconUrl: 'assets/ic_withdraw.png',
                title: 'Withdraw',
                onTap: () {},
              ),
              HomeServicesItem(
                iconUrl: 'assets/ic_more.png',
                title: 'More',
                onTap: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) => const MoreDialog());
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget transactionCard() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Latest Transaction',
            style: blackText.copyWith(fontSize: 16, fontWeight: semibold),
          ),
          const SizedBox(
            height: 14,
          ),
          Container(
            padding: const EdgeInsets.all(22),
            margin: const EdgeInsets.only(top: 14),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: whiteColor),
            child: Column(
              children: [
                LatestTransactionItem(
                    iconUrl: 'assets/ic_transaction_category1.png',
                    title: 'Top Up',
                    time: 'Yesterday',
                    value: '+ ${Utils.formatCurrency(20000)}'),
                LatestTransactionItem(
                    iconUrl: 'assets/ic_transaction_category2.png',
                    title: 'Cashback',
                    time: 'September 11',
                    value: '+ ${Utils.formatCurrency(20000)}'),
                LatestTransactionItem(
                    iconUrl: 'assets/ic_transaction_category3.png',
                    title: 'Withdraw',
                    time: 'Yesterday',
                    value: '+ ${Utils.formatCurrency(20000)}'),
                LatestTransactionItem(
                    iconUrl: 'assets/ic_transaction_category4.png',
                    title: 'Transfer',
                    time: 'Yesterday',
                    value: '+ ${Utils.formatCurrency(20000)}'),
                LatestTransactionItem(
                    iconUrl: 'assets/ic_transaction_category5.png',
                    title: 'Shopping',
                    time: 'Yesterday',
                    value: '+ ${Utils.formatCurrency(20000)}'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget sendAgainCard() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Send Again',
            style: blackText.copyWith(fontSize: 16, fontWeight: semibold),
          ),
          const SizedBox(
            height: 14,
          ),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeUserItem(imgUrl: 'assets/photo_2.png', username: 'Babayo'),
                HomeUserItem(imgUrl: 'assets/photo_2.png', username: 'Babayo'),
                HomeUserItem(imgUrl: 'assets/photo_2.png', username: 'Ayayo'),
                HomeUserItem(imgUrl: 'assets/photo_2.png', username: 'Cayayo'),
                HomeUserItem(imgUrl: 'assets/photo_2.png', username: 'Dabayo'),
                HomeUserItem(imgUrl: 'assets/photo_2.png', username: 'Babayo'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget tipsCard() {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Friendly Tips',
            style: blackText.copyWith(fontSize: 16, fontWeight: semibold),
          ),
          const SizedBox(
            height: 21,
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: const Wrap(
              spacing: 17,
              runSpacing: 18,
              children: [
                HomeTipsItem(
                    imgUrl: 'assets/onboarding_1.png',
                    title: 'Tips Menggandakan Uang',
                    url: 'https://www.google.com'),
                HomeTipsItem(
                    imgUrl: 'assets/onboarding_2.png',
                    title: 'Tips Dapat Uang',
                    url: 'https://www.google.com'),
                HomeTipsItem(
                    imgUrl: 'assets/onboarding_1.png',
                    title: 'Tips Menggandakan Uang',
                    url: 'https://www.google.com'),
                HomeTipsItem(
                    imgUrl: 'assets/onboarding_2.png',
                    title: 'Tips Dapat Uang',
                    url: 'https://www.google.com')
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MoreDialog extends StatelessWidget {
  const MoreDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      content: Container(
        padding: const EdgeInsets.all(30),
        height: 326,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40), color: whiteColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Do More with Us',
              style: blackText.copyWith(fontSize: 16, fontWeight: semibold),
            ),
            const SizedBox(
              height: 13,
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Wrap(
                runAlignment: WrapAlignment.center,
                spacing: 29,
                runSpacing: 25,
                children: [
                  HomeServicesItem(
                    iconUrl: 'assets/ic_data.png',
                    title: 'Data',
                    onTap: () => Get.toNamed(Routes.buydata),
                  ),
                  HomeServicesItem(
                    iconUrl: 'assets/ic_water.png',
                    title: 'Water',
                    onTap: () => Get.toNamed(Routes.transfer),
                  ),
                  HomeServicesItem(
                    iconUrl: 'assets/ic_stream.png',
                    title: 'Stream',
                    onTap: () {},
                  ),
                  HomeServicesItem(
                    iconUrl: 'assets/ic_movie.png',
                    title: 'Movie',
                    onTap: () => Get.toNamed(Routes.topup),
                  ),
                  HomeServicesItem(
                    iconUrl: 'assets/ic_food.png',
                    title: 'Food',
                    onTap: () => Get.toNamed(Routes.transfer),
                  ),
                  HomeServicesItem(
                    iconUrl: 'assets/ic_travel.png',
                    title: 'Travel',
                    onTap: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
