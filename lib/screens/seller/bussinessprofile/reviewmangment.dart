import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/customwidgets/customappbar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewManagmentScreen extends StatelessWidget {
  const ReviewManagmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
          title: "Review Management",
          ontap: () {
            Get.back();
          }),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80.h,
                width: Get.width,
                decoration: BoxDecoration(
                    color: Color(0xffF4F1F1),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Reviews",
                            style: TextStyle(
                              fontFamily: AppColors.helvetica,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          SvgPicture.asset(
                            "assets/arrowtop.svg",
                            height: 20.h,
                            width: 20.h,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "41,321",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppColors.helvetica,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xff46D746),
                                borderRadius: BorderRadius.circular(12)),
                            height: 25,
                            width: 40.w,
                            child: Center(child: Text("+2%")),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              // Congratulations Section
              Container(
                height: 70.h,
                width: Get.width,
                decoration: BoxDecoration(
                    color: Color(0xffF4F1F1),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(children: [
                  SizedBox(
                    width: 2.w,
                  ),
                  SvgPicture.asset(
                    "assets/ocngratsicon.svg",
                    height: 24.h,
                    width: 24.h,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Congratulations!",
                        style: TextStyle(
                          fontFamily: AppColors.helvetica,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "You get 1.2% more reviews from last month",
                        style: TextStyle(
                          fontFamily: AppColors.helvetica,
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
              SizedBox(
                height: 15.h,
              ),
              // Graph Section
              Container(
                height: 250.h,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Color(0xffF4F1F1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    series: <ChartSeries>[
                      ColumnSeries<ChartData, String>(
                          dataSource: <ChartData>[
                            ChartData('5 Stars', 50),
                            ChartData('4 Stars', 40),
                            ChartData('3 Stars', 30),
                            ChartData('2 Stars', 20),
                            ChartData('1 Star', 10),
                          ],
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y,
                          color: AppColors.lineargradient1),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              // Recent Reviews Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Reviews",
                    style: TextStyle(
                      fontFamily: AppColors.helvetica,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "See More",
                    style: TextStyle(
                      fontFamily: AppColors.helvetica,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              // Review Entry Section
              Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20.sp,
                        backgroundImage: AssetImage("assets/server.png"),
                        backgroundColor: Colors.transparent,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        "Austin Blake",
                        style: TextStyle(
                          fontFamily: AppColors.helvetica,
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  // Review Text Container
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Review Text
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3, // Adjust this value if needed
                        ),
                        SizedBox(
                            height: 1
                                .h), // Add some spacing between text and rating bar

                        // Custom Rating Bar
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RatingBarIndicator(
                              // Convert rating to double
                              rating: 3,
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 28.0,
                              direction: Axis.horizontal,
                            ),
                            SvgPicture.asset(
                              "assets/flagicon.svg",
                              height: 3.h,
                              width: 3.h,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  final String x;
  final double y;

  ChartData(this.x, this.y);
}
