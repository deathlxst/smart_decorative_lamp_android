import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:stefanus_s_application1/core/app_export.dart';
import 'provider/off_provider.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class OffScreen extends StatefulWidget {
  const OffScreen({Key? key}) : super(key: key);

  @override
  OffScreenState createState() => OffScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OffProvider(),
      child: OffScreen(),
    );
  }
}

class OffScreenState extends State<OffScreen> {
  double temperature = 0.0;
  double humidity = 0.0;

 late DateTime _currentDateTime;
late String _formattedDate;
late String _formattedTime;

  @override
  void initState() {
    super.initState();
    fetchDataFromFirebase();
  _updateDateTime(); // Initial update
  _startClock(); // Start updating the clock
  }

  Future<void> fetchDataFromFirebase() async {
    DatabaseReference databaseReference = FirebaseDatabase.instance.reference();

    DatabaseEvent temperatureEvent =
        await databaseReference.child('sensors').child('temperature').once();
    if (temperatureEvent.snapshot.value != null) {
      setState(() {
        temperature = double.parse(temperatureEvent.snapshot.value.toString());
      });
    }

    DatabaseEvent humidityEvent =
        await databaseReference.child('sensors').child('humidity').once();
    if (humidityEvent.snapshot.value != null) {
      setState(() {
        humidity = double.parse(humidityEvent.snapshot.value.toString());
      });
    }
  }

void _updateDateTime() {
  _currentDateTime = DateTime.now();
  _formattedDate = DateFormat('EEEE,').format(_currentDateTime) +
      '\n' +
      DateFormat('MMMM d y').format(_currentDateTime);
  _formattedTime = DateFormat('H:mm').format(_currentDateTime);
}


void _startClock() {
  Timer.periodic(Duration(seconds: 1), (Timer timer) {
    setState(() {
      _updateDateTime();
    });
  });
}

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 18.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 13.v),
              _buildCeCounter(context),
              SizedBox(height: 31.v),
              GestureDetector(
                onTap: () {
                  onTapFrameEleven(context);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 97.h),
                  padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 3.v),
                  decoration: AppDecoration.fillBlueGray.copyWith(
                    borderRadius: BorderRadiusStyle.circleBorder27,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: 48.v,
                        width: 46.h,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgEllipse118,
                              height: 48.v,
                              width: 46.h,
                              alignment: Alignment.center,
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgSunrise2,
                              height: 29.adaptSize,
                              width: 24.h,
                              alignment: Alignment.center,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 18.h, top: 12.v, bottom: 10.v),
                        child: Text(
                          "lbl_off".tr,
                          style: CustomTextStyles.titleLargeWhiteA700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.v),
              SizedBox(height: 90.v),
              // Integrated gray container code
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.h),
                padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 11.v),
                decoration: AppDecoration.fillBlueGray.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder22,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 130.h,
                      margin: EdgeInsets.only(left: 3.h, top: 12.v, bottom: 15.v),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgTemperatureFill,
                                height: 24.adaptSize,
                                width: 24.adaptSize,
                              ),
                              SizedBox(width: 2.h),
                              Text(
                               "Temperature: ${temperature.toStringAsFixed(2)}°C",
                                style: CustomTextStyles.bodySmall11,
                                  maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          SizedBox(height: 30.v),
                          Row(
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgHumidity,
                                height: 18.v,
                                width: 17.h,
                              ),
                              SizedBox(width: 5.h),
                              Text(
                                "Humidity: ${humidity.toStringAsFixed(2)}%",
                                style: CustomTextStyles.bodySmall11,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 78.v,
                      width: 111.h,
                      margin: EdgeInsets.only(left: 7.h, bottom: 5.v),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: SizedBox(
                              width: 85.h,
                              child: Text(
                                _formattedDate,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodySmall,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 30.h),
                              child: Text(
                                _formattedTime,
                                style: theme.textTheme.headlineSmall,
                              ),
                            ),
                          ),
 Stack(
  children: [
    Positioned(
      left: -5.0,
      top: 20.0,
      child: CustomImageView(
        imagePath: 'assets/images/img_sunrise_colorful.png',
        height: 46.0,
        width: 42.0,
      ),
    ),
  ],
)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCeCounter(BuildContext context) {
    return SizedBox(
      height: 122.v,
      width: 322.h,
      child: Stack(alignment: Alignment.bottomCenter, children: [
        Align(
          alignment: Alignment.center,
          child: Text("lbl_ce_25".tr, style: CustomTextStyles.interGray800),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 25.v,
            width: 322.h,
            decoration: BoxDecoration(color: appTheme.gray800),
          ),
        ),
      ]),
    );
  }

  onTapFrameEleven(BuildContext context) {
    DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
    databaseReference.child('LED_mode').child('turnOnLEDs').set(true);
    databaseReference.child('LED_mode').child('turnOffLEDs').set(false);
    NavigatorService.pushNamed(
      AppRoutes.onScreen,
    );
  }
}

