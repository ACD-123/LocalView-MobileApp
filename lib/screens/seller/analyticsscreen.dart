import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/controller/bussinescontroller.dart';
import 'package:localview/helpers/routeconstants.dart';
import 'package:localview/screens/seller/bussinessprofile/reviewmangment.dart';
import 'dart:math';

import 'package:syncfusion_flutter_charts/charts.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  final BusinessController businessController = Get.put(BusinessController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: SvgPicture.asset("assets/maki_cross.svg",
                    height: 16.h, width: 16.h),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Total Visitors and Revenue containers
                  Container(
                    height: 100.h,
                    width: 160.w,
                    decoration: BoxDecoration(
                        color: Color(0xffF4F1F1),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total\nVisitors",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: AppColors.helvetica,
                                ),
                              ),
                              Image.asset("assets/arrowtop.png")
                            ],
                          ),
                          SizedBox(height: 4.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "41,321",
                                style: TextStyle(
                                  fontSize: 18,
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
                  Container(
                    height: 100.h,
                    width: 160.w,
                    decoration: BoxDecoration(
                        color: Color(0xffF4F1F1),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total\nRevenue",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: AppColors.helvetica,
                                ),
                              ),
                              SvgPicture.asset(
                                "assets/arrowbottom.svg",
                              ),
                            ],
                          ),
                          SizedBox(height: 4.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$43,321",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: AppColors.helvetica,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Color(0xffE55353),
                                    borderRadius: BorderRadius.circular(12)),
                                height: 25,
                                width: 32.w,
                                child: Center(child: Text("-1.5%")),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              GestureDetector(
                onTap: () {
                  Get.toNamed(RouteConstants.advertistingscreen);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.black),
                  ),
                  height: 40.h,
                  width: Get.width,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: SvgPicture.asset("assets/adv.svg",
                            height: 20.h, width: 24.h),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text("Advertising Analytics"),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 15.h),
              Text(
                'Business Insights',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppColors.joan,
                ),
              ),

              SizedBox(height: 10.h),

              // Custom Pie Chart (Instead of fl_chart)
              Center(
                child: SizedBox(
                  height: 20.h,
                  child: CustomPaint(
                    size: Size(200.w, 200.h),
                    painter: PieChartPainter([
                      PieChartSection(65, AppColors.lineargradient2,
                          "65%\nCustomer Visits"),
                      PieChartSection(
                          15, Colors.blue.shade300, "15%\nProfile Clicks"),
                      PieChartSection(
                          20, Colors.blue.shade700, "20%\nEngagement"),
                    ]),
                  ),
                ),
              ),

              SizedBox(height: 200.h),
              Container(
                height: 60.h,
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
                    width: 24.w,
                  ),
                  SizedBox(
                    width: 8.w,
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
                        "You Get 1.2% more reviews from last month",
                        style: TextStyle(
                          fontFamily: AppColors.helvetica,
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      // Graph Section
                    ],
                  ),
                ]),
              ),
              SizedBox(
                height: 14.h,
              ),
              Container(
                height: 140.h,
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
                height: 10.h,
              ),
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
              // SizedBox(
              //   height: 2.h,
              // ),

              SizedBox(
                height: 300.h,
                child: Obx(() {
                  return ListView.builder(
                    itemCount: businessController
                        .reviewList.length, // Use the length of RxList
                    itemBuilder: (context, index) {
                      final review = businessController.reviewList[index];

                      return Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 226, 226, 226)),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 10.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 20.sp,
                                      backgroundImage:
                                          AssetImage("assets/server.png"),
                                      backgroundColor: Colors.transparent,
                                    ),
                                    SizedBox(width: 2.w),
                                    Text(
                                      review['name'],
                                      style: TextStyle(
                                        fontFamily: 'Helvetica',
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      review['reviewText'],
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                    ),
                                    SizedBox(height: 1.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RatingBarIndicator(
                                          rating: review['rating'],
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 28.0,
                                          direction: Axis.horizontal,
                                        ),
                                        SvgPicture.asset(
                                          review['flagIconPath'],
                                          height: 3.h,
                                          width: 3.h,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xffF4F1F1),
                                      borderRadius: BorderRadius.circular(15)),
                                  height: 50.h,
                                  width: Get.width,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Send Message",
                                          style: TextStyle(),
                                        ),
                                        SvgPicture.asset("assets/adv.svg",
                                            height: 23.h, width: 23.h),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(
      String title, String value, String percentage, Color color) {
    return Container(
      height: 17.h,
      width: 44.w,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 16)),
            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(value,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                Container(
                  decoration: BoxDecoration(
                      color: color, borderRadius: BorderRadius.circular(12)),
                  height: 25,
                  width: 12.w,
                  child: Center(
                      child: Text(percentage,
                          style: const TextStyle(color: Colors.white))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PieChartSection {
  final double value;
  final Color color;
  final String label;

  PieChartSection(this.value, this.color, this.label);
}

class PieChartPainter extends CustomPainter {
  final List<PieChartSection> sections;
  PieChartPainter(this.sections);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..style = PaintingStyle.fill;
    final double total = sections.fold(0, (sum, item) => sum + item.value);
    double startAngle = -pi / 2;
    final double radius = size.width / 2;

    for (var section in sections) {
      final double sweepAngle = (section.value / total) * 2 * pi;
      paint.color = section.color;

      // Draw Pie Slice
      canvas.drawArc(
        Rect.fromCircle(center: Offset(radius, radius), radius: radius),
        startAngle,
        sweepAngle,
        true,
        paint,
      );

      // Draw Labels
      final double midAngle = startAngle + sweepAngle / 2;
      final double labelX = radius + cos(midAngle) * (radius / 1.5);
      final double labelY = radius + sin(midAngle) * (radius / 1.5);

      final TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: section.label,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
        textDirection: TextDirection.ltr,
      )..layout();

      textPainter.paint(
          canvas,
          Offset(
              labelX - textPainter.width / 2, labelY - textPainter.height / 2));

      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
