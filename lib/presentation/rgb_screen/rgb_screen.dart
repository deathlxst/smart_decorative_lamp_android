import 'models/rgb_model.dart';
import 'package:flutter/material.dart';
import 'package:stefanus_s_application1/core/app_export.dart';
import 'provider/rgb_provider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'dart:async';


class RgbScreen extends StatefulWidget {
  const RgbScreen({Key? key}) : super(key: key);

  @override
  RgbScreenState createState() => RgbScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => RgbProvider(), child: RgbScreen());
  }
}

class RgbScreenState extends State<RgbScreen> {
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
              _buildCeCounterStack(context),
              SizedBox(height: 31.v),
              GestureDetector(
                onTap: () {
                  onTapFrameEleven(context);
                },
                 child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 97.h),
                  padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 3.v),
                  decoration: AppDecoration.fillWhiteA.copyWith(
                    borderRadius: BorderRadiusStyle.circleBorder27,
                  ),
                 child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 18.h, top: 12.v, bottom: 10.v),
              child: Text(
                 "ON", // Added the "ON" label
                style: CustomTextStyles.titleLargeGrayA700, // Changed the style
              ),
            ),
            SizedBox(width: 10.h), // Adjust as needed for spacing
          ],
        ),
        SizedBox(
          height: 48.v,
          width: 46.h,
          child: Stack(
            alignment: Alignment.center, // Align the stack to the center
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgEllipse118CyanA200,
                height: 48.v,
                width: 46.h,
                alignment: Alignment.center, // Align the circle to the center
              ),
              CustomImageView(
                imagePath: ImageConstant.imgSunrise224x29,
                height: 24.v,
                width: 29.h,
                alignment: Alignment(0.1, 0), // Align the sunrise to the left
              ),
            ]
          ),
        ),
      ],
    ),
  ),
),
              SizedBox(height: 20.v), // Add some space between the buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    GestureDetector(
                    onTap: () {
                      onTapWhiteButton(context);
                    },
                    child: Container(
                      height: 40.0, // Adjust the height as needed
                      width: 40.0, // Make it a square by adjusting the width
                      decoration: BoxDecoration(
                        color: Colors.white, // Change to your desired blue color
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0), // add space between  buttons
                  GestureDetector(
                    onTap: (){
                      onTapBlueButton(context);
                    },
                    child: Container (
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                       child: Icon(
                        Icons.blur_on, // Change to your desired icon
                        color: Colors.white,
                        size: 24.0, // Adjust the size of the icon
                      ),
                      ),
                  ),
                  SizedBox(width: 10.0), // Add space between buttons
                  GestureDetector(
                    onTap: () {
                      onTapRedButton(context);
                    },
                    child: Container(
                      height: 40.0, // Adjust the height as needed
                      width: 40.0, // Make it a square by adjusting the width
                      decoration: BoxDecoration(
                        color: Colors.red, // Change to your desired red color
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.panorama_fish_eye, // Change to your desired icon
                        color: Colors.white,
                        size: 24.0, // Adjust the size of the icon
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0), // Add space between buttons
                  GestureDetector(
                    onTap: () {
                      onTapGreenButton(context);
                    },
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check_circle,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0), // Add space between buttons
                  GestureDetector(
                    onTap: () {
                      onTapOrangeButton(context);
                    },
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.brightness_7,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0), // Add space between buttons
                  GestureDetector(
                    onTap: () {
                      onTapPurpleButton(context);
                    },
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.music_note,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0), // Add space between buttons
                  GestureDetector(
                    onTap: () {
                      onTapYellowButton(context);
                    },
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0), // Add space between buttons
                  GestureDetector(
                    onTap: () {
                      onTapRGBButton(context);
                    },
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.color_lens,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    ),
                  ),
                ],
              ),
      
              SizedBox(height: 15.v),
              SizedBox(height: 90.v),
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
                          // CustomImageView(
                          //   imagePath: ImageConstant.imgSubtract,
                          //   height: 31.v,
                          //   width: 27.h,
                          //   alignment: Alignment.topLeft,
                          //   margin: EdgeInsets.only(top: 17.v),
                          // ),
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


  /// Section Widget
  Widget _buildCeCounterStack(BuildContext context) {
    return SizedBox(
        height: 122.v,
        width: 322.h,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Align(
              alignment: Alignment.center,
              child: Text("lbl_ce_25".tr, style: CustomTextStyles.interRed900)),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: 25.v,
                  width: 322.h,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment(0, 0.49),
                          end: Alignment(1, 0.49),
                          colors: [
                        appTheme.red900,
                        appTheme.green900,
                        appTheme.indigo900
                      ]))))
        ]));
  }

 /// Navigates to the offScreen when the action is triggered.
  onTapFrameEleven(BuildContext context) {
    DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
     databaseReference.child('LED_mode').child('turnOffLEDs').set(true);
     databaseReference.child('LED_mode').child('turnOnLEDs').set(false);
    NavigatorService.pushNamed(
      AppRoutes.offScreen,
    );
  }


  onTapWhiteButton(BuildContext context) {
       DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
  databaseReference.child('LED_mode').child('aquamarine_mode').set(false);
  databaseReference.child('LED_mode').child('mint_mode').set(false);
  databaseReference.child('LED_mode').child('warm_mode').set(false);
  databaseReference.child('LED_mode').child('amethyst_mode').set(false);
  databaseReference.child('LED_mode').child('sunflower_mode').set(false);
  databaseReference.child('LED_mode').child('crimson_mode').set(false);
    databaseReference.child('LED_mode').child('rgb_cycle_mode').set(false);
  // set white_mode to true 
  databaseReference.child('LED_mode').child('white_mode').set(true);
    NavigatorService.pushNamed(
      AppRoutes.onScreen,
    );
  }

  onTapBlueButton(BuildContext context) {
      DatabaseReference databaseReference = FirebaseDatabase.instance.reference();

  databaseReference.child('LED_mode').child('crimson_mode').set(false);
  databaseReference.child('LED_mode').child('mint_mode').set(false);
  databaseReference.child('LED_mode').child('warm_mode').set(false);
  databaseReference.child('LED_mode').child('amethyst_mode').set(false);
  databaseReference.child('LED_mode').child('sunflower_mode').set(false);
  databaseReference.child('LED_mode').child('white_mode').set(false);
  databaseReference.child('LED_mode').child('rgb_cycle_mode').set(false);   

  // Set blue mode to true
  databaseReference.child('LED_mode').child('aquamarine_mode').set(true);
    NavigatorService.pushNamed(
      AppRoutes.blueScreen,
    );
  }

  onTapRedButton(BuildContext context) {
        DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
  databaseReference.child('LED_mode').child('aquamarine_mode').set(false);
   databaseReference.child('LED_mode').child('rgb_cycle_mode').set(false);
  databaseReference.child('LED_mode').child('mint_mode').set(false);
  databaseReference.child('LED_mode').child('warm_mode').set(false);
  databaseReference.child('LED_mode').child('amethyst_mode').set(false);
  databaseReference.child('LED_mode').child('sunflower_mode').set(false);
  databaseReference.child('LED_mode').child('white_mode').set(false);

  //set red mode to true
  databaseReference.child('LED_mode').child('crimson_mode').set(true);
    NavigatorService.pushNamed(
      AppRoutes.redScreen,
    );
  }

  onTapGreenButton(BuildContext context) {
            DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
   databaseReference.child('LED_mode').child('aquamarine_mode').set(false);
    databaseReference.child('LED_mode').child('rgb_cycle_mode').set(false);
  databaseReference.child('LED_mode').child('white_mode').set(false);
  databaseReference.child('LED_mode').child('warm_mode').set(false);
  databaseReference.child('LED_mode').child('amethyst_mode').set(false);
  databaseReference.child('LED_mode').child('sunflower_mode').set(false);
  databaseReference.child('LED_mode').child('crimson_mode').set(false);
  //set mint mode to true
   databaseReference.child('LED_mode').child('mint_mode').set(true);
    NavigatorService.pushNamed(
      AppRoutes.greenScreen,
    );
  }

  onTapOrangeButton(BuildContext context) {
       DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
 databaseReference.child('LED_mode').child('aquamarine_mode').set(false);
  databaseReference.child('LED_mode').child('rgb_cycle_mode').set(false);
  databaseReference.child('LED_mode').child('white_mode').set(false);
  databaseReference.child('LED_mode').child('mint_mode').set(false);
  databaseReference.child('LED_mode').child('amethyst_mode').set(false);
  databaseReference.child('LED_mode').child('sunflower_mode').set(false);
  databaseReference.child('LED_mode').child('crimson_mode').set(false);
    databaseReference.child('LED_mode').child('warm_mode').set(true);
    NavigatorService.pushNamed(
      AppRoutes.orangeScreen,
    );
  }

  onTapPurpleButton(BuildContext context) {
      DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
   databaseReference.child('LED_mode').child('aquamarine_mode').set(false);
   databaseReference.child('LED_mode').child('rgb_cycle_mode').set(false);
  databaseReference.child('LED_mode').child('white_mode').set(false);
  databaseReference.child('LED_mode').child('mint_mode').set(false);
  databaseReference.child('LED_mode').child('warm_mode').set(false);
  databaseReference.child('LED_mode').child('sunflower_mode').set(false);
  databaseReference.child('LED_mode').child('crimson_mode').set(false);
    databaseReference.child('LED_mode').child('amethyst_mode').set(true);
    NavigatorService.pushNamed(
      AppRoutes.purpleScreen,
    );
  }

  onTapYellowButton(BuildContext context) {
       DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
  databaseReference.child('LED_mode').child('aquamarine_mode').set(false);
  databaseReference.child('LED_mode').child('rgb_cycle_mode').set(false);
  databaseReference.child('LED_mode').child('white_mode').set(false);
  databaseReference.child('LED_mode').child('mint_mode').set(false);
  databaseReference.child('LED_mode').child('warm_mode').set(false);
  databaseReference.child('LED_mode').child('amethyst_mode').set(false);
  databaseReference.child('LED_mode').child('crimson_mode').set(false);
    databaseReference.child('LED_mode').child('sunflower_mode').set(true);
    NavigatorService.pushNamed(
      AppRoutes.yellowScreen,
    );
  }

  onTapRGBButton(BuildContext context) {
     DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
 databaseReference.child('LED_mode').child('aquamarine_mode').set(false);
  databaseReference.child('LED_mode').child('sunflower_mode').set(false);
  databaseReference.child('LED_mode').child('white_mode').set(false);
  databaseReference.child('LED_mode').child('mint_mode').set(false);
  databaseReference.child('LED_mode').child('warm_mode').set(false);
  databaseReference.child('LED_mode').child('amethyst_mode').set(false);
  databaseReference.child('LED_mode').child('crimson_mode').set(false);
    databaseReference.child('LED_mode').child('rgb_cycle_mode').set(true);
    NavigatorService.pushNamed(
      AppRoutes.rgbScreen,
    );
  }
}