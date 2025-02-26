import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/appconstants.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/componentcontroller.dart';
import 'package:localview/controller/userprofilecontroller.dart';
import 'package:localview/customwidgets/customappbar.dart';
import 'package:localview/customwidgets/customcircularprogress.dart';
import 'package:localview/helpers/routeconstants.dart';
import 'package:localview/screens/profile/favouritesscreen.dart';

class BlogsNewsScreen extends StatefulWidget {
  const BlogsNewsScreen({super.key});

  @override
  State<BlogsNewsScreen> createState() => _BlogsNewsScreenState();
}

class _BlogsNewsScreenState extends State<BlogsNewsScreen> {
  final userprofilecontroller =
      Get.put(UserProfileController(userProfileRepo: Get.find()));
  final componentcontroller = Get.put(ComponentController());

  ScrollController scrollcontroller = ScrollController();

/////blogs pagination
  blogsPagination() {
    if (scrollcontroller.offset >= scrollcontroller.position.maxScrollExtent &&
        !scrollcontroller.position.outOfRange) {
      userprofilecontroller.getAllBlogs();
    }
  }

  @override
  void initState() {
    super.initState();
    userprofilecontroller.getallblogsPage.value = 1;
    userprofilecontroller.getAllBlogs();
    scrollcontroller.addListener(blogsPagination);
  }

  @override
  void dispose() {
    super.dispose();
    scrollcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
          title: "Blog and News",
          ontap: () {
            Get.back();
          }),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: SingleChildScrollView(
            controller: scrollcontroller,
            child: Obx(
              () => Column(
                children: [
                  SizedBox(
                    height: 35.h,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            componentcontroller.blogsnewslist.length, (index) {
                          final favcategorydata =
                              componentcontroller.blogsnewslist[index];
                          return Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: customCatgegorySelectedContainer(
                              ontap: () {
                                componentcontroller
                                    .blogsnewsselectedcategory.value = index;
                              },
                              image: "",
                              title: favcategorydata['name'],
                              isSelected: componentcontroller
                                      .blogsnewsselectedcategory.value ==
                                  index,
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  userprofilecontroller.getallblogsLoading.value
                      ? Column(
                          children: List.generate(
                              3,
                              (index) => Padding(
                                    padding: EdgeInsets.only(bottom: 10.h),
                                    child: customDummyLoader(),
                                  )),
                        )
                      : userprofilecontroller.getallblogs.value == null ||
                              userprofilecontroller.getallblogs.value?.data ==
                                  null ||
                              userprofilecontroller
                                      .getallblogs.value?.data?.blogs ==
                                  null ||
                              userprofilecontroller
                                  .getallblogs.value!.data!.blogs!.isEmpty
                          ? Padding(
                              padding: EdgeInsets.symmetric(vertical: 240.h),
                              child: Center(
                                child: customNotDataText(
                                    text: "Blogs not available"),
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: userprofilecontroller
                                  .getallblogs.value?.data?.blogs?.length,
                              itemBuilder: (context, index) {
                                final blogsnewdata = userprofilecontroller
                                    .getallblogs.value?.data?.blogs?[index];
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 20.h),
                                  child: GestureDetector(
                                    onTap: () {
                                      userprofilecontroller.getBlogById(
                                          blogGuid:
                                              blogsnewdata?.guid.toString() ??
                                                  "");
                                      Get.toNamed(
                                          RouteConstants.blogsnewdetailsscreen);
                                    },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15.sp),
                                            child: Image.network(
                                              blogsnewdata?.media == null ||
                                                      blogsnewdata!
                                                          .media!.isEmpty
                                                  ? AppConstants.noimage
                                                  : blogsnewdata.media?.first
                                                          .originalUrl
                                                          .toString() ??
                                                      AppConstants
                                                          .noimage,
                                              height: 75.h,
                                              width: 90.w,
                                              fit: BoxFit.fill,
                                            )),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        SizedBox(
                                          width: 230.w,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 80.w,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            AppColors.colorF2F2,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    4.sp)),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(3.sp),
                                                      child: Center(
                                                        child: Text(
                                                          blogsnewdata?.category
                                                                  ?.name
                                                                  .toString() ??
                                                              "",
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .color2C2C,
                                                              fontFamily:
                                                                  FontFamily
                                                                      .cairo,
                                                              fontSize: 8.sp),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Text(
                                                    blogsnewdata?.publishDate
                                                            .toString() ??
                                                        "",
                                                    style: TextStyle(
                                                        color:
                                                            AppColors.color8282,
                                                        fontFamily:
                                                            FontFamily.cairo,
                                                        fontSize: 9.sp),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 4.w),
                                                    child: Icon(
                                                      Icons.circle,
                                                      size: 3.sp,
                                                      color:
                                                          AppColors.color8282,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 55.w,
                                                    child: Text(
                                                      '${blogsnewdata?.views.toString() ?? ""} views',
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .color8282,
                                                          fontFamily:
                                                              FontFamily.cairo,
                                                          fontSize: 9.sp),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Text(
                                                blogsnewdata?.title
                                                        .toString() ??
                                                    "",
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: AppColors.color2C2C,
                                                    fontFamily:
                                                        FontFamily.cairobold,
                                                    fontSize: 14.sp),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                  userprofilecontroller.getallblogsReloading.value
                      ? Center(
                          child: customCircularProgress(),
                        )
                      : const SizedBox()
                ],
              ),
            )),
      ),
    );
  }
}
