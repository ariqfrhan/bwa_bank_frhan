import 'package:bwa_bank_frhan/routes.dart';
import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:bwa_bank_frhan/views/widgets/home_latesttransaction_item.dart';
import 'package:bwa_bank_frhan/views/widgets/home_services_item.dart';
import 'package:bwa_bank_frhan/views/widgets/home_tips_item.dart';
import 'package:bwa_bank_frhan/views/widgets/home_useritem.dart';
import 'package:flutter/material.dart';
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
          servicesCard(),
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
    return Container(
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
                'Ariq Farhan',
                style: blackText.copyWith(fontWeight: semibold, fontSize: 20),
              )
            ],
          ),
          ZoomTapAnimation(
            onTap: ()=>Get.toNamed(Routes.profile),
            child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage('assets/photo.png'))),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                    decoration: BoxDecoration(
                        color: greenColor,
                        borderRadius: BorderRadius.circular(100)),
                    child: Icon(
                      Icons.check,
                      color: whiteColor,
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget walletCard() {
    return Container(
      width: double.infinity,
      height: 220,
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          image: const DecorationImage(
              image: AssetImage('assets/bg_card.png'), fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ariq Farhan',
            style: whiteText.copyWith(fontSize: 18, fontWeight: medium),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            '**** **** **** 1280',
            style: whiteText.copyWith(
                fontSize: 18, fontWeight: medium, letterSpacing: 6),
          ),
          const SizedBox(
            height: 21,
          ),
          Text(
            'Balance',
            style: whiteText.copyWith(fontSize: 14),
          ),
          Text(
            'Rp 55.000',
            style: whiteText.copyWith(fontSize: 20, fontWeight: semibold),
          )
        ],
      ),
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
                'of Rp 20.000',
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

  Widget servicesCard() {
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
                onTap: () {},
              ),
              HomeServicesItem(
                iconUrl: 'assets/ic_withdraw.png',
                title: 'Withdraw',
                onTap: () {},
              ),
              HomeServicesItem(
                iconUrl: 'assets/ic_more.png',
                title: 'More',
                onTap: () {},
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
            child: const Column(
              children: [
                LatestTransactionItem(
                    iconUrl: 'assets/ic_transaction_category1.png',
                    title: 'Top Up',
                    time: 'Yesterday',
                    value: '+ Rp 50.000'),
                LatestTransactionItem(
                    iconUrl: 'assets/ic_transaction_category2.png',
                    title: 'Cashback',
                    time: 'September 11',
                    value: '+ Rp 50.000'),
                LatestTransactionItem(
                    iconUrl: 'assets/ic_transaction_category3.png',
                    title: 'Withdraw',
                    time: 'Yesterday',
                    value: '+ Rp 50.000'),
                LatestTransactionItem(
                    iconUrl: 'assets/ic_transaction_category4.png',
                    title: 'Transfer',
                    time: 'Yesterday',
                    value: '+ Rp 50.000'),
                LatestTransactionItem(
                    iconUrl: 'assets/ic_transaction_category5.png',
                    title: 'Shopping',
                    time: 'Yesterday',
                    value: '+ Rp 50.000'),
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
          Wrap(
            spacing: 17,
            runSpacing: 18,
            children: const [
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
          )
        ],
      ),
    );
  }
}
