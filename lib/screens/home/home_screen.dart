import 'package:flutter/material.dart';
import 'package:game/config/constants/colors.dart';
import 'package:game/config/constants/images.dart';
import 'package:game/config/constants/keys.dart';
import 'package:game/controllers/home_controller.dart';
import 'package:game/controllers/login_controller.dart';
import 'package:game/screens/home/widgets/game_view.dart';
import 'package:game/utilities/text_styles.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = Get.find();
  final LoginController loginController = Get.put(LoginController());

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    var user = box.read(AppKeys.USER);
    print(user);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.transparent,
          elevation: 0,
          title: Text('Flying wolf', style: AppText.header),
          leading: Icon(Icons.short_text, color: AppColors.black, size: 32),
          actions: [
            IconButton(
              icon: Icon(Icons.logout, color: AppColors.black),
              onPressed: loginController.logout,
            )
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            controller: homeController.scrollController,
            child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(AppImages.user1),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Simon Baker', style: AppText.name),
                              SizedBox(height: 12),
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(200),
                                    border: Border.all(
                                        color: AppColors.primaryVariant)),
                                child: RichText(
                                  text: TextSpan(
                                      style: new TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: '2250',
                                            style:
                                                AppText.rating(fontSize: 18)),
                                        TextSpan(
                                            text: '  Elo Rating',
                                            style: AppText.rating()),
                                      ]),
                                ),
                              )
                            ])
                      ]),
                      SizedBox(height: 24),
                      Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                            colors: [
                                          AppColors.warning,
                                          AppColors.warning.withOpacity(0.6)
                                        ])),
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(children: <TextSpan>[
                                        TextSpan(
                                            text: '2250',
                                            style: AppText.statValue),
                                        TextSpan(
                                          text: '\nTournaments\nPlayed',
                                          style: AppText.statLabel,
                                        ),
                                      ]),
                                    ),
                                  )),
                              SizedBox(width: 1),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                            colors: [
                                          AppColors.primary,
                                          AppColors.primary.withOpacity(0.6)
                                        ])),
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(children: <TextSpan>[
                                        TextSpan(
                                            text: '09',
                                            style: AppText.statValue),
                                        TextSpan(
                                          text: '\nTournaments\nWon',
                                          style: AppText.statLabel,
                                        ),
                                      ]),
                                    ),
                                  )),
                              SizedBox(width: 1),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                            colors: [
                                          AppColors.danger,
                                          AppColors.danger.withOpacity(0.6)
                                        ])),
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(children: <TextSpan>[
                                        TextSpan(
                                            text: '26%',
                                            style: AppText.statValue),
                                        TextSpan(
                                          text: '\nWinning\nPercentage',
                                          style: AppText.statLabel,
                                        ),
                                      ]),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      Text('Recommended for you', style: AppText.name),
                      SizedBox(height: 16),
                      Obx(() => ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: homeController.tournaments.length,
                            itemBuilder: (context, index) {
                              return GameView(
                                  tournament:
                                      homeController.tournaments[index]);
                            },
                          )),
                      Obx(() => homeController.isLoading.value
                          ? Container(
                              height: 50,
                              child: Center(child: CircularProgressIndicator()))
                          : Container()),
                      SizedBox(height: 16),
                    ])),
          ),
        ));
  }
}
